import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

//Servlet implementation class SignUp
@SuppressWarnings("serial")
@WebServlet("/SignUp")
public class SignUp extends HttpServlet implements SetConnection {
	@SuppressWarnings("unused")
	private static final long serialIDVersion = 1;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		doGet(request, response);
		
		String firstnameStr 		= request.getParameter("firstname");
		String lastnameStr 			= request.getParameter("lastname");
		String emailaddressStr 		= request.getParameter("email");
		String departmentStr        = request.getParameter("department");
		String jobtitleStr 			= request.getParameter("jobtitle");
		String usernameStr 			= request.getParameter("uname");
		String passwordStr  		= request.getParameter("password");
		String confirmpasswordStr 	= request.getParameter("confirmpassword");
		
		Connection con = null;
		try {
			try {
				Class.forName("org.postgresql.Driver");
			} catch(ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			con = DriverManager.getConnection(url, username, password);
			
			Statement stmt = con.createStatement();
			
			String values = String.format("'%s', '%s', '%s', '%s', '%s', '%s', '%s'",
					firstnameStr, lastnameStr, emailaddressStr, departmentStr, jobtitleStr, usernameStr, passwordStr);
			System.out.print(values);
			
			stmt.executeUpdate("INSERT INTO Users(FirstName, "
					+ "LastName, "
					+ "EmailAddress, "
					+ "Department, "
					+ "JobTitle,"
					+ "Username,"
					+ "UserPassword) VALUES (" + values + ")");
			
			
			if(!confirmpasswordStr.equals(passwordStr)) {
				System.out.println("Your passwords do not match.");
			}
		
			
			HttpSession session = request.getSession();
			session.setAttribute("uname", firstnameStr);
			response.sendRedirect("WelcomeUser.jsp?uname="+firstnameStr+"");
			
			
			con.close();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}