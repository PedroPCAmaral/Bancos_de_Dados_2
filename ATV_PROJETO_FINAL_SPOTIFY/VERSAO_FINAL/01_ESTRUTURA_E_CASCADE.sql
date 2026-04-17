DROP DATABASE IF EXISTS SPOTYMUSIC_120;
CREATE DATABASE IF NOT EXISTS SPOTYMUSIC_120;
USE SPOTYMUSIC_120;

CREATE TABLE genero (
    id_genero INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE artista (
    id_artista INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE compositor (
    id_compositor INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE playlist (
    id_playlist INT AUTO_INCREMENT PRIMARY KEY, 
    nome_lista VARCHAR(100) NOT NULL, 
    data_criacao DATE
);

CREATE TABLE musica (
    id_musica INT AUTO_INCREMENT PRIMARY KEY, 
    titulo VARCHAR(100) NOT NULL, 
    duracao INT NOT NULL, 
    fk_genero_id_genero INT, 
    FOREIGN KEY (fk_genero_id_genero) REFERENCES genero (id_genero) ON DELETE CASCADE
);

CREATE TABLE album (
    id_album INT AUTO_INCREMENT PRIMARY KEY, 
    titulo VARCHAR(100) NOT NULL, 
    fk_artista_id_artista INT, 
    FOREIGN KEY (fk_artista_id_artista) REFERENCES artista (id_artista) ON DELETE CASCADE
);

CREATE TABLE artista_musica (
    fk_artista_id_artista INT, 
    fk_musica_id_musica INT, 
    PRIMARY KEY (fk_artista_id_artista, fk_musica_id_musica),
    FOREIGN KEY (fk_artista_id_artista) REFERENCES artista(id_artista) ON DELETE CASCADE,
    FOREIGN KEY (fk_musica_id_musica) REFERENCES musica (id_musica) ON DELETE CASCADE
);

CREATE TABLE compositor_musica (
    fk_compositor_id_compositor INT, 
    fk_musica_id_musica INT, 
    PRIMARY KEY (fk_compositor_id_compositor, fk_musica_id_musica),
    FOREIGN KEY (fk_compositor_id_compositor) REFERENCES compositor (id_compositor) ON DELETE CASCADE,
    FOREIGN KEY (fk_musica_id_musica) REFERENCES musica (id_musica) ON DELETE CASCADE
);

CREATE TABLE playlist_musica (
    fk_playlist_id_playlist INT, 
    fk_musica_id_musica INT, 
    PRIMARY KEY (fk_playlist_id_playlist, fk_musica_id_musica),
    FOREIGN KEY (fk_playlist_id_playlist) REFERENCES playlist (id_playlist) ON DELETE CASCADE,
    FOREIGN KEY (fk_musica_id_musica) REFERENCES musica (id_musica) ON DELETE CASCADE
);

-- Tabelas de Log
CREATE TABLE log_insercao (id INT AUTO_INCREMENT PRIMARY KEY, tabela VARCHAR(50), usuario VARCHAR(100), data_hora DATETIME, detalhes TEXT);
CREATE TABLE log_delecao (id INT AUTO_INCREMENT PRIMARY KEY, tabela VARCHAR(50), usuario VARCHAR(100), data_hora DATETIME, detalhes TEXT);