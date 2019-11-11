package TicketPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CreateTicket extends HttpServlet implements SetConnection {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		doGet(request, response);
		String TicketName  = request.getParameter("ticketname");
		String Department  = request.getParameter("department");
		String CreatedBy   = request.getParameter("uname");
		String AssignedTo  = request.getParameter("user");
		String Priority    = request.getParameter("priority");
		String Date        = request.getParameter("date");
		String Description = request.getParameter("description");
		
		Connection con = null;
		
		try {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			con = DriverManager.getConnection(url, username, password);
			
			Statement stmt = con.createStatement();
			
			String values = String.format("'%s', '%s', '%s', '%s', '%s', '%s', '%s'", TicketName, 
					Department, CreatedBy, AssignedTo, Priority, Date, Description);
			
			int rows = stmt.executeUpdate("INSERT INTO tickets(Name,"
					+ "Department, "
					+ "AssignedTo, "
					+ "Priority, "
					+ "scheduledcompletiondate, "
					+ "description, "
					+ "createdby) VALUES (" + values + ")");
			
			if(rows == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("uname", CreatedBy);
				response.sendRedirect("WelcomeUser.jsp?uname=" + CreatedBy + "");
			} else {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('The issue request could not be recorded. ')");
				out.println("location='TicketForm.jsp';");
				out.println("</script>");
			}
			
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
