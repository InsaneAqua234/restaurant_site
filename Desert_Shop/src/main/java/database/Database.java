package database;
import java.util.ArrayList;
import java.sql.*;

public class Database {
	Connection conn;
	public Connection getConnection() {
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/try_ice", "root", "pa$$word");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return conn;
	}
	public ArrayList<String> getCategories(){
		ArrayList<String> categories = new ArrayList<>();
		try {
			Connection con = getConnection();
			Statement smt = con.createStatement();
			ResultSet set = smt.executeQuery("select * from categories");
			while(set.next()) {
				categories.add(set.getString(1));
				//System.out.println(set.getString(1));
			}
		
		}catch(Exception e) {}
		return categories;
	}
}
