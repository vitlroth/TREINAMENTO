package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import bean.SetorBean;
import bean.UsuarioBean;
import util.Conexao;

public class UsuarioDao {

	private Connection connection;

	public void inclui(UsuarioBean usuarioBean) throws Exception {
		Conexao conexao = new Conexao();
		this.connection = conexao.getConnection();
		String sql = ("insert into usuario (idsetor,nmusuario,nmlogin,nmsenha,nmsexo,dataNascimento) values (?,?,?,?,?,?)");
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setInt(1, usuarioBean.getIdsetor());
		stmt.setString(2, usuarioBean.getNmusuario());
		stmt.setString(3, usuarioBean.getNmlogin());
		stmt.setString(4, usuarioBean.getNmsenha());
		stmt.setString(5, usuarioBean.getNmsexo());
		stmt.setDate(6, new Date(usuarioBean.getDataNascimento().getTimeInMillis()));
		// stmt.setString(6, usuarioBean.getData());
		stmt.executeUpdate();
		stmt.close();
		conexao.commit();
		conexao.closeConnection();
	}

	public int recuperaId() throws Exception {
		int ultimoid = 0;
		try {
			Conexao conexao = new Conexao();
			this.connection = conexao.getConnection();
			String sql = "SELECT  MAX(idusuario)AS ultimoId from usuario";
			Statement stmt = connection.createStatement();
			ResultSet rs = null;
			rs = stmt.executeQuery(sql.toString());
			while (rs.next()) {
				ultimoid = rs.getInt("ultimoId");
			}
			rs.close();
			conexao.closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ultimoid;
	}

	public ArrayList<UsuarioBean> lista(UsuarioBean usuarioBean) throws Exception {
		ArrayList<UsuarioBean> lista = new ArrayList<UsuarioBean>();
		Conexao conexao = new Conexao();
		this.connection = conexao.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT idusuario,nmusuario,nmlogin,nmsenha,datanascimento  FROM usuario WHERE 1=1 ");
	//	sql.append(" SELECT * FROM usuario WHERE 1=1 ");
		if (usuarioBean.getNmlogin() == null && usuarioBean.getNmusuario() == null) {
			sql.append("order by nmusuario");
		}
		if (usuarioBean.getNmusuario() != null && !usuarioBean.getNmusuario().equals("")) {
			sql.append("and nmusuario like '" + usuarioBean.getNmusuario() + "%'");
		}
		if (usuarioBean.getNmlogin() != null && !usuarioBean.getNmlogin().equals("")) {
			sql.append("and nmlogin like '" + usuarioBean.getNmlogin() + "%'");
		}
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql.toString());
		while (rs.next()) {
			UsuarioBean bean = new UsuarioBean();
			bean.setIdusuario(rs.getInt("idusuario"));						
			Calendar data = Calendar.getInstance();
            data.setTime(rs.getDate("datanascimento"));                      
			bean.setDataNascimento(data);           
			bean.setNmusuario(rs.getString("nmusuario"));
			bean.setNmlogin(rs.getString("nmlogin"));
			bean.setNmsenha(rs.getString("nmsenha"));
			lista.add(bean);
		}
		rs.close();
		conexao.closeConnection();
		return lista;
	}

	public UsuarioBean pesquisar(UsuarioBean usuarioBean) throws Exception {
		Conexao conexao = new Conexao();
		this.connection = conexao.getConnection();
		UsuarioBean bean = new UsuarioBean();
		String sql = ("SELECT us.idusuario,us.nmusuario,us.nmlogin,us.nmsenha,us.nmsexo,s.idsetor,us.idsetor,us.datanascimento FROM usuario us INNER JOIN setor s ON ( us.idSetor = s.idSetor ) WHERE idUsuario ="
				+ usuarioBean.getIdusuario());
		PreparedStatement stmt = connection.prepareStatement(sql.toString());
		ResultSet rs = stmt.executeQuery();
		if (rs.next()) {
			bean.setIdusuario(rs.getInt("idusuario"));
			bean.setIdsetor(rs.getInt("idsetor"));
			bean.setNmusuario(rs.getString("nmusuario"));
			bean.setNmlogin(rs.getString("nmlogin"));
			bean.setNmsenha(rs.getString("nmsenha"));
			bean.setNmsexo(rs.getString("nmsexo"));
			Calendar data = Calendar.getInstance();
            data.setTime(rs.getDate("datanascimento")); 
            if(data!=null) {
			bean.setDataNascimento(data);
            }
			SetorBean setor = new SetorBean();
			setor.setIdSetor(rs.getInt("idsetor"));
			bean.setSetor(setor);
		}
		rs.close();
		conexao.closeConnection();
		return bean;
	}

	public void Excluir(UsuarioBean usuarioBean) throws Exception {
		Conexao conexao = new Conexao();
		this.connection = conexao.getConnection();
		String sql = ("delete from usuario where idusuario =" + usuarioBean.getIdusuario());
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.executeUpdate();
		stmt.close();
		conexao.commit();
		conexao.closeConnection();
	}

	public void altera(UsuarioBean usuarioBean) throws Exception {
		Conexao conexao = new Conexao();
		this.connection = conexao.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE usuario SET ");
		sql.append("idsetor = '" + usuarioBean.getIdsetor() + "',");
		sql.append("nmusuario = '" + usuarioBean.getNmusuario() + "',");
		sql.append("nmlogin = '" + usuarioBean.getNmlogin() + "',");
		sql.append("nmsenha = '" + usuarioBean.getNmsenha() + "',");
		sql.append("nmsexo = '" + usuarioBean.getNmsexo() + "',");
		sql.append("dataNascimento = '" + usuarioBean.getDataNascimento().getTime() + "'");		
		sql.append("where idusuario = " + usuarioBean.getIdusuario());
		Statement stmt = this.connection.createStatement();
		stmt.executeUpdate(sql.toString());
		stmt.close();
		conexao.commit();
		conexao.closeConnection();
	}

	public UsuarioBean acessalogin(UsuarioBean usuarioBean) throws Exception {
		Conexao conexao = new Conexao();
		this.connection = conexao.getConnection();
		UsuarioBean usuarioLogin = null;
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT idusuario,nmlogin,nmsenha,nmusuario from usuario where 1=1 ");
		sql.append("and nmlogin='" + usuarioBean.getNmlogin() + "'");
		sql.append("and nmsenha='" + usuarioBean.getNmsenha() + "'");
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql.toString());
		if (rs.next()) {
			usuarioLogin = new UsuarioBean();
			usuarioLogin.setIdusuario(rs.getInt("idusuario"));
			usuarioLogin.setNmlogin(rs.getString("nmlogin"));
			usuarioLogin.setNmsenha(rs.getString("nmsenha"));
			usuarioLogin.setNmusuario(rs.getString("nmusuario"));
		}
		rs.close();
		conexao.closeConnection();
		return usuarioLogin;
	}
}
