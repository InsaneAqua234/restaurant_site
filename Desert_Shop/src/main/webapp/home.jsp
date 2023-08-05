<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, database.Database, java.util.ArrayList"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fork and Spoon</title>

    <!-- Css file link -->
    <link rel="stylesheet" href="CSS/index.css">

    <!-- Font link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<eclipse.refreshLocal resource="MyProject/MyFolder" depth="infinite"/>
	<% 
	
	try{
		
		ServletContext contx = request.getServletContext();
		Database db = (Database)contx.getAttribute("database");
		
		if(db == null)
			db = new Database();
		
		Connection con = db.getConnection();
		Statement smt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
		ResultSet set = smt.executeQuery("select * from products");
		ArrayList <String> categories = db.getCategories();
	
	%>
    <div id="container" class="container">

        <div id="menu">
            <div class="brand-logo">
                <img src="images/logo.png" alt="logo">
            </div>
            
            <div class="menu-item">
                <a href="#">About</a>
                <a href="#">Cart</a>
                <a href="#">Your Orders</a>
                <a href="#">Services</a>
                <a href="#">Help</a>
            </div>

            <footer id="footer">
                <div class="social-media">
                    <i class="fa fa-facebook"></i>
                    <i class="fa fa-instagram"></i>
                    <i class="fa fa-twitter"></i>
                    <i class="fa fa-whatsapp"></i>
                </div>
                <p>© Copyright 2023 Fork & Spoon</p>
            </footer>
        </div>

        <div id="food-container">
            <div id="header">
                <div class="add-box">
                    <i class="fa fa-map-marker your-address" id="add-address"> Your Address</i>
                </div>
                <div class="util">
                    <input type="text" placeholder="Search" id="search">
                    <i class="fa fa-tags"> Offers</i>
                </div>
            </div>
            
            <div id="food-items">
            
            	<% for(String x: categories){//System.out.println(x);%>
            		<div class="foods" id= <%=x%>>
            		<p class="category-name" id="category-name-<%=x %>"><%=x%></p>
            			<% 
            			//if(x.equals(set.getString(6))){
            				//System.out.println(set.getString(6));
            				set.absolute(1);
 							
            				while(set.next()){
            					if(x.toLowerCase().equals(set.getString(6))){
            					//System.out.println(x + "=" + set.getString(6));
            					if(set.getString(2).toLowerCase().equals("non-veg")){
            				%>		
            					<div class="item-card non-veg">
            				<%}else{ %>
            					<div class="item-card veg">
            				<%} %>
                        			<div class="card-top">
                            			<i class="fa fa-star rating"><%=set.getString(5)%></i>
                            			<i class="fa fa-heart-o add-to-cart"></i>
                        			</div>
                        			<img src="images/<%=set.getString(4)%>" alt="sample photo">
                        			<p class="item-name"><%=set.getString(1) %></p>
                        			<p class="item-price"><%=set.getString(2) %></p>
                    			</div>
            				<% 	
            				}
            		}%>
            	<%
            	}%>
            	<!-- 
            	 <div class="foods" id="biryani">
                    <p class="category-name" id="category-name-biryani">Biryani</p>
					
					
					<!-- 
                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.1</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/biryani/chicken-biryani.jpg" alt="sample photo">
                        <p class="item-name">Chicken Biryani</p>
                        <p class="item-price">Rs. 110</p>
                    </div>
                     -->
                 </div>
            </div>
       </div>

        <div id="food-nav">
            <div class="taste-header">
                <div class="user">
                    <a href="#">Sign Up</a>
                </div>
            </div>

            <div id="categoru-list">
                <p class="item-menu">Go For Hunt</p>
                <div class="border"></div>

                <a href="#biryani" class="list-card">
                    <img src="/images/biryani/mutton-biryani.jpg" alt="sample photo">
                    <p class="list-name">Biryani</p>
                </a>
        
                <a href="#rolls" class="list-card">
                    <img src="/images/rolls/mutton-keema-roll.jpg" alt="sample photo">
                    <p class="list-name">Rolls</p>
                </a>
           
                <a href="#momos" class="list-card">
                    <img src="/images/momos/chicken-chilli-cheese-momo.jpeg" alt="sample photo">
                    <p class="list-name">Momos</p>
                </a>
              
                <a href="#chinese" class="list-card">
                    <img src="/images/biryani/mutton-biryani.jpg" alt="sample photo">
                    <p class="list-name">Chinese</p>
                </a>
      
                <a href="#south-indian" class="list-card">
                    <img src="/images/biryani/mutton-biryani.jpg" alt="sample photo">
                    <p class="list-name">South Indian</p>
                </a>
			<%}catch(Exception e){
				
			} %>
            </div>
        </div>
    </div>
</body>
</html>   
			<!-- 
            <div id="food-items" class="disable">

                <div class="foods" id="biryani">
                    <p class="category-name" id="category-name-biryani">Biryani</p>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.1</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/biryani/chicken-biryani.jpg" alt="sample photo">
                        <p class="item-name">Chicken Biryani</p>
                        <p class="item-price">Rs. 110</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.0</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/biryani/mutton-biryani.jpg" alt="sample photo">
                        <p class="item-name">Muttonn Biryani</p>
                        <p class="item-price">Rs. 130</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 3.9</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/biryani/egg-biryani.jpg" alt="sample photo">
                        <p class="item-name">Egg Biryani</p>
                        <p class="item-price">Rs. 100</p>
                    </div>

                    <div class="item-card veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 3.7</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/biryani/veg-biryani.jpg" alt="sample photo">
                        <p class="item-name">Veg Biryani</p>
                        <p class="item-price">Rs. 90</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.3</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/biryani/hyderabadi-chicken-biryani.jpg" alt="sample photo">
                        <p class="item-name">Hyderabadi Chicken Biryani</p>
                        <p class="item-price">Rs. 170</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.5</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/biryani/hyderabadi-mutton-biryani.jpeg" alt="sample photo">
                        <p class="item-name">Hyderabadi Mutton Biryani</p>
                        <p class="item-price">Rs. 200</p>
                    </div>

                </div>

                <div class="foods" id="rolls">
                    <p class="category-name" id="category-name-rolls">Rolls</p>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.1</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/rolls/egg-roll.webp" alt="sample photo">
                        <p class="item-name">Egg Roll</p>
                        <p class="item-price">Rs. 40</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.3</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/rolls/chicken-kathi-roll.jpg" alt="sample photo">
                        <p class="item-name">Chicken Roll</p>
                        <p class="item-price">Rs. 55</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.0</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/rolls/mutton-kathi-roll.jpg" alt="sample photo">
                        <p class="item-name">Mutton Roll</p>
                        <p class="item-price">Rs. 70</p>
                    </div>

                    <div class="item-card veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 3.5</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/rolls/veg-roll.jpg" alt="sample photo">
                        <p class="item-name">Veg Roll</p>
                        <p class="item-price">Rs. 35</p>
                    </div>

                    <div class="item-card veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 3.9</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/rolls/paneer-kathi-roll.webp" alt="sample photo">
                        <p class="item-name">Paneer Roll</p>
                        <p class="item-price">Rs. 45</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.4</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/rolls/chicken-keema-roll.jpeg" alt="sample photo">
                        <p class="item-name">Chicken Keema Roll</p>
                        <p class="item-price">Rs. 60</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.2</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/rolls/mutton-kathi-roll.jpg" alt="sample photo">
                        <p class="item-name">Mutton Keema Roll</p>
                        <p class="item-price">Rs. 80</p>
                    </div>

                </div>

                <div class="foods" id="momos">
                    <p class="category-name" id="category-name-momos">Momos</p>

                    <div class="item-card veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 3.8</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/momos/veg_momo.jpg" alt="sample photo">
                        <p class="item-name">Veg Steam Momo(5pcs)</p>
                        <p class="item-price">Rs. 40</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.3</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/momos/chicken-momo.jpeg" alt="sample photo">
                        <p class="item-name">Chicken Steam Momo(5pcs)</p>
                        <p class="item-price">Rs. 60</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.2</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/momos/fried-momo.jpg" alt="sample photo">
                        <p class="item-name">Chicken Fried Momo(5pcs)</p>
                        <p class="item-price">Rs. 70</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.4</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/momos/pan-fried-momo.webp" alt="sample photo">
                        <p class="item-name">Chicken Pan-fried Momo(5pcs)</p>
                        <p class="item-price">Rs. 90</p>
                    </div>

                    <div class="item-card veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.1</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/momos/veg-cheese-momo.webp" alt="sample photo">
                        <p class="item-name">Veg Cheese Momo(5pcs)</p>
                        <p class="item-price">Rs. 60</p>
                    </div>

                    <div class="item-card veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.0</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/momos/corn-chilli-cheese-momo.jpeg" alt="sample photo">
                        <p class="item-name">Corn Chilli Cheese Momo(5pcs)</p>
                        <p class="item-price">Rs. 70</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.2</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/momos/veg_momo.jpg" alt="sample photo">
                        <p class="item-name">Chicken Cheese Momo(5pcs)</p>
                        <p class="item-price">Rs. 80</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.5</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/momos/schezwann-momo.webp" alt="sample photo">
                        <p class="item-name">Schezwann Momo(5pcs)</p>
                        <p class="item-price">Rs. 90</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.1</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/momos/tandoori-momo.jpg" alt="sample photo">
                        <p class="item-name">Chiecken Tandoori Momo(5pcs)</p>
                        <p class="item-price">Rs. 85</p>
                    </div>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> 4.7</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/momos/kulhad-momo.avif" alt="sample photo">
                        <p class="item-name">Chicken Kulhad Momo(5pcs)</p>
                        <p class="item-price">Rs. 120</p>
                    </div>

                </div>

                <div class="foods" id="chinese">
                    <p class="category-name" id="category-name-chinese">Chinese</p>

                    <div class="item-card non-veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> $.3</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/biryani/chicken-biryani.jpg" alt="sample photo">
                        <p class="item-name">Chicken Hakka Noodles</p>
                        <p class="item-price">Rs. 70</p>
                    </div>
                </div>

                <div class="foods" id="south-indian">
                    <p class="category-name" id="category-name-south-indian">South Indian</p>

                    <div class="item-card veg">
                        <div class="card-top">
                            <i class="fa fa-star rating"> $.3</i>
                            <i class="fa fa-heart-o add-to-cart"></i>
                        </div>
                        <img src="/images/biryani/chicken-biryani.jpg" alt="sample photo">
                        <p class="item-name">Masala Dosa</p>
                        <p class="item-price">Rs. 50</p>
                    </div>
                </div>

            </div>
            -->
