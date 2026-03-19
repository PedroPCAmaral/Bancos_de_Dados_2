CREATE DATABASE empregado_departamento_120;

USE empregado_departamento_120;

-- Tabela Departamento
CREATE TABLE Departamento (
    IdDepartamento INT PRIMARY KEY,
    NomeDepartamento VARCHAR(50),
    Endereco VARCHAR(100)
);

INSERT INTO Departamento VALUES
(1, 'RH', 'Rua A'),
(2, 'TI', 'Rua B'),
(3, 'Financeiro', 'Rua C'),
(4, 'Marketing', 'Rua D');

-- Tabela Empregado 
CREATE TABLE Empregado (
    IdEmpregado INT PRIMARY KEY,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Salario DECIMAL(10,2),
    Sexo CHAR(1),
    Id_Departamento INT,
    FOREIGN KEY (Id_Departamento) REFERENCES Departamento(IdDepartamento)
);

INSERT INTO Empregado VALUES
(1, 'Ana', 'Souza', 2000.00, 'F', 1),
(2, 'Carlos', 'Silva', 3000.00, 'M', 2),
(3, 'Marina', 'Oliveira', 2500.00, 'F', 3),
(4, 'Joao', 'Pereira', 4000.00, 'M', 2),
(5, 'Paula', 'Costa', 3500.00, 'F', 4),
(6, 'Pedro', 'Almeida', 2800.00, 'M', 1),
(7, 'Juliana', 'Gomes', 3200.00, 'F', 3),
(8, 'Lucas', 'Rocha', 2900.00, 'M', 4),
(9, 'Fernanda', 'Ribeiro', 2700.00, 'F', 2),
(10, 'Bruno', 'Martins', 3100.00, 'M', 1);