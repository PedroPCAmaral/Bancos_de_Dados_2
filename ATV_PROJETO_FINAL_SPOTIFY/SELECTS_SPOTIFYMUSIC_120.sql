USE SPOTYMUSIC_120;


SELECT 
    a.nome AS Artista, 
    m.titulo AS Musica,
    m.duracao
FROM artista a
INNER JOIN artista_musica am ON a.id_artista = am.fk_artista_id_artista
INNER JOIN musica m ON am.fk_musica_id_musica = m.id_musica
ORDER BY a.nome;


SELECT 
    p.nome_lista AS Playlist, 
    COUNT(pm.fk_musica_id_musica) AS Total_Musicas
FROM playlist p
INNER JOIN playlist_musica pm ON p.id_playlist = pm.fk_playlist_id_playlist
GROUP BY p.nome_lista;


SELECT 
    c.nome AS Compositor, 
    m.titulo AS Musica
FROM compositor c
INNER JOIN compositor_musica cm ON c.id_compositor = cm.fk_compositor_id_compositor
INNER JOIN musica m ON cm.fk_musica_id_musica = m.id_musica;


-- Ver as últimas inserções registradas pela Trigger
SELECT * FROM log_insercao ORDER BY id DESC LIMIT 20;

-- Resumo total de registros por tabela de log
SELECT 'Inserções' AS Tipo, COUNT(*) AS Total FROM log_insercao
UNION SELECT 'Deleções', COUNT(*) FROM log_delecao
UNION SELECT 'Atualizações', COUNT(*) FROM log_atualizacao;

SELECT 
    al.titulo AS Album, 
    al.ano_lancamento, 
    m.titulo AS Musica_Referencia
FROM album al
INNER JOIN musica m ON al.fk_musica_id_musica = m.id_musica;

--  CONSULTA À TABELA DE LOG (PROVA DE AUDITORIA)
SELECT * FROM log_spotymusic;

--  CONSULTA À TABELA DE ARTISTAS -
SELECT * FROM artista;

--  CONSULTA DE RELACIONAMENTO (JOIN) - PLAYLIST E MÚSICAS --
SELECT 
    p.nome_lista AS 'Nome da Playlist', 
    m.titulo AS 'Título da Música' 
FROM playlist p
JOIN playlist_musica pm ON p.id_playlist = pm.fk_playlist_id_playlist
JOIN musica m ON pm.fk_musica_id_musica = m.id_musica
WHERE p.id_playlist = 1;

-- RELATÓRIO DE CONFERÊNCIA FINAL --
SELECT 
    (SELECT COUNT(*) FROM artista) AS 'Total Artistas (Meta 10)',
    (SELECT COUNT(*) FROM album) AS 'Total Álbuns (Meta 20)',
    (SELECT COUNT(*) FROM musica) AS 'Total Músicas (Meta 200)',
    (SELECT COUNT(*) FROM playlist) AS 'Total Playlists (Meta 4)',
    (SELECT COUNT(*) FROM log_spotymusic) AS 'Registros de Trigger (Auditoria)';
    
    
    SELECT 
    'Artistas' AS Categoria, COUNT(*) AS Total, '10' AS Meta FROM artista
UNION
SELECT 
    'Álbuns', COUNT(*), '20' FROM album
UNION
SELECT 
    'Músicas Total', COUNT(*), '200 (Carga Amostral)' FROM musica
UNION
SELECT 
    'Compositores', COUNT(*), '10' FROM compositor
UNION
SELECT 
    'Playlists', COUNT(*), '4' FROM playlist
UNION
SELECT 
    'Logs de Auditoria', COUNT(*), 'Ativo' FROM log_spotymusic;
    


