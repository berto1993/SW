<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html> 
<html class="no-js">

	<head>
		<meta charset="utf-8"/>
		<title>ABAMEDIA Producciones</title>
		
		
		<link rel="stylesheet" media="all" href="css/style.css"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		
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
		
		<!-- reply move form -->
		<script src="js/moveform.js"></script>
		
	</head>
	
	
	<body class="page" onLoad="">
	
		<!-- HEADER -->
		<header>
			<div class="wrapper cf">
				
				<div id="logo">
					  <h1>ABAMedia</h1>
				</div>
				
				<!-- nav -->
				<ul id="nav" class="sf-menu">
					<li class="current-menu-item"><a href="index.jsp">INICIO</a></li>
					<li><a href="producciones.jsp">PRODUCCIONES</a></li>
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
			
			
				
			<!-- page content-->
        	<div id="page-content" class="cf">        	
	        		
	        	
	        	
				
				
				<!-- Map -->
				<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true" /></script>
				<script type="text/javascript">
					function initialize() {
						var latlng = new google.maps.LatLng(43.236699,-2.92345);
						var myOptions = {
						  zoom: 10,
						  center: latlng,
						  mapTypeId: google.maps.MapTypeId.ROADMAP
					};
					var map = new google.maps.Map(document.getElementById("map_canvas"),
					    myOptions);
					}
				</script>
				
				<div id="map-holder">
					<div id="map_canvas"></div>
					<div id="map-content">
						<p><h3>LOCALIZACIÓN</h3></p>
	        	
						<p>Puedes encontrar nuestra sede en Bilbao y vernos en google maps.</p>
					</div>
				</div>
				
				<!-- ENDS Map -->
				
				
				<p><h3>Formulario de Contacto</h3></p>
				<p>Mándanos tus guiones o cortometrajes!!!!!.</p>
				<!-- form -->
				<script type="text/javascript" src="js/form-validation.js"></script>
				<form id="contactForm" action="#" method="post">
					<fieldset>
														
						<p>
							<label for="name" >Nombre</label>
							<input name="name"  id="name" type="text" class="form-poshytip" title="Enter your full name" />
						</p>
						
						<p>
							<label for="email" >Email</label>
							<input name="email"  id="email" type="text" class="form-poshytip" title="Enter your email address" />
						</p>
						<p>
							<label for="fichero" >Fichero</label>
							<input type="file" class="form-poshytip" name="file" title="Mándanos tus creaciones" />
						</p>
						
						<p>
							<label for="comments">Comentarios</label>
							<textarea  name="comments"  id="comments" rows="5" cols="20" class="form-poshytip" title="Enter your comments"></textarea>
						</p>
						
						<!-- send mail configuration -->
						<input type="hidden" value="your@email.com" name="to" id="to" />
						<input type="hidden" value="ENter the subject here" name="subject" id="subject" />
						<input type="hidden" value="send-mail.php" name="sendMailUrl" id="sendMailUrl" />
						<!-- ENDS send mail configuration -->
						
						<p><input type="button" value="Send" name="submit" id="submit" /> <span id="error" class="warning">Mensaje</span></p>
					</fieldset>
					
				</form>
				<p id="sent-form-msg" class="success">Formulario enviado.Gracias..</p>
				<!-- ENDS form -->				
				
    		</div>
    		<!-- ENDS page content-->
			
			
			
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