<%@page import="java.awt.desktop.SystemEventListener"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Test03 | Ventas</title>
<link href="assets/css/style.css" type="text/css" rel="stylesheet" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="assets/js/script.js"></script>
</head>
<body>

<nav><ul>
<li><a href="index.html">Login</a></li>
<li><a href="products.jsp">Products</a></li>
</ul> 
</nav>
<div class="container">
	<div class="invoice">
		<h3>CONSULTA DE VENTAS</h3>
		
		
		<p>Folio de Venta:</p>
		<form class="form" method="post">
			
			<input class="inputInvoice" type="number" name="invoice" required maxlength="30">
			<input class="submit" type="submit" value="Consultar">
		</form>
		
	</div>
		<div class="table">
		<p >Lista de productos:</p>
		
			<table border="1">	
				<tr>
					<th>No.</th><th>Producto</th><th>Cantidad</th><th>Precio Unitario</th><th>Total</th>
				</tr>
			 <%
	         if (request.getParameter("invoice") != null){
	        	 
			 	float totalInvoice =  0;
				int totalProducts = 0;
				float subtotalProduct =  0;
				try
				{
					int counter = 1;
					
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection conecction = DriverManager.getConnection("jdbc:mysql://localhost:3306/test03", "root","1234");
					Statement statement = conecction.createStatement();
					ResultSet resultSet = statement.executeQuery("SELECT * FROM invoice");
					
					while(resultSet.next()){						
						totalProducts = totalProducts + resultSet.getInt("quantity");
						subtotalProduct = resultSet.getFloat("unitPrice") * resultSet.getInt("quantity");
						totalInvoice = totalInvoice + subtotalProduct;
			  %>	
						<tr>
						<td><%out.print(counter++);%></td>
						<td><%out.print(resultSet.getString("product"));%></td>
						<td><%out.print(resultSet.getInt("quantity"));%></td>
						<td>$ <%out.print(resultSet.getFloat("unitPrice"));%></td>
						<td>$ <%out.print(subtotalProduct);%></td>
						</tr>
			  <%
					}
				
				}catch(Exception e){
					 System.out.print(e.getMessage());
				}
			  %>
			</table>
		</div>
		<div class="totals">
		<p>Total Productos: <% out.print(totalProducts); %></p>
		<p class="billing">Total Venta: $ <% out.print(totalInvoice);} %></p>
		</div>
	</div>
	
 
</body>
</html>