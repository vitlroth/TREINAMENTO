package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.EmpresaBean;
import util.Conexao;

public class EmpresaDao {

	private Connection connection;

	
	
	public ArrayList<EmpresaBean> buscarEmpresa() throws Exception {
		ArrayList<EmpresaBean> lista = new ArrayList<>();
		Conexao con = new Conexao();
		this.connection = con.getConnection();
		// StringBuilder str = new StringBuilder();
		String str = "SELECT idempresa,email,nome FROM empresa ORDER BY idempresa ASC";
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(str);
		while (rs.next()) {
			EmpresaBean emp = new EmpresaBean();
			emp.setId(rs.getInt("idempresa"));
			emp.setEmail(rs.getString("email"));
			emp.setNome(rs.getString("nome"));
			lista.add(emp);
		}
		rs.close();
		con.closeConnection();
		return lista;

	}

}
