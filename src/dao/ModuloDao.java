package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.Conexao;

import bean.ModuloBean;

public class ModuloDao {

	private Connection connection;

	public ArrayList<ModuloBean> lista(ModuloBean moduloBean) throws Exception {		
		Conexao conexao = new Conexao();
		this.connection = conexao.getConnection();
		String sql = ("select idmodulo,nmmodulo,destmodulo from modulo");
		PreparedStatement stmt = connection.prepareStatement(sql);				
		ResultSet rs = stmt.executeQuery();
		ArrayList<ModuloBean> lista = new ArrayList<ModuloBean>();
		while (rs.next()) {
			ModuloBean bean = new ModuloBean();
			bean.setIdmodulo(rs.getInt("idmodulo"));
			bean.setNmmodulo(rs.getString("nmmodulo"));
			bean.setDestmodulo(rs.getString("destmodulo"));
			lista.add(bean);
		}
		rs.close();
		conexao.closeConnection();
		return lista;
	}

}
