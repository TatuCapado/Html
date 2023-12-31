-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Out-2022 às 00:03
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cardapio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
CREATE DATABASE IF NOT EXISTS `calorysistemas_delivery`;
--
USE `calorysistemas_delivery`;

-- Criação da Tabela 'admin' do sistema
CREATE TABLE IF NOT EXISTS `admin` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(100) DEFAULT NULL,
    `email` VARCHAR(100) DEFAULT NULL,
    `password` VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `admin` dos produtos
--

INSERT INTO `admin` ( `nome`, `email`, `password` ) VALUES ( 'adm', 'adm@email.com', '123' );

-- Criação da Tabela 'categoria' dos produtos

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categorias` dos produtos
--

INSERT INTO `categorias` (`id`, `nome`, `imagem`, `status`) VALUES
(1, 'Bebidas', '', 1),
(2, 'Combos', '', 1),
(3, 'Lanches', '', 1);

-- --------------------------------------------------------

--
-- Criação da tabela `forma_pgto`
--

CREATE TABLE `forma_pgto` (
  `id` int(11) NOT NULL,
  `opcao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `forma_pgto`
--

INSERT INTO `forma_pgto` (`id`, `opcao`) VALUES
(1, 'Pix'),
(2, 'Cartão'),
(3, 'Dinheiro');

-- --------------------------------------------------------

--
-- Criação da tabela `pedidosvendas`
--

CREATE TABLE `pedidosvendas` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `cliente_nome` varchar(200) NOT NULL,
  `cliente_contato` varchar(50) NOT NULL,
  `cliente_endereco` text NOT NULL,
  `cliente_opc_pgt` int(11) NOT NULL,
  `observacao` text NOT NULL,
  `order_date` date NOT NULL DEFAULT current_timestamp(),
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Criação da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `price` double NOT NULL,
  `description` text NOT NULL,
  `images` text NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `name`, `id_categoria`, `price`, `description`, `images`, `status`) VALUES
(1, 'Esfirra', 3, 20.5, 'Teste', 'Esfirra.jpg', 1),
(2, 'Agua', 1, 25, 'Teste', 'agua.jpg', 1),
(3, 'Pizza Bacon', 3, 22, 'Teste', 'Pizza-Bacon.jpg', 1),
(4, 'Pizza Calabresa', 3, 30, 'Teste', 'Pizza-Calabresa.jpg', 1),
(6, 'Coca Cola 2L', 1, 9, 'Teste', 'coca.jpg', 1),
(7, 'Pizza-Hava', 3, 20, 'Teste', 'Pizza-Hava.jpg', 1),
(8, 'Fanta', 1, 8, 'Teste', 'fanta.jpg', 1),
(9, 'Combo Pizza', 2, 30, 'Teste', 'combo-classico.jpg', 1),
(10, 'Pizza-Moda', 2, 25, 'Teste', 'Pizza-Moda.jpg', 1);

--
-- Criação da tabela `contatos`
--

CREATE TABLE IF NOT EXISTS `contatos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `assunto` VARCHAR(255) NOT NULL,
  `mensagem` TEXT NOT NULL,
  `data_insercao` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `forma_pgto`
--
ALTER TABLE `forma_pgto`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pedidosvendas`
--
ALTER TABLE `pedidosvendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `cliente_opc_pgt` (`cliente_opc_pgt`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `forma_pgto`
--
ALTER TABLE `forma_pgto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pedidosvendas`
--
ALTER TABLE `pedidosvendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedidosvendas`
--
ALTER TABLE `pedidosvendas`
  ADD CONSTRAINT `pedidosvendas_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `pedidosvendas_ibfk_2` FOREIGN KEY (`cliente_opc_pgt`) REFERENCES `forma_pgto` (`id`);

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
