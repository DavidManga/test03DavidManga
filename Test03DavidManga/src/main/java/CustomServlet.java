

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

/**
 * Servlet implementation class CustomServlet
 */
public class CustomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	doGet(request, response);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String user = request.getParameter("username");
		String password = request.getParameter("pass");
		
		try {
			
//			Class.forName("com.mysql.jdbc.Driver");
//			Connection conecction = DriverManager.getConnection("jdbc:mysql://localhost:3306/test03?useSSL=false", "root","1234");
			
			//Start the querys
//			Statement statement = conecction.createStatement();
//			ResultSet resultSet = statement.executeQuery("SELECT username, password from users");
//			while(resultSet.next()){
//				System.out.print(resultSet.getString("username"));
//			}
			response.sendRedirect("sales.jsp");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.print(e.getMessage());
		}
	}

}
