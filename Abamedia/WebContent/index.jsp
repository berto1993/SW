<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
					<li class="current-menu-item"><a href="index.jsp">INICIO</a></li>
					<li><a href="corporativo.jsp">CORPORATIVO</a></li>
					<li><a href="contacto.jsp">CONTACTO</a></li>
				</ul>
				<div id="combo-holder"></div>
				<!-- ends nav -->
				
				
				<!-- SLIDER -->				
				<div id="home-slider" class="lof-slidecontent">
					
					<div class="preload"><div></div></div>
					
					<!-- slider content --> 
					<div class="main-slider-content" >
					<ul class="sliders-wrap-inner">
					<% 
					LinkedList<String> listai = new LinkedList<String>();
					produccion bp =new produccion();
					LinkedList<produccion> lista = consultas.getProducciones();
					for (int i=0;i<lista.size();i++){
						bp=lista.get(i);
					%>
						<li>
						<% 
						fotograma bf=new fotograma();
							LinkedList<fotograma> listaFotos = bp.getListaFotos();
							for (int j=0;j<listaFotos.size();j++){
								bf=listaFotos.get(j);
								if(bf.getPortada()){%>
							 	<img src="img/dummies/slides/<%=bf.getNombreimagen()%>.jpg" title="" alt="alt" />
						     <%	listai.add(bf.getNombreimagen());%>
						     	
						     	<%}
							}%>
					     <div class="slider-description">
					     <h4><%=bp.getTitulo() %></h4>
					    <p><%=bp.getSinopsis() %></p> 
					    </div>
					   </li>
					<%}%>
					  </ul>  	
					</div>
					<!-- ENDS slider content --> 
				           
					<!-- slider nav -->
					<div class="navigator-content">
					  <div class="navigator-wrapper">
					        <ul class="navigator-wrap-inner">
					       <% for (int k=0;k<listai.size();k++){
					    	   String imagen=listai.get(k);
					       %>
					           <li><img src="img/dummies/slides/<%=imagen%>_thumb.jpg" alt="alt" /></li>
					         <% }  %>
					        </ul>
					  </div>
					  <div class="button-next">Siguiente</div>
					  <div  class="button-previous">Anterior</div>
					  <!-- REMOVED TILL FIXED <div class="button-control"><span>STOP</span></div> -->
					</div> 
					<!-- slider nav -->
					
					
				          
				 </div> 
				<!-- ENDS SLIDER -->





			</div>
		</header>
		<!-- ENDS HEADER -->
		
		<!-- MAIN -->
		<div id="main">
			<div class="wrapper cf">
			

				
			<!-- featured -->
			<div class="home-featured">
			
				<ul id="filter-buttons">
					<li><a href="#" data-filter="*" class="selected">ver todos</a></li>
					<li><a href="#" data-filter=".peliculas">películas</a></li>
					<li><a href="#" data-filter=".series">series</a></li>
					<li><a href="#" data-filter=".documentales">documentales</a></li>
					<li><a href="#" data-filter=".animacion">animación</a></li>
				</ul>
				
				<!-- Filter container -->
				<div id="filter-container" class="cf">
					<figure class="peliculas">
						<a href="project.html" class="thumb"><img src="img/dummies/featured/01.JPG" alt="alt" /></a>
						<figcaption>
							<a href="project.html"><h3 class="heading">Pellentesque </h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					<figure class="series">
						<a href="project.html" class="thumb"><img src="img/dummies/featured/02.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html"><h3 class="heading">Pellentesque habitant morbi</h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					
					<figure class="documentales">
						<a href="project.html" class="thumb"><img src="img/dummies/featured/03.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html" ><h3 class="heading">Habitant morbi</h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					
					<figure class="animacion">
						<a href="project.html" class="thumb"><img src="img/dummies/featured/04.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html" ><h3 class="heading">Pellentesque habitant morbi</h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					
					<figure class="series">
						<a href="project.html" class="thumb"><img src="img/dummies/featured/05.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html" ><h3 class="heading">Pellentesque habitant morbi</h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					
					<figure class="peliculas animacion">
						<a href="project.html" class="thumb"><img src="img/dummies/featured/06.jpg" alt="alt" /></a>
						<figcaption>
							<a href="project.html" ><h3 class="heading">Pellentesque habitant morbi</h3></a>
							Tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. </figcaption>
					</figure>
					
					
				
					
				</div><!-- ENDS Filter container -->
				
			</div>
			<!-- ENDS featured -->
			
			
			
			
			</div><!-- ENDS WRAPPER -->
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
		
		
		<!-- Start google map -->
<script>initialize();</script>
</body>
	
	
	
</html>