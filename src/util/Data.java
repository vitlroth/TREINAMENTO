package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
	 * @author l.oliveira
	 * 13-04-2010 
	 */
	
	
	
	public static String formataData(String data) throws ParseException {
		String d2 = null;
		SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
		Date dataBrasil = formatador.parse(data); // transforma para o formato string
		SimpleDateFormat formatadornovo = new SimpleDateFormat("yyyy/MM/dd");
		d2 = formatadornovo.format(dataBrasil); // transforma novamente para string												
		return d2;
	}

}
