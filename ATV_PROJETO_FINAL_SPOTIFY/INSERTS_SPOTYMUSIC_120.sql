-- 1. USAR BANCO --
USE SPOTYMUSIC_120;


SET SQL_SAFE_UPDATES = 0; -- Desativa a trava de segurança

DELETE FROM artista_musica;
DELETE FROM playlist_musica;
DELETE FROM compositor_musica;
DELETE FROM album;
DELETE FROM musica;
DELETE FROM artista;
DELETE FROM compositor;
DELETE FROM playlist;
DELETE FROM genero;
DELETE FROM log_spotymusic;

SET SQL_SAFE_UPDATES = 1; -- Reativa a trava 


-- 2. INSERÇÃO BASE (GÊNERO) --

INSERT INTO genero (id_genero, nome) VALUES (1, 'Rock');


-- 3. INSERINDO 10 ARTISTAS

INSERT INTO artista (id_artista, nome) VALUES 
(1, 'Linkin Park'), (2, 'Imagine Dragons'), (3, 'Arctic Monkeys'), (4, 'The Weeknd'), 
(5, 'Bruno Mars'), (6, 'Daft Punk'), (7, 'Coldplay'), (8, 'Gorillaz'), (9, 'Red Hot Chili Peppers'), (10, 'Tame Impala');


-- 4. INSERINDO 10 COMPOSITORES --

INSERT INTO compositor (id_compositor, nome) VALUES 
(1, 'Mike Shinoda'), (2, 'Dan Reynolds'), (3, 'Alex Turner'), (4, 'Abel Tesfaye'), 
(5, 'Bruno Mars'), (6, 'Thomas Bangalter'), (7, 'Chris Martin'), (8, 'Damon Albarn'), (9, 'Anthony Kiedis'), (10, 'Kevin Parker');


-- 5. INSERINDO 2 ÁLBUNS POR ARTISTA (EX: PARA OS 2 PRIMEIROS) -- 

INSERT INTO album (id_album, titulo, ano_lancamento) VALUES 
(101, 'Hybrid Theory', 2000), (102, 'Meteora', 2003),        
(103, 'Night Visions', 2012), (104, 'Evolve', 2017);       


-- 6. INSERINDO 10 MÚSICAS PARA O ÁLBUM 101 --

INSERT INTO musica (id_musica, titulo, duracao, fk_genero_id_genero) VALUES 
(1001, 'Papercut', 184, 1), (1002, 'One Step Closer', 155, 1), (1003, 'With You', 203, 1), 
(1004, 'Points of Authority', 200, 1), (1005, 'Crawling', 209, 1), (1006, 'Runaway', 183, 1), 
(1007, 'By Myself', 189, 1), (1008, 'In the End', 216, 1), (1009, 'A Place for My Head', 204, 1), (1010, 'Forgotten', 194, 1);


-- 7. INSERINDO 4 PLAYLISTS --

INSERT INTO playlist (id_playlist, nome_lista, data_criacao) VALUES 
(1, 'Rock Classics', NOW()), (2, 'Top 2026', NOW()), (3, 'Gym Mix', NOW()), (4, 'Study Lo-Fi', NOW());


-- 8. VINCULAR 10 MÚSICAS NA PLAYLIST 1 --

INSERT INTO playlist_musica (fk_playlist_id_playlist, fk_musica_id_musica) VALUES 
(1, 1001), (1, 1002), (1, 1003), (1, 1004), (1, 1005), (1, 1006), (1, 1007), (1, 1008), (1, 1009), (1, 1010);

USE SPOTYMUSIC_120;

-- 9. COMPLETANDO OS ÁLBUNS (2 para cada um dos 10 artistas)
-- Já temos os álbuns 101, 102, 103, 104. completar até o 120. --
INSERT INTO album (id_album, titulo, ano_lancamento) VALUES 
(105, 'The Wall', 1979), (106, 'Animals', 1977),             -- Pink Floyd
(107, 'Powerslave', 1984), (108, 'Somewhere in Time', 1986), -- Iron Maiden
(109, 'Nevermind', 1991), (110, 'In Utero', 1993),           -- Nirvana
(111, 'Back in Black', 1980), (112, 'TNT', 1975),            -- AC/DC
(113, 'Led Zeppelin IV', 1971), (114, 'Houses of the Holy', 1973), -- Led Zep
(115, 'Machine Head', 1972), (116, 'Burn', 1974),            -- Deep Purple
(117, 'Paranoid', 1970), (118, 'Master of Reality', 1971),   -- Black Sabbath
(119, 'Appetite for Destruction', 1987), (120, 'Lies', 1988);-- Guns

-- 10. CARGA DE MÚSICAS (Modelo para gerar volume rápido)
-- Vamos inserir blocos de músicas para preencher o banco
INSERT INTO musica (id_musica, titulo, duracao, fk_genero_id_genero) VALUES 
(2001, 'Música Teste 1', 200, 1), (2002, 'Música Teste 2', 210, 1), (2003, 'Música Teste 3', 220, 1),
(2004, 'Música Teste 4', 230, 1), (2005, 'Música Teste 5', 240, 1), (2006, 'Música Teste 6', 250, 1),
(2007, 'Música Teste 7', 260, 1), (2008, 'Música Teste 8', 270, 1), (2009, 'Música Teste 9', 280, 1), (2010, 'Música Teste 10', 290, 1);

-- 11. COMPLETANDO AS PLAYLISTS (10 músicas em cada uma das 4)
-- Já temos a Playlist 1.  popular a 2, 3 e 4.
INSERT INTO playlist_musica (fk_playlist_id_playlist, fk_musica_id_musica) VALUES 
(2, 1001), (2, 1002), (2, 1003), (2, 1004), (2, 1005), (2, 1006), (2, 1007), (2, 1008), (2, 1009), (2, 1010),
(3, 2001), (3, 2002), (3, 2003), (3, 2004), (3, 2005), (3, 2006), (3, 2007), (3, 2008), (3, 2009), (3, 2010),
(4, 1001), (4, 1002), (4, 2001), (4, 2002), (4, 1005), (4, 2006), (4, 1007), (4, 2008), (4, 1009), (4, 2010);




-- 12. COMPLETANDO OS ÁLBUNS (2 para cada um dos 10 artistas) --

INSERT INTO album (id_album, titulo, ano_lancamento) VALUES 
(105, 'The Wall', 1979), (106, 'Animals', 1977),             -- Pink Floyd
(107, 'Powerslave', 1984), (108, 'Somewhere in Time', 1986), -- Iron Maiden
(109, 'Nevermind', 1991), (110, 'In Utero', 1993),           -- Nirvana
(111, 'Back in Black', 1980), (112, 'TNT', 1975),            -- AC/DC
(113, 'Led Zeppelin IV', 1971), (114, 'Houses of the Holy', 1973), -- Led Zep
(115, 'Machine Head', 1972), (116, 'Burn', 1974),            -- Deep Purple
(117, 'Paranoid', 1970), (118, 'Master of Reality', 1971),   -- Black Sabbath
(119, 'Appetite for Destruction', 1987), (120, 'Lies', 1988);-- Guns

-- 13. CARGA DE MÚSICAS --

INSERT INTO musica (id_musica, titulo, duracao, fk_genero_id_genero) VALUES 
(2001, 'Música Teste 1', 200, 1), (2002, 'Música Teste 2', 210, 1), (2003, 'Música Teste 3', 220, 1),
(2004, 'Música Teste 4', 230, 1), (2005, 'Música Teste 5', 240, 1), (2006, 'Música Teste 6', 250, 1),
(2007, 'Música Teste 7', 260, 1), (2008, 'Música Teste 8', 270, 1), (2009, 'Música Teste 9', 280, 1), (2010, 'Música Teste 10', 290, 1);

-- 14. COMPLETANDO AS PLAYLISTS (10 músicas em cada uma das 4) --

INSERT INTO playlist_musica (fk_playlist_id_playlist, fk_musica_id_musica) VALUES 
(2, 1001), (2, 1002), (2, 1003), (2, 1004), (2, 1005), (2, 1006), (2, 1007), (2, 1008), (2, 1009), (2, 1010),
(3, 2001), (3, 2002), (3, 2003), (3, 2004), (3, 2005), (3, 2006), (3, 2007), (3, 2008), (3, 2009), (3, 2010),
(4, 1001), (4, 1002), (4, 2001), (4, 2002), (4, 1005), (4, 2006), (4, 1007), (4, 2008), (4, 1009), (4, 2010);




INSERT INTO musica (id_musica, titulo, duracao, fk_genero_id_genero) VALUES 
(3001, 'Rock Track 01', 200, 1), (3002, 'Rock Track 02', 200, 1), (3003, 'Rock Track 03', 200, 1),
(3004, 'Rock Track 04', 200, 1), (3005, 'Rock Track 05', 200, 1), (3006, 'Rock Track 06', 200, 1),
(3007, 'Rock Track 07', 200, 1), (3008, 'Rock Track 08', 200, 1), (3009, 'Rock Track 09', 200, 1),
(3010, 'Rock Track 10', 200, 1), (3011, 'Rock Track 11', 200, 1), (3012, 'Rock Track 12', 200, 1),
(3013, 'Rock Track 13', 200, 1), (3014, 'Rock Track 14', 200, 1), (3015, 'Rock Track 15', 200, 1),
(3016, 'Rock Track 16', 200, 1), (3017, 'Rock Track 17', 200, 1), (3018, 'Rock Track 18', 200, 1),
(3019, 'Rock Track 19', 200, 1), (3020, 'Rock Track 20', 200, 1);
