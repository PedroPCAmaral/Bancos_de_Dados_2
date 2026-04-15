
-- PROJETO SPOTYMUSIC_120 - RELATÓRIO DE 30 QUERIES --

-- 15 QUERIES COM JOINS (INNER, LEFT e RIGHT) --

-- 1. INNER JOIN: Listar Artistas e suas respectivas Músicas --
SELECT a.nome AS Artista, m.titulo AS Musica 
FROM artista a 
INNER JOIN artista_musica am ON a.id_artista = am.fk_artista_id_artista 
INNER JOIN musica m ON am.fk_musica_id_musica = m.id_musica;

-- 2. INNER JOIN: Listar Músicas e seus Gêneros --
SELECT m.titulo, g.nome AS Genero 
FROM musica m 
INNER JOIN genero g ON m.fk_genero_id_genero = g.id_genero;

-- 3. INNER JOIN: Listar Álbuns e a Música principal vinculada --
SELECT al.titulo AS Album, m.titulo AS Musica_Referencia 
FROM album al 
INNER JOIN musica m ON al.fk_musica_id_musica = m.id_musica;

-- 4. INNER JOIN: Listar Playlists e a quantidade de músicas em cada uma --
SELECT p.nome_lista, COUNT(pm.fk_musica_id_musica) AS total_musicas 
FROM playlist p 
INNER JOIN playlist_musica pm ON p.id_playlist = pm.fk_playlist_id_playlist 
GROUP BY p.nome_lista;

-- 5. INNER JOIN: Listar Compositores e as músicas que escreveram --
SELECT c.nome AS Compositor, m.titulo AS Musica 
FROM compositor c 
INNER JOIN compositor_musica cm ON c.id_compositor = cm.fk_compositor_id_compositor 
INNER JOIN musica m ON cm.fk_musica_id_musica = m.id_musica;

-- 6. LEFT JOIN: Listar todos os Artistas, mesmo aqueles sem músicas cadastradas --
SELECT a.nome, am.fk_musica_id_musica 
FROM artista a 
LEFT JOIN artista_musica am ON a.id_artista = am.fk_artista_id_artista;

-- 7. LEFT JOIN: Listar todas as Playlists e os IDs das músicas (se houver) --
SELECT p.nome_lista, pm.fk_musica_id_musica 
FROM playlist p 
LEFT JOIN playlist_musica pm ON p.id_playlist = pm.fk_playlist_id_playlist;

-- 8. LEFT JOIN: Listar todos os Gêneros e as músicas associadas --
SELECT g.nome, m.titulo 
FROM genero g 
LEFT JOIN musica m ON g.id_genero = m.fk_genero_id_genero;

-- 9. LEFT JOIN: Listar Compositores e verificar quem não tem música vinculada --
SELECT c.nome, cm.fk_musica_id_musica 
FROM compositor c 
LEFT JOIN compositor_musica cm ON c.id_compositor = cm.fk_compositor_id_compositor;

-- 10. LEFT JOIN: Listar Músicas e seus logs de alteração (se houver) --
SELECT m.titulo, l.valor_novo 
FROM musica m 
LEFT JOIN log_atualizacao l ON l.valor_antigo = m.titulo;

-- 11. RIGHT JOIN: Listar todas as Músicas e seus respectivos Artistas
SELECT m.titulo, a.nome 
FROM artista_musica am 
RIGHT JOIN artista a ON am.fk_artista_id_artista = a.id_artista;

-- 12. RIGHT JOIN: Listar Gêneros e garantir que todos apareçam, mesmo sem músicas
SELECT m.titulo, g.nome 
FROM musica m 
RIGHT JOIN genero g ON m.fk_genero_id_genero = g.id_genero;

-- 13. RIGHT JOIN: Listar músicas que estão em playlists
SELECT pm.fk_musica_id_musica, p.nome_lista 
FROM playlist_musica pm 
RIGHT JOIN playlist p ON pm.fk_playlist_id_playlist = p.id_playlist;

-- 14. RIGHT JOIN: Relacionar álbuns garantindo a exibição de todas as músicas
SELECT al.titulo, m.titulo 
FROM album al 
RIGHT JOIN musica m ON al.fk_musica_id_musica = m.id_musica;

-- 15. RIGHT JOIN: Relacionar compositores e músicas
SELECT cm.fk_musica_id_musica, c.nome 
FROM compositor_musica cm 
RIGHT JOIN compositor c ON cm.fk_compositor_id_compositor = c.id_compositor;


-- ----------------------------------------------------------
-- PARTE 2: 15 QUERIES SIMPLES (FILTROS E AGREGAÇÕES)
-- ----------------------------------------------------------

-- 16. Listar todas as músicas com duração superior a 200 segundos
SELECT * FROM musica WHERE duracao > 200;

-- 17. Contar o total de artistas cadastrados no sistema
SELECT COUNT(*) AS total_artistas FROM artista;

-- 18. Buscar o tempo de duração da música mais longa
SELECT MAX(duracao) AS maior_duracao FROM musica;

-- 19. Buscar o tempo de duração da música mais curta
SELECT MIN(duracao) AS menor_duracao FROM musica;

-- 20. Listar álbuns lançados apenas no ano de 2024
SELECT * FROM album WHERE ano_lancamento = 2024;

-- 21. Listar artistas cujo nome começa com a letra 'B'
SELECT nome FROM artista WHERE nome LIKE 'B%';

-- 22. Ordenar todas as músicas por título em ordem alfabética (A-Z)
SELECT * FROM musica ORDER BY titulo ASC;

-- 23. Verificar os últimos 10 registros de inserção no log de auditoria
SELECT * FROM log_insercao ORDER BY data_hora DESC LIMIT 10;

-- 24. Listar os anos de lançamento dos álbuns sem repetir valores (distintos)
SELECT DISTINCT ano_lancamento FROM album;

-- 25. Listar o nome das playlists criadas a partir de uma data específica
SELECT nome_lista FROM playlist WHERE data_criacao >= '2026-01-01';

-- 26. Selecionar músicas que NÃO pertencem ao gênero de ID 1
SELECT titulo, duracao FROM musica WHERE fk_genero_id_genero <> 1;

-- 27. Calcular a média de duração de todas as músicas do banco
SELECT AVG(duracao) AS media_segundos FROM musica;

-- 28. Listar logs de atualização específicos da tabela 'musica'
SELECT * FROM log_atualizacao WHERE tabela_afetada = 'musica';

-- 29. Somar a duração total de todas as músicas cadastradas
SELECT SUM(duracao) AS tempo_total_segundos FROM musica;

-- 30. Listar todos os compositores ordenados pelo ID de forma decrescente
SELECT * FROM compositor ORDER BY id_compositor DESC;


SELECT 
    a.nome AS 'Artista',
    m.titulo AS 'Música',
    al.titulo AS 'Álbum',
    p.nome_lista AS 'Playlist',
    g.nome AS 'Gênero'
FROM artista a
-- Liga Artista com a tabela associativa de Música
LEFT JOIN artista_musica am ON a.id_artista = am.fk_artista_id_artista
LEFT JOIN musica m ON am.fk_musica_id_musica = m.id_musica
-- Liga Música com Gênero
LEFT JOIN genero g ON m.fk_genero_id_genero = g.id_genero
-- Liga Música com Álbum
LEFT JOIN album al ON m.id_musica = al.fk_musica_id_musica
-- Liga Música com a associativa de Playlist
LEFT JOIN playlist_musica pm ON m.id_musica = pm.fk_musica_id_musica
LEFT JOIN playlist p ON pm.fk_playlist_id_playlist = p.id_playlist
ORDER BY a.nome, m.titulo;

SELECT 
    m.titulo AS 'Música',
    a.nome AS 'Artista',
    al.titulo AS 'Álbum',
    p.nome_lista AS 'Playlist'
FROM musica m
LEFT JOIN artista_musica am ON m.id_musica = am.fk_musica_id_musica
LEFT JOIN artista a ON am.fk_artista_id_artista = a.id_artista
LEFT JOIN album al ON m.id_musica = al.fk_musica_id_musica
LEFT JOIN playlist_musica pm ON m.id_musica = pm.fk_musica_id_musica
LEFT JOIN playlist p ON pm.fk_playlist_id_playlist = p.id_playlist;