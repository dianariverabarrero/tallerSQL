-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: db_tallersql
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idfactura` int NOT NULL,
  `fecha_fact` date DEFAULT NULL,
  `id_vendedor` int DEFAULT NULL,
  `id_tipo_doc_cliente` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `num_doc_cliente` int DEFAULT NULL,
  `fechaEliminado` datetime DEFAULT NULL,
  PRIMARY KEY (`idfactura`),
  KEY `FK_FACTURA_VENDEDOR_idx` (`id_vendedor`),
  KEY `FK_FACTURA_PRODUCTO_idx` (`id_producto`),
  KEY `FK_FACTURA_TIPDOCCLIENTE_idx` (`id_tipo_doc_cliente`),
  CONSTRAINT `FK_FACTURA_PRODUCTO` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`idproducto`),
  CONSTRAINT `FK_FACTURA_TIPDOCCLIENTE` FOREIGN KEY (`id_tipo_doc_cliente`) REFERENCES `tipodoccliente` (`idtipoDocCliente`),
  CONSTRAINT `FK_FACTURA_VENDEDOR` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`idvendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'2022-01-10',1,1,1,21654654,'2022-03-11 19:21:50'),(2,'2022-02-02',1,2,3,3216544,NULL),(3,'2022-01-01',1,3,3,3219987,NULL),(4,'2022-01-02',1,1,2,456888,NULL),(5,'2022-01-03',1,2,1,66544,NULL),(6,'2022-01-03',1,2,3,55777,NULL),(7,'2022-01-04',1,1,3,654987,NULL),(8,'2022-01-05',1,3,3,6549878,NULL),(9,'2022-01-06',1,3,2,654987984,NULL),(10,'2022-01-07',1,3,1,6546498,NULL);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_producto`
--

DROP TABLE IF EXISTS `factura_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_producto` (
  `id_producto_mx` int NOT NULL,
  `id_factura_mx` int NOT NULL,
  PRIMARY KEY (`id_producto_mx`,`id_factura_mx`),
  KEY `FK_FACTURA_idx` (`id_factura_mx`),
  CONSTRAINT `FK_FACTURA` FOREIGN KEY (`id_factura_mx`) REFERENCES `factura` (`idfactura`),
  CONSTRAINT `FK_PRODUCTO` FOREIGN KEY (`id_producto_mx`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_producto`
--

LOCK TABLES `factura_producto` WRITE;
/*!40000 ALTER TABLE `factura_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL,
  `nombre_prod` varchar(45) DEFAULT NULL,
  `marca_prod` varchar(45) DEFAULT NULL,
  `precio_prod` float DEFAULT NULL,
  `id_proveedor` int DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `FK_PRODUCTO_PROVEEDOR_idx` (`id_proveedor`),
  CONSTRAINT `FK_PRODUCTO_PROVEEDOR` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'kumis_upd','ALPINA',2500,3),(2,'LECHE ENTERA_upd','COLANTA',4500,4),(3,'CHOCORRAMO_upd','RAMO',1500,1),(4,'PAN TAJADO','COMAPAN',6000,3),(5,'HARINA DE TRIGO','HAS DE OROS',3000,4);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `idproveedor` int NOT NULL,
  `nombre_prv` varchar(45) DEFAULT NULL,
  `telefono_prv` varchar(45) DEFAULT NULL,
  `direccion_prv` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'COLANTA','6546548','CR 2#65-65'),(2,'RAMO','6549877','CR 85#69-98'),(3,'COMAPAN','465465','CLL6#9-52'),(4,'HARINA HAS DE ORO','8998798','CR 98#56-96'),(5,'ALPINA','6532165487','AV CHILE#12-12');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodoccliente`
--

DROP TABLE IF EXISTS `tipodoccliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipodoccliente` (
  `idtipoDocCliente` int NOT NULL,
  `tipoDocCliente` varchar(2) DEFAULT NULL,
  `descripcion_tipodoc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoDocCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodoccliente`
--

LOCK TABLES `tipodoccliente` WRITE;
/*!40000 ALTER TABLE `tipodoccliente` DISABLE KEYS */;
INSERT INTO `tipodoccliente` VALUES (1,'RC','REGISTRO CIVIL'),(2,'TI','TARJETA DE IDENTIDAD'),(3,'CC','CEDULA'),(4,'PA','PASAPORTE');
/*!40000 ALTER TABLE `tipodoccliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `idvendedor` int NOT NULL,
  `nombre_vend` varchar(45) DEFAULT NULL,
  `documento_vend` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idvendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'JUAN GONZALEZ','123456789');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-11 20:44:14
