
-- QUERIES EMPREGADO_DEPARTAMENTO --


-- 1 - Quantidade de pessoas do Sexo Masculino e Feminino
SELECT Sexo, COUNT(*) AS Quantidade
FROM Empregado
GROUP BY Sexo;


-- 2 - Aumento de salário de 15% para todos empregados
SELECT Nome, Sobrenome, Salario,
ROUND(Salario * 1.15, 2) AS NovoSalario
FROM Empregado;


-- 3 - Soma de todos os salários
SELECT SUM(Salario) AS TotalSalarios
FROM Empregado;


-- 4 - Mostrar o funcionário com salário mais alto
SELECT Nome, Sobrenome, Salario
FROM Empregado
WHERE Salario = (SELECT MAX(Salario) FROM Empregado);


-- 5 - Mostrar o funcionário com salário mais baixo
SELECT Nome, Sobrenome, Salario
FROM Empregado
WHERE Salario = (SELECT MIN(Salario) FROM Empregado);


-- 6 - Média de valores de salário por departamento (1 query para cada departamento)

SELECT ROUND(AVG(Salario),2) AS Media_RH
FROM Empregado
WHERE Id_Departamento = 1;

SELECT ROUND(AVG(Salario),2) AS Media_TI
FROM Empregado
WHERE Id_Departamento = 2;

SELECT ROUND(AVG(Salario),2) AS Media_Financeiro
FROM Empregado
WHERE Id_Departamento = 3;

SELECT ROUND(AVG(Salario),2) AS Media_Marketing
FROM Empregado
WHERE Id_Departamento = 4;


-- 7 - Aumento de salário para um determinado departamento (ex: TI = 2)
SELECT Nome, Sobrenome, Salario,
ROUND(Salario * 1.10, 2) AS NovoSalario
FROM Empregado
WHERE Id_Departamento = 2;


-- 8 - Aumento de 10% de salário para o sexo feminino
SELECT Nome, Sobrenome, Salario,
ROUND(Salario * 1.10, 2) AS NovoSalario
FROM Empregado
WHERE Sexo = 'F';


-- 9 - Nome, salário e endereço de trabalho dos empregados do sexo feminino
SELECT e.Nome, e.Sobrenome, e.Salario, d.Endereco
FROM Empregado e
JOIN Departamento d 
ON e.Id_Departamento = d.IdDepartamento
WHERE e.Sexo = 'F';


-- 10 - Endereço de trabalho de um funcionário específico (ex: Ana)
SELECT e.Nome, e.Sobrenome, d.Endereco
FROM Empregado e
JOIN Departamento d 
ON e.Id_Departamento = d.IdDepartamento
WHERE e.Nome = 'Ana';
