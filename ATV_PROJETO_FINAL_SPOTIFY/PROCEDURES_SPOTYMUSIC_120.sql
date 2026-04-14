USE SPOTYMUSIC_120;

-- 1. PROCEDURES DE INSERÇÃO --

DELIMITER //

CREATE PROCEDURE sp_insert_genero(IN p_id INT, IN p_nome VARCHAR(100))
BEGIN
    INSERT INTO genero (id_genero, nome) VALUES (p_id, p_nome);
END //

CREATE PROCEDURE sp_insert_artista(IN p_id INT, IN p_nome VARCHAR(100))
BEGIN
    INSERT INTO artista (id_artista, nome) VALUES (p_id, p_nome);
END //

CREATE PROCEDURE sp_insert_compositor(IN p_id INT, IN p_nome VARCHAR(100))
BEGIN
    INSERT INTO compositor (id_compositor, nome) VALUES (p_id, p_nome);
END //

CREATE PROCEDURE sp_insert_musica(IN p_id INT, IN p_titulo VARCHAR(100), IN p_duracao INT, IN p_genero INT)
BEGIN
    INSERT INTO musica (id_musica, titulo, duracao, fk_genero_id_genero) VALUES (p_id, p_titulo, p_duracao, p_genero);
END //

CREATE PROCEDURE sp_insert_album(IN p_id INT, IN p_titulo VARCHAR(100), IN p_ano INT, IN p_musica INT)
BEGIN
    INSERT INTO album (id_album, titulo, ano_lancamento, fk_musica_id_musica) VALUES (p_id, p_titulo, p_ano, p_musica);
END //

CREATE PROCEDURE sp_insert_playlist(IN p_id INT, IN p_nome VARCHAR(100), IN p_data DATE)
BEGIN
    INSERT INTO playlist (id_playlist, nome_lista, data_criacao) VALUES (p_id, p_nome, p_data);
END //


-- 2. PROCEDURE DE EXCLUSÃO (PARA TESTAR O CASCADE) --


CREATE PROCEDURE sp_delete_musica(IN p_id INT)
BEGIN
    DELETE FROM musica WHERE id_musica = p_id;
END //

DELIMITER ;


-- 3. EXECUTANDO AS INSERÇÕES (3 DE CADA) --


-- Inserindo Gêneros --
CALL sp_insert_genero(1, 'Rock');
CALL sp_insert_genero(2, 'Pop');
CALL sp_insert_genero(3, 'Jazz');

-- Inserindo Artistas --
CALL sp_insert_artista(10, 'Queen');
CALL sp_insert_artista(20, 'Michael Jackson');
CALL sp_insert_artista(30, 'Miles Davis');

-- Inserindo Compositores --
CALL sp_insert_compositor(100, 'Freddie Mercury');
CALL sp_insert_compositor(200, 'Quincy Jones');
CALL sp_insert_compositor(300, 'Bill Evans');

-- Inserindo Músicas --
CALL sp_insert_musica(500, 'Bohemian Rhapsody', 354, 1);
CALL sp_insert_musica(600, 'Thriller', 357, 2);
CALL sp_insert_musica(700, 'So What', 562, 3);

-- Inserindo Álbuns --
CALL sp_insert_album(1000, 'A Night at the Opera', 1975, 500);
CALL sp_insert_album(2000, 'Thriller Album', 1982, 600);
CALL sp_insert_album(3000, 'Kind of Blue', 1959, 700);

-- Inserindo Playlists --
CALL sp_insert_playlist(1, 'Favoritas 80s', '2024-01-10');
CALL sp_insert_playlist(2, 'Trabalho Concentrado', '2024-02-15');
CALL sp_insert_playlist(3, 'Churrasco', '2024-03-20');

-- Ligando nas associativas (Isso é importante para o teste de exclusão) --
INSERT INTO artista_musica (fk_artista_id_artista, fk_musica_id_musica) VALUES (10, 500), (20, 600), (30, 700);
INSERT INTO playlist_musica (fk_playlist_id_playlist, fk_musica_id_musica) VALUES (1, 500), (1, 600), (2, 700);
INSERT INTO compositor_musica (fk_compositor_id_compositor, fk_musica_id_musica) VALUES (100, 500), (200, 600), (300, 700);

CALL sp_delete_musica(500);

-- 1. Verificando a música (Deve retornar 0 linhas) -- 
SELECT * FROM musica WHERE id_musica = 500;

-- 2. Verificando na tabela associativa (Deve retornar 0  - PROVA O CASCADE) --
SELECT * FROM artista_musica WHERE fk_musica_id_musica = 500;

-- 3. Verificando no álbum (Deve retornar 0  - PROVA O CASCADE) --
SELECT * FROM album WHERE fk_musica_id_musica = 500;

-- 4. Verificando na playlist (Deve retornar 0  - PROVA O CASCADE) --
SELECT * FROM playlist_musica WHERE fk_musica_id_musica = 500;

CALL sp_delete_musica(500);