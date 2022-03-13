
--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
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

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
INSERT INTO `factura` VALUES (1,'2022-01-10',1,1,1,21654654,'2022-03-11 19:21:50'),(2,'2022-02-02',1,2,3,3216544,NULL),(3,'2022-01-01',1,3,3,3219987,NULL),(4,'2022-01-02',1,1,2,456888,NULL),(5,'2022-01-03',1,2,1,66544,NULL),(6,'2022-01-03',1,2,3,55777,NULL),(7,'2022-01-04',1,1,3,654987,NULL),(8,'2022-01-05',1,3,3,6549878,NULL),(9,'2022-01-06',1,3,2,654987984,NULL),(10,'2022-01-07',1,3,1,6546498,NULL);
UNLOCK TABLES;

--
-- Table structure for table `factura_producto`
--

DROP TABLE IF EXISTS `factura_producto`;
CREATE TABLE `factura_producto` (
  `id_producto_mx` int NOT NULL,
  `id_factura_mx` int NOT NULL,
  PRIMARY KEY (`id_producto_mx`,`id_factura_mx`),
  KEY `FK_FACTURA_idx` (`id_factura_mx`),
  CONSTRAINT `FK_FACTURA` FOREIGN KEY (`id_factura_mx`) REFERENCES `factura` (`idfactura`),
  CONSTRAINT `FK_PRODUCTO` FOREIGN KEY (`id_producto_mx`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `factura_producto`
--

LOCK TABLES `factura_producto` WRITE;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;

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

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
INSERT INTO `producto` VALUES (1,'kumis_upd','ALPINA',2500,3),(2,'LECHE ENTERA_upd','COLANTA',4500,4),(3,'CHOCORRAMO_upd','RAMO',1500,1),(4,'PAN TAJADO','COMAPAN',6000,3),(5,'HARINA DE TRIGO','HAS DE OROS',3000,4);

UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `idproveedor` int NOT NULL,
  `nombre_prv` varchar(45) DEFAULT NULL,
  `telefono_prv` varchar(45) DEFAULT NULL,
  `direccion_prv` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
INSERT INTO `proveedor` VALUES (1,'COLANTA','6546548','CR 2#65-65'),(2,'RAMO','6549877','CR 85#69-98'),(3,'COMAPAN','465465','CLL6#9-52'),(4,'HARINA HAS DE ORO','8998798','CR 98#56-96'),(5,'ALPINA','6532165487','AV CHILE#12-12');
UNLOCK TABLES;

--
-- Table structure for table `tipodoccliente`
--

DROP TABLE IF EXISTS `tipodoccliente`;

CREATE TABLE `tipodoccliente` (
  `idtipoDocCliente` int NOT NULL,
  `tipoDocCliente` varchar(2) DEFAULT NULL,
  `descripcion_tipodoc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipoDocCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tipodoccliente`
--

LOCK TABLES `tipodoccliente` WRITE;
INSERT INTO `tipodoccliente` VALUES (1,'RC','REGISTRO CIVIL'),(2,'TI','TARJETA DE IDENTIDAD'),(3,'CC','CEDULA'),(4,'PA','PASAPORTE');
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;


CREATE TABLE `vendedor` (
  `idvendedor` int NOT NULL,
  `nombre_vend` varchar(45) DEFAULT NULL,
  `documento_vend` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idvendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;

INSERT INTO `vendedor` VALUES (1,'JUAN GONZALEZ','123456789');

UNLOCK TABLES;
/****************************************************************************************/
/****************************************************************************************/

/*Borrado Logico*/
UPDATE factura SET fechaEliminado = sysdate() WHERE idfactura = 1;
UPDATE factura SET fechaEliminado = sysdate() WHERE idfactura = 4;

/*Borrado Fisico*/
DELETE FROM factura WHERE idfactura = 3;
DELETE FROM factura WHERE idfactura = 4;

/*MODIFICAR PRODUCTOS*/
/*SELECT * FROM producto;*/
UPDATE producto
SET nombre_prod = "kumis_upd",
	id_proveedor = 3
where idproducto = 1;

UPDATE producto
SET nombre_prod = "LECHE ENTERA_upd",
	id_proveedor = 4
where idproducto = 2;

UPDATE producto
SET nombre_prod = "CHOCORRAMO_upd",
	id_proveedor = 1
where idproducto = 3;