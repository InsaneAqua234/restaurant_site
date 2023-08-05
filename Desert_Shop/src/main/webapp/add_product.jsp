<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action = "add_product" method = "post" enctype = "multipart/form-data">
		<input type = "text" id = "prod_name" name = "prod_name" placeholder = "Enter product name"/>
		<input type = "text" id = "prod_price" name = "prod_price" placeholder = "Enter product price"/>
		<input type = "text" id = "prod_type" name = "prod_type" placeholder = "Enter product type"/>
		<input type = "file" name = "img" id = "img" accept = "image/*">
		<input type = "text" id = "prod_rating" name = "prod_rating" placeholder = "Enter product rating"/>
		<input type = "text" id = "prod_category" name = "prod_category" placeholder = "Enter product category"/>
		<input type = "submit" />
	</form>
</body>
</html>