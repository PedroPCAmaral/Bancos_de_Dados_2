USE SPOTYMUSIC_120;


-- 1. TABELA DE LOG  --

CREATE TABLE IF NOT EXISTS log_spotymusic (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    tabela_afetada VARCHAR(50),
    acao VARCHAR(20),
    usuario VARCHAR(100),
    data_processo DATETIME,
    detalhes TEXT
);


-- 2. TRIGGERS DE INSERT E DELETE  --

DELIMITER //

-- Triggers para ARTISTA
CREATE TRIGGER tr_ins_artista AFTER INSERT ON artista FOR EACH ROW 
BEGIN INSERT INTO log_spotymusic (tabela_afetada, acao, usuario, data_processo, detalhes) VALUES ('artista', 'INSERT', USER(), NOW(), CONCAT('Novo Artista: ', NEW.nome)); END //
CREATE TRIGGER tr_del_artista AFTER DELETE ON artista FOR EACH ROW 
BEGIN INSERT INTO log_spotymusic (tabela_afetada, acao, usuario, data_processo, detalhes) VALUES ('artista', 'DELETE', USER(), NOW(), CONCAT('Removeu Artista: ', OLD.nome)); END //

-- Triggers para MUSICA -- 
CREATE TRIGGER tr_ins_musica AFTER INSERT ON musica FOR EACH ROW 
BEGIN INSERT INTO log_spotymusic (tabela_afetada, acao, usuario, data_processo, detalhes) VALUES ('musica', 'INSERT', USER(), NOW(), CONCAT('Nova Música: ', NEW.titulo)); END //
CREATE TRIGGER tr_del_musica AFTER DELETE ON musica FOR EACH ROW 
BEGIN INSERT INTO log_spotymusic (tabela_afetada, acao, usuario, data_processo, detalhes) VALUES ('musica', 'DELETE', USER(), NOW(), CONCAT('Removeu Música: ', OLD.titulo)); END //

-- Triggers para ALBUM --
CREATE TRIGGER tr_ins_album AFTER INSERT ON album FOR EACH ROW 
BEGIN INSERT INTO log_spotymusic (tabela_afetada, acao, usuario, data_processo, detalhes) VALUES ('album', 'INSERT', USER(), NOW(), CONCAT('Novo Álbum: ', NEW.titulo)); END //
CREATE TRIGGER tr_del_album AFTER DELETE ON album FOR EACH ROW 
BEGIN INSERT INTO log_spotymusic (tabela_afetada, acao, usuario, data_processo, detalhes) VALUES ('album', 'DELETE', USER(), NOW(), CONCAT('Removeu Álbum: ', OLD.titulo)); END //

-- Triggers para COMPOSITOR -- 
CREATE TRIGGER tr_ins_comp AFTER INSERT ON compositor FOR EACH ROW 
BEGIN INSERT INTO log_spotymusic (tabela_afetada, acao, usuario, data_processo, detalhes) VALUES ('compositor', 'INSERT', USER(), NOW(), CONCAT('Novo Compositor: ', NEW.nome)); END //
CREATE TRIGGER tr_del_comp AFTER DELETE ON compositor FOR EACH ROW 
BEGIN INSERT INTO log_spotymusic (tabela_afetada, acao, usuario, data_processo, detalhes) VALUES ('compositor', 'DELETE', USER(), NOW(), CONCAT('Removeu Compositor: ', OLD.nome)); END //

-- Triggers para PLAYLIST --
CREATE TRIGGER tr_ins_play AFTER INSERT ON playlist FOR EACH ROW 
BEGIN INSERT INTO log_spotymusic (tabela_afetada, acao, usuario, data_processo, detalhes) VALUES ('playlist', 'INSERT', USER(), NOW(), CONCAT('Nova Playlist: ', NEW.nome_lista)); END //
CREATE TRIGGER tr_del_play AFTER DELETE ON playlist FOR EACH ROW 
BEGIN INSERT INTO log_spotymusic (tabela_afetada, acao, usuario, data_processo, detalhes) VALUES ('playlist', 'DELETE', USER(), NOW(), CONCAT('Removeu Playlist: ', OLD.nome_lista)); END //

-- Triggers para as ASSOCIATIVAS (Exemplo Artista_Musica) --
CREATE TRIGGER tr_ins_art_mus AFTER INSERT ON artista_musica FOR EACH ROW 
BEGIN INSERT INTO log_spotymusic (tabela_afetada, acao, usuario, data_processo, detalhes) VALUES ('artista_musica', 'INSERT', USER(), NOW(), 'Vinculou Artista à Música'); END //

DELIMITER ;


-- 3. INSERÇÃO DOS 10 ARTISTAS E 10 COMPOSITORES --

INSERT INTO artista (id_artista, nome) VALUES 
(1, 'Queen'), (2, 'Metallica'), (3, 'Pink Floyd'), (4, 'Iron Maiden'), (5, 'Nirvana'),
(6, 'AC/DC'), (7, 'Led Zeppelin'), (8, 'Deep Purple'), (9, 'Black Sabbath'), (10, 'Guns N Roses');

INSERT INTO compositor (id_compositor, nome) VALUES 
(1, 'Freddie Mercury'), (2, 'James Hetfield'), (3, 'Roger Waters'), (4, 'Steve Harris'), (5, 'Kurt Cobain'),
(6, 'Angus Young'), (7, 'Jimmy Page'), (8, 'Ian Gillan'), (9, 'Tony Iommi'), (10, 'Axl Rose');


-- 4. INSERÇÃO DE 2 ÁLBUNS POR ARTISTA (20) --

-- Aqui usamos IDs de 101 em diante para álbuns
INSERT INTO album (id_album, titulo, ano_lancamento) VALUES 
(101, 'A Night at the Opera', 1975), (102, 'News of the World', 1977), -- Queen
(103, 'Master of Puppets', 1986), (104, 'Metallica Black', 1991),    -- Metallica
(105, 'The Wall', 1979), (106, 'Dark Side of the Moon', 1973),       -- Pink Floyd
(107, 'Powerslave', 1984), (108, 'Piece of Mind', 1983),             -- Iron Maiden
(109, 'Nevermind', 1991), (110, 'In Utero', 1993),                  -- Nirvana
(111, 'Back in Black', 1980), (112, 'Highway to Hell', 1979),       -- AC/DC
(113, 'Led Zeppelin IV', 1971), (114, 'Physical Graffiti', 1975),    -- Led Zeppelin
(115, 'Machine Head', 1972), (116, 'Burn', 1974),                   -- Deep Purple
(117, 'Paranoid', 1970), (118, 'Master of Reality', 1971),          -- Black Sabbath
(119, 'Appetite for Destruction', 1987), (120, 'Use Your Illusion', 1991); -- Guns


-- 5. INSERÇÃO DE 10 MÚSICAS POR ÁLBUM  --

-- Repitir o padrão de IDs para completar os 200 registros se necessário --
INSERT INTO musica (id_musica, titulo, duracao, fk_genero_id_genero) VALUES 
(1001, 'Death on Two Legs', 223, 1), (1002, 'Lazing on a Sunday', 67, 1), (1003, 'Im in Love with My Car', 185, 1),
(1004, 'Youre My Best Friend', 172, 1), (1005, '39', 211, 1), (1006, 'Sweet Lady', 243, 1),
(1007, 'Seaside Rendezvous', 135, 1), (1008, 'The Prophets Song', 501, 1), (1009, 'Love of My Life', 213, 1), (1010, 'Bohemian Rhapsody', 354, 1);

-- Vinculando músicas ao Álbum 101 
UPDATE album SET fk_musica_id_musica = 1010 WHERE id_album = 101;


-- 6. PLAYLISTS (4 COM 10 MÚSICAS CADA) --

INSERT INTO playlist (id_playlist, nome_lista, data_criacao) VALUES 
(1, 'Melhores do Rock', NOW()), (2, 'Metal Pesado', NOW()), (3, 'Clássicos 70s', NOW()), (4, 'Acústico Solo', NOW());

-- Vinculando 10 músicas na Playlist 1 (Tabela Associativa) --
INSERT INTO playlist_musica (fk_playlist_id_playlist, fk_musica_id_musica) VALUES 
(1, 1001), (1, 1002), (1, 1003), (1, 1004), (1, 1005), (1, 1006), (1, 1007), (1, 1008), (1, 1009), (1, 1010);


-- 7. CONFERIR AUDITORIA --

SELECT * FROM log_spotymusic;


USE SPOTYMUSIC_120;

-- Tabela para registros de novos dados --
CREATE TABLE log_insercao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tabela_afetada VARCHAR(50),
    usuario VARCHAR(100),
    data_hora DATETIME,
    detalhes TEXT
);

-- Tabela para registros de exclusões --
CREATE TABLE log_delecao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tabela_afetada VARCHAR(50),
    usuario VARCHAR(100),
    data_hora DATETIME,
    detalhes TEXT
);

-- Tabela para registros de alterações --
CREATE TABLE log_atualizacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tabela_afetada VARCHAR(50),
    usuario VARCHAR(100),
    data_hora DATETIME,
    valor_antigo TEXT,
    valor_novo TEXT
);


DELIMITER //

-- TRIGGER DE INSERÇÃO (log_insercao) --
CREATE TRIGGER tr_ins_musica_sep AFTER INSERT ON musica FOR EACH ROW
BEGIN
    INSERT INTO log_insercao (tabela_afetada, usuario, data_hora, detalhes)
    VALUES ('musica', USER(), NOW(), CONCAT('Inserida música: ', NEW.titulo));
END //

-- TRIGGER DE DELEÇÃO (log_delecao) --
CREATE TRIGGER tr_del_musica_sep AFTER DELETE ON musica FOR EACH ROW
BEGIN
    INSERT INTO log_delecao (tabela_afetada, usuario, data_hora, detalhes)
    VALUES ('musica', USER(), NOW(), CONCAT('Removida música: ', OLD.titulo));
END //

-- TRIGGER DE ATUALIZAÇÃO (log_atualizacao) --
CREATE TRIGGER tr_upd_musica_sep AFTER UPDATE ON musica FOR EACH ROW
BEGIN
    INSERT INTO log_atualizacao (tabela_afetada, usuario, data_hora, valor_antigo, valor_novo)
    VALUES ('musica', USER(), NOW(), OLD.titulo, NEW.titulo);
END //

DELIMITER ;
