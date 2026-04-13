-- 1. Criar o database --
CREATE DATABASE livro_120;
USE livro_120;

-- 2. Criar a tabela principal --
CREATE TABLE livro (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(150),
    isbn VARCHAR(20),
    num_paginas INT,
    valor DECIMAL(10,2)
);

-- Tabela de Auditoria --
CREATE TABLE log_livro (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_livro INT,
    acao VARCHAR(50),
    usuario VARCHAR(100),
    data_processo DATETIME,
    valor_antigo DECIMAL(10,2),
    valor_novo DECIMAL(10,2)
);
