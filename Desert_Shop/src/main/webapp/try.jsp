<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "database.Database, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		try{
			ServletContext contx = getServletContext();
			Database db = (Database) contx.getAttribute("database");
			
			if(db == null){
				db = new Database();
			}
			Connection conn = db.getConnection();
			Statement smt = conn.createStatement();
			ResultSet res = smt.executeQuery("select * from user");
			
			while(res.next()){
				System.out.println(res.getString(1));
				System.out.println(res.getString(2));
				System.out.println(res.getString(3));
				System.out.println(res.getString(4));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>