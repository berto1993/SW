<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="javax.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="clases.*" %>
<%@ page import ="java.util.LinkedList"%>
 
<% corporativo bc =new corporativo();
bc = consultas.getCorporativo();
%>

<html class="no-js">

	<head>
		<meta charset="utf-8"/>
		<title>ABAMEDIA Producciones</title>
		
		<link rel="stylesheet" media="all" href="css/style.css"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		
		<!-- superfish -->
		<link rel="stylesheet" media="screen" href="css/superfish.css" /> 
		<!-- ENDS superfish -->
		<!-- GOOGLE FONTS -->
		<link href='http://fonts.googleapis.com/css?family=Voltaire' rel='stylesheet' type='text/css'>
		<!-- SKIN -->
		<link rel="stylesheet" media="all" href="css/skin.css"/>
		
	</head>
	
	<body class="page">
	
		<!-- HEADER -->
		<header>
			<div class="wrapper cf">
				
				<div id="logo">
                    <h1>ABAMedia</h1>
				</div>
				
				<!-- nav -->
				<ul id="nav" class="sf-menu">
					<li class="current-menu-item"><a href="index.jsp">INICIO</a></li>
					<li><a href="corporativo.jsp">CORPORATIVO</a></li>
					<li><a href="contacto.jsp">CONTACTO</a></li>
				</ul>
				<div id="combo-holder"></div>
				<!-- ends nav -->
			</div>
	</header>
		<!-- ENDS HEADER -->
		
		<!-- MAIN -->
		<div id="main">
			<div class="wrapper cf">
			
			
				
			<!-- page content-->
        	<div id="page-content" class="cf">        	
	        		
	        	<!-- entry-content -->	
	        	<div class="entry-content cf">
	        	
					<!-- 2 cols -->
					<div class="one-half">
						<h4 class="heading"><%=bc.getP1Tit() %></h4>
						<%=bc.getP1Desc() %></div>
					
					<div class="one-half last">
						<h4 class="heading"><%=bc.getP2Tit() %></h4>
						<%=bc.getP2Desc() %></div>
					<div class="clearfix"></div>
					<!-- ENDS 2 cols -->
					
					
					<!-- 3 cols -->
					<div class="one-third">
						<h4 class="heading"><%=bc.getP3Tit() %></h4>
						<%=bc.getP3Desc() %></div>
					
					<div class="one-third">
						<h4 class="heading"><%=bc.getP4Tit() %></h4>
						<%=bc.getP4Desc() %></div>
					
					<div class="one-third last">
						<h4 class="heading"><%=bc.getP5Tit() %></h4>
						<%=bc.getP5Desc() %></div>
					<div class="clearfix"></div>
					<!-- ENDS 3 cols -->
					
					
					<!-- 4 cols -->
					<div class="one-fourth">
						<h4 class="heading"><%=bc.getP6Tit() %></h4>
						<%=bc.getP6Desc() %></div>
					
					<div class="one-fourth">
						<h4 class="heading"><%=bc.getP7Tit() %></h4>
						<%=bc.getP7Desc() %></div>
					
					<div class="one-fourth">
						<h4 class="heading"><%=bc.getP8Tit() %></h4>
						<%=bc.getP8Desc() %>	</div>
					
					<div class="one-fourth last">
						<h4 class="heading"><%=bc.getP9Tit() %></h4>
						<%=bc.getP9Desc() %></div>
					<div class="clearfix"></div>
					<!-- ENDS 4 cols -->
				</div>
				<!-- ENDS entry-content -->	
    		</div>
    		<!-- ENDS page content-->
			</div>
		  <!-- ENDS WRAPPER -->
		</div>
		<!-- ENDS MAIN -->
		
		
		<!-- FOOTER -->
		<footer>
			<div class="wrapper cf">
			 <ul  class="widget-cols cf">
           <li class="second-col"><h4><a href="begonacarcedo.html">Begoña</a></h4></li>
					 <li class="third-col">	<h4><a href="albertofernandez.html">Alberto</a></h4></li>
					 <li class="fouth-col">	<h4><a href="arkaitzmarcos.html">Arkaitz</a></h4></li>
             </ul>
					
				<!-- bottom -->
				<div class="footer-bottom">
					<div class="left">by <a href="http://ABAMedia.com" >ABAMedia</a></div>
						<ul id="social-bar" class="cf sb">
							<li><a href="http://www.facebook.com"  title="Become a fan" class="facebook">Facebok</a></li>
							<li><a href="http://www.twitter.com" title="Follow my tweets" class="twitter"></a></li>
							<li><a href="http://plus.google.com" title="Enter my circles" class="plus"></a></li>
						</ul>
				</div>	
				<!-- ENDS bottom -->
			</div>
	</footer>
		<!-- ENDS FOOTER -->
		
	</body>
	
	
	
</html>