-- 1. SELECIONAR O BANCO
USE SPOTYMUSIC_120;


-- 2. CRIAÇÃO DAS TABELAS DE LOG  --

CREATE TABLE IF NOT EXISTS log_insercao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tabela_afetada VARCHAR(50),
    usuario VARCHAR(100),
    data_hora DATETIME,
    detalhes TEXT
);

CREATE TABLE IF NOT EXISTS log_delecao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tabela_afetada VARCHAR(50),
    usuario VARCHAR(100),
    data_hora DATETIME,
    detalhes TEXT
);

CREATE TABLE IF NOT EXISTS log_atualizacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tabela_afetada VARCHAR(50),
    usuario VARCHAR(100),
    data_hora DATETIME,
    valor_antigo TEXT,
    valor_novo TEXT
);


-- 3. TRIGGERS DIRECIONADAS --

DROP TRIGGER IF EXISTS tr_ins_musica_nova;
DROP TRIGGER IF EXISTS tr_del_musica_nova;
DROP TRIGGER IF EXISTS tr_upd_musica_nova;

DELIMITER //

CREATE TRIGGER tr_ins_musica_nova AFTER INSERT ON musica FOR EACH ROW
BEGIN
    INSERT INTO log_insercao (tabela_afetada, usuario, data_hora, detalhes)
    VALUES ('musica', USER(), NOW(), CONCAT('Nova música: ', NEW.titulo));
END //

CREATE TRIGGER tr_del_musica_nova AFTER DELETE ON musica FOR EACH ROW
BEGIN
    INSERT INTO log_delecao (tabela_afetada, usuario, data_hora, detalhes)
    VALUES ('musica', USER(), NOW(), CONCAT('Removida: ', OLD.titulo));
END //

CREATE TRIGGER tr_upd_musica_nova AFTER UPDATE ON musica FOR EACH ROW
BEGIN
    INSERT INTO log_atualizacao (tabela_afetada, usuario, data_hora, valor_antigo, valor_novo)
    VALUES ('musica', USER(), NOW(), OLD.titulo, NEW.titulo);
END //

DELIMITER ;


-- 4. PROCEDURE DE CARGA COMPLEMENTAR --

DROP PROCEDURE IF EXISTS sp_completar_banco;

DELIMITER //

CREATE PROCEDURE sp_completar_banco()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE total_atual INT;
    DECLARE id_musica_extra INT DEFAULT 9000; -- ID alto para não bater nos seus
    
    SELECT COUNT(*) INTO total_atual FROM musica;
    
    -- Se você tiver menos de 200 músicas, ele completa
    WHILE total_atual < 200 DO
        INSERT INTO musica (id_musica, titulo, duracao, fk_genero_id_genero)
        VALUES (id_musica_extra + total_atual, CONCAT('Track Especial ', total_atual), 200, 1);
        
        SET total_atual = total_atual + 1;
    END WHILE;
END //

DELIMITER ;

-- EXECUTA A COMPLEMENTAÇÃO
CALL sp_completar_banco();


-- 5. RELATÓRIO DE CONFERÊNCIA 


-- Verificando as quantidades totais --+
SELECT 'Artistas' AS Categoria, COUNT(*) AS Total FROM artista
UNION SELECT 'Álbuns', COUNT(*) FROM album
UNION SELECT 'Músicas', COUNT(*) FROM musica
UNION SELECT 'Compositores', COUNT(*) FROM compositor;

-- Verificando os Logs Separados --
SELECT 'Inserções' AS Tipo_Log, COUNT(*) AS Total FROM log_insercao
UNION SELECT 'Deleções', COUNT(*) FROM log_delecao
UNION SELECT 'Atualizações', COUNT(*) FROM log_atualizacao;

-- Ver as últimas músicas inseridas pela Procedure --
SELECT * FROM musica ORDER BY id_musica DESC LIMIT 20;

-- Ver o log de quem acabou de entrar --
SELECT * FROM log_insercao ORDER BY id DESC LIMIT 20;