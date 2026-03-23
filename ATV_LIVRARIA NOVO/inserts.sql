-- AUTORES (6 → 2 SEM LIVRO)
INSERT INTO autor (nome_autor, email_autor, cpf, sexo) VALUES
('Joao','j@email.com','111','M'),
('Maria','m@email.com','222','F'),
('Carlos','c@email.com','333','M'),
('Ana','a@email.com','444','F'),
('Autor Sem Livro 1','x@email.com','555','M'),
('Autor Sem Livro 2','y@email.com','666','F');

-- EDITORAS (4)
INSERT INTO editora (nome_editora,email,cnpj) VALUES
('Editora A','a@email.com','111'),
('Editora B','b@email.com','222'),
('Editora C','c@email.com','333'),
('Editora D','d@email.com','444');

-- CATEGORIAS
INSERT INTO categoria (tipo_categoria) VALUES
('Tecnologia'),('Romance'),('Educacao'),('Ficcao');

-- TELEFONES
INSERT INTO telefone (ddd,numero,id_editora) VALUES
('55','9991',1),
('55','9992',2),
('55','9993',3),
('55','9994',4);

-- LIVROS (16 = 4 por editora)
INSERT INTO livro (isbn,titulo,data_lancamento,numero_pagina,valor) VALUES
('1','Java','2024-01-01',200,100),
('2','SQL','2024-01-02',200,100),
('3','Algoritmo','2024-01-03',200,100),
('4','Logica','2024-01-04',200,100),

('5','Romance1','2024-02-01',200,100),
('6','Romance2','2024-02-02',200,100),
('7','Drama','2024-02-03',200,100),
('8','Historia','2024-02-04',200,100),

('9','Python','2024-03-01',200,100),
('10','IA','2024-03-02',200,100),
('11','Matematica','2024-03-03',200,100),
('12','Fisica','2024-03-04',200,100),

('13','Ficcao1','2024-04-01',200,100),
('14','Ficcao2','2024-04-02',200,100),
('15','Quimica','2024-04-03',200,100),
('16','Biologia','2024-04-04',200,100);

-- RELACIONAMENTOS (ASSOCIATIVAS)

-- AUTOR
INSERT INTO livro_autor VALUES
(1,1),(2,2),(3,3),(4,4),
(5,1),(6,2),(7,3),(8,4),
(9,1),(10,2),(11,3),(12,4),
(13,1),(14,2),(15,3),(16,4);

-- EDITORA (4 livros cada)
INSERT INTO livro_editora VALUES
(1,1),(2,1),(3,1),(4,1),
(5,2),(6,2),(7,2),(8,2),
(9,3),(10,3),(11,3),(12,3),
(13,4),(14,4),(15,4),(16,4);

-- CATEGORIA
INSERT INTO livro_categoria VALUES
(1,1),(2,1),(3,3),(4,3),
(5,2),(6,2),(7,4),(8,3),
(9,1),(10,1),(11,3),(12,3),
(13,4),(14,4),(15,3),(16,3);