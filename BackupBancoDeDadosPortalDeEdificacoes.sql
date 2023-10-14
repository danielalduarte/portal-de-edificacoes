CREATE DATABASE  IF NOT EXISTS `portaldeedificacoes` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `portaldeedificacoes`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: portaldeedificacoes
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `anexo`
--

DROP TABLE IF EXISTS `anexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anexo` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `projeto` int DEFAULT NULL,
  `termo` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `projeto_idx` (`projeto`),
  KEY `termo_idx` (`termo`),
  CONSTRAINT `anexoProjeto` FOREIGN KEY (`projeto`) REFERENCES `projeto` (`codigo`),
  CONSTRAINT `anexoTermo` FOREIGN KEY (`termo`) REFERENCES `termo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anexo`
--

LOCK TABLES `anexo` WRITE;
/*!40000 ALTER TABLE `anexo` DISABLE KEYS */;
/*!40000 ALTER TABLE `anexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guia`
--

DROP TABLE IF EXISTS `guia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guia` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `template` int DEFAULT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `datapagamento` datetime DEFAULT NULL,
  `projeto` int DEFAULT NULL,
  `servico` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `template_idx` (`template`),
  KEY `projeto_idx` (`projeto`),
  KEY `servico_idx` (`servico`),
  CONSTRAINT `guiaProjeto` FOREIGN KEY (`projeto`) REFERENCES `projeto` (`codigo`),
  CONSTRAINT `guiaServico` FOREIGN KEY (`servico`) REFERENCES `servico` (`codigo`),
  CONSTRAINT `guiaTemplate` FOREIGN KEY (`template`) REFERENCES `template` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guia`
--

LOCK TABLES `guia` WRITE;
/*!40000 ALTER TABLE `guia` DISABLE KEYS */;
/*!40000 ALTER TABLE `guia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `projeto` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `projeto_idx` (`projeto`),
  CONSTRAINT `historicoProjeto` FOREIGN KEY (`projeto`) REFERENCES `projeto` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES (1,'Cadastro','2023-10-08 22:38:32',6),(2,'Cadastro','2023-10-08 22:43:34',7);
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profissao`
--

DROP TABLE IF EXISTS `profissao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profissao` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profissao`
--

LOCK TABLES `profissao` WRITE;
/*!40000 ALTER TABLE `profissao` DISABLE KEYS */;
INSERT INTO `profissao` VALUES (1,'Engenheiro'),(2,'Arquiteto');
/*!40000 ALTER TABLE `profissao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projeto` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `protocolo` varchar(45) DEFAULT NULL,
  `processo` varchar(45) DEFAULT NULL,
  `inscricaoIptu` varchar(45) DEFAULT NULL,
  `alvara` varchar(45) DEFAULT NULL,
  `inicioObra` datetime DEFAULT NULL,
  `responsavelTecnico` int DEFAULT NULL,
  `requerente` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `requerimento` varchar(45) DEFAULT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `dataAtualizacao` datetime DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `responsavelTecnico_idx` (`responsavelTecnico`),
  KEY `requerente_idx` (`requerente`),
  KEY `status_idx` (`status`),
  CONSTRAINT `projetoRequerente` FOREIGN KEY (`requerente`) REFERENCES `requerente` (`codigo`),
  CONSTRAINT `projetoResponsavelTecnico` FOREIGN KEY (`responsavelTecnico`) REFERENCES `responsaveltecnico` (`codigo`),
  CONSTRAINT `projetoStatus` FOREIGN KEY (`status`) REFERENCES `status` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (1,'Reserva da Figueira',NULL,NULL,NULL,NULL,NULL,5,1,1,NULL,'2023-10-01 15:56:10','2023-10-01 15:56:10'),(2,'Reserva da Figueira',NULL,NULL,NULL,NULL,NULL,5,1,1,NULL,'2023-10-07 09:05:36','2023-10-07 09:05:36'),(3,'Reserva do Arvoredo',NULL,NULL,NULL,NULL,NULL,5,1,1,NULL,'2023-10-07 10:36:38','2023-10-07 10:36:38'),(4,'Reserva do Arvoredo',NULL,NULL,NULL,NULL,NULL,5,1,1,'REQ2023000004','2023-10-07 10:48:36','2023-10-07 10:48:36'),(5,'Ipiranga Garden',NULL,NULL,NULL,NULL,NULL,6,1,1,'REQ2023000005','2023-10-08 19:04:13','2023-10-08 19:04:13'),(6,'Jardim do Salso Garden',NULL,NULL,NULL,NULL,NULL,6,1,1,'REQ2023000006','2023-10-08 22:38:32','2023-10-08 22:38:32'),(7,'Jardim Europa',NULL,NULL,NULL,NULL,NULL,6,1,1,'REQ2023000007','2023-10-08 22:43:34','2023-10-08 22:43:34');
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requerente`
--

DROP TABLE IF EXISTS `requerente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requerente` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `cpfCnpj` varchar(18) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requerente`
--

LOCK TABLES `requerente` WRITE;
/*!40000 ALTER TABLE `requerente` DISABLE KEYS */;
INSERT INTO `requerente` VALUES (1,'11122233344','123456','no@email.com','55999998888','2023-09-30 21:58:07','Denise Lara Gianesini'),(2,'22233344455','123456','no@email.com','55911112222','2023-10-12 19:03:41','Denilson Lara');
/*!40000 ALTER TABLE `requerente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsaveltecnico`
--

DROP TABLE IF EXISTS `responsaveltecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsaveltecnico` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `cpfCnpj` varchar(14) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `crea` varchar(20) DEFAULT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `profissao` int DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `profissao_idx` (`profissao`),
  CONSTRAINT `responsavelProfissao` FOREIGN KEY (`profissao`) REFERENCES `profissao` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsaveltecnico`
--

LOCK TABLES `responsaveltecnico` WRITE;
/*!40000 ALTER TABLE `responsaveltecnico` DISABLE KEYS */;
INSERT INTO `responsaveltecnico` VALUES (5,'12345678910','123456','no@email.com','51988887777','123456','2023-09-30 16:55:22',1,'Daniela Lara Duarte'),(6,'12345678911','123456','no@email.com','51911112222','654321','2023-09-30 20:34:30',2,'Regis Pretto Duarte');
/*!40000 ALTER TABLE `responsaveltecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servico` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `valor` decimal(12,2) DEFAULT NULL,
  `template` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `template_idx` (`template`),
  CONSTRAINT `servicoTemplate` FOREIGN KEY (`template`) REFERENCES `template` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Cadastrado'),(2,'Aprovado - Aguardando numeração'),(3,'Aprovado'),(4,'Cancelado');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `template` longtext,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template`
--

LOCK TABLES `template` WRITE;
/*!40000 ALTER TABLE `template` DISABLE KEYS */;
/*!40000 ALTER TABLE `template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termo`
--

DROP TABLE IF EXISTS `termo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `termo` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `dataCriacao` datetime DEFAULT NULL,
  `dataAceiteRequerente` datetime DEFAULT NULL,
  `dataAceiteResponsavel` datetime DEFAULT NULL,
  `projeto` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `projeto_idx` (`projeto`),
  CONSTRAINT `termoProjeto` FOREIGN KEY (`projeto`) REFERENCES `projeto` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termo`
--

LOCK TABLES `termo` WRITE;
/*!40000 ALTER TABLE `termo` DISABLE KEYS */;
/*!40000 ALTER TABLE `termo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-14 14:32:40
