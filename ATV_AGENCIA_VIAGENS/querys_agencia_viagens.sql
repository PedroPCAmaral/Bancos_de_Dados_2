
-- a) Listar os pacotes reservados por cada cliente --

SELECT c.nome AS cliente, p.nome AS pacote
FROM cliente c
JOIN cliente_pacote cp ON c.idCliente = cp.fk_cliente_idCliente
JOIN pacote p ON cp.fk_pacote_idPacote = p.idPacote;


-- b) Mostrar os destinos de cada pacote --

SELECT p.nome AS pacote, d.cidade, d.pais
FROM pacote p
JOIN pacote_destino pd ON p.idPacote = pd.fk_pacote_idPacote
JOIN destino d ON pd.fk_destino_idDestino = d.idDestino;


-- c) Consultar o funcionario responsavel por cada cliente -- 

SELECT c.nome AS cliente, f.nome AS funcionario
FROM cliente c
JOIN funcionario f ON c.fk_funcionario_idFuncionario = f.idFuncionario;


-- d) View de pacotes e destinos --

DROP VIEW IF EXISTS vw_pacote_destino;
CREATE VIEW vw_pacote_destino AS
SELECT p.nome AS pacote, d.cidade, d.pais
FROM pacote p
JOIN pacote_destino pd ON p.idPacote = pd.fk_pacote_idPacote
JOIN destino d ON pd.fk_destino_idDestino = d.idDestino;


-- e) View de reservas detalhadas --

DROP VIEW IF EXISTS vw_reservas_detalhadas;
CREATE VIEW vw_reservas_detalhadas AS
SELECT c.nome AS cliente,
       p.nome AS pacote,
       f.nome AS funcionario
FROM cliente c
JOIN cliente_pacote cp ON c.idCliente = cp.fk_cliente_idCliente
JOIN pacote p ON cp.fk_pacote_idPacote = p.idPacote
JOIN funcionario f ON c.fk_funcionario_idFuncionario = f.idFuncionario;


-- f) Total gasto por cliente (CALCULO) --

SELECT c.nome AS cliente, SUM(p.valor) AS total_gasto
FROM cliente c
JOIN cliente_pacote cp ON c.idCliente = cp.fk_cliente_idCliente
JOIN pacote p ON cp.fk_pacote_idPacote = p.idPacote
GROUP BY c.nome;


-- JOINS EXIGIDOS --


-- 7 --
SELECT * FROM cliente c
JOIN telefone t ON c.idCliente = t.fk_cliente_idCliente;

-- 8 --
SELECT * FROM pacote p
JOIN cliente_pacote cp ON p.idPacote = cp.fk_pacote_idPacote;

-- 9 --
SELECT * FROM destino d
JOIN pacote_destino pd ON d.idDestino = pd.fk_destino_idDestino;

-- 10 --
SELECT c.nome, COUNT(cp.fk_pacote_idPacote)
FROM cliente c
JOIN cliente_pacote cp ON c.idCliente = cp.fk_cliente_idCliente
GROUP BY c.nome;

-- 11 --
SELECT p.nome, COUNT(pd.fk_destino_idDestino)
FROM pacote p
JOIN pacote_destino pd ON p.idPacote = pd.fk_pacote_idPacote
GROUP BY p.nome;

-- 12 --
SELECT f.nome, COUNT(c.idCliente)
FROM funcionario f
JOIN cliente c ON f.idFuncionario = c.fk_funcionario_idFuncionario
GROUP BY f.nome;

-- 13 --
SELECT *
FROM cliente c
LEFT JOIN cliente_pacote cp ON c.idCliente = cp.fk_cliente_idCliente;

-- 14 --
SELECT *
FROM pacote p
LEFT JOIN pacote_destino pd ON p.idPacote = pd.fk_pacote_idPacote;

-- 15 --
SELECT *
FROM cliente c
LEFT JOIN telefone t ON c.idCliente = t.fk_cliente_idCliente;


-- CALCULOS EXTRAS --


SELECT SUM(valor) AS total_pacotes FROM pacote;
SELECT AVG(valor) AS media_pacotes FROM pacote;
SELECT MAX(valor) AS maior_valor FROM pacote;