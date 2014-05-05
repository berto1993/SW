<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="clases.*" %>
<%@ page import ="java.util.LinkedList"%>
<html class="no-js">

	<head>
		<meta charset="utf-8"/>
		<title>ABAMEDIA Producciones</title>
		
		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link rel="stylesheet" media="all" href="css/style.css"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<!-- Adding "maximum-scale=1" fixes the Mobile Safari auto-zoom bug: http://filamentgroup.com/examples/iosScaleBug/ -->		
				
		<!-- JS -->
		<script src="js/jquery-1.7.1.min.js"></script>
		<script src="js/custom.js"></script>
		<script src="js/tabs.js"></script>
		<script src="js/css3-mediaqueries.js"></script>
		<script src="js/jquery.columnizer.min.js"></script>
		
		<!-- Isotope -->
		<script src="js/jquery.isotope.min.js"></script>
		
		<!-- Lof slider -->
		<script src="js/jquery.easing.js"></script>
		<script src="js/lof-slider.js"></script>
		<link rel="stylesheet" href="css/lof-slider.css" media="all"  /> 
		<!-- ENDS slider -->
		
		<!-- Tweet -->
		<link rel="stylesheet" href="css/jquery.tweet.css" media="all"  /> 
		<script src="js/tweet/jquery.tweet.js" ></script> 
		<!-- ENDS Tweet -->
		
		<!-- superfish -->
		<link rel="stylesheet" media="screen" href="css/superfish.css" /> 
		<script  src="js/superfish-1.4.8/js/hoverIntent.js"></script>
		<script  src="js/superfish-1.4.8/js/superfish.js"></script>
		<script  src="js/superfish-1.4.8/js/supersubs.js"></script>
		<!-- ENDS superfish -->
		
		<!-- prettyPhoto -->
		<script  src="js/prettyPhoto/js/jquery.prettyPhoto.js"></script>
		<link rel="stylesheet" href="js/prettyPhoto/css/prettyPhoto.css"  media="screen" />
		<!-- ENDS prettyPhoto -->
		
		<!-- poshytip -->
		<link rel="stylesheet" href="js/poshytip-1.1/src/tip-twitter/tip-twitter.css"  />
		<link rel="stylesheet" href="js/poshytip-1.1/src/tip-yellowsimple/tip-yellowsimple.css"  />
		<script  src="js/poshytip-1.1/src/jquery.poshytip.min.js"></script>
		<!-- ENDS poshytip -->
		
		<!-- JCarousel -->
		<script type="text/javascript" src="js/jquery.jcarousel.min.js"></script>
		<link rel="stylesheet" media="screen" href="css/carousel.css" /> 
		<!-- ENDS JCarousel -->
		
		<!-- GOOGLE FONTS -->
		<link href='http://fonts.googleapis.com/css?family=Voltaire' rel='stylesheet' type='text/css'>

		<!-- modernizr -->
		<script src="js/modernizr.js"></script>
		
		<!-- SKIN -->
		<link rel="stylesheet" media="all" href="css/skin.css"/>
		
		<!-- Less framework -->
		<link rel="stylesheet" media="all" href="css/lessframework.css"/>
		
		<!-- jplayer -->
		<link href="player-skin/jplayer-black-and-yellow.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/jquery.jplayer.min.js"></script>
		
		<!-- flexslider -->
		<link rel="stylesheet" href="css/flexslider.css" >
		<script src="js/jquery.flexslider.js"></script>
		
		
	</head>
	
	
	<body class="home">
	
		<!-- HEADER -->
		<header>
			<div class="wrapper cf">
				
				<div id="logo">
					<h1>ABAMedia</h1>
				</div>
				
				<!-- nav -->
				<ul id="nav" class="sf-menu">
					<li><a href="index.jsp">INICIO</a></li>
					<li class="current-menu-item"><a href="producciones.jsp">PRODUCCIONES</a></li>
					<li><a href="corporativo.jsp">CORPORATIVO</a></li>
					<li><a href="contacto.jsp">CONTACTO</a></li>
					<li><a href="gestion.jsp">GESTIÓN</a></li>
				</ul>
				<div id="combo-holder"></div>
				<!-- ends nav -->

			</div>
		</header>
		<!-- ENDS HEADER -->
		
		<!-- MAIN -->
		<div id="main">
			<div class="wrapper cf">
			
			<!-- portfolio content-->
        	<div id="portfolio-content" class="cf">
        	
					<!-- project box -->
				<div id="project-box" class="cf">
					<% LinkedList<String> listai = new LinkedList<String>();
					produccion bp =new produccion();
					LinkedList<produccion> lista = consultas.getProducciones();
					boolean enc = false;
					int i = 0;
					while (!enc & i<lista.size())
					{
						bp=lista.get(i);
						String id_pro = "" + bp.getIdPro() + "";
						if(request.getParameter("id_pro").equalsIgnoreCase(id_pro))
						{
							enc = true;
						}
						i++;
					}
					%>
					<!-- slider -->
					<div class="project-slider">
				        <div class="flexslider">
						  <ul class="slides">
						    	<% fotograma bf=new fotograma();
								LinkedList<fotograma> listaFotos = bp.getListaFotos();
								for (int j=0;j<listaFotos.size();j++)
								{
									bf=listaFotos.get(j);%>
									<li>
										<img src="img/dummies/slides/<%=bf.getNombreimagen()%>.jpg" title="" alt="alt text" />
									</li>
							     	<%	listai.add(bf.getNombreimagen());%>
								<% }%>
						  </ul>
						</div>
					</div>
		        	<!-- ENDS slider -->


					<div class="info">
	        			<p><strong>Director: </strong> <%=bp.getDirector() %></p>
	        			<p><strong>Fecha: </strong><%=bp.getFecha() %></p>
	        			<p><strong>Genero: </strong><%=bp.getGenero() %></p>
	        			<% try {
	        			if(!bp.getTrailer().equalsIgnoreCase(null))
	        			{%>
	        				<p><a href="<%=bp.getTrailer() %>" target="_blank" class="launch" ><strong>Trailer</strong></a></p>
	        			<%}
	        			}catch(NullPointerException e)
	        			{%>
	        				<p><strong>Trailer no disponible</strong></p>
	        			<%}%>
	        		</div>
	        		
	        		<!-- entry-content -->
	        		<div class="entry-content">
	        		
	        			<h2 class="heading"><%=bp.getTitulo() %></h2>
	        			
	        			<div>
	        			<%=bp.getSinopsis() %>
	        			
	        			<%
	        			actor ba=new actor();
						LinkedList<actor> listaActores = bp.getListaActores();
						if (listaActores.size() != 0)
						{%>
							<br/><br/>
							Actores - Personajes:
						<%}%>
						<%
						for (int a=0;a<listaActores.size();a++)
						{
							ba=listaActores.get(a); %>
							<br/>
							<%=ba.getName() %> ---- <%=ba.getPersonaje() %>
							
						<% }%>
	        			</div>
	        		</div>
	        		<!-- ENDS entry content -->
	        		
	        	</div>
		    	<!-- ENDS project box -->
		    	
    		</div>
    		<!-- ENDS portfolio content-->
    		
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
					<div class="left">by <a href="index.jsp" >ABAMedia</a></div>
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