package bean;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.Data;
import util.Relatorio;
import dao.UsuarioDao;
public class UsuarioBean {

	private int idusuario;
	private String nmusuario;
	private String nmlogin;
	private String nmsenha;
	private String nmsexo;
	private SetorBean setor;
	private int idsetor;
	private String data;
	private Data dat;
		
	public Data getDat() {
		return dat;
	}
	public void setDat(Data dat) {
		this.dat = dat;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}	
	public int getIdusuario() {
		return idusuario;
	}
	public SetorBean getSetor() {
		return setor;
	}
	public void setSetor(SetorBean setor) {
		this.setor = setor;
	}
	public int getIdsetor() {
		return idsetor;
	}
	public void setIdsetor(int idsetor) {
		this.idsetor = idsetor;
	}
	public String getNmlogin() {
		return nmlogin;
	}
	public void setNmlogin(String nmlogin) {
		this.nmlogin = nmlogin;
	}
	public String getNmusuario() {
		return nmusuario;
	}
	public void setNmusuario(String nmusuario) {
		this.nmusuario = nmusuario;
	}
	public String getNmsenha() {
		return nmsenha;
	}
	public void setNmsenha(String nmsenha) {
		this.nmsenha = nmsenha;
	}
	public String getNmsexo() {
		return nmsexo;
	}
	public void setNmsexo(String nmsexo) {
		this.nmsexo = nmsexo;
	}
	public void setIdusuario(int idusuario) {
		this.idusuario = idusuario;
	}
	
	public String inclui(HttpServletRequest request) {
		try {
			UsuarioBean usuarioBean = new UsuarioBean();
			usuarioBean.setNmusuario(request.getParameter("nome"));
			usuarioBean.setNmlogin(request.getParameter("login"));
			usuarioBean.setNmsenha(request.getParameter("senha"));
			usuarioBean.setNmsexo(request.getParameter("sexo"));
			usuarioBean.setIdsetor(Integer.parseInt(request.getParameter("setor")));
			String data = request.getParameter("data");						
		
			String d = Data.formataData(data);			
			usuarioBean.setData(d);							        			
			UsuarioDao usuarioDao = new UsuarioDao();
			usuarioDao.inclui(usuarioBean);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "Erro ao Incluir!!";
		}
		return "Incluido com Sucesso!";
	}

	public int recuperaId() {
		int ultimoId = 0;
		try {
			UsuarioDao dao = new UsuarioDao();
			ultimoId = dao.recuperaId();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return ultimoId;
	}

	public ArrayList<UsuarioBean> lista(HttpServletRequest request) {

		ArrayList<UsuarioBean> lista = null;
		try {
			UsuarioBean usuarioBean = new UsuarioBean();
			usuarioBean.setNmusuario(request.getParameter("nome"));
			usuarioBean.setNmlogin(request.getParameter("login"));
			UsuarioDao usuarioDao = new UsuarioDao();
			lista = usuarioDao.lista(usuarioBean);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return lista;
	}

	public UsuarioBean pesquisar(HttpServletRequest request) {
		UsuarioBean usuarioBean = null;
		try {
			usuarioBean = new UsuarioBean();
			usuarioBean.setIdusuario(Integer.parseInt(request.getParameter("idusuario")));
			UsuarioDao usuarioDao = new UsuarioDao();
			usuarioBean = usuarioDao.pesquisar(usuarioBean);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return usuarioBean;
	}

	public String exclui(HttpServletRequest request) {

		try {
			UsuarioBean usuarioBean = new UsuarioBean();
			usuarioBean.setIdusuario(Integer.parseInt(request.getParameter("idusuario")));
			UsuarioDao usuarioDao = new UsuarioDao();
			usuarioDao.Excluir(usuarioBean);

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "Excluido com sucesso!";
	}

	public String altera(HttpServletRequest request) {
		try {
			UsuarioBean usuarioBean = new UsuarioBean();
			usuarioBean.setIdusuario(Integer.parseInt(request.getParameter("idusuario")));
			usuarioBean.setNmusuario(request.getParameter("nome"));
			usuarioBean.setNmlogin(request.getParameter("login"));
			usuarioBean.setNmsenha(request.getParameter("senha"));
			usuarioBean.setNmsexo(request.getParameter("sexo"));
			usuarioBean.setIdsetor(Integer.parseInt(request.getParameter("setor")));
			String data = request.getParameter("data");				
			String novaData = Data.converteData2(data);		
			usuarioBean.setData(novaData);	
			UsuarioDao usuarioDao = new UsuarioDao();
			usuarioDao.altera(usuarioBean);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("Erro ao alterar!!");
		}
		return "Alterado com sucesso!!";
	}
	
	
	
/**
 * author Luis 22/02/2010
 * @param request
 * @param response
 * @return
 */
	public String acessalogin(HttpServletRequest request, HttpServletResponse response){
		String msg = "Acesso Permitido";
		String msg01 = "Acesso Negado";		
		try {
			UsuarioBean usuarioBean = new UsuarioBean();
			usuarioBean.setNmlogin(request.getParameter("login"));
			usuarioBean.setNmsenha(request.getParameter("senha"));
			UsuarioDao usuarioDao = new UsuarioDao();													
			usuarioBean = usuarioDao.acessalogin(usuarioBean);						
			if (usuarioBean != null) {
				response.sendRedirect("usuario/principal.jsp?idusuario=" + usuarioBean.getIdusuario()+"&msg="+msg);
				HttpSession sessao = request.getSession();							
				sessao.setAttribute("UsuarioLogado", usuarioBean);									
			}else{				
				 response.sendRedirect("index.jsp?msg01="+msg01);
			}			
		} catch (Exception e) {			 
			System.out.println(e.getMessage());									
		}
		
		return "";
		
	}
	
	public void relatorio(HttpServletRequest request, HttpServletResponse response) {				
		String relatorio = "C:\\Users\\LCRO\\workspace\\treinamento\\WebContent\\relatorios\\rel_usuarios.jasper";		
		String relatorioCsv = "C:\\Users\\LCRO\\Documents\\";	
		UsuarioBean usuarioBean = null ;				
		HashMap<String,Object> parametros = new HashMap<String,Object>();		
		parametros.put("data", Data.dataAtual());
		parametros.put("login", Data.dataAtual());
		parametros.put("usuario", Data.dataAtual());				
		ArrayList<UsuarioBean> listaUsuarios = new ArrayList<UsuarioBean>();		
		try {
			usuarioBean = new UsuarioBean();
			usuarioBean.setNmusuario(request.getParameter("nome"));
			usuarioBean.setNmlogin(request.getParameter("login"));
			UsuarioDao usuarioDao = new UsuarioDao();
			listaUsuarios = usuarioDao.lista(usuarioBean);
			String opcao = request.getParameter("opcao");	
			if(opcao.equals("1")){
				Relatorio.printReportToPdf(relatorio,parametros,listaUsuarios,response);
				
			}
			if(opcao.equals("2")){
				String nomeArquivo = "CSV_ARQUIVO.csv";		
				StringBuilder linha = new StringBuilder();										
				UsuarioBean bean = null;
				linha.append("Login" + ";" + "Usuario" + "\r\n");
				for (int i = 0; i < listaUsuarios.size(); i++) {
					bean = (UsuarioBean) listaUsuarios.get(i);
					linha.append(bean.getNmlogin() + ";");
					linha.append(bean.getNmusuario() + ";");
					linha.append("\r\n");										
				}					
				
				File  filled = new File(relatorioCsv);				
				if(filled.exists()){
					filled.delete();											
				}													
				FileWriter file = new FileWriter("C:\\Users\\LCRO\\Documents\\" + nomeArquivo);			
				file.write(linha.toString());
				file.flush();
				file.close();				
				Relatorio.printReportToCSV(filled,nomeArquivo,listaUsuarios,response);
			}									
		}
		catch (Exception e){
			System.out.println("OLA MUNDO ERRADO");

			e.printStackTrace();
		}		
	}	
}
