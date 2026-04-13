
-- 3. TRIGGERS --

DELIMITER //

-- Trigger de Inserção (Apenas mensagem de aviso ou log simples) --
CREATE TRIGGER tr_after_insert_livro
AFTER INSERT ON livro
FOR EACH ROW
BEGIN
    INSERT INTO log_livro (id_livro, acao, usuario, data_processo)
    VALUES (NEW.id_livro, 'INSERÇÃO', USER(), NOW());
END //

-- Trigger de Deletar (Registra quem apagou e quando)
CREATE TRIGGER tr_after_delete_livro
AFTER DELETE ON livro
FOR EACH ROW
BEGIN
    INSERT INTO log_livro (id_livro, acao, usuario, data_processo)
    VALUES (OLD.id_livro, 'DELEÇÃO', USER(), NOW());
END //

-- Trigger de Atualizar Valor (Registra usuário, data e a mudança de preço)
CREATE TRIGGER tr_after_update_valor
AFTER UPDATE ON livro
FOR EACH ROW
BEGIN
    IF OLD.valor <> NEW.valor THEN
        INSERT INTO log_livro (id_livro, acao, usuario, data_processo, valor_antigo, valor_novo)
        VALUES (NEW.id_livro, 'ATUALIZAÇÃO VALOR', USER(), NOW(), OLD.valor, NEW.valor);
    END IF;
END //

DELIMITER ;


-- 4. PROCEDURE DE INSERÇÃO (3 LIVROS) --


DELIMITER //
CREATE PROCEDURE sp_insert_livro(
    IN p_id INT, 
    IN p_titulo VARCHAR(150), 
    IN p_isbn VARCHAR(20), 
    IN p_pag INT, 
    IN p_valor DECIMAL(10,2)
)
BEGIN
    INSERT INTO livro VALUES (p_id, p_titulo, p_isbn, p_pag, p_valor);
END //
DELIMITER ;

-- Inserindo os 3 livros via Procedure
CALL sp_insert_livro(1, 'O Senhor dos Anéis', '978-85', 1200, 89.90);
CALL sp_insert_livro(2, 'Dom Casmurro', '978-86', 256, 35.00);
CALL sp_insert_livro(3, 'O Alquimista', '978-87', 208, 42.50);


-- TESTES PARA O PROFESSOR --


-- 1. Testar Update (vai disparar a trigger de valor) --
UPDATE livro SET valor = 95.00 WHERE id_livro = 1;

-- 2. Testar Delete (vai disparar a trigger de delete) --
DELETE FROM livro WHERE id_livro = 2;

-- 3. VER O RESULTADO DA AUDITORIA --
SELECT * FROM log_livro;