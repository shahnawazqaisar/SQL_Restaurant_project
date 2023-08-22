CREATE DATABASE  IF NOT EXISTS `restaurant_orders` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `restaurant_orders`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurant_orders
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `customer_orders`
--

DROP TABLE IF EXISTS `customer_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_orders` (
  `order_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `roll_id` int DEFAULT NULL,
  `not_include_items` varchar(4) DEFAULT NULL,
  `extra_items_included` varchar(4) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_orders`
--

LOCK TABLES `customer_orders` WRITE;
/*!40000 ALTER TABLE `customer_orders` DISABLE KEYS */;
INSERT INTO `customer_orders` VALUES (1,101,1,'','','2021-01-01 18:05:02'),(2,101,1,'','','2021-01-01 19:00:52'),(3,102,1,'','','2021-01-02 23:51:23'),(3,102,2,'','NaN','2021-01-02 23:51:23'),(4,103,1,'4','','2021-01-04 13:23:46'),(4,103,1,'4','','2021-01-04 13:23:46'),(4,103,2,'4','','2021-01-04 13:23:46'),(5,104,1,NULL,'1','2021-01-08 21:00:29'),(6,101,2,NULL,NULL,'2021-01-08 21:03:13'),(7,105,2,NULL,'1','2021-01-08 21:20:29'),(8,102,1,NULL,NULL,'2021-01-09 23:54:33'),(9,103,1,'4','1,5','2021-01-10 11:22:59'),(10,104,1,NULL,NULL,'2021-01-11 18:34:49'),(10,104,1,'2,6','1,4','2021-01-11 18:34:49');
/*!40000 ALTER TABLE `customer_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driver_id` int DEFAULT NULL,
  `reg_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,'2021-01-01'),(2,'2021-01-03'),(3,'2021-01-08'),(4,'2021-01-15');
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver_order`
--

DROP TABLE IF EXISTS `driver_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver_order` (
  `order_id` int DEFAULT NULL,
  `driver_id` int DEFAULT NULL,
  `pickup_time` datetime DEFAULT NULL,
  `distance` varchar(7) DEFAULT NULL,
  `duration` varchar(10) DEFAULT NULL,
  `cancellation` varchar(23) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver_order`
--

LOCK TABLES `driver_order` WRITE;
/*!40000 ALTER TABLE `driver_order` DISABLE KEYS */;
INSERT INTO `driver_order` VALUES (1,1,'2021-01-01 18:15:34','20km','32 minutes',''),(2,1,'2021-01-01 19:10:54','20km','27 minutes',''),(3,1,'2021-01-03 00:12:37','13.4km','20 minutes','NaN'),(4,2,'2021-01-04 13:53:03','23.4','40','NaN'),(5,3,'2021-01-08 21:10:57','10','15','NaN'),(6,3,NULL,NULL,NULL,'Cancellation'),(7,2,'2021-01-08 21:30:45','25km','25 minutes',NULL),(8,2,'2021-01-10 00:15:02','23.4 km','15 minute',NULL),(9,2,NULL,NULL,NULL,'Customer Cancellation'),(10,1,'2021-01-11 18:50:20','10km','10 minutes',NULL);
/*!40000 ALTER TABLE `driver_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ingredients_id` int DEFAULT NULL,
  `ingredients_name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'BBQ Chicken'),(2,'Chilli Sauce'),(3,'Chicken'),(4,'Cheese'),(5,'Kebab'),(6,'Mushrooms'),(7,'Onions'),(8,'Egg'),(9,'Peppers'),(10,'schezwan sauce'),(11,'Tomatoes'),(12,'Tomato Sauce');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolls`
--

DROP TABLE IF EXISTS `rolls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolls` (
  `roll_id` int DEFAULT NULL,
  `roll_name` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolls`
--

LOCK TABLES `rolls` WRITE;
/*!40000 ALTER TABLE `rolls` DISABLE KEYS */;
INSERT INTO `rolls` VALUES (1,'Non Veg Roll'),(2,'Veg Roll');
/*!40000 ALTER TABLE `rolls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolls_recipes`
--

DROP TABLE IF EXISTS `rolls_recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rolls_recipes` (
  `roll_id` int DEFAULT NULL,
  `ingredients` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolls_recipes`
--

LOCK TABLES `rolls_recipes` WRITE;
/*!40000 ALTER TABLE `rolls_recipes` DISABLE KEYS */;
INSERT INTO `rolls_recipes` VALUES (1,'1,2,3,4,5,6,8,10'),(2,'4,6,7,9,11,12');
/*!40000 ALTER TABLE `rolls_recipes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-15  2:44:30
