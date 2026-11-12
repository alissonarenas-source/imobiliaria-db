-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 12/11/2026 às 12:23
-- Versão do servidor: 8.0.42-0ubuntu0.24.04.2
-- Versão do PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `imobiliaria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `imoveis`
--

CREATE TABLE `imoveis` (
  `id` int NOT NULL,
  `valor` float DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `id_proprietario` int DEFAULT NULL,
  `tipo_negocio` varchar(100) DEFAULT NULL,
  `tamanho` varchar(50) DEFAULT NULL,
  `tipo_imovel` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL
) ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `negocios`
--

CREATE TABLE `negocios` (
  `id` int NOT NULL,
  `id_imovel` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `contrato` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Pessoas`
--

CREATE TABLE `Pessoas` (
  `id` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `senha` varchar(50) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cpf` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `Pessoas`
--

INSERT INTO `Pessoas` (`id`, `nome`, `telefone`, `email`, `senha`, `endereco`, `cpf`) VALUES
(1, 'Alisson dos Santos Arenas', 993843742, 'Alisson.Arenas@escola.pr.gov.br', 'sixseveniense', 'Bairro: Branco Rua: Preto 69-69', '724.336.482-89'),
(2, 'Albert Ribeirinho', 93843743, 'Albert.Ribeirinho@escola.pr.gov.br', 'sixseveniano', 'Bairro: Aura Rua: Ego 67-67', '534.064.020-54'),
(3, 'Beatriz Oliveira Costa', 991234567, 'Beatriz.Costa@escola.pr.gov.br', 'sigmaiano', 'Bairro: Alpha Rua: Beta 10-10', '142.857.963-12'),
(4, 'Carlos Eduardo Lima', 988765432, 'Carlos.Lima@escola.pr.gov.br', 'skibidiano', 'Bairro: Ohio Rua: Rizz 42-42', '369.258.147-85'),
(5, 'Daniela Mendes Souza', 994561238, 'Daniela.Souza@escola.pr.gov.br', 'sixseveniense', 'Bairro: Dia Rua: Noite 24-24', '852.741.963-04'),
(6, 'Eduardo Ferreira Rocha', 997894561, 'Eduardo.Rocha@escola.pr.gov.br', 'mewingiano', 'Bairro: Calvo Rua: Cabeludo 11-11', '654.321.987-33'),
(7, 'Fernanda Alves Martins', 992345678, 'Fernanda.Martins@escola.pr.gov.br', 'sixseveniano', 'Bairro: Quente Rua: Frio 00-00', '789.456.123-77'),
(8, 'Gabriel Pereira Silva', 987654321, 'Gabriel.Silva@escola.pr.gov.br', 'gyattiano', 'Bairro: Sobe Rua: Desce 88-88', '321.654.987-90'),
(9, 'Helena Ribeiro Gomes', 996543210, 'Helena.Gomes@escola.pr.gov.br', 'sixseveniense', 'Bairro: Claro Rua: Escuro 55-55', '951.753.852-61'),
(10, 'Igor Santos Carvalho', 995432109, 'Igor.Carvalho@escola.pr.gov.br', 'npciano', 'Bairro: Bug Rua: Lag 40-40', '753.159.456-28');

-- --------------------------------------------------------

--
-- Estrutura para tabela `relacao_pessoa`
--

CREATE TABLE `relacao_pessoa` (
  `id_pessoa` int NOT NULL,
  `id_tipo_pessoa` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `relacao_pessoa`
--

INSERT INTO `relacao_pessoa` (`id_pessoa`, `id_tipo_pessoa`) VALUES
(1, 1),
(2, 1),
(5, 1),
(7, 1),
(8, 1),
(9, 1),
(2, 2),
(3, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_pessoa`
--

CREATE TABLE `tipo_pessoa` (
  `id` int NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `tipo_pessoa`
--

INSERT INTO `tipo_pessoa` (`id`, `tipo`) VALUES
(1, 'cliente'),
(2, 'proprietario'),
(3, 'usuario');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `imoveis`
--
ALTER TABLE `imoveis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_proprietario` (`id_proprietario`);

--
-- Índices de tabela `negocios`
--
ALTER TABLE `negocios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_imovel` (`id_imovel`),
  ADD KEY `fk_cliente` (`id_cliente`);

--
-- Índices de tabela `Pessoas`
--
ALTER TABLE `Pessoas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `relacao_pessoa`
--
ALTER TABLE `relacao_pessoa`
  ADD PRIMARY KEY (`id_pessoa`,`id_tipo_pessoa`),
  ADD KEY `fk_tipo_pessoa` (`id_tipo_pessoa`);

--
-- Índices de tabela `tipo_pessoa`
--
ALTER TABLE `tipo_pessoa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `imoveis`
--
ALTER TABLE `imoveis`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `negocios`
--
ALTER TABLE `negocios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Pessoas`
--
ALTER TABLE `Pessoas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tipo_pessoa`
--
ALTER TABLE `tipo_pessoa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `imoveis`
--
ALTER TABLE `imoveis`
  ADD CONSTRAINT `fk_proprietario` FOREIGN KEY (`id_proprietario`) REFERENCES `Pessoas` (`id`);

--
-- Restrições para tabelas `negocios`
--
ALTER TABLE `negocios`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `Pessoas` (`id`),
  ADD CONSTRAINT `fk_imovel` FOREIGN KEY (`id_imovel`) REFERENCES `imoveis` (`id`);

--
-- Restrições para tabelas `relacao_pessoa`
--
ALTER TABLE `relacao_pessoa`
  ADD CONSTRAINT `fk_id_pessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `Pessoas` (`id`),
  ADD CONSTRAINT `fk_tipo_pessoa` FOREIGN KEY (`id_tipo_pessoa`) REFERENCES `tipo_pessoa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
