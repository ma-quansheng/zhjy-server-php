-- MySQL dump 10.16  Distrib 10.2.13-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: zhjy
-- ------------------------------------------------------
-- Server version	10.2.13-MariaDB

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
-- Current Database: `zhjy`
--

/*!40000 DROP DATABASE IF EXISTS `zhjy`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `zhjy` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zhjy`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `realname` varchar(32) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT 0,
  `login_ip` varchar(32) DEFAULT NULL,
  `login_time` int(11) DEFAULT 0,
  `xiaoqu_id` int(10) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned DEFAULT 0,
  `status` int(11) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','adminstrator','a66abb5684c45962d887564f08346e8d',NULL,1,'127.0.0.1',1574147395,1,0,1,'2019-11-14 23:46:05','2019-12-13 00:32:43',NULL),(2,'shequ','shequ admin','d23a457be84ab338c2f6bca4954a3673',NULL,2,'127.0.0.1',1574129045,2,0,1,'2019-11-14 23:46:05','2019-12-13 00:32:43',NULL),(3,'jwh','jwh admin','b712b578d0c86929d54c5406e2db15dc',NULL,3,'127.0.0.1',1574130406,1,0,1,'2019-11-14 23:46:05','2019-12-13 00:32:43',NULL),(4,'ywh','ywh admin','9de8d843c8bd3707c4d94e71445e0a00',NULL,4,'127.0.0.1',1574123701,2,0,1,'2019-11-14 23:46:05','2019-12-13 00:32:43',NULL),(5,'wy','wy admin','6684d40d03f2777a08e818e59e98619b',NULL,5,'127.0.0.1',1577337662,1,0,1,'2019-11-14 23:46:05','2019-12-26 05:21:02',NULL),(6,'aaaaaaaaaaaaaa',NULL,'22d42eb002cefa81e9ad604ea57bc01d',NULL,0,NULL,0,NULL,0,1,'2019-12-01 02:24:14','2019-12-13 00:32:43',NULL),(7,'bbbbbbbbbb',NULL,'ddebb7a9e7f3d3c9a17d49c1690a5047',NULL,0,NULL,0,NULL,0,1,'2019-12-01 02:24:59','2019-12-13 00:32:43',NULL),(8,'username aaaaaaaaaaaaa',NULL,'7fdcf96830b457c815bae139fe2c6b36',NULL,0,NULL,0,NULL,0,-1,'2019-12-01 02:28:09','2019-12-13 00:32:43',NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth`
--

DROP TABLE IF EXISTS `auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth` (
  `admin_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `granted` tinyint(3) unsigned DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`admin_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth`
--

LOCK TABLES `auth` WRITE;
/*!40000 ALTER TABLE `auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backreport`
--

DROP TABLE IF EXISTS `backreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backreport` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fee_id` int(10) unsigned DEFAULT NULL,
  `property_id` int(10) unsigned NOT NULL,
  `back_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `type_id` tinyint(3) unsigned DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT 0.00,
  `is_back2owner` tinyint(3) unsigned DEFAULT 1,
  `back2` varchar(32) DEFAULT NULL,
  `oprator` int(10) unsigned DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backreport`
--

LOCK TABLES `backreport` WRITE;
/*!40000 ALTER TABLE `backreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `backreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `pid` int(10) unsigned DEFAULT 0,
  `type_id` int(10) unsigned NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'社区',0,2,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'社区'),(2,'居委会',0,3,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'居委会'),(3,'业委会',0,4,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'业委会'),(4,'物业',0,5,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'物业'),(5,'社区信息',1,2,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'社区/社区信息'),(6,'生活指南',1,2,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'社区/生活指南'),(7,'居民之家',1,2,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'社区/居民之家'),(8,'中介服务',1,2,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'社区/中介服务'),(9,'社区管理',2,3,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'居委会/社区管理'),(10,'统计报表',2,3,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'居委会/统计报表'),(11,'红色物业',2,3,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'居委会/红色物业'),(12,'电子地图',2,3,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'居委会/电子地图'),(13,'工作日志',2,3,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'居委会/工作日志'),(14,'会议纪要',3,4,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'业委会/会议纪要'),(15,'用章记录',3,4,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'业委会/用章记录'),(16,'财务记录',3,4,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'业委会/财务记录'),(17,'文件存档',3,4,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'业委会/文件存档'),(18,'综合管理',4,5,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'物业/综合管理'),(19,'保洁管理',4,5,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'物业/保洁管理'),(20,'秩序管理',4,5,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'物业/秩序管理'),(21,'绿化管理',4,5,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'物业/绿化管理'),(22,'公共养护',4,5,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'物业/公共养护'),(23,'客服管理',4,5,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'物业/客服管理'),(24,'财务管理',4,5,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'物业/财务管理'),(25,'红色物业',4,5,1,'2019-10-03 06:15:46','2019-12-02 23:05:43',NULL,'物业/红色物业');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dictionary`
--

DROP TABLE IF EXISTS `dictionary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dictionary` (
  `type` int(10) unsigned NOT NULL DEFAULT 1,
  `typename` varchar(32) NOT NULL,
  `id` int(10) unsigned NOT NULL DEFAULT 1,
  `name` varchar(32) NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  PRIMARY KEY (`type`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dictionary`
--

LOCK TABLES `dictionary` WRITE;
/*!40000 ALTER TABLE `dictionary` DISABLE KEYS */;
INSERT INTO `dictionary` VALUES (1,'业主类型',1,'业主',1,'2019-09-27 05:49:33','0000-00-00 00:00:00'),(1,'业主类型',2,'租户',1,'2019-09-27 05:49:33','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `dictionary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feereport`
--

DROP TABLE IF EXISTS `feereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feereport` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `summary` varchar(200) DEFAULT NULL,
  `property_id` int(10) unsigned NOT NULL,
  `pay_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `feetype_id` int(10) unsigned DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT 0.00,
  `is_owner_pay` int(10) unsigned DEFAULT 1,
  `payer_name` varchar(32) DEFAULT NULL,
  `operator` int(10) unsigned DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feereport`
--

LOCK TABLES `feereport` WRITE;
/*!40000 ALTER TABLE `feereport` DISABLE KEYS */;
INSERT INTO `feereport` VALUES (1,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,430.00,0,'代缴',4,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(2,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,226.00,0,'代缴',2,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(3,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,357.00,1,'',3,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(4,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,359.00,0,'代缴',2,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(5,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,381.00,1,'',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(6,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,165.00,0,'代缴',5,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(7,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,404.00,1,'',2,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(8,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,261.00,0,'代缴',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(9,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,209.00,1,'',4,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(10,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,293.00,1,'',4,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(11,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,127.00,1,'',4,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(12,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,216.00,0,'代缴',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(13,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,151.00,0,'代缴',2,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(14,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,129.00,1,'',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(15,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,231.00,1,'',3,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(16,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,223.00,1,'',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(17,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,477.00,0,'代缴',3,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(18,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,391.00,1,'',3,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(19,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,336.00,1,'',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(20,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,249.00,1,'',4,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(21,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,346.00,1,'',5,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(22,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,178.00,1,'',2,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(23,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,319.00,1,'',3,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(24,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,304.00,0,'代缴',3,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(25,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,320.00,1,'',2,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(26,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,479.00,1,'',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(27,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,417.00,1,'',2,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(28,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,296.00,1,'',3,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(29,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,364.00,0,'代缴',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(30,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,277.00,0,'代缴',2,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(31,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,310.00,1,'',4,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(32,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,102.00,1,'',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(33,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,440.00,0,'代缴',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(34,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,373.00,0,'代缴',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(35,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,362.00,0,'代缴',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(36,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,335.00,0,'代缴',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(37,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,330.00,0,'代缴',3,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(38,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,228.00,0,'代缴',2,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(39,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,429.00,1,'',5,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(40,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,103.00,0,'代缴',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(41,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,368.00,1,'',2,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(42,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,260.00,0,'代缴',2,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(43,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,410.00,0,'代缴',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(44,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,292.00,0,'代缴',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(45,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,207.00,0,'代缴',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(46,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,418.00,0,'代缴',2,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(47,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,244.00,1,'',5,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(48,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,255.00,0,'代缴',2,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(49,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,373.00,0,'代缴',3,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(50,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,111.00,0,'代缴',2,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(51,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,229.00,0,'代缴',3,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(52,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,466.00,1,'',5,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(53,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,475.00,1,'',3,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(54,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,288.00,0,'代缴',3,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(55,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,197.00,0,'代缴',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(56,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,383.00,1,'',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(57,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,124.00,0,'代缴',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(58,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,286.00,0,'代缴',4,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(59,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,200.00,1,'',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(60,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,216.00,0,'代缴',3,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(61,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,236.00,1,'',2,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(62,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,299.00,1,'',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(63,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,141.00,1,'',3,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(64,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,317.00,1,'',2,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(65,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,417.00,0,'代缴',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(66,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,255.00,0,'代缴',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(67,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,106.00,0,'代缴',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(68,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,424.00,1,'',3,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(69,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,208.00,0,'代缴',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(70,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,470.00,0,'代缴',4,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(71,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,431.00,1,'',4,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(72,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,223.00,1,'',5,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(73,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,120.00,0,'代缴',3,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(74,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,250.00,0,'代缴',3,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(75,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,144.00,0,'代缴',2,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(76,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,130.00,0,'代缴',2,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(77,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,158.00,1,'',5,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(78,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,438.00,0,'代缴',3,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(79,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,127.00,1,'',3,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(80,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,328.00,0,'代缴',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(81,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,421.00,0,'代缴',3,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(82,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,147.00,1,'',2,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(83,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,366.00,0,'代缴',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(84,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,454.00,0,'代缴',3,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(85,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,495.00,0,'代缴',5,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(86,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,254.00,1,'',3,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(87,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,409.00,0,'代缴',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(88,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,148.00,1,'',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(89,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,158.00,1,'',5,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(90,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,413.00,0,'代缴',4,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(91,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,459.00,1,'',2,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(92,'小白楼五大道小洋楼 装修保证金',1,'2019-11-14 23:46:05',3,NULL,NULL,178.00,1,'',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(93,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,484.00,1,'',3,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(94,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,236.00,0,'代缴',5,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(95,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,379.00,1,'',5,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(96,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,348.00,0,'代缴',3,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(97,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,226.00,0,'代缴',3,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(98,'小白楼五大道小洋楼 物业费',1,'2019-11-14 23:46:05',1,NULL,NULL,231.00,1,'',4,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(99,'津N12345 车位费',2,'2019-11-14 23:46:05',4,NULL,NULL,147.00,0,'代缴',3,'2019-11-14 23:46:05','2020-01-03 11:55:24',NULL),(100,'小白楼五大道小洋楼 垃圾清运费',1,'2019-11-14 23:46:05',2,NULL,NULL,202.00,0,'代缴',2,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `feereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feetype`
--

DROP TABLE IF EXISTS `feetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feetype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feetype`
--

LOCK TABLES `feetype` WRITE;
/*!40000 ALTER TABLE `feetype` DISABLE KEYS */;
INSERT INTO `feetype` VALUES (1,'物业费',1,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(2,'垃圾清运费',1,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(3,'装修保证金',1,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(4,'车位费',1,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(5,'dddddddddddd',1,'2019-11-19 06:22:00','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `feetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jwh`
--

DROP TABLE IF EXISTS `jwh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jwh` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jwh`
--

LOCK TABLES `jwh` WRITE;
/*!40000 ALTER TABLE `jwh` DISABLE KEYS */;
INSERT INTO `jwh` VALUES (1,'default',1,'2019-10-02 05:41:41','0000-00-00 00:00:00',NULL),(2,'test',1,'2019-10-02 05:42:21','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `jwh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `sub_title` varchar(32) DEFAULT NULL,
  `category_id` int(10) unsigned DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `author` int(10) unsigned NOT NULL,
  `is_position` tinyint(3) unsigned DEFAULT 0,
  `is_hot` tinyint(3) unsigned DEFAULT 0,
  `list_order` int(10) unsigned DEFAULT 0,
  `status` tinyint(3) unsigned DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  `xiaoqu_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'国际新闻 1','wwwwwwwwww',1,NULL,'wwwwwwwwwww','news 1 摘要',1,0,1,1,1,'2019-09-30 06:17:20','2019-10-01 09:25:20',NULL,1),(2,'国内新闻 2','eeeeeeeeee',1,NULL,'eeeeeeeeeeeee','news 2 摘要',2,0,0,1,1,'2019-09-30 06:18:37','2019-10-01 09:25:20',NULL,1),(3,'体育新闻 3','rrrrrrrrrrrr',2,NULL,'rrrrrrrrrrrrrrr','news 3 摘要',3,1,1,1,1,'2019-09-30 06:18:58','2019-10-01 09:25:20',NULL,1),(4,'娱乐新闻 4','qqqqqqqqqqq',3,NULL,'qqqqqqqqqqqq','news 4 摘要',1,0,0,1,1,'2019-09-30 06:19:15','2019-10-01 09:25:20',NULL,1),(5,'热点新闻 5','ttttttttttttt',4,NULL,'ttttttttttttttt','news 5 摘要',2,0,1,1,1,'2019-09-30 06:19:31','2019-10-01 09:25:20',NULL,1),(6,'国际新闻 6',NULL,1,NULL,'wwwwwwwwwww','news 6 摘要',3,0,0,0,1,'2019-09-30 06:29:39','2019-10-01 09:25:20',NULL,1),(7,'国内新闻 7',NULL,1,NULL,'eeeeeeeeeeeee','news 7 摘要',1,0,1,0,1,'2019-09-30 06:29:39','2019-10-01 09:25:20',NULL,1),(8,'体育新闻 8',NULL,2,NULL,'rrrrrrrrrrrrrrr','news 8 摘要',2,1,0,0,1,'2019-09-30 06:29:39','2019-10-01 09:25:20',NULL,1),(9,'娱乐新闻 9',NULL,3,NULL,'qqqqqqqqqqqq','news 9 摘要',3,0,1,0,1,'2019-09-30 06:29:39','2019-10-01 09:25:20',NULL,1),(10,'热点新闻 10',NULL,4,NULL,'ttttttttttttttt','news 10 摘要',1,0,0,0,1,'2019-09-30 06:29:39','2019-10-01 09:25:20',NULL,1),(11,'国际新闻 11',NULL,1,NULL,'wwwwwwwwwww','news 11 摘要',2,0,1,0,1,'2019-09-30 06:29:41','2019-10-01 09:25:20',NULL,1),(12,'国内新闻 12',NULL,1,NULL,'eeeeeeeeeeeee','news 12 摘要',3,0,0,0,1,'2019-09-30 06:29:41','2019-10-01 09:25:20',NULL,1),(13,'体育新闻 13',NULL,2,NULL,'rrrrrrrrrrrrrrr','news 13 摘要',1,1,1,0,1,'2019-09-30 06:29:41','2019-10-01 09:25:20',NULL,1),(14,'娱乐新闻 14',NULL,3,NULL,'qqqqqqqqqqqq','news 14 摘要',2,0,0,0,1,'2019-09-30 06:29:41','2019-10-01 09:25:20',NULL,1),(15,'热点新闻 15',NULL,4,NULL,'ttttttttttttttt','news 15 摘要',3,0,1,0,1,'2019-09-30 06:29:41','2019-10-01 09:25:20',NULL,1),(16,'国际新闻 16',NULL,1,NULL,'wwwwwwwwwww','news 16 摘要',1,0,0,0,1,'2019-09-30 06:29:41','2019-10-01 09:25:20',NULL,1),(17,'国内新闻 17',NULL,1,NULL,'eeeeeeeeeeeee','news 17 摘要',2,0,1,0,1,'2019-09-30 06:29:41','2019-10-01 09:25:20',NULL,1),(18,'体育新闻 18',NULL,2,NULL,'rrrrrrrrrrrrrrr','news 18 摘要',3,1,0,0,1,'2019-09-30 06:29:41','2019-10-01 09:25:20',NULL,1),(19,'娱乐新闻 19',NULL,3,NULL,'qqqqqqqqqqqq','news 19 摘要',1,0,1,0,1,'2019-09-30 06:29:41','2019-10-01 09:25:20',NULL,1),(20,'热点新闻 20',NULL,4,NULL,'ttttttttttttttt','news 20 摘要',2,0,0,0,1,'2019-09-30 06:29:41','2019-10-01 09:25:20',NULL,1),(21,'国际新闻 21',NULL,1,NULL,'wwwwwwwwwww','news 21 摘要',3,0,1,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(22,'国内新闻 22',NULL,1,NULL,'eeeeeeeeeeeee','news 22 摘要',1,0,0,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(23,'体育新闻 23',NULL,2,NULL,'rrrrrrrrrrrrrrr','news 23 摘要',2,1,1,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(24,'娱乐新闻 24',NULL,3,NULL,'qqqqqqqqqqqq','news 24 摘要',3,0,0,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(25,'热点新闻 25',NULL,4,NULL,'ttttttttttttttt','news 25 摘要',1,0,1,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(26,'国际新闻 26',NULL,1,NULL,'wwwwwwwwwww','news 26 摘要',2,0,0,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(27,'国内新闻 27',NULL,1,NULL,'eeeeeeeeeeeee','news 27 摘要',3,0,1,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(28,'体育新闻 28',NULL,2,NULL,'rrrrrrrrrrrrrrr','news 28 摘要',1,1,0,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(29,'娱乐新闻 29',NULL,3,NULL,'qqqqqqqqqqqq','news 29 摘要',2,0,1,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(30,'热点新闻 30',NULL,4,NULL,'ttttttttttttttt','news 30 摘要',3,0,0,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(31,'国际新闻 31',NULL,1,NULL,'wwwwwwwwwww','news 31 摘要',1,0,1,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(32,'国内新闻 32',NULL,1,NULL,'eeeeeeeeeeeee','news 32 摘要',2,0,0,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(33,'体育新闻 33',NULL,2,NULL,'rrrrrrrrrrrrrrr','news 33 摘要',3,1,1,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(34,'娱乐新闻 34',NULL,3,NULL,'qqqqqqqqqqqq','news 34 摘要',1,0,0,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(35,'热点新闻 35',NULL,4,NULL,'ttttttttttttttt','news 35 摘要',2,0,1,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(36,'国际新闻 36',NULL,1,NULL,'wwwwwwwwwww','news 36 摘要',3,0,0,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(37,'国内新闻 37',NULL,1,NULL,'eeeeeeeeeeeee','news 37 摘要',1,0,1,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(38,'体育新闻 38',NULL,2,NULL,'rrrrrrrrrrrrrrr','news 38 摘要',2,1,0,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(39,'娱乐新闻 39',NULL,3,NULL,'qqqqqqqqqqqq','news 39 摘要',3,0,1,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2),(40,'热点新闻 40',NULL,4,NULL,'ttttttttttttttt','news 40 摘要',1,0,0,0,1,'2019-09-30 06:29:43','2019-10-01 09:25:37',NULL,2);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notify`
--

DROP TABLE IF EXISTS `notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `sub_title` varchar(32) DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `xiaoqu_id` int(10) unsigned DEFAULT 0,
  `category_id` int(10) unsigned DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `content` varchar(3000) DEFAULT NULL,
  `summary` varchar(100) DEFAULT NULL,
  `author` int(10) unsigned NOT NULL,
  `is_position` int(10) unsigned DEFAULT 0,
  `is_hot` int(10) unsigned DEFAULT 0,
  `list_order` int(10) unsigned DEFAULT 0,
  `status` int(11) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notify`
--

LOCK TABLES `notify` WRITE;
/*!40000 ALTER TABLE `notify` DISABLE KEYS */;
INSERT INTO `notify` VALUES (1,'业委会 资讯 标题',NULL,4,2,3,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','业委会 资讯 内容','业委会 资讯 简介',3,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(2,'业委会 资讯 标题',NULL,4,2,3,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','业委会 资讯 内容','业委会 资讯 简介',4,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(3,'客服管理 资讯 标题',NULL,5,2,23,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','客服管理 资讯 内容','客服管理 资讯 简介',3,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(4,'社区信息 资讯 标题',NULL,2,2,5,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','社区信息 资讯 内容','社区信息 资讯 简介',5,0,1,0,1,'2019-11-15 05:58:33','2019-12-07 15:07:32',NULL),(5,'工作日志 资讯 标题',NULL,3,1,13,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','工作日志 资讯 内容','工作日志 资讯 简介',5,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(6,'居委会 资讯 标题',NULL,3,2,2,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居委会 资讯 内容','居委会 资讯 简介',3,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(7,'居民之家 资讯 标题',NULL,2,2,7,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居民之家 资讯 内容','居民之家 资讯 简介',2,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(8,'会议纪要 资讯 标题',NULL,4,2,14,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','会议纪要 资讯 内容','会议纪要 资讯 简介',5,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(9,'秩序管理 资讯 标题',NULL,5,2,20,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','秩序管理 资讯 内容','秩序管理 资讯 简介',2,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(10,'业委会 资讯 标题',NULL,4,2,3,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','业委会 资讯 内容','业委会 资讯 简介',4,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(11,'会议纪要 资讯 标题',NULL,4,2,14,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','会议纪要 资讯 内容','会议纪要 资讯 简介',2,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(12,'客服管理 资讯 标题',NULL,5,1,23,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','客服管理 资讯 内容','客服管理 资讯 简介',3,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(13,'居委会 资讯 标题',NULL,3,1,2,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居委会 资讯 内容','居委会 资讯 简介',4,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(14,'居委会 资讯 标题',NULL,3,1,2,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居委会 资讯 内容','居委会 资讯 简介',3,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(15,'财务记录 资讯 标题',NULL,4,1,16,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','财务记录 资讯 内容','财务记录 资讯 简介',2,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(16,'公共养护 资讯 标题',NULL,5,1,22,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','公共养护 资讯 内容','公共养护 资讯 简介',3,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(17,'公共养护 资讯 标题',NULL,5,2,22,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','公共养护 资讯 内容','公共养护 资讯 简介',5,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(18,'红色物业 资讯 标题',NULL,3,1,11,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','红色物业 资讯 内容','红色物业 资讯 简介',2,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(19,'绿化管理 资讯 标题',NULL,5,1,21,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','绿化管理 资讯 内容','绿化管理 资讯 简介',5,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(20,'会议纪要 资讯 标题',NULL,4,2,14,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','会议纪要 资讯 内容','会议纪要 资讯 简介',5,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(21,'中介服务 资讯 标题',NULL,2,2,8,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','中介服务 资讯 内容','中介服务 资讯 简介',4,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(22,'业委会 资讯 标题',NULL,4,2,3,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','业委会 资讯 内容','业委会 资讯 简介',3,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(23,'绿化管理 资讯 标题',NULL,5,2,21,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','绿化管理 资讯 内容','绿化管理 资讯 简介',4,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(24,'会议纪要 资讯 标题',NULL,4,2,14,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','会议纪要 资讯 内容','会议纪要 资讯 简介',4,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(25,'文件存档 资讯 标题',NULL,4,1,17,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','文件存档 资讯 内容','文件存档 资讯 简介',2,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(26,'文件存档 资讯 标题',NULL,4,1,17,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','文件存档 资讯 内容','文件存档 资讯 简介',3,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(27,'居民之家 资讯 标题',NULL,2,1,7,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居民之家 资讯 内容','居民之家 资讯 简介',4,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(28,'统计报表 资讯 标题',NULL,3,1,10,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','统计报表 资讯 内容','统计报表 资讯 简介',5,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(29,'物业 资讯 标题',NULL,5,2,4,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','物业 资讯 内容','物业 资讯 简介',5,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(30,'社区信息 资讯 标题',NULL,2,1,5,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','社区信息 资讯 内容','社区信息 资讯 简介',5,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(31,'文件存档 资讯 标题',NULL,4,1,17,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','文件存档 资讯 内容','文件存档 资讯 简介',5,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(32,'公共养护 资讯 标题',NULL,5,2,22,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','公共养护 资讯 内容','公共养护 资讯 简介',3,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(33,'中介服务 资讯 标题',NULL,2,2,8,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','中介服务 资讯 内容','中介服务 资讯 简介',4,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(34,'保洁管理 资讯 标题',NULL,5,2,19,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','保洁管理 资讯 内容','保洁管理 资讯 简介',2,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(35,'电子地图 资讯 标题',NULL,3,1,12,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','电子地图 资讯 内容','电子地图 资讯 简介',3,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(36,'综合管理 资讯 标题',NULL,5,2,18,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','综合管理 资讯 内容','综合管理 资讯 简介',4,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(37,'中介服务 资讯 标题',NULL,2,1,8,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','中介服务 资讯 内容','中介服务 资讯 简介',5,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(38,'统计报表 资讯 标题',NULL,3,1,10,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','统计报表 资讯 内容','统计报表 资讯 简介',2,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(39,'社区信息 资讯 标题',NULL,2,2,5,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','社区信息 资讯 内容','社区信息 资讯 简介',5,1,0,0,1,'2019-11-15 05:58:33','2019-12-07 15:07:32',NULL),(40,'客服管理 资讯 标题',NULL,5,1,23,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','客服管理 资讯 内容','客服管理 资讯 简介',5,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(41,'中介服务 资讯 标题',NULL,2,1,8,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','中介服务 资讯 内容','中介服务 资讯 简介',4,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(42,'财务管理 资讯 标题',NULL,5,1,24,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','财务管理 资讯 内容','财务管理 资讯 简介',2,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(43,'社区 资讯 标题',NULL,2,1,1,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','社区 资讯 内容','社区 资讯 简介',2,0,1,0,1,'2019-11-15 05:58:33','2019-12-07 15:07:32',NULL),(44,'秩序管理 资讯 标题',NULL,5,2,20,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','秩序管理 资讯 内容','秩序管理 资讯 简介',3,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(45,'社区 资讯 标题',NULL,2,1,1,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','社区 资讯 内容','社区 资讯 简介',5,0,0,0,1,'2019-11-15 05:58:33','2019-12-07 15:07:32',NULL),(46,'公共养护 资讯 标题',NULL,5,1,22,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','公共养护 资讯 内容','公共养护 资讯 简介',2,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(47,'会议纪要 资讯 标题',NULL,4,1,14,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','会议纪要 资讯 内容','会议纪要 资讯 简介',4,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(48,'保洁管理 资讯 标题',NULL,5,1,19,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','保洁管理 资讯 内容','保洁管理 资讯 简介',4,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(49,'绿化管理 资讯 标题',NULL,5,1,21,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','绿化管理 资讯 内容','绿化管理 资讯 简介',4,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(50,'秩序管理 资讯 标题',NULL,5,2,20,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','秩序管理 资讯 内容','秩序管理 资讯 简介',3,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(51,'统计报表 资讯 标题',NULL,3,2,10,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','统计报表 资讯 内容','统计报表 资讯 简介',5,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(52,'财务记录 资讯 标题',NULL,4,1,16,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','财务记录 资讯 内容','财务记录 资讯 简介',5,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(53,'用章记录 资讯 标题',NULL,4,1,15,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','用章记录 资讯 内容','用章记录 资讯 简介',4,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(54,'会议纪要 资讯 标题',NULL,4,1,14,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','会议纪要 资讯 内容','会议纪要 资讯 简介',4,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(55,'物业 资讯 标题',NULL,5,1,4,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','物业 资讯 内容','物业 资讯 简介',4,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(56,'会议纪要 资讯 标题',NULL,4,1,14,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','会议纪要 资讯 内容','会议纪要 资讯 简介',2,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(57,'居民之家 资讯 标题',NULL,2,1,7,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居民之家 资讯 内容','居民之家 资讯 简介',2,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(58,'电子地图 资讯 标题',NULL,3,2,12,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','电子地图 资讯 内容','电子地图 资讯 简介',4,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(59,'居民之家 资讯 标题',NULL,2,1,7,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居民之家 资讯 内容','居民之家 资讯 简介',5,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(60,'中介服务 资讯 标题',NULL,2,1,8,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','中介服务 资讯 内容','中介服务 资讯 简介',2,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(61,'居民之家 资讯 标题',NULL,2,1,7,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居民之家 资讯 内容','居民之家 资讯 简介',2,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(62,'绿化管理 资讯 标题',NULL,5,1,21,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','绿化管理 资讯 内容','绿化管理 资讯 简介',2,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(63,'财务管理 资讯 标题',NULL,5,2,24,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','财务管理 资讯 内容','财务管理 资讯 简介',2,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(64,'用章记录 资讯 标题',NULL,4,2,15,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','用章记录 资讯 内容','用章记录 资讯 简介',3,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(65,'会议纪要 资讯 标题',NULL,4,2,14,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','会议纪要 资讯 内容','会议纪要 资讯 简介',4,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(66,'中介服务 资讯 标题',NULL,2,2,8,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','中介服务 资讯 内容','中介服务 资讯 简介',4,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(67,'居民之家 资讯 标题',NULL,2,2,7,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居民之家 资讯 内容','居民之家 资讯 简介',4,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(68,'电子地图 资讯 标题',NULL,3,2,12,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','电子地图 资讯 内容','电子地图 资讯 简介',2,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(69,'统计报表 资讯 标题',NULL,3,1,10,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','统计报表 资讯 内容','统计报表 资讯 简介',5,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(70,'公共养护 资讯 标题',NULL,5,2,22,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','公共养护 资讯 内容','公共养护 资讯 简介',5,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(71,'文件存档 资讯 标题',NULL,4,2,17,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','文件存档 资讯 内容','文件存档 资讯 简介',3,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(72,'红色物业 资讯 标题',NULL,3,1,11,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','红色物业 资讯 内容','红色物业 资讯 简介',3,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(73,'统计报表 资讯 标题',NULL,3,2,10,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','统计报表 资讯 内容','统计报表 资讯 简介',5,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(74,'会议纪要 资讯 标题',NULL,4,1,14,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','会议纪要 资讯 内容','会议纪要 资讯 简介',2,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(75,'保洁管理 资讯 标题',NULL,5,1,19,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','保洁管理 资讯 内容','保洁管理 资讯 简介',3,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(76,'居民之家 资讯 标题',NULL,2,1,7,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居民之家 资讯 内容','居民之家 资讯 简介',2,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(77,'居民之家 资讯 标题',NULL,2,2,7,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居民之家 资讯 内容','居民之家 资讯 简介',3,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(78,'用章记录 资讯 标题',NULL,4,1,15,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','用章记录 资讯 内容','用章记录 资讯 简介',4,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(79,'社区 资讯 标题',NULL,2,1,1,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','社区 资讯 内容','社区 资讯 简介',3,1,1,0,1,'2019-11-15 05:58:33','2019-12-07 15:07:32',NULL),(80,'业委会 资讯 标题',NULL,4,2,3,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','业委会 资讯 内容','业委会 资讯 简介',3,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(81,'居委会 资讯 标题',NULL,3,2,2,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居委会 资讯 内容','居委会 资讯 简介',4,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(82,'财务记录 资讯 标题',NULL,4,2,16,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','财务记录 资讯 内容','财务记录 资讯 简介',5,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(83,'用章记录 资讯 标题',NULL,4,1,15,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','用章记录 资讯 内容','用章记录 资讯 简介',5,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(84,'统计报表 资讯 标题',NULL,3,1,10,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','统计报表 资讯 内容','统计报表 资讯 简介',5,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(85,'社区 资讯 标题',NULL,2,2,1,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','社区 资讯 内容','社区 资讯 简介',2,1,0,0,1,'2019-11-15 05:58:33','2019-12-07 15:07:32',NULL),(86,'红色物业 资讯 标题',NULL,3,2,11,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','红色物业 资讯 内容','红色物业 资讯 简介',4,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(87,'居民之家 资讯 标题',NULL,2,1,7,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居民之家 资讯 内容','居民之家 资讯 简介',4,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(88,'秩序管理 资讯 标题',NULL,5,1,20,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','秩序管理 资讯 内容','秩序管理 资讯 简介',4,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(89,'会议纪要 资讯 标题',NULL,4,1,14,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','会议纪要 资讯 内容','会议纪要 资讯 简介',2,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(90,'居民之家 资讯 标题',NULL,2,2,7,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居民之家 资讯 内容','居民之家 资讯 简介',5,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(91,'客服管理 资讯 标题',NULL,5,2,23,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','客服管理 资讯 内容','客服管理 资讯 简介',3,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(92,'居民之家 资讯 标题',NULL,2,2,7,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','居民之家 资讯 内容','居民之家 资讯 简介',3,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(93,'电子地图 资讯 标题',NULL,3,1,12,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','电子地图 资讯 内容','电子地图 资讯 简介',2,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(94,'中介服务 资讯 标题',NULL,2,1,8,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','中介服务 资讯 内容','中介服务 资讯 简介',3,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(95,'中介服务 资讯 标题',NULL,2,2,8,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','中介服务 资讯 内容','中介服务 资讯 简介',4,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(96,'绿化管理 资讯 标题',NULL,5,2,21,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','绿化管理 资讯 内容','绿化管理 资讯 简介',4,1,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(97,'电子地图 资讯 标题',NULL,3,1,12,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','电子地图 资讯 内容','电子地图 资讯 简介',4,0,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(98,'财务记录 资讯 标题',NULL,4,1,16,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','财务记录 资讯 内容','财务记录 资讯 简介',5,0,0,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(99,'会议纪要 资讯 标题',NULL,4,1,14,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','会议纪要 资讯 内容','会议纪要 资讯 简介',3,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(100,'中介服务 资讯 标题',NULL,2,1,8,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','中介服务 资讯 内容','中介服务 资讯 简介',3,1,1,0,1,'2019-11-15 05:58:33','2019-12-05 04:24:36',NULL),(105,'更换煤气表通知','aaaaaaaaaaaa',5,1,4,'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png','免费更换网络智能燃气表','燃气表',5,0,0,1,1,'2019-11-19 04:33:27','2019-12-07 15:07:32',NULL);
/*!40000 ALTER TABLE `notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `addr` varchar(32) NOT NULL,
  `proptype_id` int(10) unsigned DEFAULT 1,
  `summary` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `fee_status` int(11) DEFAULT 1,
  `discount` decimal(8,2) DEFAULT 0.00,
  `is_lease` int(11) DEFAULT 0,
  `is_arrears` int(11) DEFAULT 0,
  `begin_date` date DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addr` (`addr`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (1,1,'小白楼五大道小洋楼',1,'我的房产',1,1,0.00,0,0,NULL,0.00,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(2,1,'津N12345',2,'津牌汽车',1,2,0.00,1,1,NULL,100.00,'2019-11-14 23:46:05','2020-01-03 11:49:13',NULL),(3,1,'京Q12345',2,'京牌轿车',1,0,0.00,0,1,NULL,3000.00,'2019-11-14 23:46:05','2019-11-15 03:17:51',NULL),(4,1,'河东万新村',1,'我的房产',1,1,0.00,0,0,NULL,NULL,'2019-11-16 06:04:45','0000-00-00 00:00:00',NULL),(9,1,'wwwwwwwwwwwwww',2,'wwwwwwwwwwwwwwww',1,1,0.00,0,0,NULL,NULL,'2019-11-19 07:07:24','0000-00-00 00:00:00',NULL),(10,1,'ffffffffffffff',1,'ffffffffffffffff',1,1,0.00,0,0,NULL,NULL,'2019-11-19 07:09:13','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proptype`
--

DROP TABLE IF EXISTS `proptype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proptype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `summary` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proptype`
--

LOCK TABLES `proptype` WRITE;
/*!40000 ALTER TABLE `proptype` DISABLE KEYS */;
INSERT INTO `proptype` VALUES (1,'房产',NULL,1,'2019-11-14 15:03:56','0000-00-00 00:00:00',NULL),(2,'车位',NULL,1,'2019-11-14 15:03:56','0000-00-00 00:00:00',NULL),(3,'fddasdcd','说明',1,'2019-11-19 06:21:52','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `proptype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `image` varchar(64) DEFAULT NULL,
  `content` varchar(2000) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `addr` varchar(64) DEFAULT NULL,
  `type_id` int(10) unsigned DEFAULT 1,
  `reply` varchar(2000) DEFAULT NULL,
  `replier` int(10) unsigned DEFAULT NULL,
  `reply_time` int(11) DEFAULT 0,
  `status` tinyint(4) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  `author` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'咨询 1',NULL,'咨询内容','1380013800',NULL,1,NULL,NULL,0,1,'2019-10-07 07:00:33','2019-11-18 01:00:59',NULL,1),(2,'投诉 1',NULL,'投诉内容','1380013800',NULL,2,'回复内容',1,0,0,'2019-10-07 07:01:04','2019-11-18 01:00:59',NULL,1),(3,'建议 1',NULL,'建议内容','1380013800',NULL,3,NULL,NULL,0,1,'2019-10-07 07:01:21','2019-11-18 01:00:59',NULL,1),(4,'表扬 1',NULL,'aaaa djgfkgbf kgjnbfb  dgnfmnh nghlk','1380013800',NULL,4,'回复内容',1,0,0,'2019-10-07 07:01:36','2019-11-18 01:00:59',NULL,1),(5,'ertergeg','','egeegg','ergerge','egerger',2,NULL,NULL,0,1,'2019-11-18 03:09:10','2019-11-18 04:41:32',NULL,2);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `summary` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'系统管理员','系统管理员',1,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(2,'社区管理员','社区管理员',1,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(3,'居委会成员','居委会成员',1,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(4,'业委会成员','业委会成员',1,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(5,'物业管理员','物业管理员',1,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talk`
--

DROP TABLE IF EXISTS `talk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talk` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `author` int(10) unsigned NOT NULL,
  `admiring` int(10) unsigned DEFAULT 0,
  `reading` int(10) unsigned DEFAULT 0,
  `image` varchar(200) DEFAULT NULL,
  `video` varchar(200) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talk`
--

LOCK TABLES `talk` WRITE;
/*!40000 ALTER TABLE `talk` DISABLE KEYS */;
/*!40000 ALTER TABLE `talk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telephones`
--

DROP TABLE IF EXISTS `telephones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telephones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `telephone` varchar(32) NOT NULL,
  `title` varchar(64) NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telephone` (`telephone`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telephones`
--

LOCK TABLES `telephones` WRITE;
/*!40000 ALTER TABLE `telephones` DISABLE KEYS */;
INSERT INTO `telephones` VALUES (1,'119','火警',1,'2019-10-10 11:47:50','0000-00-00 00:00:00',NULL),(2,'120','医疗急救',1,'2019-10-10 11:47:50','0000-00-00 00:00:00',NULL),(3,'110','匪警',1,'2019-10-10 11:47:50','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `telephones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `realname` varchar(32) DEFAULT NULL,
  `password` char(32) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT 0,
  `signnature` varchar(100) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `time_out` int(11) DEFAULT 0,
  `xiaoqu_id` tinyint(3) unsigned DEFAULT 0,
  `addr` varchar(64) DEFAULT NULL,
  `usertype_id` int(10) unsigned DEFAULT 1,
  `login_ip` varchar(32) DEFAULT NULL,
  `login_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(4) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'mqs','ma quansheng','5eb0e2bb362916be2ea82ce379ae4931',0,NULL,NULL,NULL,NULL,0,2,NULL,2,NULL,'2019-11-14 23:46:05',1,'2019-11-14 23:46:05','2019-12-30 06:40:50',NULL),(2,'test','test','47ec2dd791e31e2ef2076caf64ed9b3d',0,NULL,NULL,NULL,NULL,0,1,NULL,1,NULL,'2019-11-14 23:46:05',1,'2019-11-14 23:46:05','2019-12-30 06:40:50',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertype` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES (1,'业主',1,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(2,'租户',1,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wy`
--

DROP TABLE IF EXISTS `wy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `status` tinyint(4) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wy`
--

LOCK TABLES `wy` WRITE;
/*!40000 ALTER TABLE `wy` DISABLE KEYS */;
/*!40000 ALTER TABLE `wy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xiaoqu`
--

DROP TABLE IF EXISTS `xiaoqu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xiaoqu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `jwh_id` int(10) unsigned DEFAULT NULL,
  `wy_id` int(10) unsigned DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `delete_time` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xiaoqu`
--

LOCK TABLES `xiaoqu` WRITE;
/*!40000 ALTER TABLE `xiaoqu` DISABLE KEYS */;
INSERT INTO `xiaoqu` VALUES (1,'default',NULL,NULL,1,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL),(2,'test',NULL,NULL,1,'2019-11-14 23:46:05','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `xiaoqu` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-03 19:56:39
