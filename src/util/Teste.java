package util;

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

	}

}
