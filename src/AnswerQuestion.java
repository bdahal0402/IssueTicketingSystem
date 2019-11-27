import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/AnswerQuestion")

public class AnswerQuestion extends HttpServlet implements SetConnection {
	@SuppressWarnings("unused")
	private static final long serialIDVersion = 1;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		doGet(request, response);
		
		String questionid = request.getParameter("answerButton");
		
		Connection con = null;
		
		try {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			con = DriverManager.getConnection(url, username, password);
			
			Statement stmt = con.createStatement();
			
			
			
			//getting email from table
			
			
			String emailUser = "";
			
			ResultSet set = null;
			set = stmt.executeQuery("SELECT * FROM questions WHERE id = " + questionid);
			while(set.next()) {
				emailUser = set.getString("email");
			}
			
			
				
			
			
			
			
			
				
			
				stmt.executeUpdate("UPDATE questions SET status = '1' WHERE id = " + questionid);
				

			
				response.setContentType("text/html");
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Your question response has been sent to email: " + emailUser +"')");
				out.println("location='ViewQuestions.jsp';");
				out.println("</script>");
			
			
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}