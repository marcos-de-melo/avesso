-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 07-Nov-2024 às 19:11
-- Versão do servidor: 8.0.21
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbavesso`
--
CREATE DATABASE IF NOT EXISTS `dbavesso` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dbavesso`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbhashtags`
--

DROP TABLE IF EXISTS `tbhashtags`;
CREATE TABLE IF NOT EXISTS `tbhashtags` (
  `idUsuario` int NOT NULL,
  `tituloHashtag` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  KEY `usuario_id_fk` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tblikes`
--

DROP TABLE IF EXISTS `tblikes`;
CREATE TABLE IF NOT EXISTS `tblikes` (
  `idUsuario` int NOT NULL,
  `idUsuarioLike` int NOT NULL,
  `dataLike` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `usuarioLike_id_fk` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbmatches`
--

DROP TABLE IF EXISTS `tbmatches`;
CREATE TABLE IF NOT EXISTS `tbmatches` (
  `idMatche` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `idUsuarioMatch` int NOT NULL,
  `dataMatche` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idMatche`),
  KEY `usuario_id4_fk` (`idUsuario`),
  KEY `usuario_id5_fk` (`idUsuarioMatch`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tbmatches`
--

INSERT INTO `tbmatches` (`idMatche`, `idUsuario`, `idUsuarioMatch`) VALUES
(1, 1, 2),
(2, 5, 4),
(3, 5, 3),
(4, 2, 1),
(5, 4, 5),
(6, 3, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbmensagens`
--

DROP TABLE IF EXISTS `tbmensagens`;
CREATE TABLE IF NOT EXISTS `tbmensagens` (
  `idMensagem` int NOT NULL AUTO_INCREMENT,
  `idRemetente` int NOT NULL,
  `idDestinatario` int NOT NULL,
  `conteudoMsg` text COLLATE utf8mb4_general_ci NOT NULL,
  `msgVisualizada` tinyint NOT NULL DEFAULT '0',
  `dataMsg` timestamp NOT NULL,
  PRIMARY KEY (`idMensagem`),
  KEY `remetente_id_fk` (`idRemetente`),
  KEY `destinatario_id_fk` (`idDestinatario`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tbmensagens`
--

INSERT INTO `tbmensagens` (`idMensagem`, `idRemetente`, `idDestinatario`, `conteudoMsg`, `msgVisualizada`, `dataMsg`) VALUES
(3, 2, 1, 'teste de msg', 1, '2024-11-07 03:00:00'),
(4, 1, 3, 'teste de msg', 1, '2024-11-07 03:00:00'),
(5, 1, 3, 'teste de msg', 1, '2024-11-07 03:00:00'),
(6, 1, 3, 'teste de msg', 1, '0000-00-00 00:00:00'),
(7, 1, 3, 'teste de msg', 1, '2024-11-07 13:45:24'),
(8, 1, 3, 'teste de msg', 1, '2024-11-07 13:45:24'),
(9, 1, 3, 'teste de msg', 1, '2024-11-07 03:00:00'),
(11, 2, 1, 'teste da juliana', 1, '2024-11-07 14:23:54'),
(14, 2, 1, 'teste da juliana', 1, '2024-11-07 14:27:39'),
(16, 2, 1, 'Oi Marcos', 1, '2024-11-07 14:28:06'),
(17, 2, 1, 'll', 1, '2024-11-07 14:30:26'),
(20, 2, 1, 'teste', 1, '2024-11-07 14:49:46'),
(22, 2, 1, 'fdgfdg', 1, '2024-11-07 14:57:08'),
(27, 2, 1, 'sdfdsf', 1, '2024-11-07 14:59:57'),
(28, 3, 2, 'teste de msg', 1, '2024-11-07 14:43:00'),
(29, 3, 2, 'teste de msg', 1, '2024-11-07 14:43:00'),
(30, 3, 2, 'teste de msg', 1, '2024-11-07 14:43:00'),
(31, 3, 2, 'teste de msg', 1, '2024-11-07 14:43:00'),
(32, 3, 2, 'teste de msg', 1, '2024-11-07 14:43:00'),
(33, 2, 1, 'sdfdsf', 1, '2024-11-07 15:12:37'),
(54, 2, 1, 'hhhhh', 1, '2024-11-07 19:37:51'),
(55, 2, 1, 'dfsdf', 1, '2024-11-07 19:39:45'),
(57, 4, 5, 'Oi Lara', 1, '2024-11-07 21:10:42'),
(58, 4, 5, 'Oi HenrY', 1, '2024-11-07 21:11:03'),
(59, 5, 4, 'Oi Lara', 1, '2024-11-07 21:11:09'),
(60, 4, 5, 'ggg', 1, '2024-11-07 21:12:07'),
(61, 5, 4, 'fff', 1, '2024-11-07 21:15:03'),
(62, 4, 5, 'cxzczx', 1, '2024-11-07 21:15:29'),
(63, 4, 5, 'sdfdsf', 1, '2024-11-07 21:15:37'),
(64, 4, 5, 'sdad', 1, '2024-11-07 21:22:45'),
(65, 4, 5, 'teste', 1, '2024-11-07 21:23:55'),
(66, 4, 5, 'asdfasd', 1, '2024-11-07 21:33:25'),
(67, 4, 5, 'asdfas', 1, '2024-11-07 21:36:57'),
(68, 5, 4, 'dsfdsf', 1, '2024-11-07 21:37:13'),
(69, 4, 5, 'zxC  vcdsafs fasdf asd fasd fasdfasd fasd fadsfasd asdf asdfasd f.', 0, '2024-11-07 22:06:12'),
(70, 4, 5, 'asdfasd ads fasdf asdf asd fasdfsd asdfds ds fdsf adsfda ads fasdf asdf asdf adsfdsa fds fasdf asd fasdf aasd fasdfasdf asdfasd asd fasd fadsf adsfadsf asdfasdfasdfasdf asdfasf sdafsa', 0, '2024-11-07 22:06:34'),
(71, 4, 5, 'sda', 0, '2024-11-07 22:07:04'),
(72, 4, 5, 'fsdfds', 0, '2024-11-07 22:09:09'),
(73, 3, 5, 'tstes', 0, '2024-11-07 22:10:30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbpaises`
--

DROP TABLE IF EXISTS `tbpaises`;
CREATE TABLE IF NOT EXISTS `tbpaises` (
  `idPais` int NOT NULL AUTO_INCREMENT,
  `nomePais` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tbpaises`
--

INSERT INTO `tbpaises` (`idPais`, `nomePais`) VALUES
(1, 'Brasil'),
(2, 'USA');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbperguntas`
--

DROP TABLE IF EXISTS `tbperguntas`;
CREATE TABLE IF NOT EXISTS `tbperguntas` (
  `idPergunta` int NOT NULL AUTO_INCREMENT,
  `tituloPergunta` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`idPergunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbusuarios`
--

DROP TABLE IF EXISTS `tbusuarios`;
CREATE TABLE IF NOT EXISTS `tbusuarios` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `emailUsuario` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `telefoneUsuario` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `senhaUsuario` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `nomeUsuario` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `sobrenomeUsuario` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `dataNascUsuario` date DEFAULT NULL,
  `idPais` int DEFAULT NULL,
  `bioUsuario` text COLLATE utf8mb4_general_ci,
  `sexualidadeUsuario` enum('Hétero','Homossexual','Bissexual','Outro','Prefiro não informar') COLLATE utf8mb4_general_ci NOT NULL,
  `generoUsuario` enum('Masculino','Feminino','Outro','Prefiro não informar') COLLATE utf8mb4_general_ci NOT NULL,
  `preferenciaUsuario` enum('Homem','Mulher','Todos') COLLATE utf8mb4_general_ci NOT NULL,
  `fotoPerfilUsuario` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `pais_id_fk` (`idPais`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tbusuarios`
--

INSERT INTO `tbusuarios` (`idUsuario`, `emailUsuario`, `telefoneUsuario`, `senhaUsuario`, `nomeUsuario`, `sobrenomeUsuario`, `dataNascUsuario`, `idPais`, `bioUsuario`, `sexualidadeUsuario`, `generoUsuario`, `preferenciaUsuario`, `fotoPerfilUsuario`) VALUES
(1, 'marcdmelo@gmail.com', '(19) 9999-9999', '123456', 'Marcos', 'de Melo', '1976-10-25', 1, NULL, 'Hétero', 'Masculino', 'Mulher', 'http://github.com/marcos-de-melo.png'),
(2, 'juliana@gmail.com', '(78) 88888-8888', '654321', 'Juliana', 'Aparecida', '1987-08-20', 1, NULL, 'Hétero', 'Feminino', 'Homem', 'http://github.com/nerdschooltech.png'),
(3, 'nic@gmail.com', '(88) 88888-8888', '852963', 'nicoly', 'Melo', '1987-08-20', 2, NULL, 'Hétero', 'Feminino', 'Homem', 'http://github.com/nerdschooltech.png'),
(4, 'lara@gmail.com', '(88) 84588-7858', '123456', 'Lara', 'Melo', '2015-08-15', 1, NULL, 'Hétero', 'Feminino', 'Homem', 'http://github.com/nerdschooltech.png'),
(5, 'henry@dog.com', '(88) 84588-7854', '123456', 'Henry', 'Gog', '2015-08-15', 2, NULL, 'Hétero', 'Masculino', 'Mulher', 'http://github.com/nerdschooltech.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbusuario_responde_pergunta`
--

DROP TABLE IF EXISTS `tbusuario_responde_pergunta`;
CREATE TABLE IF NOT EXISTS `tbusuario_responde_pergunta` (
  `idUsuario` int NOT NULL,
  `idPergunta` int NOT NULL,
  `respostaUsuario` text COLLATE utf8mb4_general_ci NOT NULL,
  KEY `usuario2_id_fk` (`idUsuario`),
  KEY `pergunta_id_fk` (`idPergunta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbhashtags`
--
ALTER TABLE `tbhashtags`
  ADD CONSTRAINT `usuario_id_fk` FOREIGN KEY (`idUsuario`) REFERENCES `tbusuarios` (`idUsuario`);

--
-- Limitadores para a tabela `tblikes`
--
ALTER TABLE `tblikes`
  ADD CONSTRAINT `usuario_id3_fk` FOREIGN KEY (`idUsuario`) REFERENCES `tbusuarios` (`idUsuario`),
  ADD CONSTRAINT `usuarioLike_id_fk` FOREIGN KEY (`idUsuario`) REFERENCES `tbusuarios` (`idUsuario`);

--
-- Limitadores para a tabela `tbmatches`
--
ALTER TABLE `tbmatches`
  ADD CONSTRAINT `usuario_id4_fk` FOREIGN KEY (`idUsuario`) REFERENCES `tbusuarios` (`idUsuario`),
  ADD CONSTRAINT `usuario_id5_fk` FOREIGN KEY (`idUsuarioMatch`) REFERENCES `tbusuarios` (`idUsuario`);

--
-- Limitadores para a tabela `tbmensagens`
--
ALTER TABLE `tbmensagens`
  ADD CONSTRAINT `destinatario_id_fk` FOREIGN KEY (`idDestinatario`) REFERENCES `tbusuarios` (`idUsuario`),
  ADD CONSTRAINT `remetente_id_fk` FOREIGN KEY (`idRemetente`) REFERENCES `tbusuarios` (`idUsuario`);

--
-- Limitadores para a tabela `tbusuarios`
--
ALTER TABLE `tbusuarios`
  ADD CONSTRAINT `pais_id_fk` FOREIGN KEY (`idPais`) REFERENCES `tbpaises` (`idPais`);

--
-- Limitadores para a tabela `tbusuario_responde_pergunta`
--
ALTER TABLE `tbusuario_responde_pergunta`
  ADD CONSTRAINT `pergunta_id_fk` FOREIGN KEY (`idPergunta`) REFERENCES `tbperguntas` (`idPergunta`),
  ADD CONSTRAINT `usuario2_id_fk` FOREIGN KEY (`idUsuario`) REFERENCES `tbusuarios` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
