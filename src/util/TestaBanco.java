package util;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import bean.UsuarioBean;
import groovy.ui.SystemOutputInterceptor;

public class TestaBanco {

	Connection connection;
	Conexao con = null;

	public void inserir() {

		try {
			con = new Conexao();
			this.connection = con.getConnection();
			String sql = ("insert into usuario (idsetor,nmusuario,nmlogin,nmsenha,nmsexo,datanascimento) values (?,?,?,?,?,?)");
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, 1);
			stmt.setString(2, "QUARTA FEIRA");
			stmt.setString(3, "DIA DA");
			stmt.setString(4, "PROMOÇÃO");
			stmt.setString(5, "C");
			UsuarioBean b = Data.formatador();
			stmt.setDate(6, new Date(b.getDataNascimento().getTimeInMillis()));
			stmt.executeUpdate();
			stmt.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			con.commit();
			con.closeConnection();

		}

	}

	public ArrayList<UsuarioBean> lista() throws Exception {
		ArrayList<UsuarioBean> lista = new ArrayList<UsuarioBean>();
		Conexao conexao = new Conexao();
		this.connection = conexao.getConnection();
		StringBuilder sql = new StringBuilder();
		// sql.append(" SELECT idusuario,nmusuario,nmlogin,nmsenha,datanascimento FROM
		// usuario WHERE 1=1 ");
		sql.append(" SELECT * FROM usuario WHERE 1=1 ");

		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql.toString());
		while (rs.next()) {
			UsuarioBean bean = new UsuarioBean();
			// bean.setIdusuario(rs.getInt("idusuario"));
			// String data = rs.getString("datanascimento");
			// String d = Data.converteData1(data);
			// bean.setData(d);

			/*
			 * Calendar cal = Calendar.getInstance();
			 * 
			 * Date datal = rs.getDate("datanascimento"); DateFormat dfm =
			 * DateFormat.getDateInstance(DateFormat.MEDIUM); String d = dfm.format(datal);
			 * Date novo = Data.convertDateForCalendar(d);
			 * 
			 * if (datal != null) { cal.setTime(); } else { System.out.println("Ola mundo");
			 * } if (cal != null) { // System.out.println(cal.getTime() +
			 * " : Testando classe Calendar"); }
			 * 
			 * if (rs.getDate("datanascimento") != null) { //
			 * System.out.println(rs.getDate("datanascimento"));
			 * 
			 * } data.setTime(rs.getDate(3));
			 * 
			 * if (datal != null) { bean.setDataNascimento(cal); } else {
			 * System.out.println("Nenhuma data cadastrada"); }
			 */

			// System.out.println(dfm.format(cal) + "Testando DateFormat");

			Calendar data = Calendar.getInstance();
			/*
			 * Date dt = rs.getDate("datanascimento"); System.out.println(dt.getDay());
			 * data.setTime(rs.getDate("datanascimento")); if(data!=null) {
			 * bean.setDataNascimento(data); }
			 */
			/*
			 * String dtc = null;
			 * 
			 * if(rs.getString("datanascimento")!=null &&
			 * !rs.getString("datanascimento").equals("")) {
			 * 
			 * String dtx = rs.getString("datanascimento");
			 * 
			 * dtc = Data.formataData(dtx + " : Transforma");
			 * 
			 * System.out.println(dtc);
			 * 
			 * 
			 * }else {
			 * 
			 * System.out.println("LIVING LET DIE"); }
			 */

			String sono = rs.getString("datanascimento");
			if(null == sono) {
				System.out.println("SONÃO");
			}else {
			System.out.println(sono);
			Calendar c = Data.convertido(sono);
			bean.setDataNascimento(c);
			}
			

			/*if (sono.equals("") || sono == null) {
				System.out.println("que isso");
			} else {

				

			}*/

			bean.setNmusuario(rs.getString("nmusuario"));
			// bean.setNmlogin(rs.getString("nmlogin"));
			// bean.setNmsenha(rs.getString("nmsenha"));
			lista.add(bean);

		}
		rs.close();
		conexao.closeConnection();
		return lista;
	}

	public void testa() {
		try {
			Data.testador();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {

		TestaBanco s = new TestaBanco();
		// s.inserir();

		// s.testa();

		try {
			ArrayList<UsuarioBean> x = s.lista();

			for (UsuarioBean usuarioBean : x) {
				System.out.println(usuarioBean.getNmusuario());
				if (usuarioBean.getDataNascimento() != null) {
				//	String dente = new SimpleDateFormat("dd/MM/yyyy").format(usuarioBean.getDataNascimento().getTime());
				//	System.out.println(dente);
					System.out.println(usuarioBean.getDataNascimento().getTime());
				} else {
					System.out.println("Nenhum totonho");
				}

			}

		} catch (Exception e) {
			// ODO Auto-generated catch block
			e.printStackTrace();
		}

		// TODO Auto-generated method stub

	}

}
