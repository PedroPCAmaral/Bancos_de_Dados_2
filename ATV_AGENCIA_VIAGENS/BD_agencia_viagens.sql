CREATE DATABASE IF NOT EXISTS agencia_viagens;
USE agencia_viagens;


-- FUNCIONARIO --

CREATE TABLE funcionario (
    idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    cargo VARCHAR(50) NOT NULL
);

-- CLIENTE --

CREATE TABLE cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    fk_funcionario_idFuncionario INT NOT NULL,
    FOREIGN KEY (fk_funcionario_idFuncionario) 
        REFERENCES funcionario(idFuncionario)
        ON DELETE CASCADE
);


-- TELEFONE (1:N) --

CREATE TABLE telefone (
    idTelefone INT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(20) NOT NULL,
    fk_cliente_idCliente INT NOT NULL,
    FOREIGN KEY (fk_cliente_idCliente) 
        REFERENCES cliente(idCliente)
        ON DELETE CASCADE
);


-- PACOTE --

CREATE TABLE pacote (
    idPacote INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    duracao_dias INT NOT NULL
);


-- DESTINO --

CREATE TABLE destino (
    idDestino INT AUTO_INCREMENT PRIMARY KEY,
    cidade VARCHAR(50) NOT NULL,
    pais VARCHAR(50) NOT NULL
);


-- CLIENTE_PACOTE (N:N) --

CREATE TABLE cliente_pacote (
    fk_cliente_idCliente INT NOT NULL,
    fk_pacote_idPacote INT NOT NULL,
    PRIMARY KEY (fk_cliente_idCliente, fk_pacote_idPacote),
    FOREIGN KEY (fk_cliente_idCliente) 
        REFERENCES cliente(idCliente)
        ON DELETE CASCADE,
    FOREIGN KEY (fk_pacote_idPacote) 
        REFERENCES pacote(idPacote)
        ON DELETE CASCADE
);


-- PACOTE_DESTINO (N:N) --

CREATE TABLE pacote_destino (
    fk_pacote_idPacote INT NOT NULL,
    fk_destino_idDestino INT NOT NULL,
    PRIMARY KEY (fk_pacote_idPacote, fk_destino_idDestino),
    FOREIGN KEY (fk_pacote_idPacote) 
        REFERENCES pacote(idPacote)
        ON DELETE CASCADE,
    FOREIGN KEY (fk_destino_idDestino) 
        REFERENCES destino(idDestino)
        ON DELETE CASCADE
);



