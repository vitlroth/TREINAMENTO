package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import bean.UsuarioBean;

/**
 * @author l.oliveira
 * 
 */

public class Data {
	// 19/12/1212 converte data modo brasileiro para americano...
	public static String converteData2(String data) {
		if (data != null && data.length() == 10) {

			String ano = data.substring(6, 10);
			String mes = data.substring(3, 5);
			String dia = data.substring(0, 2);
			String dataFinal = ano + "/" + mes + "/" + dia;
			return dataFinal;
		} else {
			return null;
		}
	}

	// 1212/12/19 converte modo americano(banco) para brasileiro
	public static String converteData1(String data) {
		if (data != null && data.length() == 10) {
			String ano = data.substring(0, 4);
			String mes = data.substring(5, 7);
			String dia = data.substring(8, 10);

			String dataFinal = dia + "/" + mes + "/" + ano;
			return dataFinal;
		} else {
			return null;
		}
	}

	/**
	 * @author l.oliveira
	 * 
	 */
	public static String dataAtual() {
		Date data = new Date();
		SimpleDateFormat formataData = new SimpleDateFormat("dd/MM/yyyy");
		String dataAtual = formataData.format(data);
		return dataAtual;
	}

	/**
	 * @author l.oliveira 13-04-2010
	 */

	public static String formataData(String data) throws ParseException {
		String d2 = null;
		SimpleDateFormat formatador = new SimpleDateFormat("yyyy-MM-dd");
		Date dataBrasil = formatador.parse(data); // transforma para o formato Date
		SimpleDateFormat formatadornovo = new SimpleDateFormat("yyyy-MM-dd");
		formatadornovo.applyPattern("dd/MM/yyyy");
		d2 = formatadornovo.format(dataBrasil); // transforma novamente para string
		return d2;
	}

	/**
	 * 
	 * @param data
	 * @return Calendar
	 */
	public static Calendar convertDateForCalendar(Date data) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(data);
		return calendar;

	}

	public static Calendar convertDateForCalendar(String data) {
		Date calx = (Date) Data.testador(data);
		Calendar dataCalendar = Data.convertDateForCalendar(calx);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(calx);
		return dataCalendar;

	}

	
	
	public static Calendar convertido(String data) throws ParseException {
		
		String str = Data.formataData(data);
		Date clt = Data.formatadorData(str);
		Calendar coco = Calendar.getInstance();
		coco.setTime(clt);
		return coco;
		
	}
	
	
	
	
	/**
	 * @author vitlr
	 * @throws ParseException
	 * @return Date
	 */
	public static Date formatadorData(String data) throws ParseException {
		SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
		Date dt = formatador.parse(data);
		return dt;

	}
	
	
	/*<td><a href="javascript:pesquisar('<%=bean.getIdusuario()%>')"><font face="verdana"><%=bean.getNmusuario()%></font></a></td>
	<td><font face="verdana"><%=bean.getIdusuario()%></font></td>
	<td><font face="verdana"><%=bean.getDataNascimento().getTime() %></font></td>
	<td><font face="verdana"><%=bean.getNmlogin()%></font></td>
	<td><a href="javascript:excluir('<%=bean.getIdusuario() %>','<%=bean.getNmusuario()%>')"><font face="verdana">excluir</font></a>
	
	         									<div align="center">
	<input type="button"   class="btn btn-primary" value="voltar" onclick="retornar('<%=idusuario%>')">	
</div>
<input type="hidden" name="acao" value="<%=acao%>">
<input type="hidden" name="idusuario" value="<%=idusuario%>">
	         									
	         									
	         									
	</tr>*/
	
	

	public static UsuarioBean formatador() throws ParseException {
		String data = "11/03/2011";
		SimpleDateFormat formatador = new SimpleDateFormat("yyyy/MM/dd");
		// formatador.format(inter);
		// formatador.applyPattern("dd/MM/yyyy");
		Date inter = formatador.parse(data);
		formatador.applyPattern("dd/MM/yyyy");
		Calendar d = convertDateForCalendar(inter);
		UsuarioBean usuarioBean = new UsuarioBean();
		usuarioBean.setDataNascimento(d);
		return usuarioBean;
	}

	public static Date testador(String data) {
		SimpleDateFormat formatador = new SimpleDateFormat("yyyy-MM-dd");
		Date inter = null;

		try {
			inter = formatador.parse(data);
			formatador.applyPattern("dd-MM-yyyy");
			// Formata um date e devolve uma string
			String dataForm = formatador.format(inter);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return inter;

	}

	public static void testador() throws ParseException {
		// String data = "2009/10/30";
		String data = "2000-10-30";
		SimpleDateFormat formatador = new SimpleDateFormat("yyyy-MM-dd");
		Date inter = formatador.parse(data);
		formatador.applyPattern("dd-MM-yyyy");
		// Formata um date e devolve uma string
		String dataForm = formatador.format(inter);
		System.out.println(dataForm);

	}

	public static Date parseDate(String data) {
		SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
		Date inter = null;
		try {
			inter = formatador.parse(data);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return inter;

	}

	public static Calendar convertDateForCalendar(java.sql.Date a) {
		// TODO Auto-generated method stub
		return null;
	}

	// public static Date parseDate(String data) {

}
