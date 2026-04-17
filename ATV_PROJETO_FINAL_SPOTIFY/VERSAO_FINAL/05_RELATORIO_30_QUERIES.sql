USE SPOTYMUSIC_120;

-- SEÇÃO 1: INNER JOINS (Relacionamentos tabelas)

-- 1. Listar o nome do Artista e o Título da Música (Ligação N:N)
SELECT a.nome AS Artista, m.titulo AS Musica 
FROM artista a 
JOIN artista_musica am ON a.id_artista = am.fk_artista_id_artista 
JOIN musica m ON am.fk_musica_id_musica = m.id_musica;

-- 2. Listar Músicas e seus respectivos Gêneros
SELECT m.titulo AS Musica, g.nome AS Genero 
FROM musica m 
JOIN genero g ON m.fk_genero_id_genero = g.id_genero;

-- 3. Listar Álbuns e o nome do Artista dono do álbum
SELECT al.titulo AS Album, a.nome AS Artista 
FROM album al 
JOIN artista a ON al.fk_artista_id_artista = a.id_artista;

-- 4. Listar todas as músicas que estão na playlist 'Rock Classics'
SELECT p.nome_lista AS Playlist, m.titulo AS Musica 
FROM playlist p 
JOIN playlist_musica pm ON p.id_playlist = pm.fk_playlist_id_playlist 
JOIN musica m ON pm.fk_musica_id_musica = m.id_musica 
WHERE p.nome_lista = 'Rock Classics';

-- 5. Listar Compositores e as Músicas que eles escreveram
SELECT c.nome AS Compositor, m.titulo AS Musica 
FROM compositor c 
JOIN compositor_musica cm ON c.id_compositor = cm.fk_compositor_id_compositor 
JOIN musica m ON cm.fk_musica_id_musica = m.id_musica;

-- 6. Ver todas as músicas do gênero 'Pop' e seus artistas
SELECT m.titulo, a.nome 
FROM musica m 
JOIN genero g ON m.fk_genero_id_genero = g.id_genero 
JOIN artista_musica am ON m.id_musica = am.fk_musica_id_musica 
JOIN artista a ON am.fk_artista_id_artista = a.id_artista 
WHERE g.nome = 'Pop';

-- 7. Listar Álbuns e o total de músicas em cada um (Baseado no artista)
SELECT al.titulo AS Album, COUNT(m.id_musica) AS Total_Musicas
FROM album al
JOIN artista a ON al.fk_artista_id_artista = a.id_artista
JOIN artista_musica am ON a.id_artista = am.fk_artista_id_artista
JOIN musica m ON am.fk_musica_id_musica = m.id_musica
GROUP BY al.titulo;

-- 8. Listar Músicas, Artista e o Gênero ao mesmo tempo (Join Triplo)
SELECT m.titulo, a.nome, g.nome 
FROM musica m 
JOIN artista_musica am ON m.id_musica = am.fk_musica_id_musica 
JOIN artista a ON am.fk_artista_id_artista = a.id_artista 
JOIN genero g ON m.fk_genero_id_genero = g.id_genero;

-- 9. Listar Playlists e a data de criação formatada
SELECT nome_lista, DATE_FORMAT(data_criacao, '%d/%m/%Y') AS Criada_em FROM playlist;

-- 10. Listar músicas que NÃO estão em nenhuma playlist (Left Join)
SELECT m.titulo FROM musica m 
LEFT JOIN playlist_musica pm ON m.id_musica = pm.fk_musica_id_musica 
WHERE pm.fk_musica_id_musica IS NULL;

-- 11. Listar quais Compositores trabalham com quais Artistas
SELECT DISTINCT c.nome AS Compositor, a.nome AS Artista 
FROM compositor c 
JOIN compositor_musica cm ON c.id_compositor = cm.fk_compositor_id_compositor 
JOIN artista_musica am ON cm.fk_musica_id_musica = am.fk_musica_id_musica 
JOIN artista a ON am.fk_artista_id_artista = a.id_artista;

-- 12. Listar músicas e sua duração em minutos (Duração/60)
SELECT titulo, ROUND(duracao / 60, 2) AS Duracao_Minutos FROM musica;

-- 13. Buscar músicas do Linkin Park que duram mais de 3 minutos (180s)
SELECT m.titulo FROM musica m 
JOIN artista_musica am ON m.id_musica = am.fk_musica_id_musica 
JOIN artista a ON am.fk_artista_id_artista = a.id_artista 
WHERE a.nome = 'Linkin Park' AND m.duracao > 180;

-- 14. Mostrar todas as playlists que o artista 'The Weeknd' aparece
SELECT DISTINCT p.nome_lista 
FROM playlist p 
JOIN playlist_musica pm ON p.id_playlist = pm.fk_playlist_id_playlist 
JOIN artista_musica am ON pm.fk_musica_id_musica = am.fk_musica_id_musica 
JOIN artista a ON am.fk_artista_id_artista = a.id_artista 
WHERE a.nome = 'The Weeknd';

-- 15. Relatório Mestre: Artista, Álbum, Música, Gênero e Compositor
SELECT a.nome, al.titulo, m.titulo, g.nome, c.nome 
FROM artista a 
JOIN album al ON a.id_artista = al.fk_artista_id_artista 
JOIN artista_musica am ON a.id_artista = am.fk_artista_id_artista 
JOIN musica m ON am.fk_musica_id_musica = m.id_musica 
JOIN genero g ON m.fk_genero_id_genero = g.id_genero 
JOIN compositor_musica cm ON m.id_musica = cm.fk_musica_id_musica 
JOIN compositor c ON cm.fk_compositor_id_compositor = c.id_compositor;


-- SEÇÃO 2: FILTROS, AGREGAÇÕES E ORDENAÇÃO --


-- 16. Contar o total de músicas cadastradas no banco
SELECT COUNT(*) AS Total_Musicas_Banco FROM musica;

-- 17. Média de duração das músicas do gênero 'Rock'
SELECT AVG(duracao) AS Media_Segundos FROM musica m 
JOIN genero g ON m.fk_genero_id_genero = g.id_genero 
WHERE g.nome = 'Rock';

-- 18. Listar os 5 artistas por ordem alfabética
SELECT nome FROM artista ORDER BY nome ASC LIMIT 5;

-- 19. Listar as 10 músicas mais longas do banco
SELECT titulo, duracao FROM musica ORDER BY duracao DESC LIMIT 10;

-- 20. Buscar qualquer música que tenha a palavra 'End' no título
SELECT * FROM musica WHERE titulo LIKE '%End%';

-- 21. Contar quantos artistas existem por gênero
SELECT g.nome, COUNT(am.fk_artista_id_artista) 
FROM genero g 
JOIN musica m ON g.id_genero = m.fk_genero_id_genero 
JOIN artista_musica am ON m.id_musica = am.fk_musica_id_musica 
GROUP BY g.nome;

-- 22. Listar as músicas com duração entre 120 e 180 segundos
SELECT titulo, duracao FROM musica WHERE duracao BETWEEN 120 AND 180;

-- 23. Listar álbuns que começam com a letra 'M' ou 'A'
SELECT titulo FROM album WHERE titulo LIKE 'M%' OR titulo LIKE 'A%';

-- 24. Ver o log de quem inseriu músicas no sistema (Trigger Test)
SELECT * FROM log_insercao WHERE tabela = 'musica';

-- 25. Ver o log de músicas deletadas (Trigger Test)
SELECT * FROM log_delecao;

-- 26. Somar a duração total de todas as músicas (em segundos)
SELECT SUM(duracao) AS Tempo_Total_Segundos FROM musica;

-- 27. Listar artistas que não possuem álbum cadastrado (se houver)
SELECT a.nome FROM artista a 
LEFT JOIN album al ON a.id_artista = al.fk_artista_id_artista 
WHERE al.id_album IS NULL;

-- 28. Selecionar o nome do compositor e o total de obras dele
SELECT c.nome, COUNT(cm.fk_musica_id_musica) AS Obras 
FROM compositor c 
JOIN compositor_musica cm ON c.id_compositor = cm.fk_compositor_id_compositor 
GROUP BY c.nome;

-- 29. Listar músicas ordenadas por Gênero e depois por Título
SELECT g.nome, m.titulo FROM musica m 
JOIN genero g ON m.fk_genero_id_genero = g.id_genero 
ORDER BY g.nome, m.titulo;

-- 30. Mostrar apenas as Playlists criadas no mês atual
SELECT * FROM playlist WHERE MONTH(data_criacao) = MONTH(CURDATE());