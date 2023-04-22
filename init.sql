-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: econometric
-- ------------------------------------------------------
-- Server version       8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `econometric`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `econometric` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `econometric`;

--
-- Table structure for table `app_agri_img`
--

DROP TABLE IF EXISTS `app_agri_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_agri_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_agri_img`
--

LOCK TABLES `app_agri_img` WRITE;
/*!40000 ALTER TABLE `app_agri_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_agri_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_algorithm`
--

DROP TABLE IF EXISTS `app_algorithm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_algorithm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(63) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `multiple` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_algorithm`
--

LOCK TABLES `app_algorithm` WRITE;
/*!40000 ALTER TABLE `app_algorithm` DISABLE KEYS */;
INSERT INTO `app_algorithm` VALUES (2,'linear_regression','linearRegression.py',0);
/*!40000 ALTER TABLE `app_algorithm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_algorithm_parameters`
--

DROP TABLE IF EXISTS `app_algorithm_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_algorithm_parameters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `algorithm_id` int NOT NULL,
  `parameter_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_algorithm_parameters_algorithm_id_parameter_id_e949fd7b_uniq` (`algorithm_id`,`parameter_id`),
  KEY `app_algorithm_parame_parameter_id_6cecf1b6_fk_app_param` (`parameter_id`),
  CONSTRAINT `app_algorithm_parame_algorithm_id_8c678ddb_fk_app_algor` FOREIGN KEY (`algorithm_id`) REFERENCES `app_algorithm` (`id`),
  CONSTRAINT `app_algorithm_parame_parameter_id_6cecf1b6_fk_app_param` FOREIGN KEY (`parameter_id`) REFERENCES `app_parameter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_algorithm_parameters`
--

LOCK TABLES `app_algorithm_parameters` WRITE;
/*!40000 ALTER TABLE `app_algorithm_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_algorithm_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_balance`
--

DROP TABLE IF EXISTS `app_balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_balance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `balance` decimal(10,2) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_balance`
--

LOCK TABLES `app_balance` WRITE;
/*!40000 ALTER TABLE `app_balance` DISABLE KEYS */;
INSERT INTO `app_balance` VALUES (1,15701.00,'2022-01-26 07:30:04.786408','2022-01-22 09:44:31.668836',2),(5,829.00,'2022-01-26 07:30:04.804168','2022-01-23 07:56:41.740782',5),(6,-98900.00,'2022-01-24 07:35:35.019145','2022-01-24 07:35:35.019214',6),(7,-98900.00,'2022-01-24 07:58:53.476677','2022-01-24 07:58:53.476727',7);
/*!40000 ALTER TABLE `app_balance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_consultant_content_img`
--

DROP TABLE IF EXISTS `app_consultant_content_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_consultant_content_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_consultant_content_img`
--

LOCK TABLES `app_consultant_content_img` WRITE;
/*!40000 ALTER TABLE `app_consultant_content_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_consultant_content_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_database_img`
--

DROP TABLE IF EXISTS `app_database_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_database_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_database_img`
--

LOCK TABLES `app_database_img` WRITE;
/*!40000 ALTER TABLE `app_database_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_database_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_dataset`
--

DROP TABLE IF EXISTS `app_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_dataset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `usertype` varchar(127) NOT NULL,
  `userId` int NOT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_dataset`
--

LOCK TABLES `app_dataset` WRITE;
/*!40000 ALTER TABLE `app_dataset` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_dataset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_forecast`
--

DROP TABLE IF EXISTS `app_forecast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_forecast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dataset` int DEFAULT NULL,
  `algorithmid` int DEFAULT NULL,
  `userid` int DEFAULT NULL,
  `usertype` varchar(255) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `datax` varchar(255) DEFAULT NULL,
  `datay` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_forecast`
--

LOCK TABLES `app_forecast` WRITE;
/*!40000 ALTER TABLE `app_forecast` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_forecast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_index_img`
--

DROP TABLE IF EXISTS `app_index_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_index_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_index_img`
--

LOCK TABLES `app_index_img` WRITE;
/*!40000 ALTER TABLE `app_index_img` DISABLE KEYS */;
INSERT INTO `app_index_img` VALUES (1,'slide1.jpg'),(2,'slide2.jpg'),(3,'slide3.jpg'),(4,'3.jpg'),(5,'4.jpg'),(6,'5.jpg'),(7,'6.jpg'),(8,'7.jpg'),(9,'8.jpg'),(10,'9.jpg'),(11,'10.jpg'),(12,'11.jpg'),(13,'12.jpg'),(14,'13.jpg'),(15,'14.jpg'),(16,'img-1.png');
/*!40000 ALTER TABLE `app_index_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_index_text`
--

DROP TABLE IF EXISTS `app_index_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_index_text` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_index_text`
--

LOCK TABLES `app_index_text` WRITE;
/*!40000 ALTER TABLE `app_index_text` DISABLE KEYS */;
INSERT INTO `app_index_text` VALUES (1,'欢迎来到经济预测与政策模拟平台1111'),(2,'政策模拟是利用已经估出参数值的经济计量模型，计算出不同政策方案的后果，以便进行政策评价。进行政策模拟时，首先
  出不同政策方案的假设条件，即政策变量的数值，或结构参数的变动值，然后用模型计算出不同假设条件下内生变量的数值。它可用简化式进行模拟，也可用结构式进行模拟。由于经济和社会现象的影响因素很多，
  能保持其他因素不变，在实验室进行有控制的实验，确定某种因素单独的作用。'),(3,'世界经济模型'),(4,'世界经济模型（World economic models）是指用定量方法构造的描述世界大部分国家和地区综合经济发
  状况的模型。'),(5,'东亚十国模型'),(6,'东盟十国包括老挝 、柬埔寨 、缅甸 、泰国 、越南 、马来西亚 、新加坡 、汶莱 、菲律宾 、印尼。'),(7,'一带一路模型'),(8,'“一带一路”（The Belt and Road，缩
  B&R）是“丝绸之路经济带”和“21世纪海上丝绸之路”的简称。'),(9,'投资策略'),(10,'国际贸易'),(11,'环境资源'),(12,'资源'),(13,'灾害评估'),(14,'劳动力');
/*!40000 ALTER TABLE `app_index_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_orderhistory`
--

DROP TABLE IF EXISTS `app_orderhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_orderhistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `forecast_id` int NOT NULL,
  `user_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `count` int NOT NULL,
  `is_team` tinyint(1) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `time` varchar(127) NOT NULL,
  `is_buy` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_orderhistory`
--

LOCK TABLES `app_orderhistory` WRITE;
/*!40000 ALTER TABLE `app_orderhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_orderhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_parameter`
--

DROP TABLE IF EXISTS `app_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_parameter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_parameter`
--

LOCK TABLES `app_parameter` WRITE;
/*!40000 ALTER TABLE `app_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_produce_img`
--

DROP TABLE IF EXISTS `app_produce_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_produce_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_produce_img`
--

LOCK TABLES `app_produce_img` WRITE;
/*!40000 ALTER TABLE `app_produce_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_produce_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_serviceobject_img`
--

DROP TABLE IF EXISTS `app_serviceobject_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_serviceobject_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_serviceobject_img`
--

LOCK TABLES `app_serviceobject_img` WRITE;
/*!40000 ALTER TABLE `app_serviceobject_img` DISABLE KEYS */;
INSERT INTO `app_serviceobject_img` VALUES (1,'picture-4.jpg'),(2,'picture-10.jpg'),(3,'picture-7.jpg'),(4,'picture-13.jpg'),(5,'picture-15.jpg'),(6,'picture-5.jpg'),(7,'picture-8.jpg'),(8,'picture-6.jpg'),(9,'picture-14.jpg'),(10,'picture-9.jpg'),(11,'picture-11.jpg'),(12,'picture-12.jpg'),(13,'picture-17.gif'),(14,'picture-18.jpg');
/*!40000 ALTER TABLE `app_serviceobject_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_serviceobject_text`
--

DROP TABLE IF EXISTS `app_serviceobject_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_serviceobject_text` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_serviceobject_text`
--

LOCK TABLES `app_serviceobject_text` WRITE;
/*!40000 ALTER TABLE `app_serviceobject_text` DISABLE KEYS */;
INSERT INTO `app_serviceobject_text` VALUES (1,'本公司是中国国家信息中心（SIC）的战略合作伙伴，我们的服务对象主要包括国际机构、政府机构、非政府组织、行业组织、个体企业以及相关研究团队。此外
  任何在宏观经济、应用经济、行业发展战略、一般均衡模型（CGE）课题攻艰上有需求的客户，我们都会竭诚为您服务。'),(2,'欧盟委员会(European Commission)'),(3,'世界银行(World Bank)'),(4,'亚洲发展银
  (Asia Development Bank)'),(5,'加拿大外交部(Department of Foreign Affairs, Trade and Development, Canada)'),(6,'新加坡贸易与产业部(Ministry of Trade and Industry, Singapore)'),(7,'哈佛大学(Harvard University)'),(8,'北京久其软件股份有限公司(Beijing Join-Cheer Software Co.,Ltd.股票简称：久其软件；股票代码:002279)'),(9,'加拿大首席执行长协会(Canadian Council of Chief Executives)'),(10,'Ciuriak Consulting'),(11,'BKP Development & Research Consulting GmbH'),(12,'麦肯锡(McKinsey)'),(13,'智库开放欧洲（Open Europe)'),(14,'澳洲政策研究中心（The Centre of Policy Studies）'),(15,'Global Trade Analysis Project');
/*!40000 ALTER TABLE `app_serviceobject_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_simulation_platform_img`
--

DROP TABLE IF EXISTS `app_simulation_platform_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_simulation_platform_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_simulation_platform_img`
--

LOCK TABLES `app_simulation_platform_img` WRITE;
/*!40000 ALTER TABLE `app_simulation_platform_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_simulation_platform_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_solution_img`
--

DROP TABLE IF EXISTS `app_solution_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_solution_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_solution_img`
--

LOCK TABLES `app_solution_img` WRITE;
/*!40000 ALTER TABLE `app_solution_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_solution_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_solution_text`
--

DROP TABLE IF EXISTS `app_solution_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_solution_text` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(511) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_solution_text`
--

LOCK TABLES `app_solution_text` WRITE;
/*!40000 ALTER TABLE `app_solution_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_solution_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_teammember_img`
--

DROP TABLE IF EXISTS `app_teammember_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_teammember_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_teammember_img`
--

LOCK TABLES `app_teammember_img` WRITE;
/*!40000 ALTER TABLE `app_teammember_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_teammember_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_training_courses_img`
--

DROP TABLE IF EXISTS `app_training_courses_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_training_courses_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_training_courses_img`
--

LOCK TABLES `app_training_courses_img` WRITE;
/*!40000 ALTER TABLE `app_training_courses_img` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_training_courses_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(25) NOT NULL,
  `research_field` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `organization` varchar(50) NOT NULL,
  `is_team` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_user_account_4d856186_uniq` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (9,'admin','admin','admin','admin@bupt.edu.cn','15016339620','admin',0,1,1,'2022-05-11 16:00:44.984864','pbkdf2_sha256$320000$KT6p8Qxi4629Jgx7ZNeCwu$TRrwwQ32bwMONNqKyTZdbFlLhOWBnSn62PI/3r+FQMo=');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user_groups`
--

DROP TABLE IF EXISTS `app_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_user_groups_user_id_group_id_73b8e940_uniq` (`user_id`,`group_id`),
  KEY `app_user_groups_group_id_e774d92c_fk_auth_group_id` (`group_id`),
  CONSTRAINT `app_user_groups_group_id_e774d92c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `app_user_groups_user_id_e6f878f6_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user_groups`
--

LOCK TABLES `app_user_groups` WRITE;
/*!40000 ALTER TABLE `app_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_user_user_permissions`
--

DROP TABLE IF EXISTS `app_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_user_user_permissions_user_id_permission_id_7c8316ce_uniq` (`user_id`,`permission_id`),
  KEY `app_user_user_permis_permission_id_4ef8e133_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app_user_user_permis_permission_id_4ef8e133_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `app_user_user_permissions_user_id_24780b52_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user_user_permissions`
--

LOCK TABLES `app_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `app_user_user_permissions` DISABLE KEYS */;
INSERT INTO `app_user_user_permissions` VALUES (184,9,1),(185,9,2),(186,9,3),(187,9,4),(281,9,5),(282,9,6),(283,9,7),(284,9,8),(277,9,9),(278,9,10),(279,9,11),(280,9,12),(285,9,13),(286,9,14),(287,9,15),(288,9,16),(289,9,17),(290,9,18),(291,9,19),(292,9,20),(293,9,21),(294,9,22),(295,9,23),(296,9,24),(188,9,25),(189,9,26),(190,9,27),(191,9,28),(200,9,29),(201,9,30),(202,9,31),(203,9,32),(204,9,33),(205,9,34),(206,9,35),(207,9,36),(216,9,37),(217,9,38),(218,9,39),(219,9,40),(236,9,41),(237,9,42),(238,9,43),(239,9,44),(240,9,45),(241,9,46),(242,9,47),(243,9,48),(248,9,49),(249,9,50),(250,9,51),(251,9,52),(252,9,53),(253,9,54),(254,9,55),(255,9,56),(260,9,57),(261,9,58),(262,9,59),(263,9,60),(264,9,61),(265,9,62),(266,9,63),(267,9,64),(268,9,65),(269,9,66),(270,9,67),(271,9,68),(272,9,69),(273,9,70),(274,9,71),(276,9,72),(220,9,73),(221,9,74),(222,9,75),(223,9,76),(244,9,77),(245,9,78),(246,9,79),(247,9,80),(192,9,81),(193,9,82),(194,9,83),(195,9,84),(212,9,85),(213,9,86),(214,9,87),(215,9,88),(208,9,89),(209,9,90),(210,9,91),(211,9,92),(232,9,93),(233,9,94),(234,9,95),(235,9,96),(256,9,97),(257,9,98),(258,9,99),(259,9,100),(224,9,101),(225,9,102),(226,9,103),(227,9,104),(275,9,122),(196,9,123),(197,9,124),(198,9,125),(199,9,126),(228,9,127),(229,9,128),(230,9,129),(231,9,130);
/*!40000 ALTER TABLE `app_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add agri_img',7,'add_agri_img'),(26,'Can change agri_img',7,'change_agri_img'),(27,'Can delete agri_img',7,'delete_agri_img'),(28,'Can view agri_img',7,'view_agri_img'),(29,'Can add consultant_content_img',8,'add_consultant_content_img'),(30,'Can change consultant_content_img',8,'change_consultant_content_img'),(31,'Can delete consultant_content_img',8,'delete_consultant_content_img'),(32,'Can view consultant_content_img',8,'view_consultant_content_img'),(33,'Can add database_img',9,'add_database_img'),(34,'Can change database_img',9,'change_database_img'),(35,'Can delete database_img',9,'delete_database_img'),(36,'Can view database_img',9,'view_database_img'),(37,'Can add index_img',10,'add_index_img'),(38,'Can change index_img',10,'change_index_img'),(39,'Can delete index_img',10,'delete_index_img'),(40,'Can view index_img',10,'view_index_img'),(41,'Can add produce_img',11,'add_produce_img'),(42,'Can change produce_img',11,'change_produce_img'),(43,'Can delete produce_img',11,'delete_produce_img'),(44,'Can view produce_img',11,'view_produce_img'),(45,'Can add serviceobject_img',12,'add_serviceobject_img'),(46,'Can change serviceobject_img',12,'change_serviceobject_img'),(47,'Can delete serviceobject_img',12,'delete_serviceobject_img'),(48,'Can view serviceobject_img',12,'view_serviceobject_img'),(49,'Can add simulation_platform_img',13,'add_simulation_platform_img'),(50,'Can change simulation_platform_img',13,'change_simulation_platform_img'),(51,'Can delete simulation_platform_img',13,'delete_simulation_platform_img'),(52,'Can view simulation_platform_img',13,'view_simulation_platform_img'),(53,'Can add solution_img',14,'add_solution_img'),(54,'Can change solution_img',14,'change_solution_img'),(55,'Can delete solution_img',14,'delete_solution_img'),(56,'Can view solution_img',14,'view_solution_img'),(57,'Can add team',15,'add_team'),(58,'Can change team',15,'change_team'),(59,'Can delete team',15,'delete_team'),(60,'Can view team',15,'view_team'),(61,'Can add teammember_img',16,'add_teammember_img'),(62,'Can change teammember_img',16,'change_teammember_img'),(63,'Can delete teammember_img',16,'delete_teammember_img'),(64,'Can view teammember_img',16,'view_teammember_img'),(65,'Can add training_courses_img',17,'add_training_courses_img'),(66,'Can change training_courses_img',17,'change_training_courses_img'),(67,'Can delete training_courses_img',17,'delete_training_courses_img'),(68,'Can view training_courses_img',17,'view_training_courses_img'),(69,'Can add user',18,'add_user'),(70,'Can change user',18,'change_user'),(71,'Can delete user',18,'delete_user'),(72,'Can view user',18,'view_user'),(73,'Can add index_text',19,'add_index_text'),(74,'Can change index_text',19,'change_index_text'),(75,'Can delete index_text',19,'delete_index_text'),(76,'Can view index_text',19,'view_index_text'),(77,'Can add serviceobject_text',20,'add_serviceobject_text'),(78,'Can change serviceobject_text',20,'change_serviceobject_text'),(79,'Can delete serviceobject_text',20,'delete_serviceobject_text'),(80,'Can view serviceobject_text',20,'view_serviceobject_text'),(81,'Can add algorithm',21,'add_algorithm'),(82,'Can change algorithm',21,'change_algorithm'),(83,'Can delete algorithm',21,'delete_algorithm'),(84,'Can view algorithm',21,'view_algorithm'),(85,'Can add 预测实例',22,'add_forecast'),(86,'Can change 预测实例',22,'change_forecast'),(87,'Can delete 预测实例',22,'delete_forecast'),(88,'Can view 预测实例',22,'view_forecast'),(89,'Can add 数据',23,'add_dataset'),(90,'Can change 数据',23,'change_dataset'),(91,'Can delete 数据',23,'delete_dataset'),(92,'Can view 数据',23,'view_dataset'),(93,'Can add 参数',24,'add_parameter'),(94,'Can change 参数',24,'change_parameter'),(95,'Can delete 参数',24,'delete_parameter'),(96,'Can view 参数',24,'view_parameter'),(97,'Can add 文字管理',25,'add_solution_text'),(98,'Can change 文字管理',25,'change_solution_text'),(99,'Can delete 文字管理',25,'delete_solution_text'),(100,'Can view 文字管理',25,'view_solution_text'),(101,'Can add 订单',26,'add_order'),(102,'Can change 订单',26,'change_order'),(103,'Can delete 订单',26,'delete_order'),(104,'Can view 订单',26,'view_order'),(122,'运行算法',18,'run_algorithm'),(123,'Can add 余额',27,'add_balance'),(124,'Can change 余额',27,'change_balance'),(125,'Can delete 余额',27,'delete_balance'),(126,'Can view 余额',27,'view_balance'),(127,'Can add 订单历史',28,'add_orderhistory'),(128,'Can change 订单历史',28,'change_orderhistory'),(129,'Can delete 订单历史',28,'delete_orderhistory'),(130,'Can view 订单历史',28,'view_orderhistory');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app','agri_img'),(21,'app','algorithm'),(27,'app','balance'),(8,'app','consultant_content_img'),(9,'app','database_img'),(23,'app','dataset'),(22,'app','forecast'),(10,'app','index_img'),(19,'app','index_text'),(26,'app','order'),(28,'app','orderhistory'),(24,'app','parameter'),(11,'app','produce_img'),(12,'app','serviceobject_img'),(20,'app','serviceobject_text'),(13,'app','simulation_platform_img'),(14,'app','solution_img'),(25,'app','solution_text'),(15,'app','team'),(16,'app','teammember_img'),(17,'app','training_courses_img'),(18,'app','user'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-12-02 11:10:07.101624'),(2,'auth','0001_initial','2020-12-02 11:10:07.141791'),(6,'app','0001_initial','2020-12-02 11:10:07.304988'),(7,'contenttypes','0002_remove_content_type_name','2020-12-02 11:10:07.333304'),(8,'auth','0002_alter_permission_name_max_length','2020-12-02 11:10:07.348589'),(9,'auth','0003_alter_user_email_max_length','2020-12-02 11:10:07.359932'),(10,'auth','0004_alter_user_username_opts','2020-12-02 11:10:07.365116'),(11,'auth','0005_alter_user_last_login_null','2020-12-02 11:10:07.378109'),(12,'auth','0006_require_contenttypes_0002','2020-12-02 11:10:07.379412'),(13,'auth','0007_alter_validators_add_error_messages','2020-12-02 11:10:07.384485'),(14,'auth','0008_alter_user_username_max_length','2020-12-02 11:10:07.403140'),(15,'auth','0009_alter_user_last_name_max_length','2020-12-02 11:10:07.418232'),(16,'auth','0010_alter_group_name_max_length','2020-12-02 11:10:07.428403'),(17,'auth','0011_update_proxy_permissions','2020-12-02 11:10:07.435954'),(18,'auth','0012_alter_user_first_name_max_length','2020-12-02 11:10:07.451897'),(19,'sessions','0001_initial','2020-12-02 11:10:07.458118'),(20,'app','0002_index_text','2020-12-07 10:30:11.413770'),(21,'app','0003_serviceobject_text','2020-12-17 16:14:35.622431'),(22,'app','0004_algorithm','2021-03-24 05:57:16.181688'),(23,'app','0005_auto_20210329_2046','2022-01-03 09:23:36.668224'),(24,'app','0006_auto_20210329_2106','2022-01-03 09:23:36.697487'),(25,'app','0007_auto_20210330_1309','2022-01-03 09:23:36.721878'),(26,'app','0008_auto_20210330_1510','2022-01-03 09:23:36.791019'),(27,'app','0009_auto_20210330_1528','2022-01-03 09:23:36.820890'),(28,'app','0010_auto_20210331_1610','2022-01-03 09:23:36.853264'),(29,'app','0011_remove_forecast_parameter','2022-01-03 09:23:36.920316'),(30,'app','0012_algorithm_multiple','2022-01-03 09:23:36.942406'),(31,'app','0013_auto_20210420_1605','2022-01-03 09:23:37.005303'),(32,'app','0014_auto_20210420_1609','2022-01-03 09:23:37.077935'),(33,'app','0015_forecast_model','2022-01-03 09:23:37.092612'),(34,'app','0016_auto_20210421_2047','2022-01-03 09:23:37.119292'),(35,'app','0017_solution_text','2022-01-03 09:23:37.132122'),(36,'app','0018_order','2022-01-15 10:16:40.384087'),(37,'app','0019_auto_20220115_1819','2022-01-15 10:19:33.356165'),(38,'app','0020_order_team_id','2022-01-15 10:24:24.033042'),(39,'app','0021_remove_order_team_id','2022-01-15 10:25:39.430165'),(40,'app','0022_auto_20220116_1456','2022-01-16 06:56:11.948382'),(41,'app','0023_auto_20220116_1553','2022-01-16 07:53:07.509370'),(42,'app','0024_auto_20220116_1557','2022-01-16 07:57:21.743253'),(43,'app','0025_auto_20220118_1928','2022-01-18 11:28:46.983315'),(44,'app','0026_user_is_active','2022-01-19 13:05:58.329014'),(45,'app','0027_auto_20220119_2107','2022-01-19 13:07:05.113909'),(46,'app','0028_auto_20220119_2111','2022-01-19 13:11:03.894522'),(47,'app','0029_auto_20220119_2115','2022-01-19 13:15:42.290501'),(48,'app','0030_auto_20220119_2141','2022-01-19 13:41:17.727274'),(49,'app','0031_auto_20220120_2109','2022-01-20 13:09:11.342919'),(50,'admin','0001_initial','2022-01-20 13:33:54.674582'),(51,'admin','0002_logentry_remove_auto_add','2022-01-20 13:33:54.721557'),(52,'admin','0003_logentry_add_action_flag_choices','2022-01-20 13:33:54.731321'),(53,'app','0002_auto_20220121_1845','2022-01-21 10:45:16.639187'),(54,'app','0003_auto_20220121_1911','2022-01-21 11:11:07.425873'),(55,'app','0004_auto_20220122_1556','2022-01-22 07:57:05.131777'),(56,'app','0005_balance_user_id','2022-01-22 08:43:15.436251'),(57,'app','0006_auto_20220122_1646','2022-01-22 08:46:02.825507'),(58,'app','0007_auto_20220122_1957','2022-01-22 11:57:05.878059'),(59,'app','0008_orderhistory_is_buy','2022-01-22 11:59:54.931495');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('dh30d15w44ejtj6nlrh24p2ibvgkzyap','.eJzVVtFu4yAQ_JXIz0nPxoChb73fuFTRYpaEq2MiY596qvLvB06vSRyiRJUq3T2tzK5ndoYF-y1bwdBvVoPHbmV19pjJbH66pqB-wTYmYLd7eH96eNrtnkLJ9_fk2Rsb8JtQzpUUkjNDC22IolQWhqkSOUhFKMk5ryQIJIQqJlBRJqDUvCbUMF5wLkUE3WI7-ID1422ZtbDFZfY4W2bL5SCl5DGIioVQKShioDlfZvNQYWvXHmoNdDMDC2MbXEDTH9Jbp7HxseACmHGDEYrQ6hawj8B2C2v0h-TQNYdccOqbbTW-rux2fcih1TFX5DnZz2dTVs5EpGOK3cdqXNtf5ezxtZ-Slvvn84Ui1UWV69gFGemZMjIEUfPi6LSsOPlHDQ-j98vW6NRPrPuU8ezrjD_nTm0An24ATXQjJJaxm0KVY28qbgAXVPwfG-CaobeuTXkvvtD7v7Qp2-XU9ipluybxMuGkvK8R0LpD7xfKuZeb9p6Cp-HipZnQdVz-6L4oJnKKPCGnUjLq4LW-eTeO_DU09dBA77qbYk6h7wM7kwTN2nW232ynusqEDFbWZJySKv8M1w66gNZfekinHqYuZCkEjeSaqjtns9F4279z2HC-48mjRqgrsBp6UOAxoc-4Dmvw04kvePKkBQ9DKDleIQo0TYolNuDxgqSaepi6W8Pkk-Pn5I45dLb1t0eQEXE8rKccV1A71LYPs9LphD4FDbQ1TvXJlBwFI1XJ2BgEH4Mh14gbu1MuTeu6MC0b68Po_p5wk3zqrdg_h3-hjx80uf8DSSnyhQ:1noolZ:yFEILRoQ1xG1OEVjBvYj0GJ5sXO36eXI-V87pb87apw','2022-05-25 16:00:45.008169');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'econometric'
--

--
-- Dumping routines for database 'econometric'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-12  0:18:17
