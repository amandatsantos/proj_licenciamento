-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.33 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para licencimento_projetofinal
CREATE DATABASE IF NOT EXISTS `licencimento_projetofinal` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `licencimento_projetofinal`;

-- Copiando estrutura para tabela licencimento_projetofinal.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_veiculo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela licencimento_projetofinal.categoria: ~1 rows (aproximadamente)
DELETE FROM `categoria`;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`idcategoria`, `categoria_veiculo`) VALUES
	(1, 'familiar medio'),
	(2, 'picape compacta'),
	(3, 'SUV  compacto'),
	(4, 'jipe'),
	(5, 'conversivel medio'),
	(6, 'caminhão urbano'),
	(7, 'furgão');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela licencimento_projetofinal.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `nome_estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela licencimento_projetofinal.estado: ~0 rows (aproximadamente)
DELETE FROM `estado`;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`idestado`, `nome_estado`) VALUES
	(1, 'BA'),
	(2, 'CE'),
	(3, 'PI'),
	(4, 'MA'),
	(5, 'AL'),
	(6, 'SE'),
	(7, 'RN');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;

-- Copiando estrutura para tabela licencimento_projetofinal.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `idmarca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idmarca`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela licencimento_projetofinal.marca: ~0 rows (aproximadamente)
DELETE FROM `marca`;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`idmarca`, `marca`) VALUES
	(1, 'Volkswagen '),
	(2, 'Fiat '),
	(3, 'Hyundai '),
	(4, 'Jeep'),
	(5, 'Renault '),
	(6, 'JAC'),
	(7, 'Fiat ');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Copiando estrutura para tabela licencimento_projetofinal.modelo
CREATE TABLE IF NOT EXISTS `modelo` (
  `idmodelo` int(11) NOT NULL AUTO_INCREMENT,
  `modelo_nome` varchar(50) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmodelo`),
  KEY `FK_modelo_categoria` (`categoria_id`),
  CONSTRAINT `FK_modelo_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`idcategoria`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela licencimento_projetofinal.modelo: ~0 rows (aproximadamente)
DELETE FROM `modelo`;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` (`idmodelo`, `modelo_nome`, `categoria_id`) VALUES
	(1, 'Volkswagen Golf Variant', 3),
	(2, 'Fiat Strada', 2),
	(3, 'Hyundai Creta', 1),
	(4, 'Jeep Wrangler', 4),
	(5, 'Renault Mégane Coupe Cabriolet', 5),
	(6, 'JAC V260', 6),
	(7, 'Fiat Doblò Cargo', 7);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;

-- Copiando estrutura para tabela licencimento_projetofinal.municipio
CREATE TABLE IF NOT EXISTS `municipio` (
  `idmunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `nome_municipio` varchar(150) DEFAULT NULL,
  `estado_idestado` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmunicipio`),
  KEY `FK_municipio_estado` (`estado_idestado`),
  CONSTRAINT `FK_municipio_estado` FOREIGN KEY (`estado_idestado`) REFERENCES `estado` (`idestado`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela licencimento_projetofinal.municipio: ~0 rows (aproximadamente)
DELETE FROM `municipio`;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` (`idmunicipio`, `nome_municipio`, `estado_idestado`) VALUES
	(1, 'Itapetinga', 1),
	(2, 'Itapipoca ', 2),
	(3, 'Imperatriz', 4),
	(4, 'Penedo', 5),
	(5, 'Teresina', 3),
	(6, 'Lagarto', 6),
	(7, 'Mossoró', 7);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;

-- Copiando estrutura para tabela licencimento_projetofinal.proprietario
CREATE TABLE IF NOT EXISTS `proprietario` (
  `nome` varchar(50) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `bairo` varchar(100) DEFAULT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `RG` varchar(12) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `idproprietario` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idproprietario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela licencimento_projetofinal.proprietario: ~0 rows (aproximadamente)
DELETE FROM `proprietario`;
/*!40000 ALTER TABLE `proprietario` DISABLE KEYS */;
INSERT INTO `proprietario` (`nome`, `endereco`, `bairo`, `CPF`, `telefone`, `RG`, `data_nascimento`, `idproprietario`) VALUES
	('Pedro', 'rua 2', 'bairro 1', '12312312312', '12345-12345', '123456789789', '2000-11-14', 1),
	('João', 'rua 1', 'bairro 3', '32112365478', '32145-32145', '456321023046', '2001-10-24', 2),
	('Lulu', 'rua 3', 'bairro 5', '45698712365', '44569-89654', '456987123456', '1999-02-14', 3),
	('Lua', 'rua 4 ', 'bairro 2', '89745612302', '32145-44569', '789456321023', '1998-01-14', 4),
	('Lila', 'rua 6 ', 'bairro 7', '36985478512', '56987-89654', '456987413665', '2001-11-14', 5),
	('Maria', 'rua 5', 'bairro 6', '45654136214', '45694-89623', '987456123012', '2000-03-04', 6),
	('Laura', 'rua 7', 'bairro 4', '78965412264', '65474-89654', '777777777777', '1995-11-14', 7);
/*!40000 ALTER TABLE `proprietario` ENABLE KEYS */;

-- Copiando estrutura para tabela licencimento_projetofinal.veiculo
CREATE TABLE IF NOT EXISTS `veiculo` (
  `idveiculo` int(11) NOT NULL AUTO_INCREMENT,
  `placaVeiculo` varchar(10) DEFAULT NULL,
  `anoveiculo` date DEFAULT NULL,
  `proprietario_idproprietario` int(11) DEFAULT NULL,
  `marca_idmarca` int(11) DEFAULT NULL,
  `municipio_idmunicipio` int(11) DEFAULT NULL,
  `categoria_idcategoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idveiculo`),
  KEY `proprietario_idproprietario` (`proprietario_idproprietario`),
  KEY `marca_idmarca` (`marca_idmarca`),
  KEY `municipio_idmunicipio` (`municipio_idmunicipio`),
  KEY `categoria_idcategoria` (`categoria_idcategoria`),
  CONSTRAINT `FK_veiculo_categoria` FOREIGN KEY (`categoria_idcategoria`) REFERENCES `categoria` (`idcategoria`) ON UPDATE CASCADE,
  CONSTRAINT `FK_veiculo_marca` FOREIGN KEY (`marca_idmarca`) REFERENCES `marca` (`idmarca`) ON UPDATE CASCADE,
  CONSTRAINT `FK_veiculo_municipio` FOREIGN KEY (`municipio_idmunicipio`) REFERENCES `municipio` (`idmunicipio`) ON UPDATE CASCADE,
  CONSTRAINT `FK_veiculo_proprietario` FOREIGN KEY (`proprietario_idproprietario`) REFERENCES `proprietario` (`idproprietario`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela licencimento_projetofinal.veiculo: ~0 rows (aproximadamente)
DELETE FROM `veiculo`;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` (`idveiculo`, `placaVeiculo`, `anoveiculo`, `proprietario_idproprietario`, `marca_idmarca`, `municipio_idmunicipio`, `categoria_idcategoria`) VALUES
	(1, 'ABC546S5DF', '2021-11-14', 4, 3, 2, 3),
	(2, 'CDA569F6CF', '2021-11-14', 5, 7, 4, 5),
	(3, 'DFSD455D5F', '2021-11-14', 3, 6, 7, 6),
	(4, 'SDFE5987SD', '2021-11-14', 2, 4, 5, 4),
	(5, 'QUJG4569DF', '2021-11-14', 1, 1, 6, 1),
	(6, 'POISD456SD', '2021-11-14', 6, 2, 1, 2),
	(7, 'TYUO1554FD', '2021-11-14', 7, 5, 3, 5);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
