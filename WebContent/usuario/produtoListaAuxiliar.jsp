<%@page import="dao.ProdutoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="bean.ProdutoBean"%>
<%@page import="java.util.ArrayList"%>
<%@include file="verifica_sessao.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<%
	String acao = request.getParameter("acao");
	String idusuario = request.getParameter("idusuario");
	ArrayList<ProdutoBean> listao = null;
	ProdutoBean bean = new ProdutoBean();	
	ProdutoBean beanRel = null;	

	if(acao.equals("gerarPdf")){
		
		beanRel = new ProdutoBean();
		beanRel.gerarRelatorioPdf(request, response);
	}		
%>
<%!public int Converter(String str) {
		int convrtr = 0;
		if (str == null) {
			str = "0";
		} else if ((str.trim()).equals("null")) {
			str = "0";
		} else if (str.equals("")) {
			str = "0";
		}
		try {
			convrtr = Integer.parseInt(str);
		} catch (Exception e) {
		}
		return convrtr;
	}%>
<%
	// Numero de registros mostrados em cada pagina
	int iSwRws = 2;
	// Numero de paginas exibidas.			
	int iTotSrhRcrds = 8;
	int iTotRslts = Converter(request.getParameter("iTotRslts"));
	int iTotPags = Converter(request.getParameter("iTotPags"));
	int iPagNo = Converter(request.getParameter("iPagNo"));
	int cPagNo = Converter(request.getParameter("cPagNo"));
	int escolhaPag = Converter(request.getParameter("example_length"));			
	int totalRegistros = 0;		
	int iStRsNo = 0;	
	int iEnRsNo = 0;
	if (iPagNo == 0) {
		iPagNo = 0;
	} else {
		iPagNo = Math.abs((iPagNo - 1) * iSwRws);
	}				
		ProdutoDao daoPr = new ProdutoDao();	
		iTotRslts = daoPr.contaRegistros();	
		if( iTotRslts<=0){
			iTotRslts = 0;
		} else if(escolhaPag==10||escolhaPag==20||escolhaPag==30){
			iTotRslts = escolhaPag;
		}							
	ProdutoBean beanLaden = new ProdutoBean();					
	listao = beanLaden.listaPaginacao(iTotRslts,iPagNo);	
	
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Paginação usando JSP</title>
<jsp:useBean id="produto" class="bean.ProdutoBean"></jsp:useBean>
<jsp:useBean id="dao" class="dao.ProdutoDao"></jsp:useBean>
<link href="../resources/bootstrap/css/dataTables.jqueryui.css"
	rel="stylesheet" />
<link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css" />
<link href="https://code.jquery.com/jquery-3.3.1.js" rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"
	rel="stylesheet" />
</head>
<script type="text/javascript">
 	function voltar(idusuario) { 	 		
 	 	document.forms[0].acao.value = "listaAux";
 		document.forms[0].idusuario.value = idusuario;  
		document.forms[0].action = "cadastro_usuario.jsp";
		document.forms[0].submit();
	}		
	function armazena(x){		
		document.forms[0].example_length.value = x;	
		document.forms[0].submit();		
	}			
	function gerarPdf(){	
		document.forms[0].acao.value = "gerarPdf";
		document.forms[0].idusuario.value = idusuario;  
		document.forms[0].action = "produtoListaAuxiliar.jsp";
		document.forms[0].submit();
		
	}			
	function limpar(){
		document.forms[0].acao.value = "limpar";
		document.forms[0].submit();
	}			
</script>
<body>
	<form method="get">
		<input type="hidden" name="iPagNo" value="<%=iPagNo%>">  
		<input type="hidden" name="cPagNo" value="<%=cPagNo%>">		
		<input type="hidden" name="iSwRws" value="<%=iSwRws%>">	
			
		<div id="example_wrapper" class="table table-striped table-bordered" style="width: 100%">
		  <div align="center">		     
					<label class="text-primary"  ><font size="5" face="Verdana">PRODUTOS AUXILIARES</font></label>			
		  </div>
		    <div class="row">
			  <div class="col-sm-12">
					<table id="example" class="table table-striped table-bordered dataTable"
						style="width: 80%;" role="grid" aria-describedby="example_info">
						<thead>
						    <tr role="row">
	                           <th>    
	                           <select name="example_length"   onchange="armazena(this.value)" class="form-control input-sm">	
	                           <option value="10" >selecione</option>  
	                           <option value="10" >10</option>
	                           <option value="20">20</option>
	                           <option value="30">30</option>	                           
	                           </select>	                           
	                           </th>   					
						    </tr>
							<tr role="row">
								<th class="sorting_asc" tabindex="0" aria-controls="example"
									rowspan="1" colspan="1" style="width: 128px;"
									aria-sort="ascending"
									aria-label="Name: activate to sort column descending">CODIGOID</th>
								<th class="sorting" tabindex="0" aria-controls="example"
									rowspan="1" colspan="1" style="width: 210px;"
									aria-label="Position: activate to sort column ascending">NOME</th>
								<th class="sorting" tabindex="0" aria-controls="example"
									rowspan="1" colspan="1" style="width: 95px;"
									aria-label="Office: activate to sort column ascending">UNIDADE
									DE MEDIDA</th>
								<th class="sorting" tabindex="0" aria-controls="example"
									rowspan="1" colspan="1" style="width: 40px;"
									aria-label="Age: activate to sort column ascending">VALOR</th>
								<th class="sorting" tabindex="0" aria-controls="example"
									rowspan="1" colspan="1" style="width: 86px;"
									aria-label="Start date: activate to sort column ascending">DATA
									DA COTACAO</th>
								<th class="sorting" tabindex="0" aria-controls="example"
									rowspan="1" colspan="1" style="width: 71px;"
									aria-label="Salary: activate to sort column ascending">NOME
									DO FORNECEDOR</th>
							</tr>
						</thead>
						<%
							if (listao != null && listao.size() > 0) {
								ProdutoBean rsPgin = null;
								for (int i = 0; i < listao.size(); i++) {
									rsPgin = listao.get(i);
						%>
						<tbody>
							<tr>
								<td><%=rsPgin.getIdproduto()%></td>
								<td><%=rsPgin.getNome()%></td>
								<td><%=rsPgin.getUnidade()%></td>
								<td><%=rsPgin.getValor()%></td>
								<td><%=rsPgin.getDatacotacao()%></td>
								<td><%=rsPgin.getEmp().getNome()%></td>
							</tr>
							<%
								}
								}
							%>
							<%
								// Calcula o posicao inicial e a final dos registros.
								try {
									if (iTotRslts < (iPagNo + iSwRws)) {
										iEnRsNo = iTotRslts;
									} else {
										iEnRsNo = (iPagNo + iSwRws);
									}

									iStRsNo = (iPagNo + 1);
									iTotPags = ((int) (Math.ceil((double) iTotRslts / iSwRws)));

								} catch (Exception e) {
									e.printStackTrace();
								}
							%>
							<tr>
								<td colspan="3">
								<nav aria-label="Page navigation example">
								 <ul class="pagination">
<% 
     // Create index of pages  
    int i=0; 
    int cPge=0; 
    if(iTotRslts!=0) 
       { 
        cPge=((int)(Math.ceil((double)iEnRsNo/(iTotSrhRcrds*iSwRws)))); 
        int prePageNo=(cPge*iTotSrhRcrds)-((iTotSrhRcrds-1)+iTotSrhRcrds);
        if((cPge*iTotSrhRcrds)-(iTotSrhRcrds)>0) 
            { 
        %>                          
        <li class="page-item"><a class="page-link" href="produtoListaAuxiliar.jsp?iPagNo=<%=prePageNo%>&cPagNo=<%=prePageNo%>"><<<<<< Previous</a></li> 
        <% 
        } 
           
        for(i=((cPge*iTotSrhRcrds)-(iTotSrhRcrds-1));i<=(cPge*iTotSrhRcrds);i++) 
        { 
            if(i==((iPagNo/iSwRws)+1)) 
            { 
            %> 
        <li class="page-item"><a class="page-link"  href="produtoListaAuxiliar.jsp?iPagNo=<%=i%>"   style="cursor:pointer;color:red"><b>
        <%=i%></b></a></li> 
            <% 
            } 
            else if(i<=iTotPags) 
            { 
            %> 
        <li class="page-item"><a class="page-link"  href="produtoListaAuxiliar.jsp?iPagNo=<%=i%>"><%=i%></a></li> 
            <%  
            } 
        } 
       
        if(iTotPags>iTotSrhRcrds&& i<iTotPags) 
        { 
         %> 
        <li class="page-item"><a class="page-link"  href="produtoListaAuxiliar.jsp?iPagNo=<%=i%>&cPagNo=<%=i%>">>>> Next</a></li>
         
        <% 
        } 
      } 
      %> 
       </ul>
        </nav>
    <b>Rows <%=iStRsNo%> - <%=iEnRsNo%>   
    Total Result  <%=iTotRslts%></b> 
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
		</div>
		<input type="hidden" name="acao">
		<input type="hidden" name="idusuario"> 
		
		<button class="btn btn-primary" onclick="voltar(<%=idusuario%>)">Voltar</button>
		<button class="btn btn-primary" onclick="limpar()">Limpar</button>
		<button class="btn btn-primary" onclick="gerarPdf()">Gerar pdf</button>			
	</form>
</body>
</html>