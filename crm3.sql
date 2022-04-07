-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: repocrm3.c9kwg0fbps6f.eu-west-3.rds.amazonaws.com    Database: repocrm3
-- ------------------------------------------------------
-- Server version	8.0.23

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Категория',7,'add_category'),(26,'Can change Категория',7,'change_category'),(27,'Can delete Категория',7,'delete_category'),(28,'Can view Категория',7,'view_category'),(29,'Can add Плагин',8,'add_plugins'),(30,'Can change Плагин',8,'change_plugins'),(31,'Can delete Плагин',8,'delete_plugins'),(32,'Can view Плагин',8,'view_plugins');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$e1isyWj2gyrI$keu2rIYYL7P9RH6i1GzKzLu2z2kI8aD1DfEWgWfQvvA=','2021-09-07 22:37:44.100614',1,'admin','','','',1,1,'2021-02-05 20:46:41.568017');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-02-05 21:02:46.523209','1','Ремонт',1,'[{\"added\": {}}]',7,1),(2,'2021-02-09 10:25:58.767040','12','Заказы',2,'[{\"changed\": {\"fields\": [\"\\u041d\\u0430\\u0437\\u0432\\u0430\\u043d\\u0438\\u0435\", \"\\u0418\\u043c\\u044f \\u043c\\u043e\\u0434\\u0443\\u043b\\u044f\", \"\\u0418\\u043c\\u044f APP INSTALL\", \"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\"]}}]',8,1),(3,'2021-02-09 19:30:11.848689','13','Tests',1,'[{\"added\": {}}]',8,1),(4,'2021-02-10 00:06:27.499762','13','Tests',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(5,'2021-02-10 00:12:35.968837','12','Заказы',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(6,'2021-02-10 00:29:54.301227','12','Заказы',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(7,'2021-02-10 00:46:02.147584','12','Заказы',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(8,'2021-02-10 00:56:38.299970','12','Заказы',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(9,'2021-02-10 01:03:11.896483','12','Заказы',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(10,'2021-02-10 01:11:21.974513','12','Заказы',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(11,'2021-02-10 01:13:39.081356','12','Заказы',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(12,'2021-02-10 22:10:18.597961','12','Заказы',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(13,'2021-02-10 22:54:47.040587','12','Заказы',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(14,'2021-02-10 23:29:17.657020','12','Заказы',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(15,'2021-02-25 21:33:41.967378','12','Заказы',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(16,'2021-02-26 16:18:03.651850','2','Клиенты',1,'[{\"added\": {}}]',7,1),(17,'2021-02-26 16:18:55.570820','2','Данные',2,'[{\"changed\": {\"fields\": [\"\\u041d\\u0430\\u0438\\u043c\\u0435\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u0438\"]}}]',7,1),(18,'2021-02-26 16:19:16.622024','13','Tests',3,'',8,1),(19,'2021-02-26 16:19:27.841666','14','Клиенты',2,'[{\"changed\": {\"fields\": [\"\\u041a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f\"]}}]',8,1),(20,'2021-02-27 18:20:54.467221','14','Клиенты',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(21,'2021-02-27 19:12:29.897270','14','Клиенты',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(22,'2021-02-27 19:14:46.221067','14','Клиенты',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(23,'2021-02-27 19:16:02.124408','14','Клиенты',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(24,'2021-02-27 19:17:47.827454','14','Клиенты',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(25,'2021-02-27 19:33:59.899054','14','Клиенты',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(26,'2021-07-16 20:48:42.600838','16','Печать',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(27,'2021-07-16 20:50:45.313857','16','Печать',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(28,'2021-08-26 22:01:27.148399','3','Склады',1,'[{\"added\": {}}]',7,1),(29,'2021-08-27 00:12:37.520559','17','Отделения',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(30,'2021-09-07 22:15:31.796411','17','Отделения',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(31,'2021-09-07 22:36:21.745904','17','Отделения',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(32,'2021-09-07 22:36:33.341567','17','Отделения',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1),(33,'2021-09-07 22:37:56.311312','17','Отделения',2,'[{\"changed\": {\"fields\": [\"\\u0424\\u0430\\u0439\\u043b\"]}}]',8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'plugins','category'),(8,'plugins','plugins'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-02-05 20:41:37.695636'),(2,'auth','0001_initial','2021-02-05 20:41:39.865760'),(3,'admin','0001_initial','2021-02-05 20:41:41.628861'),(4,'admin','0002_logentry_remove_auto_add','2021-02-05 20:41:41.987882'),(5,'admin','0003_logentry_add_action_flag_choices','2021-02-05 20:41:42.162892'),(6,'contenttypes','0002_remove_content_type_name','2021-02-05 20:41:42.680921'),(7,'auth','0002_alter_permission_name_max_length','2021-02-05 20:41:42.923935'),(8,'auth','0003_alter_user_email_max_length','2021-02-05 20:41:43.132947'),(9,'auth','0004_alter_user_username_opts','2021-02-05 20:41:43.270955'),(10,'auth','0005_alter_user_last_login_null','2021-02-05 20:41:43.503969'),(11,'auth','0006_require_contenttypes_0002','2021-02-05 20:41:43.624975'),(12,'auth','0007_alter_validators_add_error_messages','2021-02-05 20:41:43.767984'),(13,'auth','0008_alter_user_username_max_length','2021-02-05 20:41:44.015998'),(14,'auth','0009_alter_user_last_name_max_length','2021-02-05 20:41:44.274013'),(15,'auth','0010_alter_group_name_max_length','2021-02-05 20:41:44.510026'),(16,'auth','0011_update_proxy_permissions','2021-02-05 20:41:44.818044'),(17,'auth','0012_alter_user_first_name_max_length','2021-02-05 20:41:45.067058'),(18,'plugins','0001_initial','2021-02-05 20:41:45.943108'),(19,'sessions','0001_initial','2021-02-05 20:41:46.504140'),(20,'plugins','0002_auto_20210206_0013','2021-02-05 21:14:04.703999'),(21,'plugins','0003_plugins_module_name','2021-02-05 21:16:50.985510'),(22,'plugins','0004_auto_20210207_0032','2021-02-06 21:33:05.604052'),(23,'plugins','0005_plugins_apps_install_name','2021-02-09 10:23:25.592279'),(24,'plugins','0006_remove_plugins_apps_install_name','2021-02-12 12:55:06.665222'),(25,'plugins','0007_plugins_version','2021-02-13 12:45:46.856000'),(26,'plugins','0008_plugins_related_class_name','2021-07-16 19:41:43.440955');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2ybeidp5dpswq4q378fzv7oed7zt6id4','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1lAvfN:rdnAawW__YNrPtrf_8cdnJtYjlmP9mXtQM3V2g_ISyQ','2021-02-27 14:12:57.887198'),('3dxt23dhjs1j7qm0of29qbok0l894h8x','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1m4Tf9:-KSbyjdsWF3lytR0Y-pDKEVeQ9_zTW_PwdesLg_KJGs','2021-07-30 19:38:19.652299'),('5b8gxaw2q50wvcgzaxkj9lkmuugvndds','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1mNjiq:WklB8y5Kkmvzt6aFevk5nDyCRjSgfmRrlWskRtVj7To','2021-09-21 22:37:44.144617'),('7fajnizfy51l2rag1cjh64gdh66rkdak','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l9e4P:miXUJ6Stu4pWJI83RjvbKkh0Ml_6RKnsLZBPg2z0s6g','2021-02-24 01:13:29.816826'),('amv2ubynvxt0rerk776yw5fa9azkb3kn','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l9d0l:2ZWmQXouTgzU2Wlj1OR3mGZG8Xt2pgBYVP-H4R_LNaU','2021-02-24 00:05:39.581021'),('cbde9va87tzjktpnk54n8cy16g4sd94w','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l880b:hqxZ498itSNF5Sp2exMJpinu6CUJkkFwmpaaEXWDJ5w','2021-02-19 20:47:17.309061'),('d4yj79cagf01tyrla2ni8emh7iwww6ts','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1lG5Ko:60dOKsH_f8f4cBDDQWdE8XNo-FS4CGd8ikN7OicPBpA','2021-03-13 19:33:02.328761'),('d8xvjb62oks3zgboohz2kpnp7vdqqv2n','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l8VG2:VfuDJ6T_x0x6KAB6VTl9jjjTNsbwrYzcrTkWOEWWzdQ','2021-02-20 21:36:46.448684'),('e57zfz1vj9s5fe1kd8csidlt48auedip','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1m4Un5:FtclsnhRg_6CBluRyHamTUN6hsO9xGW8Nx1jdNNAVE4','2021-07-30 20:50:35.603301'),('etlzhgtiy9azmhk5j7fdl09psl59oyfa','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l9yNV:8NxLzQqimlLRhmRmHAkG6vQpP1R1u6DeOFWKF6zBH5o','2021-02-24 22:54:33.588818'),('evgylgphd1nx1dxi62rjznvmfcg5jxcz','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l9dO1:TLcCHnW2g26QwUcfGLbdA7_76DyHROhi32ZJKJAvKbI','2021-02-24 00:29:41.104472'),('g3pmdnqxa2gef409uz61jnh9znut7yi6','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1lG52w:ou_hBDbRdJc6HuRw2_lucyGnCaI1ruVGfrIhXaVSVis','2021-03-13 19:14:34.826415'),('h0ljz5sqh5pa953la8gzsxqv2sjmwikr','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1lFOE3:J1NyF7xxJbKbcJhQHRO0ToRZAhkfKWcl8h5_Ve-GJxQ','2021-03-11 21:31:11.547775'),('hrvyol2z2hwfrg66g9gy7s3rmr9cgi8r','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1lG50h:BMai_ZPo2KS9jAihsdU3H2pBQRFx9qL8sA5v4llUReo','2021-03-13 19:12:15.460444'),('j86bnvcpvpsd6o7cndblifljly63hvrc','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1mNjhQ:XLwM2ajIsuxt_FCtqzCMez24tB4OZxGh5LefkTt4YGA','2021-09-21 22:36:16.487603'),('jck4nuxdnt2sdytvxs9lzf6fs64r7swo','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1mNjN4:JyQRI3RDQsASX0Xc8zGHepaIz0cSa01rZGcLtB0qrWk','2021-09-21 22:15:14.805439'),('ma37gxbqdr0p4b2slxsuw2um1tfeg6zh','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l9xgT:vApXnfSmYosKmmykwDL-s15YYWnp0vNaxgW8W729MiQ','2021-02-24 22:10:05.298201'),('n2wglqcgwzijp1763zjn2mwhp2241722','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1lG4rR:2KDJ4awC4iBymmElVhMaFwrGcw3nlSmYvIzarB4lI8I','2021-03-13 19:02:41.749630'),('nx12emb20r3ac1jucy2r75dtzllgvr32','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1lG54A:oZIHIIPci-7JZEnVWwQZ6UzLrDVOPdcdrgl3lGWokmA','2021-03-13 19:15:50.534745'),('nydz53ahrvpq6f3627nch1cmuq2cw3kd','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l9e2D:JOGfE-PreCLpM1aOGdi1Vk8-CYERQahKXih1fFvCMGI','2021-02-24 01:11:13.655038'),('ph1kq7cct203rsz37e1oxatan93vluym','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l9com:Q8FDT73mEr_EMp81UhVUIIxKSh5r7MM5YHXk_DreeSQ','2021-02-23 23:53:16.676530'),('pssn2yaaiom7us763s4ymqf6102n6601','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l9dnx:sS7nw_sU258fpNp3U6Y5YnS2gG_eTMgnRyfzQ6fvA68','2021-02-24 00:56:29.783483'),('q3i1oeu8uuve22ppawmu4jmmm45hhief','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l9yuz:F1EL_9LLbp9KmFuko84kz01TNVEIQHeAJRutTIDKKNw','2021-02-24 23:29:09.422549'),('qoo111wu6e9s10ado0hy8h1w2csau5kj','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l9Ygs:sEd_75R-AlVjIJ4mtkmoYovCvdATqkP_-PjMFhvhHAU','2021-02-23 19:28:50.806054'),('qufzm0cgu9wly1qp3d4wgiese19gedmg','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1mJNNX:g2qRfJeNYj9Y2lfLoUXnvXpGBZgiNv9-GL2eEtHTWfM','2021-09-09 21:57:43.438604'),('sl1oml173r92p6k246olrhec5boeundb','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1mJPTD:5EEwki7ZXkVZ_6k7hgdhHMMCgvNeEtIZVkNJYSt5skU','2021-09-10 00:11:43.853489'),('sz77ps3zud1g4krlt553lhcihxsro60y','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1lG55m:gmwjzzEmqxyVHcPjCNWQh4qROHAYr8-aO5oo0GuBXZI','2021-03-13 19:17:30.114441'),('t0dwdo210kxswwhk397h3jtlgr9rtk44','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1lFfoH:85Pj52VZGzGy1WywioWS_ltvsswTFiCEKsIdS3dSdsY','2021-03-12 16:17:45.217796'),('u6dicdn5l1gu6ud60qgielshwnj8ij8e','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l9duC:ksbeMYqWQnfmbqwUbFa57O5axO2KPGbJaE5vS2hsrTY','2021-02-24 01:02:56.029575'),('ujn55q18026x7z5e5n1miuggcqwknyst','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l9QC9:H7LzNOrpo_M03n4-jxq79yf34v1zClCqiOg3BddL-cU','2021-02-23 10:24:33.135142'),('upedwo9q4kx0eh5u95yzi2hyi8zlb80k','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1m4UcN:Sjz7jgA5vhfE7GTKqWkTAxUcz8fukMrfKWBrKypH1lI','2021-07-30 20:39:31.576321'),('vkp8fm6q6nl0e0baspjtq4bk7b2s9fnp','.eJxVjEsOwiAUAO_C2hCg_J5L956BwHsgVUOT0q6Md1eSLnQ7M5kXC3Hfath7XsNM7MwkO_2yFPGR2xB0j-22cFzats6Jj4QftvPrQvl5Odq_QY29jq0QaB2JrCcofgJjo1dgEIREo1wBo2QpCd1XQEHtPGpwulC2gnwC9v4AwEM3ag:1l9d78:vremb4C92zYJmJifKHmrRS36fhCjbBeyhGHK8xwR_Qk','2021-02-24 00:12:14.859630');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins_category`
--

DROP TABLE IF EXISTS `plugins_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plugins_category_title_251e06a5` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins_category`
--

LOCK TABLES `plugins_category` WRITE;
/*!40000 ALTER TABLE `plugins_category` DISABLE KEYS */;
INSERT INTO `plugins_category` VALUES (2,'Данные'),(1,'Ремонт'),(3,'Склады');
/*!40000 ALTER TABLE `plugins_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins_plugins`
--

DROP TABLE IF EXISTS `plugins_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins_plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `loads` int NOT NULL,
  `category_id` int NOT NULL,
  `photo` varchar(100) NOT NULL,
  `zipfile` varchar(100) NOT NULL,
  `module_name` varchar(150) NOT NULL,
  `version` int NOT NULL,
  `related_class_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plugins_plugins_category_id_b93592ae_fk_plugins_category_id` (`category_id`),
  CONSTRAINT `plugins_plugins_category_id_b93592ae_fk_plugins_category_id` FOREIGN KEY (`category_id`) REFERENCES `plugins_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins_plugins`
--

LOCK TABLES `plugins_plugins` WRITE;
/*!40000 ALTER TABLE `plugins_plugins` DISABLE KEYS */;
INSERT INTO `plugins_plugins` VALUES (12,'Заказы','Плагин работы с заказами клиентов','2021-02-05 23:40:00.213785','2021-02-25 21:33:41.907375',1,0,1,'photos/2021/02/06/zSn2zPflRBw_qLb3uNP.jpg','file/orders/orders.zip','orders',1,''),(14,'Клиенты','Плагин для работы с базой клиентов','2021-02-26 16:17:26.759740','2021-02-27 19:33:59.668040',1,0,2,'photos/2021/02/26/1413.png','file/clients/clients_SEVLm57.zip','clients',1,''),(15,'Бухгалтерия','Деньги','2021-03-25 22:26:07.158306','2021-03-25 22:26:07.158306',1,0,2,'photos/2021/03/26/photo_1529595_56544df57b2f0.jpg','file/money/money.zip','money',1,''),(16,'Печать','Печатные данные для заказов итд','2021-07-16 19:44:53.384819','2021-07-16 20:50:45.268854',1,0,2,'photos/2021/07/16/5k8Iv1U43TRemZvdP.jpg','file/prints/prints_0jJ2hsQ.zip','prints',1,''),(17,'Отделения','Отделения','2021-08-26 22:02:09.232806','2021-09-07 22:37:56.269310',1,0,3,'photos/2021/08/27/metmebel.jpg','file/storehouse/storehouse_jkJMISJ.zip','storehouse',1,'');
/*!40000 ALTER TABLE `plugins_plugins` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-03  1:30:53
