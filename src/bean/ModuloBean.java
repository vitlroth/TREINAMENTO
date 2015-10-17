package bean;


import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;

import dao.ModuloDao;

public class ModuloBean {
	private int idmodulo;
	private String nmmodulo;
	private String destmodulo;

	public int getIdmodulo() {
		return idmodulo;
	}

	public void setIdmodulo(int idmodulo) {
		this.idmodulo = idmodulo;
	}

	public String getNmmodulo() {
		return nmmodulo;
	}

	public void setNmmodulo(String nmmodulo) {
		this.nmmodulo = nmmodulo;
	}

	public String getDestmodulo() {
		return destmodulo;
	}

	public void setDestmodulo(String destmodulo) {
		this.destmodulo = destmodulo;
	}

	public ArrayList<ModuloBean> lista(HttpServletRequest request) {
		ArrayList<ModuloBean> lista = null;
		try {
			ModuloBean moduloBean = new ModuloBean();
			ModuloDao moduloDao = new ModuloDao();
			lista = moduloDao.lista(moduloBean);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return lista;
	}
	
	
	
	

}
