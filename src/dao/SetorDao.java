package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.Conexao;

import bean.SetorBean;

public class SetorDao {

	private Connection connection;

	public ArrayList<SetorBean> setaSetor(SetorBean setorBean) throws Exception {

		Conexao conexao = new Conexao();
		this.connection = conexao.getConnection();
		String sql = ("select idSetor,nmSetor from setor");
		PreparedStatement stmt = connection.prepareStatement(sql);
		ArrayList<SetorBean> lista = new ArrayList<SetorBean>();
		ResultSet rs = stmt.executeQuery();
		while (rs.next()) {
			SetorBean bean = new SetorBean();
			bean.setIdSetor(rs.getInt("idSetor"));			
	        bean.setNmSetor(rs.getString("nmSetor"));
			lista.add(bean);
		}
		rs.close();
		conexao.closeConnection();
		return lista;

	}

}
