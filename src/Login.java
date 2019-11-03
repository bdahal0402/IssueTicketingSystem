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

// Servlet implementation class Login
@SuppressWarnings("serial")
@WebServlet("/Login")
public class Login extends HttpServlet implements SetConnection {
	@SuppressWarnings("unused")
	private static final long serialIDVersion = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.sendRedirect("login.jsp");
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		doGet(request, response);
		
		String name = request.getParameter("uname");
		String pass = request.getParameter("upass");
		
		//System.out.println("Name =" + name + "Pass " + pass);
		
		Connection con = null;
		try {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			con = DriverManager.getConnection(url, username, password);
			//System.out.println("DB connected successfully!");
			
			Statement stmt = con.createStatement();
			
			ResultSet rs2 = stmt.executeQuery("SELECT Username, UserPassword FROM Users WHERE Username = '"+name+"' AND UserPassword = '"+AES.encrypt(pass, "passwordEncryption")+"'   ");
			
			if(rs2.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("uname", name);
				response.sendRedirect("WelcomeUser.jsp?uname=" + name);
			} else {
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Wrong username and password combination.');");
				out.println("</script>");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static boolean checkDBusername(String Username) {
		DBConnection db = new DBConnection();
		String query = String.format("SELECT COUNT(*) FROM Users WHERE Username='%s'", Username);
		db.runQuery(query);
		return true;
	}
	
	public static boolean checkDBPassword(String Password) {
		DBConnection db = new DBConnection();
		String query = String.format("SELECT COUNT(*) FROM Users WHERE UserPassword='%s'", Password);
		db.runQuery(query);
		return true;
	}
}
