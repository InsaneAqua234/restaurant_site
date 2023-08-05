package servlets;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import database.Database;
/**
 * Servlet implementation class AddProducts
 */
@WebServlet("/AddProducts")
@MultipartConfig
public class AddProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProducts() {
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
		doGet(request, response);
		
		
		
		String prod_name = request.getParameter("prod_name");
		String prod_type = request.getParameter("prod_type");
		String prod_price = request.getParameter("prod_price");
		String prod_rate = request.getParameter("prod_rating");
		
		try {
			Part file = request.getPart("img");
			String prod_category = request.getParameter("prod_category").toLowerCase();
			String filename = file.getSubmittedFileName();
			String upload_path = "D:/Chatting/Desert_Shop/src/main/webapp/images/" + filename;
			
			FileOutputStream fs = new FileOutputStream(upload_path);
			InputStream is = file.getInputStream();
			
			byte[] data = new byte[is.available()];
			is.read(data);
			fs.write(data);
			fs.close();
			ServletContext contx = request.getServletContext();
			Database db = (Database) contx.getAttribute("database");
			
			if(db == null) {
				db = new Database(); 
			}
			
			Connection conn = db.getConnection();
			Statement smt = conn.createStatement();
			/*ResultSet set = smt.executeQuery("select * from products");
			while(set.next()) {
				System.out.println(set.getString(1));
				System.out.println(set.getString(2));
				System.out.println(set.getString(3));
				System.out.println(set.getString(4));
				System.out.println(set.getString(5));
				System.out.println(set.getString(6));
			}
			
			*/
			String query = "insert into products values(?,?,?,?,?,?)";
			PreparedStatement preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, prod_name);
			preparedStatement.setString(2, prod_type);
			preparedStatement.setString(3, prod_price);
			preparedStatement.setString(4, filename);
			preparedStatement.setString(5, prod_rate);
			preparedStatement.setString(6, prod_category);
			
			if(preparedStatement.executeUpdate() == 1)
				System.out.print("Data inserted");
			
			response.sendRedirect("home.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
