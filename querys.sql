-- 1. Projetar todos os veículos de uma determinada cor
SELECT * FROM veiculo 
WHERE cor = 'Preto';

-- 2. Projetar todas as placas cadastradas no sistema
SELECT * FROM veiculo;

-- 3. Projetar modelos e placas de todos os veículos
SELECT modelo, placa FROM veiculo;

-- 4. Projetar o nome de todos os clientes
SELECT nome FROM cliente;

-- 5. Projetar cpf, nome de todos clientes
SELECT cpf, nome FROM cliente;

-- 6. Projetar nome, cpf, telefone de todos os clientes 
SELECT c.nome, c.cpf, t.numero
FROM cliente c
JOIN telefone t ON c.id_cliente = t.id_cliente;

-- 7. Projetar todos os tickets cadastrados
SELECT * FROM ticket;

-- 8. Projetar os tickets de um determinado horário de entrada
SELECT * FROM ticket 
WHERE hora_entrada = '2026-03-25 08:00:00';

-- 9. Projetar os tickets de um determinado horário de saída
SELECT * FROM ticket 
WHERE hora_saida = '2026-03-25 10:00:00';

-- 10. Projetar todas as vagas com status disponível ou livre
SELECT * FROM vaga 
WHERE status = 'Livre';

-- 11. Projetar todos os tipos de vagas que estejam disponíveis
SELECT DISTINCT tipo 
FROM vaga 
WHERE status = 'Livre';

-- 12. Projetar nomes de clientes e veículos de uma determinada cor
SELECT c.nome, v.modelo, v.cor
FROM cliente c
JOIN veiculo v ON c.id_cliente = v.id_cliente
WHERE v.cor = 'Preto';

-- 13. Projetar os idcliente de um determinado modelo de veículo
SELECT id_veiculo, modelo
FROM veiculo
WHERE modelo = 'HB20';

-- 14. Projetar todos os dados dos clientes de uma determinada placa
SELECT c.*, v.placa
FROM cliente c
JOIN veiculo v ON c.id_cliente = v.id_cliente
WHERE v.placa = 'ABC1D23';

-- 15. Projetar os nomes, cpf e os tickets de uma determinada hora de entrada
SELECT c.nome, c.cpf, t.id_ticket
FROM cliente c
JOIN veiculo v ON c.id_cliente = v.id_cliente
JOIN ticket t ON v.id_veiculo = t.id_veiculo
WHERE t.hora_entrada = '2026-03-25 08:00:00';

-- 16. Projetar os nomes, cpf e os tickets de uma determinada hora de saída
SELECT c.nome, c.cpf, t.id_ticket
FROM cliente c
JOIN veiculo v ON c.id_cliente = v.id_cliente
JOIN ticket t ON v.id_veiculo = t.id_veiculo
WHERE t.hora_saida = '2026-03-25 10:00:00';

-- 17. Determinar nomes, cpf, tickets e os tipos de vagas cadastrados
SELECT c.nome, c.cpf, t.id_ticket, vg.tipo
FROM cliente c
JOIN veiculo v ON c.id_cliente = v.id_cliente
JOIN ticket t ON v.id_veiculo = t.id_veiculo
JOIN vaga vg ON t.id_vaga = vg.id_vaga;

-- 18. Projetar nome, cpf, modelo, cor, ticket e tipo de vaga
SELECT c.nome, c.cpf, v.modelo, v.cor, t.id_ticket, vg.tipo
FROM cliente c
JOIN veiculo v ON c.id_cliente = v.id_cliente
JOIN ticket t ON v.id_veiculo = t.id_veiculo
JOIN vaga vg ON t.id_vaga = vg.id_vaga;

-- 19. Projetar nome, modelo, ticket e tipo de vaga por hora de entrada
SELECT c.nome, v.modelo, t.id_ticket, vg.tipo
FROM cliente c
JOIN veiculo v ON c.id_cliente = v.id_cliente
JOIN ticket t ON v.id_veiculo = t.id_veiculo
JOIN vaga vg ON t.id_vaga = vg.id_vaga
WHERE t.hora_entrada = '2026-03-25 08:00:00';

-- 20. Projetar nome, modelo, ticket e tipo de vaga por hora de saída
SELECT c.nome, v.modelo, t.id_ticket, vg.tipo
FROM cliente c
JOIN veiculo v ON c.id_cliente = v.id_cliente
JOIN ticket t ON v.id_veiculo = t.id_veiculo
JOIN vaga vg ON t.id_vaga = vg.id_vaga
WHERE t.hora_saida = '2026-03-25 10:00:00';

-- 21. Fazer alteração no modelo de carro de 2 clientes
UPDATE veiculo 
SET modelo = 'Fusion' 
WHERE id_cliente IN (1,2);

-- 22. Excluir um registro de cliente
DELETE FROM telefone 
WHERE id_cliente = 22;

DELETE FROM cliente 
WHERE id_cliente = 22;

-- 23. Inserir mais 1 cliente 
INSERT INTO cliente (nome, cpf, data_nascimento, sexo, gestante)
VALUES ('Autoridade','999.999.999-99','1980-01-01','M',FALSE);

-- inserir telefone do cliente novo
INSERT INTO telefone (numero, id_cliente)
VALUES ('(62)99999-9999', LAST_INSERT_ID());



-- REGRAS DE NEGÓCIO --


-- Clientes idosos (60+)
SELECT nome 
FROM cliente
WHERE TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) >= 60;

-- Clientes gestantes
SELECT nome 
FROM cliente
WHERE gestante = TRUE;

-- Mulheres
SELECT nome 
FROM cliente
WHERE sexo = 'F';