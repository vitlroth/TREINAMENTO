package bean;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import dao.EmpresaDao;

public class EmpresaBean {

	private String email;
	private String nome;
	private Integer id;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ArrayList<EmpresaBean> listar(HttpServletRequest request) {
		ArrayList<EmpresaBean> lista = null;
		EmpresaDao dao = new EmpresaDao();

		try {
			lista = dao.buscarEmpresa();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return lista;
	}

}
