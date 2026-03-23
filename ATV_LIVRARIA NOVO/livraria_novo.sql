CREATE DATABASE livraria_novo;
USE livraria_novo;

-- AUTOR
CREATE TABLE autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_autor VARCHAR(100),
    email_autor VARCHAR(100),
    cpf VARCHAR(20),
    sexo CHAR(1)
);

-- EDITORA
CREATE TABLE editora (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome_editora VARCHAR(100),
    email VARCHAR(100),
    cnpj VARCHAR(20)
);

-- CATEGORIA
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    tipo_categoria VARCHAR(50)
);

-- TELEFONE
CREATE TABLE telefone (
    id_telefone INT AUTO_INCREMENT PRIMARY KEY,
    ddd VARCHAR(3),
    numero VARCHAR(15),
    id_editora INT,
    FOREIGN KEY (id_editora) REFERENCES editora(id_editora)
);

-- LIVRO (SEM FK!)
CREATE TABLE livro (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20),
    titulo VARCHAR(100),
    data_lancamento DATE,
    numero_pagina INT,
    valor DECIMAL(10,2)
);

-- ASSOCIATIVAS

CREATE TABLE livro_autor (
    id_livro INT,
    id_autor INT,
    PRIMARY KEY (id_livro, id_autor),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

CREATE TABLE livro_editora (
    id_livro INT,
    id_editora INT,
    PRIMARY KEY (id_livro, id_editora),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_editora) REFERENCES editora(id_editora)
);

CREATE TABLE livro_categoria (
    id_livro INT,
    id_categoria INT,
    PRIMARY KEY (id_livro, id_categoria),
    FOREIGN KEY (id_livro) REFERENCES livro(id_livro),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);