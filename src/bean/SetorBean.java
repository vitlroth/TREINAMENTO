package bean;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import dao.SetorDao;

public class SetorBean {

	private int idSetor;
	private String nmSetor;		
	
	public String getNmSetor() {
		return nmSetor;
	}

	public void setNmSetor(String nmSetor) {
		this.nmSetor = nmSetor;
	}

	public int getIdSetor() {
		return idSetor;
	}

	public void setIdSetor(int idSetor) {
		this.idSetor = idSetor;
	}

	
	public ArrayList<SetorBean> setaSetor(HttpServletRequest request) {
		ArrayList<SetorBean> lista = null;
		try {
			SetorBean setorbean = new SetorBean();
			SetorDao setorDao = new SetorDao();
			lista = setorDao.setaSetor(setorbean);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return lista;
	}

}
