# Resolução das Queries - Banco de Dados de Alunos

Este documento contém o script completo para criação do banco de dados com 300 alunos e a resolução das 12 queries solicitadas.

---

## 1. Script de Criação do Banco de Dados (SQL)

Você pode copiar e colar este script em seu gerenciador de banco de dados (MySQL, SQLite, etc.) para criar as tabelas e popular os dados.

```sql
-- Criação da Tabela Alunos
CREATE TABLE Alunos (
    id_aluno INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    sobrenome TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    data_nascimento DATE,
    cpf TEXT UNIQUE
);

-- Criação da Tabela Enderecos
CREATE TABLE Enderecos (
    id_endereco INTEGER PRIMARY KEY AUTOINCREMENT,
    id_aluno INTEGER,
    logradouro TEXT,
    cidade TEXT,
    estado TEXT,
    cep TEXT,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

-- Criação da Tabela Telefones
CREATE TABLE Telefones (
    id_telefone INTEGER PRIMARY KEY AUTOINCREMENT,
    id_aluno INTEGER,
    ddd TEXT,
    numero TEXT,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno)
);

-- (O script completo com os 300 registros está disponível no arquivo setup_banco.sql anexo)
```

---

## 2. Resolução das Queries Solicitadas

Abaixo estão os comandos SQL para cada um dos 12 exercícios propostos:

### Query 1
**Objetivo:** Selecione o nome, sobrenome e e-mail de todos os alunos cadastrados, ordenados alfabeticamente pelo sobrenome.
```sql
SELECT nome, sobrenome, email 
FROM Alunos 
ORDER BY sobrenome ASC;
```

### Query 2
**Objetivo:** Liste todos os logradouros, cidades e CEPs dos endereços cadastrados no estado de 'SP'.
```sql
SELECT logradouro, cidade, cep 
FROM Enderecos 
WHERE estado = 'SP';
```

### Query 3
**Objetivo:** Mostre o DDD e o número de telefone de todos os alunos que possuem o DDD '11'.
```sql
SELECT ddd, numero 
FROM Telefones 
WHERE ddd = '11';
```

### Query 4
**Objetivo:** Selecione o nome e a data de nascimento de todos os alunos que nasceram antes do ano 2000.
```sql
SELECT nome, data_nascimento 
FROM Alunos 
WHERE data_nascimento < '2000-01-01';
```

### Query 5
**Objetivo:** Exiba o nome completo de todos os alunos (concatenado) e o seus respectivos logradouros e cidades.
```sql
SELECT (nome || ' ' || sobrenome) AS nome_completo, e.logradouro, e.cidade
FROM Alunos a
JOIN Enderecos e ON a.id_aluno = e.id_aluno;
```

### Query 6
**Objetivo:** Liste o nome do aluno e todos os seus telefones vinculados. Se um aluno tiver dois números, ele deve aparecer duas vezes na lista.
```sql
SELECT a.nome, t.ddd, t.numero
FROM Alunos a
JOIN Telefones t ON a.id_aluno = t.id_aluno;
```

### Query 7
**Objetivo:** Liste o nome dos alunos e suas respectivas UFs (estados).
```sql
SELECT a.nome, e.estado
FROM Alunos a
JOIN Enderecos e ON a.id_aluno = e.id_aluno;
```

### Query 8
**Objetivo:** Conte quantos alunos existem em cada estado (UF). O resultado deve mostrar a UF e a quantidade, ordenando do maior para o menor.
```sql
SELECT estado, COUNT(*) as quantidade
FROM Enderecos
GROUP BY estado
ORDER BY quantidade DESC;
```

### Query 9
**Objetivo:** Mostre o nome do aluno e a quantidade total de números de telefone que cada um possui cadastrado.
```sql
SELECT a.nome, COUNT(t.id_telefone) as total_telefones
FROM Alunos a
LEFT JOIN Telefones t ON a.id_aluno = t.id_aluno
GROUP BY a.id_aluno, a.nome;
```

### Query 10
**Objetivo:** Liste apenas as cidades que possuem mais de 3 alunos cadastrados.
```sql
SELECT cidade, COUNT(*) as total_alunos
FROM Enderecos
GROUP BY cidade
HAVING COUNT(*) > 3;
```

### Query 11
**Objetivo:** Liste os alunos cujo e-mail termina com '@gmail.com', exibindo nome e e-mail.
```sql
SELECT nome, email
FROM Alunos
WHERE email LIKE '%@gmail.com';
```

### Query 12
**Objetivo:** Crie uma consulta que retorne: Nome do Aluno, CPF, Cidade e o Telefone.
```sql
SELECT a.nome, a.cpf, e.cidade, t.ddd, t.numero
FROM Alunos a
JOIN Enderecos e ON a.id_aluno = e.id_aluno
JOIN Telefones t ON a.id_aluno = t.id_aluno;
```
