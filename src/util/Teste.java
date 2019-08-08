package util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Teste {

	public static java.sql.Date getSqlDate(Date data) {
		if (data == null) {
			return null;
		}

		return java.sql.Date.valueOf(dateToStr(data, "yyyy-MM-dd"));

	}

	public static String dateToStr(Date date, String format) {
		String retorno = null;

		if ((null != date) && (null != format)) {
			SimpleDateFormat formater = new SimpleDateFormat(format);
			retorno = formater.format(date);
		}

		return retorno;

	}
	
	
	
	
	
	
	
	
	

	public static void main(String[] args) {

		
		try {
			File f = new File("Teste.java");
			System.out.println("Nome do arquivo : " + f.getName());
			System.out.println("Caminho : " + f.getPath());
			System.out.println("Caminho Absoluto : " + f.getAbsolutePath());
			
		} catch (Exception e) {					
			// Se não encontrar o erro trata a exceção
			
			
			e.getMessage();
		}
		
		
		
		
		
		
		
		
		
	}

}
