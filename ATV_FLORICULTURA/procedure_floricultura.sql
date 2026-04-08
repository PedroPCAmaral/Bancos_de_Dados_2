DELIMITER //

-- 1. Atualizar o preço de um produto por uma porcentagem
CREATE PROCEDURE sp_reajuste_preco(IN p_id_produto INT, IN p_porcentagem DECIMAL(5,2))
BEGIN
    UPDATE produto SET preco = preco * (1 + p_porcentagem / 100) 
    WHERE id_produto = p_id_produto;
END //

-- 2. Mudar o status de uma encomenda
CREATE PROCEDURE sp_alterar_status_encomenda(IN p_id_encomenda INT, IN p_novo_status VARCHAR(50))
BEGIN
    UPDATE encomenda SET status = p_novo_status 
    WHERE id_encomenda = p_id_encomenda;
END //

-- 3. Inserir um novo tipo de produto
CREATE PROCEDURE sp_inserir_tipo_produto(IN p_descricao VARCHAR(50))
BEGIN
    INSERT INTO tipo_produto (descricao) VALUES (p_descricao);
END //

-- 4. Excluir um item de uma encomenda específica
CREATE PROCEDURE sp_remover_item_encomenda(IN p_id_item INT)
BEGIN
    DELETE FROM item_encomenda WHERE id_item = p_id_item;
END //

DELIMITER ;