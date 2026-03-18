-- RESOLUÇÃO DAS QUERIES --

-- 1 --
SELECT nome, sobrenome, email 
FROM Alunos 
ORDER BY sobrenome ASC;

-- 2 --
SELECT logradouro, cidade, cep 
FROM Enderecos 
WHERE estado = 'SP';

-- 3 --
SELECT a.nome, t.ddd, t.numero 
FROM Alunos a
JOIN Telefones t ON a.id_aluno = t.id_aluno
WHERE t.ddd = '11';

SELECT ddd, numero
FROM Telefones
WHERE ddd = '11';


-- 4 --
SELECT nome, data_nascimento 
FROM Alunos 
WHERE data_nascimento < '2000-01-01';

-- 5 --
SELECT CONCAT(a.nome, ' ', a.sobrenome) AS nome_completo, e.logradouro, e.cidade
FROM Alunos a
JOIN Enderecos e ON a.id_aluno = e.id_aluno;

-- 6  --
SELECT a.nome, t.ddd, t.numero
FROM Alunos a
JOIN Telefones t ON a.id_aluno = t.id_aluno;

SELECT a.nome, t.ddd, t.numero
FROM Alunos a
LEFT JOIN Telefones t ON a.id_aluno = t.id_aluno;

-- 7 --
SELECT a.nome, e.estado
FROM Alunos a
JOIN Enderecos e ON a.id_aluno = e.id_aluno;

-- 8 --
SELECT estado, COUNT(*) as quantidade
FROM Enderecos
GROUP BY estado
ORDER BY quantidade DESC;

-- 9 --
SELECT a.nome, COUNT(t.id_telefone) as total_telefones
FROM Alunos a
LEFT JOIN Telefones t ON a.id_aluno = t.id_aluno
GROUP BY a.id_aluno, a.nome;

-- 10 -- 
SELECT e.cidade, COUNT(DISTINCT a.id_aluno) as total_alunos
FROM Alunos a
JOIN Enderecos e ON a.id_aluno = e.id_aluno
GROUP BY e.cidade
HAVING COUNT(DISTINCT a.id_aluno) > 3;

-- 11 -- 
SELECT nome, email 
FROM Alunos 
WHERE email LIKE '%@gmail.com';

-- 12 --
SELECT a.nome, a.cpf, e.cidade, CONCAT('(', t.ddd, ') ', t.numero) as telefone
FROM Alunos a
LEFT JOIN Enderecos e ON a.id_aluno = e.id_aluno
LEFT JOIN Telefones t ON a.id_aluno = t.id_aluno;





