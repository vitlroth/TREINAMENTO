package bean;


import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.Object;


import dao.ProdutoDao;
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
			InputStream relatorio;
			try {														
			 HttpSession sessao = request.getSession();				 
			  relatorio = sessao.getServletContext().getResourceAsStream("relatorios/relatorio.jasper");
				HashMap<String, Object> hs = new HashMap<>();
				Calendar r =  Calendar.getInstance();
				hs.put("Data", r.getTime());
				ProdutoDao dao = new ProdutoDao();		
				ArrayList<ProdutoBean> lista;
				lista = dao.getlistar();
				Relatorio.gerarPDF(relatorio, hs, lista, response);
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				System.out.println("Arquivo não foi encontrado:");
						}catch (Exception e){
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
