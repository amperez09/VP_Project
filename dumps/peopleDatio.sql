-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: PeopleDatio
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add bitacora',7,'add_bitacora'),(26,'Can change bitacora',7,'change_bitacora'),(27,'Can delete bitacora',7,'delete_bitacora'),(28,'Can view bitacora',7,'view_bitacora'),(29,'Can add empleado',8,'add_empleado'),(30,'Can change empleado',8,'change_empleado'),(31,'Can delete empleado',8,'delete_empleado'),(32,'Can view empleado',8,'view_empleado'),(33,'Can add ftes',9,'add_ftes'),(34,'Can change ftes',9,'change_ftes'),(35,'Can delete ftes',9,'delete_ftes'),(36,'Can view ftes',9,'view_ftes'),(37,'Can add periodo',10,'add_periodo'),(38,'Can change periodo',10,'change_periodo'),(39,'Can delete periodo',10,'delete_periodo'),(40,'Can view periodo',10,'view_periodo'),(41,'Can add proyecto',11,'add_proyecto'),(42,'Can change proyecto',11,'change_proyecto'),(43,'Can delete proyecto',11,'delete_proyecto'),(44,'Can view proyecto',11,'view_proyecto');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$1LaPGWE5LYDs$HFdeEv2hufXvvFNyV5nuwutvxunHJcDbMDkUyFJcNEo=','2019-02-08 20:02:18.648159',1,'datio','','','datio@datio.com',1,1,'2019-02-07 23:13:19.568710');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_bitacora`
--

DROP TABLE IF EXISTS `blog_bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_bitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horasLaborables` double DEFAULT NULL,
  `horasVacaciones` int(11) DEFAULT NULL,
  `horasEnfermedad` int(11) DEFAULT NULL,
  `horasEspeciales` int(11) DEFAULT NULL,
  `horasPorcentaje` double DEFAULT NULL,
  `clavePeriodo_id` varchar(6) NOT NULL,
  `codigo_id` varchar(13) NOT NULL,
  `idEmpleado_id` int(11) NOT NULL,
  `observaciones` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_bitacora_idEmpleado_id_codigo_id__900aff78_uniq` (`idEmpleado_id`,`codigo_id`,`clavePeriodo_id`),
  KEY `blog_bitacora_clavePeriodo_id_28371925_fk_blog_peri` (`clavePeriodo_id`),
  KEY `blog_bitacora_codigo_id_da989ad7_fk_blog_proyecto_codigo` (`codigo_id`),
  CONSTRAINT `blog_bitacora_clavePeriodo_id_28371925_fk_blog_peri` FOREIGN KEY (`clavePeriodo_id`) REFERENCES `blog_periodo` (`clavePeriodo`),
  CONSTRAINT `blog_bitacora_codigo_id_da989ad7_fk_blog_proyecto_codigo` FOREIGN KEY (`codigo_id`) REFERENCES `blog_proyecto` (`codigo`),
  CONSTRAINT `blog_bitacora_idEmpleado_id_a370574a_fk_blog_empleado_idEmpleado` FOREIGN KEY (`idEmpleado_id`) REFERENCES `blog_empleado` (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_bitacora`
--

LOCK TABLES `blog_bitacora` WRITE;
/*!40000 ALTER TABLE `blog_bitacora` DISABLE KEYS */;
INSERT INTO `blog_bitacora` VALUES (3,160,0,0,0,1,'201812','3BDH:8918',14,''),(4,150,0,0,0,1,'201812','3BDH:8918',67,''),(5,140,0,0,0,1,'201812','3BDH:8918',88,NULL),(6,140,0,0,0,1,'201812','3BDH.0001288',88,NULL);
/*!40000 ALTER TABLE `blog_bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_empleado`
--

DROP TABLE IF EXISTS `blog_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apPaterno` varchar(50) NOT NULL,
  `apMaterno` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `activo` int(11) NOT NULL,
  `pais` varchar(50) NOT NULL,
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_empleado`
--

LOCK TABLES `blog_empleado` WRITE;
/*!40000 ALTER TABLE `blog_empleado` DISABLE KEYS */;
INSERT INTO `blog_empleado` VALUES (2,'Aduer Janiel','Macedo','Barona','ajmacedo@datiobd.com','Developer',1,''),(4,'Aduer Janiel','Macedo','Barona',NULL,'Developer',1,'Mx'),(5,'Pepe','Camacho','Villanueva','jocamacho@datiobd.com','Deployment',1,'MX'),(11,'Oton','Camacho','Villanueva','jocamacho@datiobd.com','Deployment',1,'MX'),(12,'Alina','Ah','','','',1,'MX'),(13,'Felipe','Lui','SS','','',1,'MX'),(14,'Narda','Ixcel','R','narda@hol.com','Deployment',1,'MX'),(23,'Juan','Jo','Se','jaime@kol.com','Deployment',1,'MX'),(24,'juani','bana','Camachou','dasdas@asda.com','Qa',1,'ES'),(25,'jan','Na','Camachou','ban@jac.com','Deployment',1,'ES'),(26,'as','bana','asdas','ban@jac.com','Deployment',1,'ES'),(27,'as','bana','asdas','ban@jac.com','Deployment',1,'ES'),(28,'juani','Perez','asdas','dasdas@asda.com','Deployment',1,'ES'),(61,'dsad','bana','Camachou','dasdas@asda.com','Deployment',1,'ES'),(66,'SA','sa','','','',1,'MX'),(67,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',0,'MX'),(68,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(69,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(70,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(71,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(72,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(73,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(74,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(75,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(76,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(77,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(78,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(79,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(80,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(81,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(82,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(83,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(84,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(85,'Humberto','Del','Angel','humberto@bancomerss.com','Analítica',1,'MX'),(86,'Aduer Janiel','Macedo','Barona','ajmacedo@datiobd.com','Developer',1,'Mx'),(87,'Aduer Janiel','Macedo','Barona',NULL,'Developer',1,'Mx'),(88,'Xochiquetzalli Cuahutemoquetzolli','Se fue para atrás tras tras','Maria de la PazPAz Paz','Xochiquetzallicu@hotstarmediagmail.com','Deploymente Startup Analitica',1,'MX');
/*!40000 ALTER TABLE `blog_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_ftes`
--

DROP TABLE IF EXISTS `blog_ftes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_ftes` (
  `nombreFtes` varchar(50) NOT NULL,
  `activo` int(11) NOT NULL,
  PRIMARY KEY (`nombreFtes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_ftes`
--

LOCK TABLES `blog_ftes` WRITE;
/*!40000 ALTER TABLE `blog_ftes` DISABLE KEYS */;
INSERT INTO `blog_ftes` VALUES ('Deployment',1),('DevOps',1),('Palomas',1),('QA',1),('Soporte MX',1);
/*!40000 ALTER TABLE `blog_ftes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_periodo`
--

DROP TABLE IF EXISTS `blog_periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_periodo` (
  `clavePeriodo` varchar(6) NOT NULL,
  `horasTotales` int(11) NOT NULL,
  `horasNoLaborables` int(11) DEFAULT NULL,
  `descripcionMes` varchar(20) NOT NULL,
  `descripcionAnio` varchar(6) NOT NULL,
  PRIMARY KEY (`clavePeriodo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_periodo`
--

LOCK TABLES `blog_periodo` WRITE;
/*!40000 ALTER TABLE `blog_periodo` DISABLE KEYS */;
INSERT INTO `blog_periodo` VALUES ('201812',172,8,'Enero','2018');
/*!40000 ALTER TABLE `blog_periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_proyecto`
--

DROP TABLE IF EXISTS `blog_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_proyecto` (
  `codigo` varchar(13) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `activo` int(11) DEFAULT NULL,
  `nombreFtes_id` varchar(50) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `blog_proyecto_nombreFtes_id_052e0ba0_fk_blog_ftes_nombreFtes` (`nombreFtes_id`),
  CONSTRAINT `blog_proyecto_nombreFtes_id_052e0ba0_fk_blog_ftes_nombreFtes` FOREIGN KEY (`nombreFtes_id`) REFERENCES `blog_ftes` (`nombreFtes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_proyecto`
--

LOCK TABLES `blog_proyecto` WRITE;
/*!40000 ALTER TABLE `blog_proyecto` DISABLE KEYS */;
INSERT INTO `blog_proyecto` VALUES ('3BDH.00','IN','DAT:PRO FDS C',1,'QA'),('3BDH.0001221','IN','DAT: PRO WS',1,'Palomas'),('3BDH.0001288','IN','DAT: PRO EL DORADO COL',1,'Palomas'),('3BDH:8918','IN','DAT:CRD MCX',1,'QA'),('3BFD:8980','IN','EDC:89 MXAM',1,'Soporte MX');
/*!40000 ALTER TABLE `blog_proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-02-08 18:51:41.986185','1','Jose luis Aguilar Sanchez',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'blog','bitacora'),(8,'blog','empleado'),(9,'blog','ftes'),(10,'blog','periodo'),(11,'blog','proyecto'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-02-07 23:12:32.925056'),(2,'auth','0001_initial','2019-02-07 23:12:34.726473'),(3,'admin','0001_initial','2019-02-07 23:12:35.137224'),(4,'admin','0002_logentry_remove_auto_add','2019-02-07 23:12:35.166073'),(5,'admin','0003_logentry_add_action_flag_choices','2019-02-07 23:12:35.188439'),(6,'contenttypes','0002_remove_content_type_name','2019-02-07 23:12:35.414839'),(7,'auth','0002_alter_permission_name_max_length','2019-02-07 23:12:35.442335'),(8,'auth','0003_alter_user_email_max_length','2019-02-07 23:12:35.483830'),(9,'auth','0004_alter_user_username_opts','2019-02-07 23:12:35.508879'),(10,'auth','0005_alter_user_last_login_null','2019-02-07 23:12:35.624714'),(11,'auth','0006_require_contenttypes_0002','2019-02-07 23:12:35.633283'),(12,'auth','0007_alter_validators_add_error_messages','2019-02-07 23:12:35.646813'),(13,'auth','0008_alter_user_username_max_length','2019-02-07 23:12:35.666710'),(14,'auth','0009_alter_user_last_name_max_length','2019-02-07 23:12:35.708463'),(15,'blog','0001_initial','2019-02-07 23:12:37.057121'),(16,'sessions','0001_initial','2019-02-07 23:12:37.176582'),(17,'blog','0002_auto_20190211_1837','2019-02-11 18:37:54.290602'),(18,'blog','0002_bitacora_observaciones','2019-02-14 16:32:37.761376'),(19,'blog','0003_auto_20190214_1636','2019-02-14 16:36:18.418277'),(20,'blog','0004_auto_20190214_1639','2019-02-14 16:39:43.081486'),(21,'blog','0005_auto_20190214_1727','2019-02-14 17:27:06.953758'),(22,'blog','0003_auto_20190214_1638','2019-02-14 18:03:40.401598'),(23,'blog','0004_auto_20190214_1727','2019-02-14 18:03:40.471800');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('cm24enpmd5n0189gba6287shvjzdln0x','MDE3YzBjOTgyZmQ0MGMyNzIxMzZkNjBmM2QyZDNlOTYwNDE2YTBiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYWIyNjFmMTQwMTUxZGMzNDdmMjdjZGJiMzFlMmY0NWQ3YTg5MGY5In0=','2019-02-21 23:15:14.421938'),('n10karswsbyq5nnsamvujuv5wl60h6kb','MDE3YzBjOTgyZmQ0MGMyNzIxMzZkNjBmM2QyZDNlOTYwNDE2YTBiZjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhYWIyNjFmMTQwMTUxZGMzNDdmMjdjZGJiMzFlMmY0NWQ3YTg5MGY5In0=','2019-02-22 18:50:29.740041');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-18 11:33:19
