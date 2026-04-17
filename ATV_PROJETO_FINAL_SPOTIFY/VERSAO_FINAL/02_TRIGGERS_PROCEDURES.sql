USE SPOTYMUSIC_120;
DELIMITER //

-- PROCEDURES DE INSERÇÃO (Uma para cada tabela)
CREATE PROCEDURE sp_ins_genero(IN n VARCHAR(50)) BEGIN INSERT INTO genero (nome) VALUES (n); END //
CREATE PROCEDURE sp_ins_artista(IN n VARCHAR(100)) BEGIN INSERT INTO artista (nome) VALUES (n); END //
CREATE PROCEDURE sp_ins_compositor(IN n VARCHAR(100)) BEGIN INSERT INTO compositor (nome) VALUES (n); END //
CREATE PROCEDURE sp_ins_playlist(IN n VARCHAR(100), IN d DATE) BEGIN INSERT INTO playlist (nome_lista, data_criacao) VALUES (n, d); END //
CREATE PROCEDURE sp_ins_musica(IN t VARCHAR(100), IN d INT, IN g INT) BEGIN INSERT INTO musica (titulo, duracao, fk_genero_id_genero) VALUES (t, d, g); END //
CREATE PROCEDURE sp_ins_album(IN t VARCHAR(100), IN a INT) BEGIN INSERT INTO album (titulo, fk_artista_id_artista) VALUES (t, a); END //

-- TRIGGERS DE LOG (INSERT e DELETE para TODAS as tabelas principais)
-- Genero
CREATE TRIGGER tr_gen_ins AFTER INSERT ON genero FOR EACH ROW BEGIN INSERT INTO log_insercao VALUES (NULL, 'genero', USER(), NOW(), NEW.nome); END //
CREATE TRIGGER tr_gen_del AFTER DELETE ON genero FOR EACH ROW BEGIN INSERT INTO log_delecao VALUES (NULL, 'genero', USER(), NOW(), OLD.nome); END //
-- Artista
CREATE TRIGGER tr_art_ins AFTER INSERT ON artista FOR EACH ROW BEGIN INSERT INTO log_insercao VALUES (NULL, 'artista', USER(), NOW(), NEW.nome); END //
CREATE TRIGGER tr_art_del AFTER DELETE ON artista FOR EACH ROW BEGIN INSERT INTO log_delecao VALUES (NULL, 'artista', USER(), NOW(), OLD.nome); END //
-- Compositor
CREATE TRIGGER tr_comp_ins AFTER INSERT ON compositor FOR EACH ROW BEGIN INSERT INTO log_insercao VALUES (NULL, 'compositor', USER(), NOW(), NEW.nome); END //
CREATE TRIGGER tr_comp_del AFTER DELETE ON compositor FOR EACH ROW BEGIN INSERT INTO log_delecao VALUES (NULL, 'compositor', USER(), NOW(), OLD.nome); END //
-- Musica
CREATE TRIGGER tr_mus_ins AFTER INSERT ON musica FOR EACH ROW BEGIN INSERT INTO log_insercao VALUES (NULL, 'musica', USER(), NOW(), NEW.titulo); END //
CREATE TRIGGER tr_mus_del AFTER DELETE ON musica FOR EACH ROW BEGIN INSERT INTO log_delecao VALUES (NULL, 'musica', USER(), NOW(), OLD.titulo); END //
-- Album
CREATE TRIGGER tr_alb_ins AFTER INSERT ON album FOR EACH ROW BEGIN INSERT INTO log_insercao VALUES (NULL, 'album', USER(), NOW(), NEW.titulo); END //
CREATE TRIGGER tr_alb_del AFTER DELETE ON album FOR EACH ROW BEGIN INSERT INTO log_delecao VALUES (NULL, 'album', USER(), NOW(), OLD.titulo); END //
-- Playlist
CREATE TRIGGER tr_pl_ins AFTER INSERT ON playlist FOR EACH ROW BEGIN INSERT INTO log_insercao VALUES (NULL, 'playlist', USER(), NOW(), NEW.nome_lista); END //
CREATE TRIGGER tr_pl_del AFTER DELETE ON playlist FOR EACH ROW BEGIN INSERT INTO log_delecao VALUES (NULL, 'playlist', USER(), NOW(), OLD.nome_lista); END //

DELIMITER ;