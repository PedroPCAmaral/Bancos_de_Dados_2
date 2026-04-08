-- 1. Criar e usar o banco
CREATE DATABASE floricultura_120;
USE floricultura_120;

-- 2. Tabela Cliente
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);

-- 3. Tabela Telefone (Relacionada a Cliente)
CREATE TABLE telefone_cliente (
    id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR(20) NOT NULL,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

-- 4. Tabela Local de Entrega
CREATE TABLE local_entrega (
    id_local INT PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(150) NOT NULL,
    cidade VARCHAR(50),
    complemento VARCHAR(100)
);

-- 5. Tabela Tipo de Produto
CREATE TABLE tipo_produto (
    id_tipo INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL
);

-- 6. Tabela Produto
CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    id_tipo INT,
    FOREIGN KEY (id_tipo) REFERENCES tipo_produto(id_tipo)
);

-- 7. Tabela Encomenda
CREATE TABLE encomenda (
    id_encomenda INT PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    status VARCHAR(50),
    id_cliente INT,
    id_local INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_local) REFERENCES local_entrega(id_local)
);

-- 8. Tabela Associativa: Item_Encomenda (A 7ª tabela que une Encomenda e Produto)
CREATE TABLE item_encomenda (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT NOT NULL,
    id_encomenda INT,
    id_produto INT,
    FOREIGN KEY (id_encomenda) REFERENCES encomenda(id_encomenda),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);