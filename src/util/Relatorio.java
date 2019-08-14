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
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;


import bean.ProdutoBean;
import bean.UsuarioBean;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

public class Relatorio {

	/**
	 * Método estático responsável por gerar o arquivo em pdf e exibir na tela Abrir
	 * ou Salvar.
	 * 
	 * @param relatorio
	 * @param parameters
	 * @param dados
	 * @param response
	 * @throws JRException
	 * @throws IOException
	 */
	public static void printReportToPdf(String relatorio, HashMap<String, Object> parameters,
			ArrayList<UsuarioBean> dados, HttpServletResponse response) throws JRException, IOException {
		// Codigo abaixo oferece ao usuario a opção de salvar o arquivo pdf
		JRDataSource reportSource = new JRBeanCollectionDataSource(dados);
		byte[] pdf = JasperRunManager.runReportToPdf(relatorio, parameters, reportSource);
		response.setHeader("Content-Disposition", "attachment; filename=\"arquivo.pdf\""); // nome do arquivo enviado
																					// ra o navegador;
		response.setContentType("application/pdf"); // força o download
		ServletOutputStream retornoPDF = response.getOutputStream();
		retornoPDF.write(pdf);
		retornoPDF.flush();
		retornoPDF.close();

	}

	
	
	
	/**
	 * 
	 * @param relatorio
	 * @param parameters
	 * @param lista
	 * @param response
	 * @throws JRException
	 * @throws IOException
	 */
	public static void gerarPDF(InputStream relatorio, HashMap<String, Object> parameters, ArrayList<ProdutoBean> lista,
			HttpServletResponse response) throws JRException, IOException {
		System.out.println("Tentando gerar relaforio");
		JRDataSource reportSource = new JRBeanCollectionDataSource(lista);
		System.out.println("Se não ocorreu nenhum erro...");
		response.setHeader("Content-Disposition", "attachment; filename=\"arquivo.pdf\""); // nome do arquivo enviado		
		response.setContentType("application/pdf"); // força o download// para o navegador;
		ServletOutputStream retornoPDF = response.getOutputStream();		
		JasperRunManager.runReportToPdfStream(relatorio,retornoPDF,parameters,reportSource);	
		retornoPDF.flush();
		retornoPDF.close();
	}

	public static void geraRelatorioPdf(String inputStream, HashMap<String, Object> parametros,
			ArrayList<ProdutoBean> lista, HttpServletResponse response) {
		JRBeanCollectionDataSource ds = new JRBeanCollectionDataSource(lista);
		try {
			// Manda o jasper gerar o relatório
			JasperPrint print = JasperFillManager.fillReport(inputStream, parametros, ds);
			preencherPdf(print, inputStream);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Erro ao gerar relatorio PDF ");
		}

	}

	/**
	 * Método que retorna o caminho completo ou pasta de aplicação
	 * 
	 * @return
	 */
	private String getDiretorioReal() {
		return "";
	}

	/**
	 * Método que retorna o nome da aplicação
	 * 
	 * @return
	 */
	private String getContextPath() {
		return "";
	}

	private static void preencherPdf(JasperPrint print, String caminho) {
		try {
			System.out.println("Preparando para exportar arquivo pdf para o caminho : " + caminho);
			JasperExportManager.exportReportToPdfFile(print, caminho);
		} catch (JRException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void printReportToCSV(File filled, String nomeArquivo, ArrayList<UsuarioBean> dados,
			HttpServletResponse response) {
		try {
			FileInputStream fileInputStream = new FileInputStream("C:\\Users\\vitlr\\OneDrive" + nomeArquivo);
			response.setContentType("text/html");
			response.setHeader("Content-Disposition", "attachment; filename=" + nomeArquivo);
			BufferedOutputStream out2 = null;
			out2 = new BufferedOutputStream(response.getOutputStream(), 4096);
			int bytesRead = 0;
			byte bite[] = new byte[4096];
			BufferedInputStream bis = new BufferedInputStream(fileInputStream, 4096);
			while ((bytesRead = bis.read(bite, 0, bite.length)) != -1)
				out2.write(bite, 0, bytesRead);
			out2.flush();
			bis.close();
			filled.delete();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}
}
