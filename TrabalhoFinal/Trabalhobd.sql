-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS mydb;
USE mydb;

-- -----------------------------------------------------
-- Table `CATEGORIAS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CATEGORIAS`;
CREATE TABLE IF NOT EXISTS `CATEGORIAS` (
  `id_categoria` INT NOT NULL,
  `nome_categoria` VARCHAR(20) NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DOADORES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DOADORES`;
CREATE TABLE IF NOT EXISTS `DOADORES` (
  `id_doador` INT NOT NULL,
  `nome_doador` VARCHAR(45) NULL,
  `sobrenome` VARCHAR(45) NULL,
  `Rua` VARCHAR(45) NULL,
  `Bairro` VARCHAR(45) NULL,
  `CEP` INT(8) NULL,
  `Numero` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `data_ultima_doacao` DATE NULL,
  PRIMARY KEY (`id_doador`)
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PRODUTOS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRODUTOS`;
CREATE TABLE IF NOT EXISTS `PRODUTOS` (
  `id_produto` INT NOT NULL,
  `nome_produto` VARCHAR(45) NULL,
  `Valor` FLOAT NULL,
  `Quantidade` INT NULL,
  `CATEGORIAS_id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_produto`),
  CONSTRAINT `fk_PRODUTOS_CATEGORIAS1`
    FOREIGN KEY (`CATEGORIAS_id_categoria`) REFERENCES `CATEGORIAS` (`id_categoria`) 
    ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `DOACOES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DOACOES`;
CREATE TABLE IF NOT EXISTS `DOACOES` (
  `id_doacoes` INT NOT NULL,
  `Valor` FLOAT NULL,
  `Quantidade` INT NULL,
  `DOADORES_id_doador` INT NOT NULL,
  `PRODUTOS_id_produto` INT NOT NULL,
  `CATEGORIAS_id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_doacoes`),
  CONSTRAINT `fk_DOACOES_DOADORES1` FOREIGN KEY (`DOADORES_id_doador`) 
    REFERENCES `DOADORES` (`id_doador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DOACOES_PRODUTOS1` FOREIGN KEY (`PRODUTOS_id_produto`) 
    REFERENCES `PRODUTOS` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DOACOES_CATEGORIAS1` FOREIGN KEY (`CATEGORIAS_id_categoria`) 
    REFERENCES `CATEGORIAS` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `TELEFONE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TELEFONE`;
CREATE TABLE IF NOT EXISTS `TELEFONE` (
  `telefone_fixo` BIGINT(14) NULL,
  `celular` BIGINT(14) NULL,
  `DOADORES_id_doador` INT NOT NULL,
  CONSTRAINT `fk_TELEFONE_DOADORES1` FOREIGN KEY (`DOADORES_id_doador`) 
    REFERENCES `DOADORES` (`id_doador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- -----------------------------------------------------
-- Scripts de inserção de dados
-- -----------------------------------------------------
-- Inserir dados em CATEGORIAS
INSERT INTO `CATEGORIAS` (`id_categoria`, `nome_categoria`) VALUES 
(1, 'Alimentos'),
(2, 'Roupas'),
(3, 'Limpeza'),
(4, 'Higiene'),
(5, 'Acessibilidade'),
(6, 'Financeira');

-- Inserir dados em DOADORES
INSERT INTO `DOADORES` (`id_doador`, `nome_doador`, `sobrenome`, `Rua`, `Bairro`, `CEP`, `Numero`, `email`, `data_ultima_doacao`) VALUES
(1, 'João', 'Silva', 'Rua das Flores', 'Centro', 12345678, '101', 'joao.silva@example.com', '2024-11-15'),
(2, 'Maria', 'Oliveira', 'Av. Paulista', 'Bela Vista', 87654321, '202', 'maria.oliveira@example.com', '2024-11-20'),
(3, 'Pedro', 'Santos', 'Rua Azul', 'Jardim', 11223344, '303', 'pedro.santos@example.com', '2024-11-25');

-- Inserir dados em PRODUTOS
INSERT INTO `PRODUTOS` (`id_produto`, `nome_produto`, `Valor`, `Quantidade`, `CATEGORIAS_id_categoria`) VALUES
(1, 'Cadeira de rodas', 5.50, 100, 1), 
(2, 'Camiseta', 15.00, 50, 2),
(3, 'Fralda', 700.00, 20, 3),
(4, 'Sonda alimentar', 500.00, 10, 4),
(5, 'Auxilio Financeiro', 500.00, 10, 6);

-- Inserir dados em DOACOES
INSERT INTO `DOACOES` (`id_doacoes`, `Valor`, `Quantidade`, `CATEGORIAS_id_categoria`, `DOADORES_id_doador`, `PRODUTOS_id_produto`) VALUES
(1, NULL, 50, 1, 1, 1), 
(2, NULL, 30, 2, 2, 2), 
(3, NULL, 2, 3, 3, 3),
(4, NULL, 5, 4, 1, 4),
(5, 50.00, NULL, 6, 1, 5);

-- Inserir dados em TELEFONE
INSERT INTO `TELEFONE` (`telefone_fixo`, `celular`, `DOADORES_id_doador`) VALUES
(1133345566, 11988776655, 1),
(1144456677, 11999887766, 2),
(NULL, 11977665544, 3);
