

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

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Login() {
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
		PrintWriter out = response.getWriter();
		doGet(request, response);
		
		String name = request.getParameter("uname");
		String pass = request.getParameter("upass");
		
		System.out.println("Name =" + name + "Pass " + pass);
		
	
			
				Connection con = null;
				try {
					
					
					try {
						Class.forName("org.postgresql.Driver");
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					String url = "jdbc:postgresql://ec2-54-235-246-201.compute-1.amazonaws.com/d712a16gfjlf2i";
			        String username = "qpvmvoqkxifbdv";
			        String password = "7bb011180f5880de08fe6c69f68647a5a8409ccc13528729b792dcdee7df9512";
			        
			        con = DriverManager.getConnection(url,username,password);
		            System.out.println("DB connected successfully!");
					
					
					
					Statement stmt = con.createStatement();
					
					
					
//					ResultSet rs = stmt.executeQuery("select * from users");
//					   ResultSetMetaData rsmd = rs.getMetaData();
//					   int columnsNumber = rsmd.getColumnCount();
//					   while (rs.next()) {
//					       for (int i = 1; i <= columnsNumber; i++) {
//					           if (i > 1) System.out.print(",  ");
//					           String columnValue = rs.getString(i);
//					           System.out.print(columnValue + " " + rsmd.getColumnName(i));
//					       }
//					       System.out.println("");
//					   }
					
					
					
					//ResultSet rs = stmt.executeQuery("select * from user_reg");
					ResultSet rs2 = stmt.executeQuery("select firstname,userpassword from users where firstname = '"+name+"'and userpassword = '"+pass+"'   ");
				
					
					
					
					
					if(rs2.next()) {
						HttpSession session = request.getSession();
						session.setAttribute("uname", name);
						response.sendRedirect("WelcomeUser.jsp?uname="+name+"");
					}
					else {
						out.println("Wrong username or password");
					}
					
					
					
					
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				
				

		
		
		
		
		
		
		
		
	}

}
