-- 1. Selecione o nome, sobrenome e e-mail de todos os alunos cadastrados, ordenados alfabeticamente pelo sobrenome.
SELECT nome, sobrenome, email 
FROM Alunos 
ORDER BY sobrenome ASC;

-- 2. Liste todos os logradouros, cidades e CEPs dos endereços cadastrados no estado de 'SP'.
SELECT logradouro, cidade, cep 
FROM Enderecos 
WHERE estado = 'SP';

-- 3. Mostre o DDD e o número de telefone de todos os alunos que possuem o DDD '11'.
SELECT ddd, numero 
FROM Telefones 
WHERE ddd = '11';

-- 4. Selecione o nome e a data de nascimento de todos os alunos que nasceram antes do ano 2000.
SELECT nome, data_nascimento 
FROM Alunos 
WHERE data_nascimento < '2000-01-01';

-- 5. Exiba o nome completo de todos os alunos (concatenado) e o seus respectivos logradouros e cidades.
SELECT (nome || ' ' || sobrenome) AS nome_completo, e.logradouro, e.cidade
FROM Alunos a
JOIN Enderecos e ON a.id_aluno = e.id_aluno;

-- 6. Liste o nome do aluno e todos os seus telefones vinculados. Se um aluno tiver dois números, ele deve aparecer duas vezes na lista.
SELECT a.nome, t.ddd, t.numero
FROM Alunos a
JOIN Telefones t ON a.id_aluno = t.id_aluno;

-- 7. Liste o nome dos alunos e suas respectivas UFs (estados).
SELECT a.nome, e.estado
FROM Alunos a
JOIN Enderecos e ON a.id_aluno = e.id_aluno;

-- 8. Conte quantos alunos existem em cada estado (UF). O resultado deve mostrar a UF e a quantidade, ordenando do maior para o menor.
SELECT estado, COUNT(*) as quantidade
FROM Enderecos
GROUP BY estado
ORDER BY quantidade DESC;

-- 9. Mostre o nome do aluno e a quantidade total de números de telefone que cada um possui cadastrado.
SELECT a.nome, COUNT(t.id_telefone) as total_telefones
FROM Alunos a
LEFT JOIN Telefones t ON a.id_aluno = t.id_aluno
GROUP BY a.id_aluno, a.nome;

-- 10. Liste apenas as cidades que possuem mais de 3 alunos cadastrados.
SELECT cidade, COUNT(*) as total_alunos
FROM Enderecos
GROUP BY cidade
HAVING COUNT(*) > 3;

-- 11. Liste os alunos cujo e-mail termina com '@gmail.com', exibindo nome e e-mail.
SELECT nome, email
FROM Alunos
WHERE email LIKE '%@gmail.com';

-- 12. Crie uma consulta que retorne: Nome do Aluno, CPF, Cidade e o Telefone.
SELECT a.nome, a.cpf, e.cidade, t.ddd, t.numero
FROM Alunos a
JOIN Enderecos e ON a.id_aluno = e.id_aluno
JOIN Telefones t ON a.id_aluno = t.id_aluno;
