package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import util.Conexao;

import bean.ModuloBean;
import bean.Usuario_ModuloBean;

public class Usuario_ModuloDao {

	private Connection connection;

	public void incluirmod(Usuario_ModuloBean usuariomod) throws Exception {
		try {
			Conexao conexao = new Conexao();
			this.connection = conexao.getConnection();
			String sql = ("insert into usuario_modulo (idmodulo,idusuario)values(?,?)");
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, usuariomod.getModulo_idmodulo());
			stmt.setInt(2, usuariomod.getUsuario_idusario());
			stmt.executeUpdate();
			stmt.close();
			conexao.commit();
			conexao.closeConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public int verificaregistro(Usuario_ModuloBean usuariomod) throws Exception {
		int registro = 0;
		try {
			Conexao conexao = new Conexao();
			this.connection = conexao.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(0) QTD FROM usuario_modulo WHERE 1=1 ");
			sql.append("and modulo_idmodulo = '" + usuariomod.getModulo_idmodulo() + "'");
			sql.append("and usuario_idusuario = '" + usuariomod.getUsuario_idusario() + "'");
			Statement stmt = connection.createStatement();
			ResultSet rs = null;
			rs = stmt.executeQuery(sql.toString());
			while (rs.next()) {
				registro = rs.getInt("QTD");
			}
			rs.close();
			conexao.closeConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return registro;
	}

	public void excluirmod(Usuario_ModuloBean modulobean) throws Exception {
		Conexao conexao = new Conexao();
		this.connection = conexao.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("Delete from usuario_modulo where 1=1 ");
		sql.append("and idmodulo ='" + modulobean.getModulo_idmodulo() + "'");
		sql.append("and idusuario ='" + modulobean.getUsuario_idusario() + "'");
		Statement stmt = connection.createStatement();
		stmt.executeUpdate(sql.toString());
		stmt.close();
		conexao.commit();
		conexao.closeConnection();
	}

	public ArrayList<Usuario_ModuloBean> listamodulos(Usuario_ModuloBean modulo) throws Exception {
		ArrayList<Usuario_ModuloBean> lista = new ArrayList<Usuario_ModuloBean>();
		Conexao conexao = new Conexao();
		this.connection = conexao.getConnection();
		StringBuilder sql = new StringBuilder(); 
		sql.append("SELECT u.nmusuario,us.idmodulo, m.nmmodulo,m.destmodulo ");
		sql.append("FROM usuario_modulo us INNER JOIN usuario u ON ( us.idUsuario = u.idUsuario )");
		sql.append("INNER JOIN modulo  m ON ( us.idModulo = m.idModulo )where u.idusuario =" + modulo.getUsuario_idusario());		
		PreparedStatement stmt = connection.prepareStatement(sql.toString());
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			ModuloBean mod = new ModuloBean();
			mod.setIdmodulo(rs.getInt("idmodulo"));
			mod.setNmmodulo(rs.getString("nmmodulo"));	
			mod.setDestmodulo(rs.getString("destmodulo"));
			Usuario_ModuloBean bean = new Usuario_ModuloBean();						
			bean.setModuloBean(mod);
			lista.add(bean);
		}
		rs.close();
		conexao.closeConnection();
		return lista;

	}
	
	
	public ArrayList<Usuario_ModuloBean> listaModulosDesvinculados(Usuario_ModuloBean modulo) throws Exception {
		ArrayList<Usuario_ModuloBean> lista = new ArrayList<Usuario_ModuloBean>();
		Conexao conexao = new Conexao();
		this.connection = conexao.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM modulo mod WHERE mod.idmodulo NOT IN ( ");
		sql.append("SELECT usm.idmodulo FROM modulo mod INNER JOIN usuario_modulo usm ");
		sql.append("ON (mod.idmodulo = usm.idmodulo) INNER JOIN usuario u ");
		sql.append("ON (usm.idusuario = u.idusuario) WHERE usm.idusuario = " + modulo.getUsuario_idusario() + ")");				  								
		PreparedStatement stmt = connection.prepareStatement(sql.toString());
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			ModuloBean mod = new ModuloBean();
			mod.setIdmodulo(rs.getInt("idmodulo"));
			mod.setNmmodulo(rs.getString("nmmodulo"));
			Usuario_ModuloBean bean = new Usuario_ModuloBean();
			bean.setModuloBean(mod);
			lista.add(bean);
		}
		rs.close();
		conexao.closeConnection();
		return lista;
	}

}
