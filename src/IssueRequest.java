package TicketPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//Servlet implementation class SignUp
@SuppressWarnings("serial")
@WebServlet("/IssueRequest")
public class IssueRequest extends HttpServlet implements SetConnection {
	@SuppressWarnings("unused")
	private static final long serialIDVersion = 1;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		doGet(request, response);
		
		String requestForm     = request.getParameter("request");
		String departmentForm  = request.getParameter("department");
		String descriptionForm = request.getParameter("description");
		String userName        = request.getParameter("uname");
		
		Connection con = null;
		
		try {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			con = DriverManager.getConnection(url, username, password);
			
			Statement stmt = con.createStatement();
			
			String values = String.format("'%s', '%s', '%s', '%s'", userName, requestForm, departmentForm, descriptionForm);
			
			System.out.println(values);
			
			int rows = stmt.executeUpdate("INSERT INTO issuerequests(username, "
					+ "request, "
					+ "department, "
					+ "description) VALUES (" + values + ")");
			
			if(rows == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("uname", userName);
				response.sendRedirect("WelcomeUser.jsp?uname="+userName+"");
			} else {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('The issue request could not be recorded. ')");
				out.println("location='IssueRequest.jsp';");
				out.println("</script>");
			}
			
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
;	}
}
