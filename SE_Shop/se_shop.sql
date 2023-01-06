-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: se_shop
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add jobs',7,'add_jobs'),(26,'Can change jobs',7,'change_jobs'),(27,'Can delete jobs',7,'delete_jobs'),(28,'Can view jobs',7,'view_jobs'),(29,'Can add product',8,'add_product'),(30,'Can change product',8,'change_product'),(31,'Can delete product',8,'delete_product'),(32,'Can view product',8,'view_product'),(33,'Can add detail model',9,'add_detailmodel'),(34,'Can change detail model',9,'change_detailmodel'),(35,'Can delete detail model',9,'delete_detailmodel'),(36,'Can view detail model',9,'view_detailmodel'),(37,'Can add orders model',10,'add_ordersmodel'),(38,'Can change orders model',10,'change_ordersmodel'),(39,'Can delete orders model',10,'delete_ordersmodel'),(40,'Can view orders model',10,'view_ordersmodel'),(41,'Can add member',11,'add_member'),(42,'Can change member',11,'change_member'),(43,'Can delete member',11,'delete_member'),(44,'Can view member',11,'view_member'),(45,'Can add message',12,'add_message'),(46,'Can change message',12,'change_message'),(47,'Can delete message',12,'delete_message'),(48,'Can view message',12,'view_message');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$tgeKxpBtFwHbVAKyLZA2wJ$qz44/jKqx86/od0ykMAsUCkuW2DlprAgaKOLEbHtIWE=','2023-01-05 11:29:51.510084',1,'katskon','','','a0975396306@gmail.com',1,1,'2023-01-03 05:45:41.009511');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_detailmodel`
--

DROP TABLE IF EXISTS `cart_detailmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detailmodel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pname` varchar(100) NOT NULL,
  `unitprice` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `dtotal` int(11) NOT NULL,
  `dorder_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_detailmodel_dorder_id_4a34f87f_fk_cart_ordersmodel_id` (`dorder_id`),
  CONSTRAINT `cart_detailmodel_dorder_id_4a34f87f_fk_cart_ordersmodel_id` FOREIGN KEY (`dorder_id`) REFERENCES `cart_ordersmodel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detailmodel`
--

LOCK TABLES `cart_detailmodel` WRITE;
/*!40000 ALTER TABLE `cart_detailmodel` DISABLE KEYS */;
INSERT INTO `cart_detailmodel` VALUES (1,'ファイナルファンタジーXIV　私立エオルゼア学園',730,1,730,1),(2,'Eorzean Symphony: FINAL FANTASY XIV Orchestral Album Vol. 3【映像付サントラ／Blu-ray Disc Music】',6600,1,6600,1);
/*!40000 ALTER TABLE `cart_detailmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_ordersmodel`
--

DROP TABLE IF EXISTS `cart_ordersmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_ordersmodel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subtotal` int(11) NOT NULL,
  `shipping` int(11) NOT NULL,
  `grandtotal` int(11) NOT NULL,
  `customname` varchar(100) NOT NULL,
  `customemail` varchar(100) NOT NULL,
  `customphone` varchar(50) NOT NULL,
  `paytype` varchar(20) NOT NULL,
  `create_date` date NOT NULL,
  `customaddress` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_ordersmodel`
--

LOCK TABLES `cart_ordersmodel` WRITE;
/*!40000 ALTER TABLE `cart_ordersmodel` DISABLE KEYS */;
INSERT INTO `cart_ordersmodel` VALUES (1,7330,100,7430,'蔡欣憲','a0975396306@gmail.com','0966000451','ATM轉帳','2023-01-06','天祥街92巷35號五樓');
/*!40000 ALTER TABLE `cart_ordersmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-01-03 05:54:31.345953','1','Jobs object (1)',1,'[{\"added\": {}}]',7,1),(2,'2023-01-03 05:54:42.841354','1','Jobs object (1)',2,'[]',7,1),(3,'2023-01-03 05:54:57.168830','1','Jobs object (1)',2,'[]',7,1),(4,'2023-01-03 05:55:01.813717','1','Jobs object (1)',2,'[]',7,1),(5,'2023-01-03 05:58:06.878595','2','Jobs object (2)',1,'[{\"added\": {}}]',7,1),(6,'2023-01-03 05:58:18.157613','1','Jobs object (1)',2,'[]',7,1),(7,'2023-01-03 05:58:20.056217','1','Jobs object (1)',2,'[]',7,1),(8,'2023-01-03 05:58:30.398714','2','Jobs object (2)',2,'[]',7,1),(9,'2023-01-03 06:01:47.765025','1','Jobs object (1)',2,'[]',7,1),(10,'2023-01-03 06:12:21.775647','1','Jobs object (1)',2,'[{\"changed\": {\"fields\": [\"Classifi\"]}}]',7,1),(11,'2023-01-03 06:12:38.740919','2','Jobs object (2)',2,'[{\"changed\": {\"fields\": [\"Classifi\"]}}]',7,1),(12,'2023-01-03 06:12:53.349976','1','Jobs object (1)',2,'[{\"changed\": {\"fields\": [\"Classifi\"]}}]',7,1),(13,'2023-01-03 06:13:12.379127','1','Jobs object (1)',2,'[]',7,1),(14,'2023-01-03 06:16:49.418845','3','Jobs object (3)',1,'[{\"added\": {}}]',7,1),(15,'2023-01-03 06:17:15.239464','3','Jobs object (3)',2,'[]',7,1),(16,'2023-01-03 06:18:53.487445','4','Jobs object (4)',1,'[{\"added\": {}}]',7,1),(17,'2023-01-03 06:26:55.647870','5','Jobs object (5)',1,'[{\"added\": {}}]',7,1),(18,'2023-01-03 06:28:08.826375','6','Jobs object (6)',1,'[{\"added\": {}}]',7,1),(19,'2023-01-03 06:36:34.836182','7','Jobs object (7)',1,'[{\"added\": {}}]',7,1),(20,'2023-01-03 06:37:38.991451','8','Jobs object (8)',1,'[{\"added\": {}}]',7,1),(21,'2023-01-03 06:37:43.906774','1','Jobs object (1)',2,'[]',7,1),(22,'2023-01-03 06:40:15.950807','9','Jobs object (9)',1,'[{\"added\": {}}]',7,1),(23,'2023-01-03 06:41:13.607728','10','Jobs object (10)',1,'[{\"added\": {}}]',7,1),(24,'2023-01-03 06:42:30.069479','11','Jobs object (11)',1,'[{\"added\": {}}]',7,1),(25,'2023-01-05 11:31:07.315266','12','Jobs object (12)',1,'[{\"added\": {}}]',7,1),(26,'2023-01-05 11:58:34.175612','13','Jobs object (13)',1,'[{\"added\": {}}]',7,1),(27,'2023-01-05 12:00:08.604531','14','Jobs object (14)',1,'[{\"added\": {}}]',7,1),(28,'2023-01-05 12:03:27.496430','15','Jobs object (15)',1,'[{\"added\": {}}]',7,1),(29,'2023-01-05 12:05:20.917319','16','Jobs object (16)',1,'[{\"added\": {}}]',7,1),(30,'2023-01-05 12:06:59.753150','17','Jobs object (17)',1,'[{\"added\": {}}]',7,1),(31,'2023-01-05 12:09:27.942601','18','Jobs object (18)',1,'[{\"added\": {}}]',7,1),(32,'2023-01-05 12:10:55.676653','19','Jobs object (19)',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'cart','detailmodel'),(10,'cart','ordersmodel'),(5,'contenttypes','contenttype'),(7,'jobs','jobs'),(11,'login','member'),(12,'message','message'),(8,'product','product'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-01-03 05:37:19.705594'),(2,'auth','0001_initial','2023-01-03 05:37:20.133042'),(3,'admin','0001_initial','2023-01-03 05:37:20.245543'),(4,'admin','0002_logentry_remove_auto_add','2023-01-03 05:37:20.251609'),(5,'admin','0003_logentry_add_action_flag_choices','2023-01-03 05:37:20.257425'),(6,'contenttypes','0002_remove_content_type_name','2023-01-03 05:37:20.327165'),(7,'auth','0002_alter_permission_name_max_length','2023-01-03 05:37:20.369465'),(8,'auth','0003_alter_user_email_max_length','2023-01-03 05:37:20.385194'),(9,'auth','0004_alter_user_username_opts','2023-01-03 05:37:20.392177'),(10,'auth','0005_alter_user_last_login_null','2023-01-03 05:37:20.432285'),(11,'auth','0006_require_contenttypes_0002','2023-01-03 05:37:20.434286'),(12,'auth','0007_alter_validators_add_error_messages','2023-01-03 05:37:20.441376'),(13,'auth','0008_alter_user_username_max_length','2023-01-03 05:37:20.480108'),(14,'auth','0009_alter_user_last_name_max_length','2023-01-03 05:37:20.521733'),(15,'auth','0010_alter_group_name_max_length','2023-01-03 05:37:20.534468'),(16,'auth','0011_update_proxy_permissions','2023-01-03 05:37:20.541561'),(17,'auth','0012_alter_user_first_name_max_length','2023-01-03 05:37:20.613510'),(18,'sessions','0001_initial','2023-01-03 05:37:20.675944'),(19,'jobs','0001_initial','2023-01-03 05:42:40.668365'),(20,'jobs','0002_jobs_classifi','2023-01-03 06:11:50.536038'),(21,'product','0001_initial','2023-01-05 14:24:53.428893'),(22,'cart','0001_initial','2023-01-05 16:55:18.179836'),(23,'login','0001_initial','2023-01-05 16:55:18.223303'),(24,'message','0001_initial','2023-01-06 04:57:21.835562');
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
INSERT INTO `django_session` VALUES ('ddswgzok3ao22n4rsg2hh8d2riaf9n62','.eJxVjMEOgjAQRP-lZ9NYtqWUo3e_wBiy7W4tSiCh5WT8d8Fgosc3b2aeosOlpG7JPHc9iVYocfjNPIYHj5ugO463SYZpLHPv5VaRu83yPBEPp737d5Awp3UdwOlaGecN68Ywgq9sBcS2RojKHmvvgnZsHRmlSVUaIpDXjIZtbBDW04BzGfpcRHu5fugLrzcplkDN:1pDdy0:eavdj53d7SUVendf5DGTpRVuu_er6hNGr4YVkZ5Zjf0','2023-01-20 04:04:28.667534'),('jk064tyx8ga69d44q1myabgh8z41jwft','.eJxVjMsOwiAQRf-FtSHC8Cgu3fcbyMAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJE4mLUOL0uyXMD247oDu22yzz3NZlSnJX5EG7HGfi5_Vw_w4q9vqtMwTjlA3JshksIyTtNRB7h1CUP7sUsgnsA1llSGkDBSgZRsu-DAji_QHPFzex:1pCa7p:xGdUWFYzLP_0qjpcEAwWLCVfLQ8tNqfrdvtToh3zGU4','2023-01-17 05:46:13.161791');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(50) NOT NULL,
  `link` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `Classifi` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (1,'黒魔道士','https://jp.finalfantasyxiv.com/jobguide/blackmage/','https://cdn.fanbyte.com/wp-content/uploads/2022/02/ffxiv-endwalker-black-mage-guide-opener-rotation.jpg?x48911','https://i0.wp.com/gamerescape.com/wp-content/uploads/2019/05/Black_Mage_Icon_3.png?resize=192%2C192&ssl=1','はるか昔、あるひとりの偉大な女魔道士が編み出したとされる破壊の力「黒魔法」。人々は強大な「黒魔法」の使い手を、「黒魔道士」と呼び、畏れ敬ったという。だが、大きすぎる力は、やがて人々を滅びの道に誘うことに……。  今や失われたこの魔法を会得できたとしたら、眼前に立ちはだかる敵たちを、灼熱の業火で焼き尽くすことも容易い。','遠隔魔法DPS'),(2,'白魔道士','https://jp.finalfantasyxiv.com/jobguide/whitemage/','https://cdn.fanbyte.com/wp-content/uploads/2021/11/white-mage-endwalker-job-guide.jpg?x48911','https://assets.rpglogs.com/img/ff/icons/secondary/WhiteMage.png?v=3','癒やしと浄化の力として編み出されながらも、人々の尽きぬ欲望のために乱用され、大災厄を引き起こした歴史を持つ「白魔法」。一度は、禁忌として封じられたが、後世、「グリダニア」の「角尊」たちの手で復元され、密かに継承されてきた。  その知識を正しく扱うことができたなら、どんな死地にあっても仲間を救うことができる、最後の希望となるはずだ。','ヒーラー'),(3,'召喚士','https://jp.finalfantasyxiv.com/jobguide/summoner/','https://www.akhmorning.com/assets/media/jobbackgrounds/6.0/smn.jpg','https://snazzyj.github.io/xivcharactertracker/images/job-icons/summoner.png','焔神「イフリート」、岩神「タイタン」、嵐神「ガルーダ」……これら蛮族勢力が呼び降ろした「蛮神」と呼ばれる存在は、エオルゼア諸都市にとって大いなる脅威となっている。  だが、太古の昔には、呼び降ろされた「蛮神」の力を奪い、性質を変容させることで、使い魔として使役する者たちがいた。人は彼らを「異形の獣を召喚する者」、「召喚士」と呼んだが、その存在は今や忘れ去られて久しい。','遠隔魔法DPS'),(4,'学者','https://jp.finalfantasyxiv.com/jobguide/scholar/','https://cdn.fanbyte.com/wp-content/uploads/2021/11/endwalker-scholar-job-guide-ffxiv.jpg?x48911','https://snazzyj.github.io/xivcharactertracker/images/job-icons/scholar.png','魔法文明が花開いた古の時代……バイルブランド島に「ニーム」という都市国家が存在した。 強力な魔法がもてはやされた戦乱の時代にあって、海兵を主力とする「ニーム」が独立を維持できたのは、軍学を修めた「学者」の指揮があればこそであった。使い魔「フェアリー」を操る学者は、傷ついた味方を癒やしつつ潜在能力を引き出し、小国の自由を守り抜いたと伝えられている。','ヒーラー'),(5,'吟遊詩人','https://jp.finalfantasyxiv.com/jobguide/bard/','https://i.ytimg.com/vi/y66RtFr26hs/maxresdefault.jpg','https://snazzyj.github.io/xivcharactertracker/images/job-icons/bard.png','「吟遊詩人」と言えば、旅に生き、各地の酒場や宴の席で歌う者を連想するだろう。しかし、かつては弓の使い手を指して、そう呼んでいた。  古の弓兵は、戦場で弓の弦をつまはじき、詩歌を吟じたと伝えられている。恐怖心を払うため、勝利を祝すため、そして、死した戦友を弔うため……。かくして命せめぎ合う戦場で吟じられる詩歌には、人の魂を震わせる力が宿るようになったという。','遠隔物理DPS'),(6,'機工士','https://jp.finalfantasyxiv.com/jobguide/machinist/','https://cdn.fanbyte.com/wp-content/uploads/2021/11/FFXIV-111621-Shot-01-Machinist-MCH.jpg?x48911','https://assets.rpglogs.com/img/ff/icons/secondary/Machinist.png?v=3','ドラゴン族との果てなき戦いを繰り広げる皇都「イシュガルド」。 剣と槍とを掲げる騎士の国として知られているが、強力なドラゴン族に対抗するため、近年では対竜バリスタやカノン砲の開発にも余念がない。 そんな中、帝国人機工師シド・ガーロンドが亡命したことで、エオルゼアに魔導技術が流入。 皇都の「スカイスチール機工房」では、魔導技術を独自に発展させた兵器が開発され、新たな機工猟兵「機工士」が産まれつつあった。','遠隔物理DPS'),(7,'ナイト','https://jp.finalfantasyxiv.com/jobguide/paladin/','https://cdn.fanbyte.com/wp-content/uploads/2021/11/FFXIV-111621-Shot-01-Paladin.jpg?x48911','https://xivapi.com/cj/companion/paladin.png','ウルダハの近衛兵団「銀冑団」の騎士たちは、 忠誠を誓う王家を守るため、長い歴史の中で技を磨き上げてきた。  白銀の甲冑で身を固め、大盾と騎士剣を手に戦いに身を投じる彼らは、剣術だけではなく護衛術にも長け、主君の命を断固として守り抜く。彼ら「ナイト」の戦技を学べば、鉄壁の守護者として戦場に君臨できることだろう。','タンク'),(8,'戦士','https://jp.finalfantasyxiv.com/jobguide/warrior/','https://cdn.fanbyte.com/wp-content/uploads/2021/11/Warrior-Endwalker-Job-Guide.jpg?x48911','https://preview.redd.it/sd89ul7qtm671.png?auto=webp&s=2ce0b8dab007e47766430598937af6dc6db9e3b6','北アバラシア山脈に棲まう山岳民族は、歴史的に多くの傭兵を輩出してきた。大ぶりの戦斧を手にした彼らは「戦士」と呼ばれ、各地の戦場で活躍。  人が生まれ持つ闘争本能を目覚めさせ、獣性むき出しで戦う彼らは、驚くべき強靱さで戦い続けるという。 だが、都市国家間の紛争が絶えなかった戦乱期の終焉と共に、徐々に姿を消し、今ではその技の継承者も僅かしか存在しない。','タンク'),(9,'モンク','https://jp.finalfantasyxiv.com/jobguide/monk/','https://www.theclick.gg/wp-content/uploads/2021/09/ffxiv-monk.jpg','https://snazzyj.github.io/xivcharactertracker/images/job-icons/monk.png','かつてエオルゼア随一の軍事力を誇った城塞都市「アラミゴ」。 その精強なる軍勢の中で、パイク兵と並び、 他都市に恐れられたのが「モンク」と呼ばれる僧兵であった。  「ラールガー星導教」の僧侶でもある彼らは、信奉する壊神「ラールガー」に一歩でも近づくため研鑽を積み、独自の格闘術を発展させてきた。  チャクラを操る彼らは、己の身体能力を最大限に高め、舞うように闘うという。','近接物理DPS'),(10,'竜騎士','https://jp.finalfantasyxiv.com/jobguide/dragoon/','https://i.ytimg.com/vi/wmWFZpX8C0Y/maxresdefault.jpg','https://snazzyj.github.io/xivcharactertracker/images/job-icons/dragoon.png','竜を屠る者……「竜騎士」。 建国以来、ドラゴン族との果て無き戦いを続ける宗教都市「イシュガルド」において、その言葉が持つ意味は限りなく重い。  ドラゴン族を倒す。その目的のためだけに発展した槍術は、硬き鱗に隠されたドラゴン族の急所を狙うため、独特の跳躍攻撃を生み出した。天高く跳び、槍と一体となって舞い降りる……その貫通力は攻撃の要となるだろう。','近接物理DPS'),(11,'忍者','https://jp.finalfantasyxiv.com/jobguide/ninja/','https://i.ytimg.com/vi/tr4WM76d_ww/maxresdefault.jpg','https://snazzyj.github.io/xivcharactertracker/images/job-icons/ninja.png','はるか昔、乱世に生きる東方の民が 己の身と財を守るために編み出したという 忍びの技……忍術。  天の中、地の底、人の内に流れる気を用い、印を結ぶことで神秘を成すと伝えられているこの秘術は、はるか辺境の地に散在する隠れ里で密かに継承されてきた。もし、その術を体得することができれば、戦の流れを変える力を得られるだろう。','近接物理DPS'),(12,'暗黒騎士','https://jp.finalfantasyxiv.com/jobguide/darkknight/','https://www.highgroundgaming.com/wp-content/uploads/2021/10/ffxiv-dark-knight-1080x662.webp','https://snazzyj.github.io/xivcharactertracker/images/job-icons/darkknight.png','聖職者たちが民を導き、騎士たちが民を護る宗教都市「イシュガルド」。 しかし、高潔であるべき者の中にも、悪は存在する。 見捨てられた者を護るため、果たされぬ正義を成すため、タブーである聖職者殺し、騎士殺しをも厭わぬ者たち。 信念のために業を背負い、己の内に闇を飼い慣らす者たち……人は彼らを「暗黒騎士」と呼ぶ。 彼らは決して盾を掲げない。 騎士の盾には、権力の象徴たる紋章が描かれるのだから。 ただ大剣を闇にかざし、磨くのみである。','タンク'),(13,'ガンブレイカー','https://jp.finalfantasyxiv.com/jobguide/gunbreaker/','https://cdn.fanbyte.com/wp-content/uploads/2021/11/FFXIV-111621-Shot-01-Gunbreaker-GBR.jpg?x48911','https://assets.rpglogs.com/img/ff/icons/secondary/Gunbreaker.png?v=3','北洲イルサバード大陸南部の外れに位置する辺境の地。 当地で暮らすロスガル族は、剣のような刀身に、銃のようなグリップを併せ持つ、奇妙な武器を継承してきた。 特殊なシリンダーに魔力を込め、引き金を引くことで一気に解放して、刀身より魔法的効果を発揮する。古の女王「グンヒルド」の親衛隊が用いたというその武器を、彼らは「グンヒルドの剣」――すなわち「ガンブレード」と呼ぶ。ガレマール帝国軍が用いる同名の武器とは、ルーツも構造も異なる存在なのだ。','タンク'),(14,'占星術師','https://jp.finalfantasyxiv.com/jobguide/astrologian/','https://cdn.fanbyte.com/wp-content/uploads/2021/11/astro-scaled.jpg?x48911','https://xivapi.com/cj/companion/astrologian.png','古の昔より、人は定かではない未来を知ろうと試みてきた。 大半が児戯にも等しい物であったが、やがて星々の動きから、季節の移ろいを知る術が編み出されてゆく。 それは後に天文学と呼ばれる分野の知識であったが、一方で北洋の学術都市「シャーレアン」では、天に座す「星座」と己のエーテルを結びつけ、奇跡を成す「占星魔法」が確立されていった。 「天球儀」を回し、星座を暗示する「アルカナ」により運命を切り開く者、それが「占星術師」である。','ヒーラー'),(15,'賢者','https://jp.finalfantasyxiv.com/jobguide/sage/','https://cdn.fanbyte.com/wp-content/uploads/2021/12/sage-ffxiv-endwalker-scaled.jpg?x48911','https://assets.rpglogs.com/img/ff/icons/secondary/Sage.png?v=3','シャーレアン魔法大学――それは、知の都を代表する最高学府である。 その最大の特徴は、膨大な蔵書数を誇る書院でも、数多の賢人たちでもない。複数の学問を横断的に学ぶことで、新たな学問を創出してきた歴史にあるのだ。中でも、エーテル学と魔法学に、医学を統合することで生み出された「賢学」は、ほかに類を見ない学問である。結節点となる賢具を配置して立体的な魔法陣を形成し、体内エーテルに作用して治癒や攻撃を為す。それが、「人の進歩」を目指す賢学の徒――すなわち賢者の術である。','ヒーラー'),(16,'侍','https://jp.finalfantasyxiv.com/jobguide/samurai/','https://cdn.fanbyte.com/wp-content/uploads/2021/11/FFXIV-111621-Shot-01-Samurai-SAM.jpg?x48911','https://assets.rpglogs.com/img/ff/icons/secondary/Samurai.png?v=3','はるかなる海を越えた東の果てに浮かぶは、「ひんがしの国」。  島内の限りある土地を巡り、豪族たちがしのぎを削る乱世が続いた結果、国主に従い戦に参じる「侍」たちの技もまた、独自の発展を遂げていった。その後、天下統一が成されると、「刀」を佩く彼らは、いつしか雪月花美しき故郷の平和を護る者へと変化していったという。  だが、研ぐことを怠れば、鋭き刃も鈍り、志もまた墜ちるもの。真の「侍」の数が減りゆくなかで、己の信念を込めて柄に手をかけ、「抜刀」の刻を待つ者たちがいた。','近接物理DPS'),(17,'リーパー','https://jp.finalfantasyxiv.com/jobguide/reaper/','https://www.siliconera.com/wp-content/uploads/2021/09/FFXIV-Endwalker-Reaper-Sage.jpg?fit=710%2C397','https://assets.rpglogs.com/img/ff/icons/secondary/Reaper.png?v=3','ガレアン族は、エーテル放射を不得手とする。 かつて彼らは温暖なイルサバード大陸南部で農耕民として暮らしていたが、魔法を得意とする異民族との戦いに敗れ、中央山脈以北の寒冷地に追いやられた経緯を持つ。その苦しみの歴史の中で、常に魔法に替わる力を求め続けた彼らは、やがてひとつの技にたどり着く。クリスタルを触媒に異界「ヴォイド」と交信し、自らの半身たり得る妖異「アヴァター」を探し出し、契約を交わしたのだ。彼らは、同胞の命を守るため、その出自を示す大鎌を手に戦う。 魂の収穫者、リーパーとして。','近接物理DPS'),(18,'踊り子','https://jp.finalfantasyxiv.com/jobguide/dancer/','https://cdn.fanbyte.com/wp-content/uploads/2021/11/Dancer-Endwalker-Job-Guide.jpg?x48911','https://assets.rpglogs.com/img/ff/icons/secondary/Dancer.png?v=3','近東の島国「サベネア」から、魅力的な旅芸人の一座がやってきた。 その踊り子が舞うのは、単純に美しいだけの舞踏ではない。彼らが舞うのは「クリークタンツ」と呼ばれる武の舞踏――。見る者の魂を震わせる鼓舞の力であり、その心に生まれた負の感情を鎮める神秘の技であるともいう。 また、厳しい旅路の中で護身術を磨いてきた踊り子たちは、投擲武器と幻扇を華麗に操り、立ちふさがる者を討ち倒す。','遠隔物理DPS'),(19,'赤魔道士','https://jp.finalfantasyxiv.com/jobguide/redmage/','https://venturebeat.com/wp-content/uploads/2021/10/ffxivendwalkerredmage.jpg?fit=2228%2C1250&strip=all','https://assets.rpglogs.com/img/ff/icons/secondary/RedMage.png?v=3','アバラシア山脈の東端、峨々たる山岳地帯「ギラバニア」。  第五星暦末期のこと、迫り来る水の災厄「第六霊災」から逃れるため、星の輝きに導かれた人々が、方々から山間を目指して集結したという。その中には、魔大戦で激しく戦い合った魔法都市「マハ」の黒魔道士と、古都「アムダプール」の白魔道士の姿もあった。  そして、滅びの定めに抗うため、かつての敵同志が手を結び、黒魔法でも白魔法でもない新たな魔法体系の確立に挑む。かくして、「細剣」を手に戦う「赤魔道士」が誕生したのである。','遠隔魔法DPS');
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `create_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'測試測試','Kats','這是資料庫的第一個測試留言','2023-01-06 05:32:33.843734'),(2,'測試測試','Kats','這是資料庫的第一個測試留言','2023-01-06 05:39:24.996331'),(3,'測試測試','Kats','這是資料庫的第一個測試留言','2023-01-06 05:40:27.862019'),(4,'第二次測試','Katskon','親愛的御主，您好：\r\n【「秋葉原‧爆裂！」舉辦紀念活動】即將展開！\r\n為了紀念限時活動「秋葉原‧爆裂！ ～祈願之街與銘刻了愛的雕像們～」的舉辦，我們準備了數個紀念活動，等待御主們來參加喔！\r\n【「秋葉原‧爆裂！」舉辦紀念活動】期間：1月12日(四) 維護後 至 1月29日(日) 12:59','2023-01-06 05:50:41.246128'),(5,'第三次測試','菜菜子','除了柴魚片，還會有罐罐噢！而且是開好的～\r\n對了，今天會有「賣場有個烘焙部」，是因為昨天工作忙到半夜，想說要大家半夜爬起來看也很辛苦，所以就延到今天白天，下午就放上來，請稍等一下，不會缺席的噢～','2023-01-06 05:51:08.508882');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `create_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Eorzean Symphony: FINAL FANTASY XIV Orchestral Album Vol. 3【映像付サントラ／Blu-ray Disc Music】',6600,'オーケストラ','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_20090/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_20090.html','0000-00-00'),(2,'ファイナルファンタジーXIV　ファットキャットパーカー',10000,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140587_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140587_1.html','0000-00-00'),(3,'ファイナルファンタジーXIV　私立エオルゼア学園',730,'コミック','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757583801/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757583801.html','0000-00-00'),(4,'ファイナルファンタジーXIV　らくがきミニオンズ　アクリルマグネット',440,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140588_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140588_1.html','0000-00-00'),(5,'ファイナルファンタジーXIV　でぶチョコボパーカー',6050,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/V_MWFF140308_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/V_MWFF140308_2.html','0000-00-00'),(6,'ドルフィードリーム　ヤ・シュトラ',99880,'フィギュア・プラモデル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MFF140015/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MFF140015.html','0000-00-00'),(7,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜ナイト＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140549_4/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140549_4.html','0000-00-00'),(8,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜戦士＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140550_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140550_2.html','0000-00-00'),(9,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜暗黒騎士＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140551_4/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140551_4.html','0000-00-00'),(10,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜竜騎士＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140552_4/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140552_4.html','0000-00-00'),(11,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜モンク＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140553_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140553_2.html','0000-00-00'),(12,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜忍者＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140554_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140554_2.html','0000-00-00'),(13,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜吟遊詩人＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140555_4/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140555_4.html','0000-00-00'),(14,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜機工士＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140556_4/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140556_4.html','0000-00-00'),(15,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜黒魔道士＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140557_4/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140557_4.html','0000-00-00'),(16,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜召喚士＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140558_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140558_2.html','0000-00-00'),(17,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜学者＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140559_4/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140559_4.html','0000-00-00'),(18,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜白魔道士＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140560_4/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140560_4.html','0000-00-00'),(19,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜占星術師＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140561_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140561_2.html','0000-00-00'),(20,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜侍＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140562_3/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140562_3.html','0000-00-00'),(21,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜赤魔道士＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140563_5/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140563_5.html','0000-00-00'),(22,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜青魔道士＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140564_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140564_2.html','0000-00-00'),(23,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜ガンブレイカー＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140565_3/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140565_3.html','0000-00-00'),(24,'ファイナルファンタジーXIV　ジョブアクリルマグネット　＜踊り子＞',495,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140566_3/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140566_3.html','0000-00-00'),(25,'ファイナルファンタジーXIV 複製原画『Eorzean Symphony 2017』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502986/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502986.html','0000-00-00'),(26,'ファイナルファンタジーXIV 複製原画『Eorzean Symphony 2022』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502993/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502993.html','0000-00-00'),(27,'FINAL FANTASY XIV Orchestral Arrangement Album Vol. 3',2750,'オーケストラ','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10999/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10999.html','0000-00-00'),(28,'ファイナルファンタジーXIV　オフィシャルカレンダー2023',2750,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502924/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502924.html','0000-00-00'),(29,'FINAL FANTASY XIV ORCHESTRA CONCERT 2022 -Eorzean Symphony- オフィシャルパンフレット',2000,'ファンブック・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502931/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502931.html','0000-00-00'),(30,'ファイナルファンタジーXIV　フラワーライト　＜エルピスの花＞',4000,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140609/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140609.html','0000-00-00'),(31,'ファイナルファンタジーXIV　オルゴール　＜Flow＞',2200,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140610/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140610.html','0000-00-00'),(32,'ファイナルファンタジーXIV　オルゴール　＜死の刻 ～終末幻想 アーモロート～＞',2200,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140611/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140611.html','0000-00-00'),(33,'ファイナルファンタジーXIV Eorzean Symphony　スタンド付きメタルピンズ',1800,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140612/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140612.html','0000-00-00'),(34,'ファイナルファンタジーXIV Eorzean Symphony　ペットボトルバッグ',3300,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140613/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140613.html','0000-00-00'),(35,'ファイナルファンタジーXIV Eorzean Symphony　アートシートセット',1800,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140614/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140614.html','0000-00-00'),(36,'ファイナルファンタジーXIV　ORCHESTRA CONCERT 2022　ギフトバッグ',600,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140615/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140615.html','0000-00-00'),(37,'ファイナルファンタジーXIV　アクリルプレート　＜Flow＞',4400,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140616/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140616.html','0000-00-00'),(38,'ファイナルファンタジーXIV Eorzean Symphony　タオルハンカチ',1700,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140617/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140617.html','0000-00-00'),(39,'ファイナルファンタジーXIV　大判ストール　＜アーモロート＞',6600,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140618/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140618.html','0000-00-00'),(40,'【セット商品】FINAL FANTASY XIV Vinyl LP Box + ENDWALKER Vinyl LP',13200,'アナログレコード','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SE_E3182/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SE_E3182.html','0000-00-00'),(41,'ENDWALKER Vinyl LP',3300,'アナログレコード','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10930/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10930.html','0000-00-00'),(42,'ファイナルファンタジーXIV　クプル・コポ　ぬいぐるみ',2970,'ぬいぐるみ・マスコット','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MFF140010_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MFF140010_1.html','0000-00-00'),(43,'THE PRIMALS Live in Japan - Beyond the Shadow【Blu-ray】',6050,'コンサートDVD/Blu-ray','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_20089/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_20089.html','0000-00-00'),(44,'FINAL FANTASY XIV: ENDWALKER | The Art of Resurrection - Among the Stars -',3300,'ゲーム画集・コミック画集','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757579002/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757579002.html','0000-00-00'),(45,'ファイナルファンタジーXIV　ORCHESTRA CONCERT　オルゴール　＜天より降りし力＞',1650,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140214_3/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140214_3.html','0000-00-00'),(46,'ファイナルファンタジーXIV　ORCHESTRA CONCERT　オルゴール　＜雲霧街の夜霧＞',1650,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140215_3/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140215_3.html','0000-00-00'),(47,'ファイナルファンタジーXIV　アイストレー　＜ソウルクリスタル＞',1650,'キッチン雑貨','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140250_6/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140250_6.html','0000-00-00'),(48,'ファイナルファンタジーXIV×Kiwanda　アラガンショートソックス　メンズ　レッド',3080,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140603/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140603.html','0000-00-00'),(49,'ファイナルファンタジーXIV×Kiwanda　アラガンショートソックス　メンズ　バイオレット',3080,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140604/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140604.html','0000-00-00'),(50,'ファイナルファンタジーXIV×Kiwanda　アラガンショートソックス　メンズ　イエロー',3080,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140605/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140605.html','0000-00-00'),(51,'ファイナルファンタジーXIV×Kiwanda　アラガンショートソックス　レディース　レッド',2860,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140606/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140606.html','0000-00-00'),(52,'ファイナルファンタジーXIV×Kiwanda　アラガンショートソックス　レディース　バイオレット',2860,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140607/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140607.html','0000-00-00'),(53,'ファイナルファンタジーXIV×Kiwanda　アラガンショートソックス　レディース　イエロー',2860,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140608/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140608.html','0000-00-00'),(54,'ファイナルファンタジーXIV×Kiwanda　ローズ・ヴァレンティオンタイツ',6600,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF14073/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF14073.html','0000-00-00'),(55,'THE PRIMALS - Beyond the Shadow',2200,'アレンジ','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10939/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10939.html','0000-00-00'),(56,'ファイナルファンタジーXIV　THE PRIMALS Live in Japan - Beyond the Shadow　ミラー付メタルキーホルダー',1500,'キーホルダー・ストラップ','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140598/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140598.html','0000-00-00'),(57,'ファイナルファンタジーXIV　THE PRIMALS Live in Japan - Beyond the Shadow　サコッシュ',2000,'バッグ・ポーチ・財布','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140599/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140599.html','0000-00-00'),(58,'ファイナルファンタジーXIV　THE PRIMALS　カンバッジセット',1200,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140602/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140602.html','0000-00-00'),(59,'ファイナルファンタジーXIV　THE PRIMALS　ロゴジャケット',8030,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/V_MWFF140464_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/V_MWFF140464_1.html','0000-00-00'),(60,'ファイナルファンタジーXIV　THE PRIMALS Live in Japan - Beyond the Shadow　Tシャツ＜ブラック＞',3000,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/V_MWFF140590/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/V_MWFF140590.html','0000-00-00'),(61,'ファイナルファンタジーXIV　THE PRIMALS Live in Japan - Beyond the Shadow　Tシャツ＜ホワイト＞',3000,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/V_MWFF140594/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/V_MWFF140594.html','0000-00-00'),(62,'FINAL FANTASY XIV Vinyl LP Box',9900,'アナログレコード','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10842_5_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10842_5_1.html','0000-00-00'),(63,'ファイナルファンタジーXIV 複製原画『暁月の群像』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502733_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502733_1.html','0000-00-00'),(64,'ファイナルファンタジーXIV 複製原画『暁月のフィナーレ』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502740_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502740_1.html','0000-00-00'),(65,'ファイナルファンタジーXIV 複製原画『もうひとつの未来』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502757_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502757_1.html','0000-00-00'),(66,'ファイナルファンタジーXIV 複製原画『アンテンパード』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502764_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502764_1.html','0000-00-00'),(67,'ファイナルファンタジーXIV 複製原画『Eorzean Symphony 2019』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502771_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502771_1.html','0000-00-00'),(68,'ファイナルファンタジーXIV 複製原画『賢を極めし者』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502788_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502788_1.html','0000-00-00'),(69,'ファイナルファンタジーXIV 複製原画『兄妹』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502795_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502795_1.html','0000-00-00'),(70,'ファイナルファンタジー35周年 UT グラフィックTシャツ ファイナルファンタジーXIV',1500,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/V_SE_E2968/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/V_SE_E2968.html','0000-00-00'),(71,'The Prisoner for FINAL FANTASY XIV ＜SPECIAL BOX＞',12100,'お酒','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SE_E2796/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SE_E2796.html','0000-00-00'),(72,'ENDWALKER: FINAL FANTASY XIV Original Soundtrack【映像付サントラ/Blu-ray Disc Music】',5500,'映像付きサウンドトラック','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_20086/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_20086.html','0000-00-00'),(73,'シチズン×ファイナルファンタジーXIV コラボレーションウオッチ -LIGHT-',38500,'腕時計・アクセサリー','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/BM8181_60A/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/BM8181_60A.html','0000-00-00'),(74,'シチズン×ファイナルファンタジーXIV コラボレーションウオッチ -DARKNESS-',44000,'腕時計・アクセサリー','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/CA0596_86E/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/CA0596_86E.html','0000-00-00'),(75,'ファイナルファンタジーXIV　肩たたき棒　＜ファットキャット＞',2860,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140581/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140581.html','0000-00-00'),(76,'ファイナルファンタジーXIV　肩たたき棒　＜ロンカの水蛇？＞',2860,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140582/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140582.html','0000-00-00'),(77,'ファイナルファンタジーXIV　ジョブピンバッチ　＜賢者＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140583/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140583.html','0000-00-00'),(78,'ファイナルファンタジーXIV　ジョブピンバッチ　＜リーパー＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140584/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140584.html','0000-00-00'),(79,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜賢者＞',1760,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140585/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140585.html','0000-00-00'),(80,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜リーパー＞',1760,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140586/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140586.html','0000-00-00'),(81,'ファイナルファンタジーXIV　ジョブピンバッチ　＜ナイト＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140140_6/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140140_6.html','0000-00-00'),(82,'ファイナルファンタジーXIV　ジョブピンバッチ　＜暗黒騎士＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140142_6/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140142_6.html','0000-00-00'),(83,'ファイナルファンタジーXIV　ジョブピンバッチ　＜白魔道士＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140151_6/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140151_6.html','0000-00-00'),(84,'ファイナルファンタジーXIV　ジョブピンバッチ　＜赤魔道士＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140208_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140208_2.html','0000-00-00'),(85,'ファイナルファンタジーXIV　ジョブピンバッチ　＜ガンブレイカー＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140435_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140435_2.html','0000-00-00'),(86,'『暁月のフィナーレ』特別装丁コレクターズBOX【数量限定】　(※ゲームソフトは付属しません)',15180,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140568/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140568.html','0000-00-00'),(87,'(Windows ダウンロード版)ファイナルファンタジーXIV: 暁月のフィナーレ',4620,'MMORPG','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SEDL_1103/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SEDL_1103.html','0000-00-00'),(88,'(Mac ダウンロード版)ファイナルファンタジーXIV: 暁月のフィナーレ',4620,'MMORPG','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SEDL_1104/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SEDL_1104.html','0000-00-00'),(89,'(Windows ダウンロード版)ファイナルファンタジーXIV: 暁月のフィナーレ コレクターズエディション',6600,'MMORPG','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SEDL_1105/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SEDL_1105.html','0000-00-00'),(90,'(Mac ダウンロード版)ファイナルファンタジーXIV: 暁月のフィナーレ コレクターズエディション',6600,'MMORPG','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SEDL_1106/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SEDL_1106.html','0000-00-00'),(91,'(Windows ダウンロード版)ファイナルファンタジーXIV コンプリートパック[新生エオルゼア～暁月のフィナーレ]',3190,'MMORPG','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SEDL_1141/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SEDL_1141.html','0000-00-00'),(92,'(Windows ダウンロード版)ファイナルファンタジーXIV コンプリートパック コレクターズエディション[新生エオルゼア～暁月のフィナーレ]',7480,'MMORPG','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SEDL_1142/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SEDL_1142.html','0000-00-00'),(93,'(Mac ダウンロード版)ファイナルファンタジーXIV コンプリートパック[新生エオルゼア～暁月のフィナーレ]',3190,'MMORPG','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SEDL_1143/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SEDL_1143.html','0000-00-00'),(94,'(Mac ダウンロード版)ファイナルファンタジーXIV コンプリートパック コレクターズエディション[新生エオルゼア～暁月のフィナーレ]',7480,'MMORPG','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SEDL_1144/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SEDL_1144.html','0000-00-00'),(95,'(Windows ダウンロード版)ファイナルファンタジーXIV: 暁月のフィナーレ コレクターズエディション【数量限定 特別装丁版】',21780,'MMORPG','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SE_E2691/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SE_E2691.html','0000-00-00'),(96,'(Mac ダウンロード版)ファイナルファンタジーXIV: 暁月のフィナーレ コレクターズエディション【数量限定 特別装丁版】',21780,'MMORPG','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SE_E2692/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SE_E2692.html','0000-00-00'),(97,'咲とファイナルファンタジーXIV（1）',660,'コミック','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757575448/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757575448.html','0000-00-00'),(98,'ENDWALKER 7-inch Vinyl Single',2420,'アナログレコード','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10899/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10899.html','0000-00-00'),(99,'ファイナルファンタジーXIV　ファットキャット　ビッグクッション',23100,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140497_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140497_1.html','0000-00-00'),(100,'【オフィシャルショップ限定】Time and Again2: FINAL FANTASY XIV Raid Dungeon Themes',3630,'サウンドトラック','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10891_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10891_2.html','0000-00-00'),(101,'Death Unto Dawn: FINAL FANTASY XIV Original Soundtrack【映像付サントラ/Blu-ray Disc Music】',5500,'映像付きサウンドトラック','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_20081/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_20081.html','0000-00-00'),(102,'FINAL FANTASY XIV: SHADOWBRINGERS | The Art of Reflection - Histories Unwritten -',3300,'ゲーム画集・コミック画集','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757571792/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757571792.html','0000-00-00'),(103,'ファイナルファンタジーXIV　ブックストレージボックス　＜ワールドマップ＞',3850,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140546/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140546.html','0000-00-00'),(104,'ファイナルファンタジーXIV　ワイングラスセット　＜アシエン＞　（3個入り）',11000,'キッチン雑貨','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140547/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140547.html','0000-00-00'),(105,'A REALM REBORN Vinyl LP',2750,'アナログレコード','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10846/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10846.html','0000-00-00'),(106,'HEAVENSWARD Vinyl LP',2750,'アナログレコード','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10847/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10847.html','0000-00-00'),(107,'STORMBLOOD Vinyl LP',2750,'アナログレコード','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10848/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10848.html','0000-00-00'),(108,'SHADOWBRINGERS Vinyl LP',2750,'アナログレコード','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10849/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10849.html','0000-00-00'),(109,'ファイナルファンタジーXIV　ファッションマスク　＜メテオ＞',1100,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140517_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140517_2.html','0000-00-00'),(110,'ファイナルファンタジーXIV: 漆黒のヴィランズ エオルゼアコレクション2021',2200,'公式ガイドブック・設定資料集','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757573994/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757573994.html','0000-00-00'),(111,'ファイナルファンタジーXIV　ストール　＜ジョブアイコン＞',4180,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140539/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140539.html','0000-00-00'),(112,'ファイナルファンタジーXIV　システム手帳　＜ジョブアイコン＞',5280,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140540/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140540.html','0000-00-00'),(113,'ファイナルファンタジーXIV　ボディバッグ　＜ジョブアイコン＞',8800,'バッグ・ポーチ・財布','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140544/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140544.html','0000-00-00'),(114,'ファイナルファンタジーXIV　ミニマムウォレット　＜ジョブアイコン＞',5280,'バッグ・ポーチ・財布','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140545/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140545.html','0000-00-00'),(115,'ファイナルファンタジーXIV　ぬいぐるみ　＜ホパルの水蛇？＞',3520,'ぬいぐるみ・マスコット','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140536/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140536.html','0000-00-00'),(116,'ファイナルファンタジーXIV　ミニオンフィギュア　＜リーン＞',6380,'フィギュア・プラモデル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140524/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140524.html','0000-00-00'),(117,'ファイナルファンタジーXIV　ミニオンフィギュア　＜ヤ・シュトラ＞',6380,'フィギュア・プラモデル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140525/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140525.html','0000-00-00'),(118,'ファイナルファンタジーXIV　ミニオンフィギュア　＜エスティニアン＞',6380,'フィギュア・プラモデル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140526/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140526.html','0000-00-00'),(119,'ファイナルファンタジーXIV シナリオブック 愛用の紀行録 Vol.1（新生編／蒼天編／紅蓮編）',5500,'ファンブック・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502528/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502528.html','0000-00-00'),(120,'ファイナルファンタジー14の絵本 ナマズオとだれもみたことのないもの',1300,'学習参考書・えほん','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757571204/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757571204.html','0000-00-00'),(121,'FINAL FANTASY XIV ポストカードブック',1500,'ポストカードブック','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757571785/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757571785.html','0000-00-00'),(122,'ファイナルファンタジーXIV　ラウンドクッション　＜モグモグ★コレクション＞',3300,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140515/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140515.html','0000-00-00'),(123,'ファイナルファンタジーXIV　ピロークッション　＜ジョブアイコン＞',3300,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140516/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140516.html','0000-00-00'),(124,'ファイナルファンタジーXIV　ファッションマスク　＜ジョブアイコン＞',1100,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140518/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140518.html','0000-00-00'),(125,'ファイナルファンタジーXIV　マスクケース　＜ジョブアイコン＞',2750,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140519/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140519.html','0000-00-00'),(126,'ファイナルファンタジーXIV　コットンバッグ　＜罪喰い＞',4400,'バッグ・ポーチ・財布','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140532/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140532.html','0000-00-00'),(127,'ファイナルファンタジーXIV　パーカー　＜ハーデス＞',6160,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/V_MWFF140527/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/V_MWFF140527.html','0000-00-00'),(128,'Untempered2: FINAL FANTASY XIV Primal Battle Themes',3630,'サウンドトラック','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10833_4/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10833_4.html','0000-00-00'),(129,'Scions & Sinners: FINAL FANTASY XIV ～ Arrangement Album ～',4400,'アレンジ','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_20079/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_20079.html','0000-00-00'),(130,'FINAL FANTASY　TRADING CARD GAME　対戦デッキ スターターセット　FINAL FANTASY XIV　SHADOWBRINGERS　英語版',2548,'カード／ボードゲーム','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MFFTCG99166/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MFFTCG99166.html','0000-00-00'),(131,'ファイナルファンタジーXIV　ぬいぐるみペンケース＆ボールペンセット　＜ロンカの水蛇？＞',3080,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140499/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140499.html','0000-00-00'),(132,'ファイナルファンタジーXIV　タオル　＜パイッサ：ブラウン＞',1100,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140502/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140502.html','0000-00-00'),(133,'ファイナルファンタジーXIV　タオル　＜パイッサ：ピンク＞',1100,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140503/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140503.html','0000-00-00'),(134,'ファイナルファンタジーXIV　ミニオンスクイーズコレクション',748,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140505/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140505.html','0000-00-00'),(135,'ファイナルファンタジーXIV　ミニオンスクイーズコレクション　8個入りBOX',5984,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140505_A/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140505_A.html','0000-00-00'),(136,'ファイナルファンタジーXIV　ポーチ付きエコバッグ　＜ファットキャット＞',1650,'バッグ・ポーチ・財布','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140506/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140506.html','0000-00-00'),(137,'ファイナルファンタジーXIV　ミニオンマスコットコレクション　Vol.2　12個入りBOX',6600,'ぬいぐるみ・マスコット','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140507_A/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140507_A.html','0000-00-00'),(138,'【オフィシャルショップ限定】 Encyclopaedia Eorzea ～The World of FINAL FANTASY XIV～ 英語版',5602,'公式ガイドブック・設定資料集','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601501255_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601501255_1.html','0000-00-00'),(139,'ファイナルファンタジーXIV　ボトルオープナー　キーホルダー　＜サボテンダー＞',1078,'キッチン雑貨','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140284_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140284_2.html','0000-00-00'),(140,'ファイナルファンタジーXIV 複製原画『暁光の刻』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502320_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502320_2.html','0000-00-00'),(141,'ファイナルファンタジーXIV 複製原画『ヴィエラ』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502337_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502337_2.html','0000-00-00'),(142,'ファイナルファンタジーXIV 複製原画『蒼の竜騎士』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502344_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502344_2.html','0000-00-00'),(143,'ファイナルファンタジーXIV 複製原画『魂を継ぐ者』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502351_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502351_2.html','0000-00-00'),(144,'ファイナルファンタジーXIV 複製原画『屠龍のエスティニアン』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502368_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502368_2.html','0000-00-00'),(145,'ファイナルファンタジーXIV 複製原画『クリスタルの残光』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502375_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502375_2.html','0000-00-00'),(146,'ファイナルファンタジーXIV 複製原画『月下の舞い』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502382_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502382_2.html','0000-00-00'),(147,'ファイナルファンタジーXIV 複製原画『妖精王ティターニア』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601502399_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601502399_2.html','0000-00-00'),(148,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜ナイト＞',1760,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140477/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140477.html','0000-00-00'),(149,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜戦士＞',1650,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140478/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140478.html','0000-00-00'),(150,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜暗黒騎士＞',1650,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140479/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140479.html','0000-00-00'),(151,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜竜騎士＞',1760,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140480/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140480.html','0000-00-00'),(152,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜モンク＞',1650,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140481/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140481.html','0000-00-00'),(153,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜忍者＞',1650,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140482/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140482.html','0000-00-00'),(154,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜吟遊詩人＞',1650,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140483/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140483.html','0000-00-00'),(155,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜機工士＞',1650,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140484/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140484.html','0000-00-00'),(156,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜黒魔道士＞',1650,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140485/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140485.html','0000-00-00'),(157,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜召喚士＞',1760,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140486/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140486.html','0000-00-00'),(158,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜学者＞',1650,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140487/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140487.html','0000-00-00'),(159,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜白魔道士＞',990,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140488/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140488.html','0000-00-00'),(160,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜占星術師＞',1650,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140489/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140489.html','0000-00-00'),(161,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜侍＞',1650,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140490/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140490.html','0000-00-00'),(162,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜赤魔道士＞',1650,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140491/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140491.html','0000-00-00'),(163,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜青魔道士＞',1760,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140492/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140492.html','0000-00-00'),(164,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜ガンブレイカー＞',1760,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140493/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140493.html','0000-00-00'),(165,'ファイナルファンタジーXIV　ジョブアクリルスタンド　＜踊り子＞',1760,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140494/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140494.html','0000-00-00'),(166,'ファイナルファンタジーXIV　ぬいぐるみ　＜パイッサ・クリナリアン＞',3520,'ぬいぐるみ・マスコット','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140498/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140498.html','0000-00-00'),(167,'Pulse: FINAL FANTASY XIV Remix Album',3300,'アレンジ','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10807/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10807.html','0000-00-00'),(168,'ファイナルファンタジーXIV ドマ式麻雀　手打ち用麻雀マット　(※麻雀牌は別売りです)',7480,'カード／ボードゲーム','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140463/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140463.html','0000-00-00'),(169,'ファイナルファンタジーXIV　THE PRIMALS　キーホルダー',1000,'キーホルダー・ストラップ','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140244_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140244_2.html','0000-00-00'),(170,'ファイナルファンタジーXIV　THE PRIMALS Live in Tokyo Bringers of Shadow　ステッカー',880,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140470/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140470.html','0000-00-00'),(171,'THE PRIMALS - Out of the Shadows',2200,'アレンジ','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10790/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10790.html','0000-00-00'),(172,'ファイナルファンタジーXIV ギャザラーピンバッチ　＜採掘師＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140440_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140440_1.html','0000-00-00'),(173,'ファイナルファンタジーXIV ジョブピンバッチ　＜踊り子＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140436_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140436_1.html','0000-00-00'),(174,'ファイナルファンタジーXIV 複製原画『暁の血盟』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601501767_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601501767_1.html','0000-00-00'),(175,'ファイナルファンタジーXIV 複製原画『竜詩の群像』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601501774_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601501774_1.html','0000-00-00'),(176,'ファイナルファンタジーXIV 複製原画『紅蓮の群像』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601501781_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601501781_1.html','0000-00-00'),(177,'ファイナルファンタジーXIV 複製原画『漆黒の群像』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601501798_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601501798_1.html','0000-00-00'),(178,'ファイナルファンタジーXIV 複製原画『最期の咆哮』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601501804_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601501804_1.html','0000-00-00'),(179,'ファイナルファンタジーXIV 複製原画『乱れ雪月花』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601501811_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601501811_1.html','0000-00-00'),(180,'ファイナルファンタジーXIV 複製原画『闇の戦士たち』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601501828_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601501828_1.html','0000-00-00'),(181,'ファイナルファンタジーXIV 複製原画『ゼノス・イェー・ガルヴァス』',33000,'複製原画・アート','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601501835_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601501835_1.html','0000-00-00'),(182,'Eorzean Symphony: FINAL FANTASY XIV Orchestral Album Vol. 2【映像付サントラ／Blu-ray Disc Music】',6600,'オーケストラ','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_20072/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_20072.html','0000-00-00'),(183,'ファイナルファンタジーXIV ギャザラーピンバッチ　＜園芸師＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140441/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140441.html','0000-00-00'),(184,'ファイナルファンタジーXIV クラフターピンバッチ　＜木工師＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140443/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140443.html','0000-00-00'),(185,'ファイナルファンタジーXIV クラフターピンバッチ　＜鍛冶師＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140444/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140444.html','0000-00-00'),(186,'ファイナルファンタジーXIV クラフターピンバッチ　＜甲冑師＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140445/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140445.html','0000-00-00'),(187,'ファイナルファンタジーXIV クラフターピンバッチ　＜彫金師＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140446/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140446.html','0000-00-00'),(188,'ファイナルファンタジーXIV クラフターピンバッチ　＜革細工師＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140447/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140447.html','0000-00-00'),(189,'ファイナルファンタジーXIV クラフターピンバッチ　＜裁縫師＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140448/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140448.html','0000-00-00'),(190,'ファイナルファンタジーXIV クラフターピンバッチ　＜錬金術師＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140449/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140449.html','0000-00-00'),(191,'ファイナルファンタジーXIV クラフターピンバッチ　＜調理師＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140450/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140450.html','0000-00-00'),(192,'ファイナルファンタジーXIV: 漆黒のヴィランズ　アクリルスタンド　＜ウリエンジェ＞',2200,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140456/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140456.html','0000-00-00'),(193,'ファイナルファンタジーXIV: 漆黒のヴィランズ　アクリルスタンド　＜サンクレッド＆リーン＞',2530,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140457/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140457.html','0000-00-00'),(194,'ファイナルファンタジーXIV: 漆黒のヴィランズ　アクリルスタンド　＜ヤ・シュトラ＞',1980,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140459/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140459.html','0000-00-00'),(195,'ファイナルファンタジーXIV: 漆黒のヴィランズ　アクリルスタンド　＜アルバート＞',1980,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140460/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140460.html','0000-00-00'),(196,'FINAL FANTASY XIV Eorzean Symphony　フロストグラス',1650,'キッチン雑貨','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140426_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140426_1.html','0000-00-00'),(197,'ファイナルファンタジーXIV ジョブピンバッチ　＜青魔道士＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140434/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140434.html','0000-00-00'),(198,'『FINAL FANTASY XIV ORCHESTRA CONCERT 2019』オフィシャルパンフレット',2037,'ファンブック・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601501743/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601501743.html','0000-00-00'),(199,'FINAL FANTASY XIV Orchestral Arrangement Album Vol. 2',2750,'オーケストラ','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10726/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10726.html','0000-00-00'),(200,'SHADOWBRINGERS: FINAL FANTASY XIV Original Soundtrack【映像付Blu-ray Discサウンドトラック】',5500,'映像付きサウンドトラック','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_20069/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_20069.html','0000-00-00'),(201,'ファイナルファンタジーXIV　ミニオンメタルチャーム　Vol.2',440,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140287_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140287_1.html','0000-00-00'),(202,'ファイナルファンタジーXIV　ソックスセット　＜ドットキャラクターズ＞　レディース　3足組',1980,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140294_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140294_1.html','0000-00-00'),(203,'ファイナルファンタジーXIV　ソックスセット　＜ドットキャラクターズ＞　メンズ　3足組',1980,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140295_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140295_1.html','0000-00-00'),(204,'ファイナルファンタジーXIV　箸置きセット',2200,'キッチン雑貨','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140298_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140298_1.html','0000-00-00'),(205,'ファイナルファンタジーXIV　ロゴキャップ',3300,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140311_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140311_1.html','0000-00-00'),(206,'ファイナルファンタジーXIV　ラバーキーチェーン　＜ドットキャラクターズ＞　18個入BOX',9504,'キーホルダー・ストラップ','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140323_A/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140323_A.html','0000-00-00'),(207,'FINAL FANTASY XIV Silver Ring ＜Meteor Survivor＞（メテオサバイバー）',29700,'腕時計・アクセサリー','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/V_MWFF140296_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/V_MWFF140296_1.html','0000-00-00'),(208,'Journeys: FINAL FANTASY XIV ～ Arrangement Album ～',4400,'アレンジ','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_20064/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_20064.html','0000-00-00'),(209,'ファイナルファンタジーXIV　ぬいぐるみ　＜THE PRIMALS モーグリ＞',1650,'ぬいぐるみ・マスコット','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140247_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140247_1.html','0000-00-00'),(210,'ファイナルファンタジーXIV　カラビナ　＜忍者＞',935,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140254_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140254_1.html','0000-00-00'),(211,'ファイナルファンタジーXIV　モーグリカチューシャ',1650,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140255_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140255_1.html','0000-00-00'),(212,'ファイナルファンタジーXIV　モグモグキャップ',2750,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140256_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140256_1.html','0000-00-00'),(213,'ファイナルファンタジーXIV　キーカバー　＜でぶチョコボ＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140283_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140283_1.html','0000-00-00'),(214,'ファイナルファンタジーXIV　カーバンクル・コスチュームセット　＜エメラルド＞',4950,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140285_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140285_1.html','0000-00-00'),(215,'ファイナルファンタジーXIV　カーバンクル・コスチュームセット　＜トパーズ＞',4950,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140286_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140286_1.html','0000-00-00'),(216,'ファイナルファンタジーXIV　ゴールドソーサー　くじテンダーパーティー',3565,'カード／ボードゲーム','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MFF140013_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MFF140013_1.html','0000-00-00'),(217,'ファイナルファンタジーXIV　ナノブロック　サボテンダー',1430,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140280_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140280_1.html','0000-00-00'),(218,'ファイナルファンタジーXIV　ナノブロック　スプリガン',1430,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140281_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140281_1.html','0000-00-00'),(219,'【オフィシャルショップ限定】ファイナルファンタジーXIV ファンフェスティバル2019 in 東京 オフィシャルパンフレット',2037,'ファンブック・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601501620/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601501620.html','0000-00-00'),(220,'THE PRIMALS Zepp Tour 2018 - Trial By Shadow　【映像付サントラ／Blu-ray Disc Music】',6050,'コンサートDVD／Blu-ray','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_20058/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_20058.html','0000-00-00'),(221,'ファイナルファンタジーXIV 蛮神Tシャツ＜ホワイト＞',2750,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/V_MWFF140268_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/V_MWFF140268_1.html','0000-00-00'),(222,'ファイナルファンタジーXIV スマートフォンケース PLUS　＜アラガントームストーン:詩学＞',2970,'スマホ関連','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140273/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140273.html','0000-00-00'),(223,'ファイナルファンタジーXIV　BLM　ブラック　Tシャツ',2750,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/V_MWFF140260/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/V_MWFF140260.html','0000-00-00'),(224,'ファイナルファンタジーXIV 蛮神Tシャツ＜ネイビー＞',2750,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/V_MWFF140264/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/V_MWFF140264.html','0000-00-00'),(225,'STORMBLOOD: FINAL FANTASY XIV Original Soundtrack【映像付サントラ／Blu-ray Disc Music】',5500,'映像付きサウンドトラック','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_20053/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_20053.html','0000-00-00'),(226,'Time and Again FINAL FANTASY XIV Raid Dungeon Themes',3630,'サウンドトラック','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10662_3/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10662_3.html','0000-00-00'),(227,'FINAL FANTASY　TRADING CARD GAME　スターターセット2018　FINAL FANTASY XIV　英語版',1528,'カード／ボードゲーム','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MFFTCG99028/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MFFTCG99028.html','0000-00-00'),(228,'FINAL FANTASY　TRADING CARD GAME　スターターセット2018　FINAL FANTASY XIV　日本語版',1100,'カード／ボードゲーム','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MFFTCG99043/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MFFTCG99043.html','0000-00-00'),(229,'FINAL FANTASY XIV: STORMBLOOD | Art of the Revolution - Western Memories -',3300,'ゲーム画集・コミック画集','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757556140/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757556140.html','0000-00-00'),(230,'ファイナルファンタジーXIV ジョブピンバッチ　＜侍＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140207_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140207_1.html','0000-00-00'),(231,'ファイナルファンタジーXIV フード付マフラー＜カーバンクルエメラルド＞',2750,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140229/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140229.html','0000-00-00'),(232,'ファイナルファンタジーXIV フード付マフラー＜カーバンクルトパーズ＞',2750,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140230/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140230.html','0000-00-00'),(233,'ファイナルファンタジーXIV　Tシャツ＜竜騎士＞ Designed by Keita Amemiya',3300,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/V_MWFF140196_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/V_MWFF140196_2.html','0000-00-00'),(234,'ファイナルファンタジーXIV ジョブピンバッチ　＜戦士＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140141_5/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140141_5.html','0000-00-00'),(235,'ファイナルファンタジーXIV ジョブピンバッチ　＜吟遊詩人＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140146_5/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140146_5.html','0000-00-00'),(236,'ファイナルファンタジーXIV ジョブピンバッチ　＜召喚士＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140149_5/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140149_5.html','0000-00-00'),(237,'ファイナルファンタジーXIV ジョブピンバッチ　＜学者＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140150_5/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140150_5.html','0000-00-00'),(238,'ファイナルファンタジーXIV ジョブピンバッチ　＜竜騎士＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140143_4/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140143_4.html','0000-00-00'),(239,'ファイナルファンタジーXIV ジョブピンバッチ　＜忍者＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140145_4/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140145_4.html','0000-00-00'),(240,'ファイナルファンタジーXIV ジョブピンバッチ　＜黒魔道士＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140148_4/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140148_4.html','0000-00-00'),(241,'ファイナルファンタジーXIV ジョブピンバッチ　＜占星術師＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140152_4/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140152_4.html','0000-00-00'),(242,'『FINAL FANTASY XIV ORCHESTRA CONCERT 2017 -交響組曲エオルゼア-』オフィシャルパンフレット',2037,'ファンブック・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601501323/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601501323.html','0000-00-00'),(243,'Untempered: FINAL FANTASY XIV Primal Battle Themes',3630,'サウンドトラック','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_10622_3/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_10622_3.html','0000-00-00'),(244,'ファイナルファンタジーXIV ジョブピンバッチ　＜モンク＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140144_3/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140144_3.html','0000-00-00'),(245,'ファイナルファンタジーXIV ジョブピンバッチ　＜機工士＞',660,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140147_2/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140147_2.html','0000-00-00'),(246,'(Windows ダウンロード版)ファイナルファンタジーXIV スターターパック',2420,'MMORPG','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SEDL_1045/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SEDL_1045.html','0000-00-00'),(247,'(Mac ダウンロード版)ファイナルファンタジーXIV スターターパック',2420,'MMORPG','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SEDL_1046/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SEDL_1046.html','0000-00-00'),(248,'ファイナルファンタジーXIVマガジン 2017年夏 紅蓮のリベレーター直前スペシャル号',1579,'ファンブック・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757553996/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757553996.html','0000-00-00'),(249,'ファイナルファンタジーXIV: 蒼天のイシュガルド オフィシャルコンプリートガイド',2424,'公式ガイドブック・設定資料集','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757553385/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757553385.html','0000-00-00'),(250,'FINAL FANTASY XIV: HEAVENSWARD | The Art of Ishgard　- The Scars of War -',3300,'ゲーム画集・コミック画集','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757553118/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757553118.html','0000-00-00'),(251,'ファイナルファンタジーXIV カラビナ　＜グゥーブー＞',935,'雑貨・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140170/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140170.html','0000-00-00'),(252,'ファイナルファンタジーXIV ファンフェスティバル2016 マフラータオル',1430,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/V_MWFF140179/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/V_MWFF140179.html','0000-00-00'),(253,'【オフィシャルショップ限定】 ファイナルファンタジーXIV ファンフェスティバル2016 in TOKYO オフィシャルパンフレット',2037,'ファンブック・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601501224/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601501224.html','0000-00-00'),(254,'ファイナルファンタジーXIVマガジン 2016年夏号',1540,'ファンブック・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757550322/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757550322.html','0000-00-00'),(255,'ファイナルファンタジーXIV: 蒼天のイシュガルド　ぬいぐるみポーチ　モーグリ',1078,'バッグ・ポーチ・財布','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140087/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140087.html','0000-00-00'),(256,'ファイナルファンタジーXIV: 蒼天のイシュガルド　ぬいぐるみポーチ　でぶチョコボ',1078,'バッグ・ポーチ・財布','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140088/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140088.html','0000-00-00'),(257,'ファイナルファンタジーXIV: 蒼天のイシュガルド　ぬいぐるみポーチ　ボム',1078,'バッグ・ポーチ・財布','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140090/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140090.html','0000-00-00'),(258,'ファイナルファンタジーXIV: 蒼天のイシュガルド　ぬいぐるみポーチ　サボテンダー',1078,'バッグ・ポーチ・財布','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140091/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140091.html','0000-00-00'),(259,'Heavensward：FINAL FANTASY XIV Original Soundtrack【映像付サントラ／Blu-ray Disc Music】',5500,'映像付きサウンドトラック','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_20025/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_20025.html','0000-00-00'),(260,'ファイナルファンタジーXIV　フードブランケット　でぶチョコボ',5060,'アパレル','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/MWFF140081_1/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/MWFF140081_1.html','0000-00-00'),(261,'FINAL FANTASY XIV: HEAVENSWARD | The Art of Ishgard　- Stone and Steel -',3300,'ゲーム画集・コミック画集','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757548558/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757548558.html','0000-00-00'),(262,'BEFORE THE FALL: FINAL FANTASY XIV Original Soundtrack 【映像付サントラ／Blu-ray Disc Music】',5500,'映像付きサウンドトラック','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/SQEX_20022/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/SQEX_20022.html','0000-00-00'),(263,'ファイナルファンタジーXIV: 蒼天のイシュガルド 公式スターティングガイド',1760,'公式ガイドブック・設定資料集','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757546875/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757546875.html','0000-00-00'),(264,'FINAL FANTASY XIV FAN FESTIVAL 2014 TOKYO Official Pamphlet',2037,'ファンブック・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/4988601500982/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/4988601500982.html','0000-00-00'),(265,'えんじょい！ファイナルファンタジーXIV ＃2014-2015 WINTER',1528,'ファンブック・その他','https://store.jp.square-enix.com/client_info/SQEX_ESTORE/itemimage/9784757545472/ITEM_IMAGE1.jpg','https://store.jp.square-enix.com/item/9784757545472.html','0000-00-00');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermember`
--

DROP TABLE IF EXISTS `usermember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usermember` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `create_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermember`
--

LOCK TABLES `usermember` WRITE;
/*!40000 ALTER TABLE `usermember` DISABLE KEYS */;
INSERT INTO `usermember` VALUES (1,'katskon','F','1997-03-04','a0975396306@gmail.com','丹鳳里天祥街92巷35號五樓','4ec9d8359c1ac54e121cdb8740dd7c007c4e0b17adff4f652da36777f8a3d6ef','2023-01-06');
/*!40000 ALTER TABLE `usermember` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-06 14:01:06
