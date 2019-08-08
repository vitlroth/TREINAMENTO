package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import bean.EmpresaBean;
import bean.ProdutoBean;
import util.Conexao;

public class ProdutoDao {

	private Connection connection;
	private int x;

	
	
	
	public ArrayList<ProdutoBean> getlistar() throws Exception {
		ArrayList<ProdutoBean> lista = new ArrayList<ProdutoBean>();		
		Conexao con = new Conexao();
		this.connection = con.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT p.idproduto, p.nome, p.unidade, p.valor, p.datacotacao, e.nome AS emp, e.email AS emp_1 FROM produto p  INNER JOIN empresa e ON p.idempresa=e.idempresa");
		sql.append(" ORDER BY  p.nome, emp_1 ASC");
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql.toString());
		while (rs.next()) {
			ProdutoBean bean = new ProdutoBean();
		    bean.setIdproduto(rs.getInt("idproduto"));
			bean.setNome(rs.getString("nome"));			
			bean.setUnidade(rs.getString("unidade"));
			bean.setValor(rs.getDouble("valor"));
			bean.setDatacotacao(rs.getString("datacotacao"));				
			EmpresaBean e = new EmpresaBean();
			e.setNome(rs.getString("emp"));
			e.setEmail(rs.getString("emp_1"));
			bean.setEmp(e);												
			lista.add(bean);
		}
		rs.close();
		con.closeConnection();
		
		return lista;

	}
					
	private boolean verificar(int pag) throws Exception {
		Conexao con = new Conexao();
		this.connection = con.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT count(*) AS totalReg from produto");
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql.toString());		 
		while(rs.next()) {
			x = rs.getInt("totalReg");			
		}
		
		
		if(pag<=x) {
			return true;
		}else {
			return false;
		}				
	}
					
	public int contaRegistros() throws Exception {		
		int z = 0;
		Conexao con = new Conexao();
		this.connection = con.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT count(*) AS totalReg from produto");
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql.toString());		 
		if(rs.next()) {
			x = rs.getInt("totalReg");	
			z = x;
		}
		
		return z;						
	}			
	
	
	/**
	 * 
	 * @param pag é o numero de registros por pagina.
	 * @return
	 * @throws Exception
	 * @author vitlr
	 */
	public ArrayList<ProdutoBean> getListarPag(String pag, String seq) throws Exception{
		
		ArrayList<ProdutoBean> lista = new ArrayList<ProdutoBean>();	
		Conexao con = new Conexao();
		this.connection = con.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT p.idproduto, p.nome, p.unidade, p.valor, p.datacotacao, Empresa.nome as nomeE FROM produto p INNER JOIN empresa Empresa ON (p.idempresa=Empresa.idempresa)");
		sql.append(" ORDER BY p.idproduto ASC");		
		int pagInt = Integer.parseInt(pag);		
		if(verificar(pagInt)) {
		sql.append(" limit "+ pag);
		sql.append(" offset "+ seq);
		}
		Statement stmt = connection.createStatement();
		ResultSet rs = stmt.executeQuery(sql.toString());
		while (rs.next()) {
			ProdutoBean bean = new ProdutoBean();
		    bean.setIdproduto(rs.getInt("idproduto"));
			bean.setNome(rs.getString("nome"));			
			bean.setUnidade(rs.getString("unidade"));
			bean.setValor(rs.getDouble("valor"));
			bean.setDatacotacao(rs.getString("datacotacao"));
			EmpresaBean ep = new EmpresaBean();
			ep.setNome(rs.getString("nomeE"));
			bean.setEmp(ep);		
			lista.add(bean);
		}
		rs.close();
		con.closeConnection();
		return lista;
						
	}	

}
