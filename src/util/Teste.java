package util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
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

	public static void main(String[] args) throws FileNotFoundException {

		File f = new File("rel_produtos.jasper");
		FileInputStream fis = new FileInputStream("C:\\Users\\vitlr\\workspace\\treinamento\\WebContent\\relatorios\\rel_produtos.jasper");
		System.out.println("Nome do arquivo : " + f.getName());
		System.out.println("Caminho : " + f.getPath());
		System.out.println("Caminho Absoluto : " + f.getAbsolutePath());
		String path = "C:\\Users\\vitlr\\workspace\\treinamento\\WebContent\\relatorios\\rel_produtos.jasper";
//	InputStream inpSt = fis;
		// Se não encontrar o erro trata a exceção
	}
}
