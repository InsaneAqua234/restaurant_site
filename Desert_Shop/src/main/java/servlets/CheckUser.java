package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;

/**
 * Servlet implementation class CheckUser
 */
@WebServlet("/CheckUser")
public class CheckUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		try {
			boolean x = false;
			String emailID = request.getParameter("emailID");
			String pass = request.getParameter("password");
	
			
			ServletContext contx = getServletContext();
			Database db = (Database)contx.getAttribute("database");
			if(db == null) {
				db = new Database();
			}
			
			Connection con = db.getConnection();
			Statement smt = con.createStatement();
			ResultSet set = smt.executeQuery("select * from users");
			
			while(set.next()) {
				String checkEmail = set.getString("EmailID");
				if(emailID.equals(checkEmail)) {
					response.sendRedirect("index.html");
					x = true;
				}
			}
			if(!x) {
				response.sendRedirect("signup.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
