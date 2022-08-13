<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<nav>
	<ul>
		<li><a href="index.html">Login</a></li>
		<li><a href="sales.jsp">Ventas</a></li>
	</ul> 
</nav>

<div>
<form method="POST">
	<p>Producto</p>
	<input type="text" name="product" required>

	<p>Quantity</p>
	<input type="number" name="quantity" required>

	<p>Unit Price</p>
	<input type="number" step="any" name="unitPrice" required>

	<p></p>
	<input type="submit" value="GUARDAR">

</form>

<%
if(request.getParameter("product") != null)
{
	try
	{		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conecction = DriverManager.getConnection("jdbc:mysql://localhost:3306/test03", "root","1234");
		Statement statement = conecction.createStatement();
		int result = statement.executeUpdate("INSERT INTO invoice(product,quantity,unitPrice) VALUES ('" + request.getParameter("product").toString() + "','" + request.getParameter("quantity").toString() + "','" + request.getParameter("unitPrice").toString() + "')");
		out.print(result);
	}catch(Exception e){
		 System.out.println(e.getMessage());
	}
}
%>
</div>
</body>
</html>