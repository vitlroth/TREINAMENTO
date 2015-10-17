/**
 * @autor: Luis Roth
 * 
 * e-mail: vitlroth@gmail.com
 */
package util;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import bean.UsuarioBean;

public class Relatorio {

	/**
	 * Método estático responsável por gerar o arquivo em pdf e exibir na tela
	 * Abrir ou Salvar.
	 * 
	 * @param relatorio
	 * @param parameters
	 * @param dados
	 * @param response
	 * @throws JRException
	 * @throws IOException
	 */
	public static void printReportToPdf(String relatorio, HashMap<String,Object> parameters, ArrayList<UsuarioBean> dados, HttpServletResponse response) throws JRException, IOException {
//		static JasperPrint 	JasperFillManager.fillReport(JasperReport jasperReport, java.util.Map<java.lang.String,java.lang.Object> parameters, JRDataSource dataSource) 		
//	JasperPrint filled = JasperFillManager.fillReport(relatorio, parameters, new JRBeanCollectionDataSource(dados));		
	// EXPORTAÇÃO DO RELATORIO PARA OUTRO FORMATO , nesse caso PDF..
//	JasperExportManager.exportReportToPdfFile(filled,"C:\\Users\\Luis\\Documents\\RelatorioClientes.pdf");
		
		// Codigo abaixo oferece ao usuario a opção de salvar o arquivo pdf
		JRDataSource reportSource = new JRBeanCollectionDataSource(dados);
		byte[] pdf =  JasperRunManager.runReportToPdf(relatorio,parameters,reportSource);		
		response.setHeader("Content-Disposition","attachment; filename=\"arquivo.pdf\""); // nome do arquivo enviado para o  navegador;
		response.setContentType("application/pdf"); // força o download
		ServletOutputStream retornoPDF = response.getOutputStream();	
		retornoPDF.write(pdf);
		retornoPDF.flush();		
		retornoPDF.close();

	}

	public static void printReportToCSV(File filled,String nomeArquivo,ArrayList<UsuarioBean> dados, HttpServletResponse response) {
		try {									
			FileInputStream fileInputStream = new FileInputStream("C:\\Users\\LCRO\\Documents\\" + nomeArquivo);		         
			response.setContentType("text/html");
            response.setHeader("Content-Disposition", "attachment; filename="+ nomeArquivo);
            BufferedOutputStream out2 = null;
            out2 = new BufferedOutputStream(response.getOutputStream(), 4096);
        	int bytesRead = 0;
        	byte bite[] = new byte[4096];
        	BufferedInputStream bis = new BufferedInputStream(fileInputStream, 4096);        	
        	while((bytesRead = bis.read(bite, 0, bite.length)) != -1)
        	out2.write(bite, 0, bytesRead);	        	          
            out2.flush();
        	bis.close();   
        	filled.delete();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		
	}
}
