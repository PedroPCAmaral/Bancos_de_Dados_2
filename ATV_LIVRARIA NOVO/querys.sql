-- =========================================
-- 1. Projetar todos os livros
-- =========================================
SELECT * FROM livro;


-- =========================================
-- 2. Projetar todas as editoras
-- =========================================
SELECT * FROM editora;


-- =========================================
-- 3. Projetar todos os livros e suas editoras
-- =========================================
SELECT l.titulo, e.nome_editora
FROM livro l
JOIN livro_editora le ON l.id_livro = le.id_livro
JOIN editora e ON le.id_editora = e.id_editora;


-- =========================================
-- 4. Projetar todos os autores
-- =========================================
SELECT * FROM autor;


-- =========================================
-- 5. Projetar todos os autores e seus livros
-- (inclui autores sem livros)
-- =========================================
SELECT a.nome_autor, l.titulo
FROM autor a
LEFT JOIN livro_autor la ON a.id_autor = la.id_autor
LEFT JOIN livro l ON la.id_livro = l.id_livro;


-- =========================================
-- 6. Projetar livros e seus valores
-- =========================================
SELECT titulo, valor FROM livro;


-- =========================================
-- 7. Projetar autores, e-mail, livros e valores
-- =========================================
SELECT a.nome_autor, a.email_autor, l.titulo, l.valor
FROM autor a
JOIN livro_autor la ON a.id_autor = la.id_autor
JOIN livro l ON la.id_livro = l.id_livro;


-- =========================================
-- 8. Projetar autor, sexo, livro e editoras
-- =========================================
SELECT a.nome_autor, a.sexo, l.titulo, e.nome_editora
FROM autor a
JOIN livro_autor la ON a.id_autor = la.id_autor
JOIN livro l ON la.id_livro = l.id_livro
JOIN livro_editora le ON l.id_livro = le.id_livro
JOIN editora e ON le.id_editora = e.id_editora;


-- =========================================
-- 9. Projetar identificação da editora e os livros cadastrados
-- =========================================
SELECT e.id_editora, e.nome_editora, l.titulo
FROM editora e
JOIN livro_editora le ON e.id_editora = le.id_editora
JOIN livro l ON le.id_livro = l.id_livro;


-- =========================================
-- 10. Projetar autor, livro, tipocategoria e isbn
-- =========================================
SELECT a.nome_autor, l.titulo, c.tipo_categoria, l.isbn
FROM livro l
JOIN livro_autor la ON l.id_livro = la.id_livro
JOIN autor a ON la.id_autor = a.id_autor
JOIN livro_categoria lc ON l.id_livro = lc.id_livro
JOIN categoria c ON lc.id_categoria = c.id_categoria;


-- =========================================
-- 11. Projetar todas as categorias e seus livros
-- =========================================
SELECT c.tipo_categoria, l.titulo
FROM categoria c
JOIN livro_categoria lc ON c.id_categoria = lc.id_categoria
JOIN livro l ON lc.id_livro = l.id_livro;


-- =========================================
-- 12. Projetar quantidade de autores
-- =========================================
SELECT COUNT(*) AS total_autores FROM autor;


-- =========================================
-- 13. Projetar autores agrupados por sexo
-- =========================================
SELECT sexo, COUNT(*) AS quantidade
FROM autor
GROUP BY sexo;


-- =========================================
-- 14. Projetar livros, valor unitário e total (2 unidades)
-- =========================================
SELECT titulo, valor, valor*2 AS total_2_livros
FROM livro;


-- =========================================
-- 15. Projetar livro com desconto de 15%
-- =========================================
SELECT titulo, valor, valor*0.85 AS valor_desconto
FROM livro;


-- =========================================
-- 16. Projetar livro com acréscimo de 10%
-- =========================================
SELECT titulo, valor, valor*1.10 AS valor_acrescimo
FROM livro;


-- =========================================
-- 17. Projetar quantidade de editoras
-- =========================================
SELECT COUNT(*) AS total_editoras FROM editora;


-- =========================================
-- 18. Projetar quantidade de categorias
-- =========================================
SELECT COUNT(*) AS total_categorias FROM categoria;


-- =========================================
-- 19. Projetar quantidade de categorias agrupadas por tipo
-- =========================================
SELECT tipo_categoria, COUNT(*) AS quantidade
FROM categoria
GROUP BY tipo_categoria;


-- =========================================
-- 20. Projetar livros, editoras, e-mail, categoria, valores
-- =========================================
SELECT l.titulo, e.nome_editora, e.email, c.tipo_categoria, l.valor
FROM livro l
JOIN livro_editora le ON l.id_livro = le.id_livro
JOIN editora e ON le.id_editora = e.id_editora
JOIN livro_categoria lc ON l.id_livro = lc.id_livro
JOIN categoria c ON lc.id_categoria = c.id_categoria;


-- =========================================
-- 21. Projetar livros, editoras, CNPJ, categoria, valores
-- =========================================
SELECT l.titulo, e.nome_editora, e.cnpj, c.tipo_categoria, l.valor
FROM livro l
JOIN livro_editora le ON l.id_livro = le.id_livro
JOIN editora e ON le.id_editora = e.id_editora
JOIN livro_categoria lc ON l.id_livro = lc.id_livro
JOIN categoria c ON lc.id_categoria = c.id_categoria;


-- =========================================
-- 22. Projetar editoras, CNPJ, livro e data
-- =========================================
SELECT e.nome_editora, e.cnpj, l.titulo, l.data_lancamento
FROM editora e
JOIN livro_editora le ON e.id_editora = le.id_editora
JOIN livro l ON le.id_livro = l.id_livro;


-- =========================================
-- 23. Projetar livros entre duas datas
-- =========================================
SELECT *
FROM livro
WHERE data_lancamento BETWEEN '2023-01-01' AND '2025-12-31';


-- =========================================
-- 24. Projetar livros em uma data com 50% desconto
-- =========================================
SELECT titulo, valor, valor*0.5 AS valor_desconto
FROM livro
WHERE data_lancamento = '2024-01-01';


-- =========================================
-- 25. Projetar livros, ISBN, editora, telefone e e-mail por categoria
-- =========================================
SELECT l.titulo, l.isbn, e.nome_editora, t.numero, e.email
FROM livro l
JOIN livro_editora le ON l.id_livro = le.id_livro
JOIN editora e ON le.id_editora = e.id_editora
JOIN telefone t ON e.id_editora = t.id_editora
JOIN livro_categoria lc ON l.id_livro = lc.id_livro
JOIN categoria c ON lc.id_categoria = c.id_categoria
WHERE c.tipo_categoria = 'Tecnologia';


-- =========================================
-- 26. Projetar autores e CPF por tipo de livro
-- =========================================
SELECT a.nome_autor, a.cpf
FROM autor a
JOIN livro_autor la ON a.id_autor = la.id_autor
JOIN livro l ON la.id_livro = l.id_livro
JOIN livro_categoria lc ON l.id_livro = lc.id_livro
JOIN categoria c ON lc.id_categoria = c.id_categoria
WHERE c.tipo_categoria = 'Tecnologia';


-- =========================================
-- 27. View: livro, isbn, editora e data
-- =========================================
CREATE VIEW vw_livro_editora AS
SELECT l.titulo, l.isbn, e.nome_editora, l.data_lancamento
FROM livro l
JOIN livro_editora le ON l.id_livro = le.id_livro
JOIN editora e ON le.id_editora = e.id_editora;


-- =========================================
-- 28. View: livros, editoras e valores
-- =========================================
CREATE VIEW vw_livros_valores AS
SELECT l.titulo, e.nome_editora, l.valor
FROM livro l
JOIN livro_editora le ON l.id_livro = le.id_livro
JOIN editora e ON le.id_editora = e.id_editora;


-- =========================================
-- 29. View: desconto de 30% por editora
-- =========================================
CREATE VIEW vw_desconto_editora AS
SELECT l.titulo, e.nome_editora, l.valor*0.7 AS valor_desconto
FROM livro l
JOIN livro_editora le ON l.id_livro = le.id_livro
JOIN editora e ON le.id_editora = e.id_editora
WHERE e.nome_editora = 'Editora A';


-- =========================================
-- 30. Mostrar todas as views
-- =========================================
SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';