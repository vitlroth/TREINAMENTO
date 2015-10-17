package bean;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import dao.Usuario_ModuloDao;

public class Usuario_ModuloBean {

	private int usuario_idusario; // idusuario
	private int idusuario_modulo; // chave primaria no banco
	private UsuarioBean usuarioBean;
	private ModuloBean moduloBean;
	private int modulo_idmodulo; // atributo igual ao banco
	private String[] modulo; // array de string módulos

	public String[] getModulo() {
		return modulo;
	}

	public void setModulo(String[] modulo) {
		this.modulo = modulo;
	}

	public int getUsuario_idusario() {
		return usuario_idusario;
	}

	public void setUsuario_idusario(int usuario_idusario) {
		this.usuario_idusario = usuario_idusario;
	}

	public int getIdusuario_modulo() {
		return idusuario_modulo;
	}

	public void setIdusuario_modulo(int idusuario_modulo) {
		this.idusuario_modulo = idusuario_modulo;
	}

	public UsuarioBean getUsuarioBean() {
		return usuarioBean;
	}

	public void setUsuarioBean(UsuarioBean usuarioBean) {
		this.usuarioBean = usuarioBean;
	}

	public ModuloBean getModuloBean() {
		return moduloBean;
	}

	public void setModuloBean(ModuloBean moduloBean) {
		this.moduloBean = moduloBean;
	}

	public int getModulo_idmodulo() {
		return modulo_idmodulo;
	}

	public void setModulo_idmodulo(int modulo_idmodulo) {
		this.modulo_idmodulo = modulo_idmodulo;
	}

	public String incluirmod(HttpServletRequest request) {
		try {
			Usuario_ModuloBean usuariomod = new Usuario_ModuloBean();
			usuariomod.setUsuario_idusario(Integer.parseInt(request.getParameter("idusuario")));
			String[] modulo = request.getParameterValues("modulo2");
			if (modulo != null && modulo.length>0) {
				for (int i = 0; i < modulo.length; i++) {
					Usuario_ModuloDao usuariodao = new Usuario_ModuloDao();
					Usuario_ModuloDao usuarioreg = new Usuario_ModuloDao();
					String s = modulo[i];
					usuariomod.setModulo_idmodulo(Integer.parseInt(s));
					int registro = usuarioreg.verificaregistro(usuariomod);
					if (registro == 0) {
						usuariodao.incluirmod(usuariomod);
					} else {
						return "Modulo já Vinculado!!!";
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "Erro ao Vincular Modulo!!";
		}
		return "Modulo vinculado com Sucesso!!";
	}

	public String excluirmod(HttpServletRequest request) {
		Usuario_ModuloBean bean = null;
		try {
			bean = new Usuario_ModuloBean();
			bean.setUsuario_idusario(Integer.parseInt(request.getParameter("idusuario")));
			String[] modulo_idmodulo = request.getParameterValues("modulo1");
			if (modulo_idmodulo != null && modulo_idmodulo.length > 0) {
				Usuario_ModuloDao moduloDao = null;
				for (int i = 0; i < modulo_idmodulo.length; i++) {
					String s = modulo_idmodulo[i];
					bean.setModulo_idmodulo(Integer.parseInt(s));
					moduloDao = new Usuario_ModuloDao();
					moduloDao.excluirmod(bean);
				}
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "Erro ao Incluir Modulo";
		}
		return "Modulo Desvinculado com sucesso!!";
	}

	public ArrayList<Usuario_ModuloBean> listamodulos(HttpServletRequest request) {
		ArrayList<Usuario_ModuloBean> lista = null;
		try {
			Usuario_ModuloBean moduloBean = new Usuario_ModuloBean();
			moduloBean.setUsuario_idusario(Integer.parseInt(request.getParameter("idusuario")));
			Usuario_ModuloDao moduloDao = new Usuario_ModuloDao();
			lista = moduloDao.listamodulos(moduloBean);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return lista;
	}

	public ArrayList<Usuario_ModuloBean> listaModulosDesvinculados( HttpServletRequest request) {
		ArrayList<Usuario_ModuloBean> lista = null;
		try {
			Usuario_ModuloBean moduloBean = new Usuario_ModuloBean();
			moduloBean.setUsuario_idusario(Integer.parseInt(request.getParameter("idusuario")));
			Usuario_ModuloDao moduloDao = new Usuario_ModuloDao();
			lista = moduloDao.listaModulosDesvinculados(moduloBean);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return lista;
	}

}
