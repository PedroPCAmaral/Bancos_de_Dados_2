
-- BANCO DE DADOS: SPOTYMUSIC_120 --


CREATE DATABASE SPOTYMUSIC_120;
USE SPOTYMUSIC_120;

-- 1. Tabela Gênero
CREATE TABLE genero (
    id_genero INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- 2. Tabela Música --
CREATE TABLE musica (
    id_musica INTEGER PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    duracao INTEGER, -- Tempo em segundos
    fk_genero_id_genero INTEGER,
    FOREIGN KEY (fk_genero_id_genero) REFERENCES genero(id_genero) ON DELETE CASCADE
);

-- 3. Tabela Álbum --
CREATE TABLE album (
    id_album INTEGER PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    ano_lancamento INTEGER,
    fk_musica_id_musica INTEGER,
    FOREIGN KEY (fk_musica_id_musica) REFERENCES musica(id_musica) ON DELETE CASCADE
);

-- 4. Tabela Artista --
CREATE TABLE artista (
    id_artista INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- 5. Tabela Compositor -- 
CREATE TABLE compositor (
    id_compositor INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- 6. Tabela Playlist --
CREATE TABLE playlist (
    id_playlist INTEGER PRIMARY KEY,
    nome_lista VARCHAR(100) NOT NULL,
    data_criacao DATE
);

-- TABELAS ASSOCIATIVAS (Relacionamentos Muitos-para-Muitos) --

-- 7. Tabela Associativa: artista_musica --
CREATE TABLE artista_musica (
    fk_artista_id_artista INTEGER,
    fk_musica_id_musica INTEGER,
    PRIMARY KEY (fk_artista_id_artista, fk_musica_id_musica),
    FOREIGN KEY (fk_artista_id_artista) REFERENCES artista(id_artista) ON DELETE CASCADE,
    FOREIGN KEY (fk_musica_id_musica) REFERENCES musica(id_musica) ON DELETE CASCADE
);

-- 8. Tabela Associativa: compositor_musica --
CREATE TABLE compositor_musica (
    fk_compositor_id_compositor INTEGER,
    fk_musica_id_musica INTEGER,
    PRIMARY KEY (fk_compositor_id_compositor, fk_musica_id_musica),
    FOREIGN KEY (fk_compositor_id_compositor) REFERENCES compositor(id_compositor) ON DELETE CASCADE,
    FOREIGN KEY (fk_musica_id_musica) REFERENCES musica(id_musica) ON DELETE CASCADE
);

-- 9. Tabela Associativa: playlist_musica --
CREATE TABLE playlist_musica (
    fk_playlist_id_playlist INTEGER,
    fk_musica_id_musica INTEGER,
    PRIMARY KEY (fk_playlist_id_playlist, fk_musica_id_musica),
    FOREIGN KEY (fk_playlist_id_playlist) REFERENCES playlist(id_playlist) ON DELETE CASCADE,
    FOREIGN KEY (fk_musica_id_musica) REFERENCES musica(id_musica) ON DELETE CASCADE
);