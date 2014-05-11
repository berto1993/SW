CREATE DATABASE  IF NOT EXISTS `abamedia` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `abamedia`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: abamedia
-- ------------------------------------------------------
-- Server version	5.5.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id_actor` int(11) NOT NULL AUTO_INCREMENT,
  `nombrea` varchar(50) NOT NULL,
  PRIMARY KEY (`id_actor`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (1,'John Cusack'),(2,'Robert Downey Jr.'),(3,'Jim Carrey'),(4,'Dennis Quaid'),(5,'Jake Gyllenhaal'),(6,'Leonard Nimoy'),(7,'Elijah Wood'),(8,'Kelly Macdonald'),(9,'Sandra Bullock'),(10,'George Clooney'),(11,'Matthew Perry'),(12,'Matt LeBlanc'),(13,'David Schwimmer'),(14,'Jennifer Aniston'),(15,'Courteney Cox'),(16,'Lisa Kudrow'),(17,'Jim Parsons'),(18,'Kaley Cuoco');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto` (
  `name` text NOT NULL,
  `email` text NOT NULL,
  `archivo` text NOT NULL,
  `coments` text NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES ('rr','r','prueba.txt','r',1);
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporativo`
--

DROP TABLE IF EXISTS `corporativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporativo` (
  `idcorporativo` int(11) NOT NULL AUTO_INCREMENT,
  `p1Titulo` text,
  `p1Descripcion` text,
  `p2Titulo` text,
  `p2Descripcion` text,
  `p3Titulo` text,
  `p3Descripcion` text,
  `p4Titulo` text,
  `p4Descripcion` text,
  `p5Titulo` text,
  `p5Descripcion` text,
  `p6Titulo` text,
  `p6Descripcion` text,
  `p7Titulo` text,
  `p7Descripcion` text,
  `p8Titulo` text,
  `p8Descripcion` text,
  `p9Titulo` text,
  `p9Descripcion` text,
  PRIMARY KEY (`idcorporativo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corporativo`
--

LOCK TABLES `corporativo` WRITE;
/*!40000 ALTER TABLE `corporativo` DISABLE KEYS */;
INSERT INTO `corporativo` VALUES (1,'Grupo AbaMedia','El grupo ABAMedia ocupa una posición líder como proveedor de servicios técnicos para la industria audiovisual, es productor y distribuidor de contenidos audiovisuales, gestor y distribuidor de acontecimientos deportivos, productor cinematográfico y de contenidos interactivos, y presta servicios de postproducción. ','Medios Técnicos','Dedica gran parte de su actividad a la creación de contenidos audiovisuales. Dispone de un departamento que idea, diseña y produce programas de actualidad, películas, informativos, spots publicitarios, documentales, programas de entretenimiento y series de ficción. Los profesionales del grupo ofrecen además un servicio \"llave en mano\" para la puesta en marcha y gestión de canales de televisión en todo el mundo. ','Contenidos','Creado en 1994, el Grupo ABAMedia se fusionó en 2006 con el grupo GLOBOMEDIA, creando, junto a WPP, líder mundial de comunicación y marketing, y Torreal, el grupo IMAGINA, líder europeo en contenido multimedia y único en integración de contenidos, producción y distribución audiovisual con una facturación de 1.353 millones de euros en 2013 y un equipo humano de cerca de 3.450 profesionales. ','Producción y PostProducción','La postproducción de imagen y sonido destaca entre las actividades del grupo ABAMedia. Sus actividades cubren todos los campos de la industria audiovisual: publicidad, televisión, tratamiento de imagen para cine, efectos digitales, etc. Profesionales altamente cualificados y tecnología en constante actualización son las claves de su posición como líder en el mercado del Sur de Europa. ','I+D','Desde su creación, ABAMedia ha impulsado de manera directa la investigación, desarrollando las herramientas y aplicaciones más eficaces para la ejecución de cada proyecto. El departamento de I + D, formado por cerca de 20 personas, desarrolla sus propios proyectos en colaboración con grupos europeos, destacadas universidades y empresas líderes en tecnología.Imagen y vídeo, audio, lenguaje natural y contenidos inteligentes, son sus principales áreas de trabajo. Muchos de sus proyectos son ya toda una realidad: sistemas para publicidad virtual personalizada y producción automatizada de eventos. ','ABASport','Gestiona, produce y realiza espacios informativos y retransmisiones de grandes eventos deportivos para televisión \"llave en mano\".','ABANet','Desarrolla propuestas para televisión local e internet. Gestión de contenidos y de informativos, proyectos de edición digital, producciones audiovisuales','ABATechnic','Cobertura técnica de eventos de todo tipo.Con más de 15 unidades móviles equipadas con la última tecnología, en exteriores o en su centro de producción de Bilbao.','ABADev','Abarca todos los procesos de producción audiovisual y creación de contenidos, de vídeo, cine y multimedia destinados a televisión,canales corporativos, IPTV o publicidad. ');
/*!40000 ALTER TABLE `corporativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `id_di` int(11) NOT NULL AUTO_INCREMENT,
  `nombred` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_di`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (1,'Roland Emmerich'),(2,'Jon Favreau '),(3,'Robert Zemeckis'),(4,'Gene Roddenberry'),(5,'Shane Acker'),(6,'Mark Andrews'),(7,'Alfonso Cuaron'),(8,'Mateo La Hoz'),(9,'Luc Jacquet'),(10,'Marta Kauffman y David Crane'),(11,'Brad Bird'),(12,'Chuck Lorre');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotogramas`
--

DROP TABLE IF EXISTS `fotogramas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fotogramas` (
  `id_pro` int(11) NOT NULL DEFAULT '0',
  `id_f` int(11) NOT NULL DEFAULT '0',
  `nombreimagen` varchar(50) DEFAULT NULL,
  `portada` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_pro`,`id_f`),
  CONSTRAINT `fotogramas_ibfk_1` FOREIGN KEY (`id_pro`) REFERENCES `produccion` (`id_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotogramas`
--

LOCK TABLES `fotogramas` WRITE;
/*!40000 ALTER TABLE `fotogramas` DISABLE KEYS */;
INSERT INTO `fotogramas` VALUES (1,1,'01',1),(1,2,'012',0),(1,3,'013',0),(2,1,'02',1),(2,2,'022',0),(2,3,'023',0),(3,1,'03',1),(3,2,'032',0),(3,3,'033',0),(4,1,'04',1),(4,2,'042',0),(4,3,'043',0),(5,1,'05',1),(5,2,'052',0),(5,3,'053',0),(6,1,'06',1),(6,2,'062',0),(6,3,'063',0),(7,1,'07',1),(7,2,'072',0),(7,3,'073',0),(8,1,'08',1),(8,2,'082',0),(8,3,'083',0),(9,1,'09',1),(9,2,'092',0),(10,1,'10',1),(10,2,'102',0),(10,3,'103',0),(11,1,'11',1),(11,2,'112',0),(11,3,'113',0),(12,1,'12',1),(12,2,'122',0),(12,3,'123',0),(13,1,'13',1),(13,2,'132',0),(13,3,'133',0),(14,1,'14',1),(14,2,'142',0),(14,3,'143',0);
/*!40000 ALTER TABLE `fotogramas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  `nombreg` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Musical'),(2,'Comedia'),(3,'Acción'),(4,'Drama'),(5,'Suspense'),(6,'Thriller'),(7,'Animación'),(8,'Ciencia ficción'),(9,'Documental');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion`
--

DROP TABLE IF EXISTS `produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produccion` (
  `id_pro` int(11) NOT NULL DEFAULT '0',
  `titulo` text,
  `sinopsis` text,
  `trailer` text,
  `fecha` varchar(4) DEFAULT NULL,
  `id_di` int(11) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `id_genero` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pro`),
  KEY `id_di` (`id_di`),
  KEY `id_tipo` (`id_tipo`),
  KEY `id_genero` (`id_genero`),
  CONSTRAINT `produccion_ibfk_1` FOREIGN KEY (`id_di`) REFERENCES `director` (`id_di`),
  CONSTRAINT `produccion_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`),
  CONSTRAINT `produccion_ibfk_3` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion`
--

LOCK TABLES `produccion` WRITE;
/*!40000 ALTER TABLE `produccion` DISABLE KEYS */;
INSERT INTO `produccion` VALUES (1,'2013','En el calendario de los mayas aparece señalado el año 2012 como la fecha en la que se producirá el fin del mundo, que irá acompañado de diversas catástrofes naturales: erupciones volcánicas, tifones, glaciares que inundarán el planeta.','https://www.youtube.com/watch?v=9ooDeS4Ep5Q','2009',2,1,8),(2,'Iron Man','El multimillonario fabricante de armas Tony Stark debe enfrentarse a su turbio pasado después de sufrir un accidente con una de sus armas. Equipado con una armadura de última generación tecnológica, se convierte en Iron Man para combatir el mal a escala global.','https://www.youtube.com/watch?v=8hYlB38asDY','2008',2,1,3),(3,'Cuento de Navidad','Ebenezer Scrooge es un hombre de negocios que sólo piensa en ganar dinero. Para él la Navidad, en sus propias palabras, es una patraña. Han pasado siete años desde la muerte de su amigo y socio y el fantasma de Nochebuena Marley le dice es durante la noche una visita de tres espíritus.','https://www.youtube.com/watch?v=UtoPN6R_W3E','2009',3,1,7),(4,'El Día de Mañana','Las investigaciones del climatólogo Jack Hall indican que el calentamiento global podría desencadenar un repentino y catastrófico cambio climático de la Tierra. Las perforaciones realizadas en la Antártida demuestran que es algo que ya ha ocurrido hace diez mil años. Hall advierte a los dirigentes políticos de la necesidad de adoptar inmediatamente medidas para evitarlo. Pero sus advertencias llegan demasiado tarde.','https://www.youtube.com/watch?v=KzztUQFfpf8','2004',1,1,8),(5,'Star Trek','Serie de televisión de ciencia ficción estadounidense creada por Gene Roddenberry que se transmitió desde el 8 de septiembre del 1966 hasta el 2 de septiembre del 1969.','https://www.youtube.com/watch?v=iGAHnZ555nI','1966',4,3,8),(6,'Número 9','En un futuro muy próximo el invento conocido como la Gran Máquina activa y aporta energía a las máquinas que se han alzado contra la raza humana, diezmando a la población, antes de empezar a apagarse. El mundo pronto quedará destruido, pero un grupo de pequeños seres intenta salvar lo poco que queda de la civilización. Está compuesto por nueve criaturas a las que un científico infundió vida poco antes de la catástrofe.','https://www.youtube.com/watch?v=j5J4dexGjXY','2009',5,1,7),(7,'Brave','Cuenta la historia de la princesa Mérida, una excelente arquera que es la impetuosa hija del rey Fergus y la reina Elinor. Dispuesta a encontrar su propio camino en la vida, Mérida desafía una ancestral costumbre sagrada de los señores de la guerra.','https://www.youtube.com/watch?v=0gc36idTb3c','2012',6,1,7),(8,'Gravity','Mientras reparan un satélite fuera de su nave, dos astronautas sufren un grave accidente y quedan flotando en el espacio. Son la doctora Ryan Stone, una brillante ingeniera que realiza su primera misión espacial, y el veterano astronauta Matt Kowalsky. La misión exterior parecía rutinaria, pero una lluvia de basura espacial les alcanza y se produce el desastre: el satélite y parte de la nave quedan destrozados, dejando a Ryan y Matt completamente solos, momento a partir del cual intentarán por todos los medios buscar una solución para volver a la Tierra.','https://www.youtube.com/watch?v=MEZWseaoZc8','2013',7,1,8),(9,'9','Cortometraje que posteriormente se adapto a largometraje. En él, una bestia mecánica ataca a dos criaturas de trapo mientras hurgan en las ruinas de su mundo. Después de ser testigo de la muerte de su mentor \'5\' a manos del malévolo artefacto, el muñeco de trapo \'9\' debe confrontar el terror. Sólo con astucia y haciendo uso de su primitiva tecnología puede 9 destruir a la criatura y robarle el talismán de las almas cautivas que carga como trofeo.','http://www.shaneacker.com/#9-short','2005',5,4,7),(10,'Impacto Animal: Selvas','En la selva, la competencia entre los seres vivos da lugar a un asombroso despliegue de recursos para la supervivencia. La nueva tecnología de las cámaras nos muestra la ingeniería interna que permite a las especies adaptarse a un entorno y prosperar.','https://www.youtube.com/watch?v=zvnun-TlUQM','2013',8,2,9),(11,'La Marcha de los Pingüinos','En otoño, todos los pingüinos en edad reproductiva (de más de cinco años) dejan el océano, su hábitat habitual, para iniciar un viaje hacia el interior de la Antártida hacia sus lugares de anidamiento y reproducción ancestrales. Allí, los pingüinos comienzan el cortejo que dará lugar a una nueva vida. Para que los polluelos sobrevivan su madre ha de hacer varios viajes desde el lugar de anidamiento hasta el océano, donde captura la comida, mientras el padre cuida el polluelo a lo largo de varios meses.','https://www.youtube.com/watch?v=z28ozEirhDM','2005',9,2,9),(12,'Friends','La historia comienza con cuatro amigos (Chandler, Monica, Phoebe y Joey) conversando en una cafetería llamada Central Perk. A medida que transcurre el inicio del capítulo aparece el quinto personaje (Ross) y posteriormente la sexta (Rachel). Este encuentro dentro de la cafetería marca el comienzo de una comedia basada en la amistad, los triunfos y caídas, el amor, el pasado y el futuro de un grupo de amigos en la ciudad de Nueva York.','https://www.youtube.com/watch?v=hDNNmeeJs1Q','1994',10,3,2),(13,'Jack-Jack Ataca','Es un cortometraje spin-off de 2005 que resulta de la película Los Increíbles. En este cortometraje, se ve lo que Disney nos ocultó dentro de la película.','https://www.youtube.com/watch?v=YNsvyq4Oxco','2005',11,4,7),(14,'The Big Bang Theory','La serie comienza con la llegada de Penny, aspirante a actriz, al apartamento vecino que comparten Sheldon y Leonard, dos físicos, que trabajan en el Instituto Tecnológico de California (Caltech). Leonard se enamora desde el primer momento de Penny. Leonard y Sheldon son intelectuales brillantes en su trabajo, amigos a su vez de Howard y Raj, que son presentados como unos completos geeks, muy alejados de las inquietudes y problemas de la gente común. En el curso de la serie se muestra la dificultad de los protagonistas masculinos para relacionarse con personas fuera de su entorno, principalmente de sexo femenino, dando lugar a situaciones cómicas.','https://www.youtube.com/watch?v=KU8T8pq3b8k','2007',12,3,2);
/*!40000 ALTER TABLE `produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reparto`
--

DROP TABLE IF EXISTS `reparto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reparto` (
  `id_pro` int(11) NOT NULL DEFAULT '0',
  `id_actor` int(11) NOT NULL DEFAULT '0',
  `nombrepersonaje` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pro`,`id_actor`),
  KEY `id_actor` (`id_actor`),
  CONSTRAINT `reparto_ibfk_1` FOREIGN KEY (`id_actor`) REFERENCES `actor` (`id_actor`),
  CONSTRAINT `reparto_ibfk_2` FOREIGN KEY (`id_pro`) REFERENCES `produccion` (`id_pro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reparto`
--

LOCK TABLES `reparto` WRITE;
/*!40000 ALTER TABLE `reparto` DISABLE KEYS */;
INSERT INTO `reparto` VALUES (1,1,'Jackson Curtis'),(2,2,'Iron Man'),(3,3,' Ebenezer Scrooge'),(4,4,'Jack Hall'),(4,5,'Sam Hall'),(5,6,'Sr. Spock'),(6,7,'Número 9'),(7,8,'Princesa Mérida'),(8,9,'Dra. Ryan Stone'),(8,10,'Astronauta Matt Kowalski'),(12,11,'Chandler Bing'),(12,12,'Joey Tribbiani'),(12,13,'Ross Geller'),(12,14,'Rachel Green'),(12,15,'Mónica Geller'),(12,16,'Phoebe Buffay'),(14,17,'Sheldon Cooper'),(14,18,'Penny');
/*!40000 ALTER TABLE `reparto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'peliculas'),(2,'documental'),(3,'serie'),(4,'cortometraje');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `name` varchar(25) NOT NULL DEFAULT '',
  `password` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`,`password`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('alberto','1234'),('bego','1111');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-11  6:47:14
