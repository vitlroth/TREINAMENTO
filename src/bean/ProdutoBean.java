package bean;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import dao.ProdutoDao;

public class ProdutoBean {

	private Integer id;
	private String nome;
	private String datacotacao;
	private String unidade;
	private Double valor;
	private EmpresaBean emp;
	private String numeroDeRegistros;
	private String sequenciaRegistros;
	public int cont;

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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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
