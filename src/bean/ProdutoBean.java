package bean;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProdutoDao;
import dao.UsuarioDao;
import util.Relatorio;

public class ProdutoBean {

	private Integer idproduto;
	private String nome;
	private String datacotacao;
	private String unidade;
	private String empAux;
	private Double valor;
	private EmpresaBean emp;
	private String numeroDeRegistros;
	private String sequenciaRegistros;
	public int cont;
	
	public void setEmpAux(String empAux) {
		this.empAux = empAux;
	}
	
	public String getEmpAux() {
		return empAux;
	}

	public String getSequenciaRegistros() {
		return sequenciaRegistros;
	}

	public void setSequenciaRegistros(String sequenciaRegistros) {
		this.sequenciaRegistros = sequenciaRegistros;
	}

	public String getNumeroDeRegistros() {
		return numeroDeRegistros;
	}

	public void setNumeroDeRegistros(String numeroDeRegistros) {
		this.numeroDeRegistros = numeroDeRegistros;
	}

	public EmpresaBean getEmp() {
		return emp;
	}

	public void setEmp(EmpresaBean emp) {
		this.emp = emp;
	}



	public Integer getIdproduto() {
		return idproduto;
	}

	public void setIdproduto(Integer idproduto) {
		this.idproduto = idproduto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDatacotacao() {
		return datacotacao;
	}

	public void setDatacotacao(String datacotacao) {
		this.datacotacao = datacotacao;
	}

	public String getUnidade() {
		return unidade;
	}

	public void setUnidade(String unidade) {
		this.unidade = unidade;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}
	

	
	
	
	/**
	 * Método responsavel de gerar Relatório apartir de uma lista 
	 * @param request
	 * @param response
	 */
	public void gerarRelatorioPdf(HttpServletRequest request, HttpServletResponse response) {
		// caminho do relatório		
		String path = "C:\\Users\\vitlr\\workspace\\treinamento\\WebContent\\relatorios\\rel_produtos.jasper";
		HashMap<String, Object> hs = new HashMap<>();
		Calendar r =  Calendar.getInstance();
		hs.put("Data", r.getTime());
		ProdutoDao dao = new ProdutoDao();		
		ArrayList<ProdutoBean> lista;
		try {
			
			lista = dao.getlistar();
			Relatorio.gerarPDF(path, hs, lista, response);

		} catch (Exception e) {
		
			e.printStackTrace();
			System.out.println("Erro ao gerar relatorio PDF produtoBean");
		}
							
	}
	
	
	

	public ArrayList<ProdutoBean> lista(HttpServletRequest request) {
		ArrayList<ProdutoBean> l = null;
		ProdutoDao dao = new ProdutoDao();
		try {
			l = dao.getlistar();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return l;
	}

	public ArrayList<ProdutoBean> listaPaginacao(int numReg, int numPag) {
		ArrayList<ProdutoBean> l = null;
		ProdutoDao dao = new ProdutoDao();
		try {
			String numR = String.valueOf(numReg);
			String numP = String.valueOf(numPag);
			l = dao.getListarPag(numR, numP);
			return l;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return l;
	}

}
