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
 * Servlet implementation class AddUser
 */
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		response.setContentType("text/html");
		try {
			
			boolean x = true;
			String name = request.getParameter("name-input");
			String emailID = request.getParameter("email-input");
			String pass = request.getParameter("password-input");
			String c_number = request.getParameter("number-input");
	
			
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
					x= false;
					response.sendRedirect("login.html");
				}
			}
			if(x) {
				String query = "insert into users (Username, EmailID, Password, ContactNumber) values(?,?,?,?)";
				PreparedStatement preparedStatement = con.prepareStatement(query);
				preparedStatement.setString(1, name);
				preparedStatement.setString(2, emailID);
				preparedStatement.setString(3, pass);
				preparedStatement.setString(4, c_number);
				
				if(preparedStatement.executeUpdate() == 1)
					System.out.println("Data inserted.");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
