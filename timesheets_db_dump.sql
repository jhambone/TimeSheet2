-- MySQL dump 10.13  Distrib 5.6.26, for Linux (x86_64)
--
-- Host: localhost    Database: LSC_db
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `TimeSheetApp_department`
--

DROP TABLE IF EXISTS `TimeSheetApp_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeSheetApp_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` varchar(15) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeSheetApp_department`
--

LOCK TABLES `TimeSheetApp_department` WRITE;
/*!40000 ALTER TABLE `TimeSheetApp_department` DISABLE KEYS */;
INSERT INTO `TimeSheetApp_department` VALUES (1,'0001','Operations'),(2,'0002','Finance');
/*!40000 ALTER TABLE `TimeSheetApp_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeSheetApp_employee`
--

DROP TABLE IF EXISTS `TimeSheetApp_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeSheetApp_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `employeeID` varchar(100) NOT NULL,
  `laborType_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `TimeSheetApp_employee_69d14838` (`department_id`),
  KEY `TimeSheetApp_employee_9446c989` (`laborType_id`),
  CONSTRAINT `department_id_refs_id_9818240a` FOREIGN KEY (`department_id`) REFERENCES `TimeSheetApp_department` (`id`),
  CONSTRAINT `laborType_id_refs_id_d6e080a5` FOREIGN KEY (`laborType_id`) REFERENCES `TimeSheetApp_labortype` (`id`),
  CONSTRAINT `user_id_refs_id_ab1e79f3` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeSheetApp_employee`
--

LOCK TABLES `TimeSheetApp_employee` WRITE;
/*!40000 ALTER TABLE `TimeSheetApp_employee` DISABLE KEYS */;
INSERT INTO `TimeSheetApp_employee` VALUES (1,1,1,'000001',1);
/*!40000 ALTER TABLE `TimeSheetApp_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeSheetApp_labortype`
--

DROP TABLE IF EXISTS `TimeSheetApp_labortype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeSheetApp_labortype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `labortype_id` varchar(15) NOT NULL,
  `labortype_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `labortype_id` (`labortype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeSheetApp_labortype`
--

LOCK TABLES `TimeSheetApp_labortype` WRITE;
/*!40000 ALTER TABLE `TimeSheetApp_labortype` DISABLE KEYS */;
INSERT INTO `TimeSheetApp_labortype` VALUES (1,'0258','Regular');
/*!40000 ALTER TABLE `TimeSheetApp_labortype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeSheetApp_timesheetline`
--

DROP TABLE IF EXISTS `TimeSheetApp_timesheetline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeSheetApp_timesheetline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeSheet_line_code` varchar(20) NOT NULL,
  `timeSheet_code_id` int(11) NOT NULL,
  `taskOrder_number` varchar(20) NOT NULL,
  `unit` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TimeSheetApp_timesheetline_692820f4` (`timeSheet_code_id`),
  CONSTRAINT `timeSheet_code_id_refs_id_9c1792de` FOREIGN KEY (`timeSheet_code_id`) REFERENCES `TimeSheetApp_timesheetmain` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeSheetApp_timesheetline`
--

LOCK TABLES `TimeSheetApp_timesheetline` WRITE;
/*!40000 ALTER TABLE `TimeSheetApp_timesheetline` DISABLE KEYS */;
INSERT INTO `TimeSheetApp_timesheetline` VALUES (1,'1',1,'1.1','1.2'),(2,'2',1,'2.1','2.2'),(3,'3',1,'3.1','3.2');
/*!40000 ALTER TABLE `TimeSheetApp_timesheetline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeSheetApp_timesheetlinecell`
--

DROP TABLE IF EXISTS `TimeSheetApp_timesheetlinecell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeSheetApp_timesheetlinecell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeSheet_line_cell_ID` int(11) NOT NULL,
  `timeSheet_line_code_id` int(11) NOT NULL,
  `payType` varchar(20) NOT NULL,
  `workComp_cd` decimal(3,2) NOT NULL,
  `hours` decimal(3,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `TimeSheetApp_timesheetlinecell_8dbbd892` (`timeSheet_line_code_id`),
  CONSTRAINT `timeSheet_line_code_id_refs_id_f6cb5370` FOREIGN KEY (`timeSheet_line_code_id`) REFERENCES `TimeSheetApp_timesheetline` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeSheetApp_timesheetlinecell`
--

LOCK TABLES `TimeSheetApp_timesheetlinecell` WRITE;
/*!40000 ALTER TABLE `TimeSheetApp_timesheetlinecell` DISABLE KEYS */;
INSERT INTO `TimeSheetApp_timesheetlinecell` VALUES (1,101,1,'R',8.10,6.00,'2015-08-01'),(2,102,1,'R',8.10,6.00,'2015-08-02'),(3,103,1,'R',8.10,6.00,'2015-08-03'),(4,104,1,'R',8.10,6.00,'2015-08-04'),(5,105,1,'R',8.10,6.00,'2015-08-05'),(6,106,1,'R',8.10,6.00,'2015-08-06'),(7,107,1,'R',8.10,6.00,'2015-08-07'),(8,108,1,'R',8.10,6.00,'2015-08-08'),(9,109,1,'R',8.10,6.00,'2015-08-09'),(10,110,1,'R',8.10,6.00,'2015-08-10'),(11,111,1,'R',8.10,6.00,'2015-08-11'),(12,112,1,'R',8.10,6.00,'2015-08-12'),(13,113,1,'R',8.10,6.00,'2015-08-13'),(14,114,2,'R',8.10,6.00,'2015-08-14'),(15,101,2,'R',8.10,9.00,'2015-08-01'),(16,102,2,'R',8.10,6.00,'2015-08-02'),(17,103,2,'R',8.10,8.00,'2015-08-03'),(18,104,2,'R',8.10,6.00,'2015-08-04'),(19,105,2,'R',8.10,6.00,'2015-08-05'),(20,106,2,'R',8.10,6.00,'2015-08-06'),(21,107,2,'R',8.10,7.00,'2015-08-07'),(22,108,2,'R',8.10,6.00,'2015-08-08'),(23,109,2,'R',8.10,6.00,'2015-08-09'),(24,110,2,'R',8.10,6.00,'2015-08-10'),(25,111,2,'R',8.10,7.00,'2015-08-11'),(26,112,2,'R',8.10,6.00,'2015-08-12'),(27,113,2,'R',8.10,6.00,'2015-08-13'),(28,114,2,'R',8.10,6.00,'2015-08-14'),(29,101,3,'R',8.10,6.00,'2015-08-01'),(30,102,3,'R',8.10,6.00,'2015-08-02'),(31,103,3,'R',8.10,6.00,'2015-08-03'),(32,104,3,'R',8.10,6.00,'2015-08-04'),(33,105,3,'R',8.10,7.00,'2015-08-05'),(34,106,3,'R',8.10,6.00,'2015-08-06'),(35,107,3,'R',8.10,6.00,'2015-08-07'),(36,108,3,'R',8.10,6.00,'2015-08-08'),(37,109,3,'R',8.10,6.00,'2015-08-09'),(38,110,3,'R',8.10,6.00,'2015-08-10'),(39,111,3,'R',8.10,6.00,'2015-08-11'),(40,112,3,'R',8.10,6.00,'2015-08-12'),(41,113,3,'R',8.10,7.00,'2015-08-13'),(42,114,3,'R',8.10,6.00,'2015-08-14');
/*!40000 ALTER TABLE `TimeSheetApp_timesheetlinecell` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TimeSheetApp_timesheetmain`
--

DROP TABLE IF EXISTS `TimeSheetApp_timesheetmain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TimeSheetApp_timesheetmain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timeSheet_code` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_id` varchar(20) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `signedBy` varchar(20) NOT NULL,
  `approvedBy` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `timeSheet_code` (`timeSheet_code`),
  KEY `TimeSheetApp_timesheetmain_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_61e7bdba` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TimeSheetApp_timesheetmain`
--

LOCK TABLES `TimeSheetApp_timesheetmain` WRITE;
/*!40000 ALTER TABLE `TimeSheetApp_timesheetmain` DISABLE KEYS */;
INSERT INTO `TimeSheetApp_timesheetmain` VALUES (1,'997892be-6d5d-4df4-85da-84527abc6ce9',1,'01','2015-08-01','2015-08-14','?','?','?');
/*!40000 ALTER TABLE `TimeSheetApp_timesheetmain` ENABLE KEYS */;
UNLOCK TABLES;

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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add log entry',6,'add_logentry'),(17,'Can change log entry',6,'change_logentry'),(18,'Can delete log entry',6,'delete_logentry'),(19,'Can add department',7,'add_department'),(20,'Can change department',7,'change_department'),(21,'Can delete department',7,'delete_department'),(22,'Can add labor type',8,'add_labortype'),(23,'Can change labor type',8,'change_labortype'),(24,'Can delete labor type',8,'delete_labortype'),(25,'Can add employee',9,'add_employee'),(26,'Can change employee',9,'change_employee'),(27,'Can delete employee',9,'delete_employee'),(28,'Can add time sheet main',10,'add_timesheetmain'),(29,'Can change time sheet main',10,'change_timesheetmain'),(30,'Can delete time sheet main',10,'delete_timesheetmain'),(31,'Can add time sheet line',11,'add_timesheetline'),(32,'Can change time sheet line',11,'change_timesheetline'),(33,'Can delete time sheet line',11,'delete_timesheetline'),(34,'Can add time sheet line cell',12,'add_timesheetlinecell'),(35,'Can change time sheet line cell',12,'change_timesheetlinecell'),(36,'Can delete time sheet line cell',12,'delete_timesheetlinecell');
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
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$h3pqA7pNRo9W$L8uk0WdKtBhwE1SZUZ1ZuV0PAYnziGfsCvmXqGXsPsw=','2015-09-06 16:45:40',1,'wova','','','asdf@asdf.com',1,1,'2015-09-05 16:46:48'),(2,'pbkdf2_sha256$12000$PLeAIbngs5Gg$/WJFdPYv/Xneyy9nxNFcdeUt1bmFmAFVTJScqgorV3U=','2015-09-05 19:16:56',0,'James','','','',0,1,'2015-09-05 16:58:04');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-09-05 16:47:21',1,7,'1','Department: 0001',1,''),(2,'2015-09-05 16:47:33',1,8,'1','Labor Type: 0258',1,''),(3,'2015-09-05 16:49:02',1,9,'1','User: wova',1,''),(4,'2015-09-05 16:49:55',1,7,'2','Department: 0002',1,''),(5,'2015-09-05 16:58:04',1,3,'2','James',1,''),(6,'2015-09-05 16:58:07',1,3,'2','James',2,'No fields changed.'),(7,'2015-09-05 18:55:56',1,10,'1','User: James, Date: 2015-08-01-2015-08-14, Status: ?',1,''),(8,'2015-09-05 18:56:51',1,11,'1','1, 1, 1.1',1,''),(9,'2015-09-05 18:57:01',1,11,'2','2, 2, 2.1',1,''),(10,'2015-09-05 18:57:13',1,11,'3','3, 3, 3.1',1,''),(11,'2015-09-05 18:58:46',1,12,'1','1, timeSheet_line_code_ID: 100, timeSheet_line_code: 1, 1, 1.1',1,''),(12,'2015-09-05 19:16:16',1,9,'2','User: James',1,''),(13,'2015-09-05 19:17:45',1,9,'2','User: James',3,''),(14,'2015-09-05 19:18:57',1,10,'1','User: wova, Date: 2015-08-01-2015-08-14, Status: ?',2,'Changed user.');
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'log entry','admin','logentry'),(7,'department','TimeSheetApp','department'),(8,'labor type','TimeSheetApp','labortype'),(9,'employee','TimeSheetApp','employee'),(10,'time sheet main','TimeSheetApp','timesheetmain'),(11,'time sheet line','TimeSheetApp','timesheetline'),(12,'time sheet line cell','TimeSheetApp','timesheetlinecell');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('tgtq72c96um0hlcgsim28r4hi3x1v0f5','ZDZiZjM4MDgxNjM1MWI2MjFhZjZhYWMyODYzNmRmMDBjNDUyNDZkNDp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX21lc3NhZ2VzIjoiW1tcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlN1Y2Nlc3NmdWxseSBkZWxldGVkIDEgZW1wbG95ZWUuXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlRoZSB0aW1lIHNoZWV0IG1haW4gXFxcIlVzZXI6IHdvdmEsIERhdGU6IDIwMTUtMDgtMDEtMjAxNS0wOC0xNCwgU3RhdHVzOiA/XFxcIiB3YXMgY2hhbmdlZCBzdWNjZXNzZnVsbHkuXCJdXSJ9','2015-09-20 16:45:40');
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

-- Dump completed on 2015-09-06 11:50:26
