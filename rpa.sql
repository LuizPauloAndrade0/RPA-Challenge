-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 21-Ago-2021 às 17:24
-- Versão do servidor: 5.5.28-log
-- versão do PHP: 5.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `rpa`
--
CREATE DATABASE IF NOT EXISTS `rpa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `rpa`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbcontato`
--

CREATE TABLE IF NOT EXISTS `tbcontato` (
  `Idcontato` int(11) NOT NULL AUTO_INCREMENT,
  `Pessoa` int(11) DEFAULT NULL,
  `Email` varchar(150) DEFAULT NULL,
  `DDD` varchar(3) DEFAULT NULL,
  `Telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Idcontato`),
  KEY `fk_contato` (`Pessoa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbcontato`
--

INSERT INTO `tbcontato` (`Idcontato`, `Pessoa`, `Email`, `DDD`, `Telefone`) VALUES
(1, 1, 'ma@gmail.com', '17', '981144461'),
(2, 2, 'tarsila.amaral@gmail.com', '41', '996574545'),
(3, 3, 'lobato@hotmail.com', '61', '988241212');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbpessoa`
--

CREATE TABLE IF NOT EXISTS `tbpessoa` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(300) DEFAULT NULL,
  `Cidade` varchar(300) DEFAULT NULL,
  `Estado` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbpessoa`
--

INSERT INTO `tbpessoa` (`Id`, `Nome`, `Cidade`, `Estado`) VALUES
(1, 'Machado de Assis (Teste)', 'SJR Preto', 'São Paulo'),
(2, 'Tarsila do Amaral (Teste)', 'Curitiba', 'Paraná'),
(3, 'Monteiro Lobato (Teste)', 'Brasília', 'Distrito Federal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbstatusmensagemenviada`
--

CREATE TABLE IF NOT EXISTS `tbstatusmensagemenviada` (
  `Idstatus` int(11) NOT NULL AUTO_INCREMENT,
  `Pessoa` int(11) DEFAULT NULL,
  `Contato` int(11) DEFAULT NULL,
  `Assunto` varchar(1000) DEFAULT NULL,
  `MensagemEnviada` varchar(8000) DEFAULT NULL,
  `RetornoSite` varchar(8000) DEFAULT NULL,
  PRIMARY KEY (`Idstatus`),
  KEY `fk_pessoa` (`Pessoa`),
  KEY `fk_contato_status` (`Contato`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbstatusmensagemenviada`
--

INSERT INTO `tbstatusmensagemenviada` (`Idstatus`, `Pessoa`, `Contato`, `Assunto`, `MensagemEnviada`, `RetornoSite`) VALUES
(1, 1, 1, 'Cotação', 'Preciso de uma cotação\r\npara veículo XPTO\r\n', NULL),
(2, 2, 2, 'Dúvida', 'Como eu encontro em\r\ncontato com meu correto?\r\n', NULL),
(3, 3, 3, 'Sugestão', 'Poderia haver uma\r\npágina para buscar corretoras próxima a mim.\r\n', NULL);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tbcontato`
--
ALTER TABLE `tbcontato`
  ADD CONSTRAINT `fk_contato` FOREIGN KEY (`Pessoa`) REFERENCES `tbpessoa` (`Id`);

--
-- Limitadores para a tabela `tbstatusmensagemenviada`
--
ALTER TABLE `tbstatusmensagemenviada`
  ADD CONSTRAINT `fk_contato_status` FOREIGN KEY (`Contato`) REFERENCES `tbcontato` (`Idcontato`),
  ADD CONSTRAINT `fk_pessoa` FOREIGN KEY (`Pessoa`) REFERENCES `tbpessoa` (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
