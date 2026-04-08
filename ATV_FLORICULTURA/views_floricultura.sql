-- 1. Relatório de Encomendas com nome do Cliente e Endereço de Entrega
CREATE VIEW v_relatorio_entregas AS
SELECT e.id_encomenda, c.nome AS cliente, e.status, l.endereco, l.cidade
FROM encomenda e
JOIN cliente c ON e.id_cliente = c.id_cliente
JOIN local_entrega l ON e.id_local = l.id_local;

-- 2. Lista de Produtos detalhada com sua Categoria (Tipo)
CREATE VIEW v_detalhes_produtos AS
SELECT p.id_produto, p.nome, p.preco, t.descricao AS categoria
FROM produto p
JOIN tipo_produto t ON p.id_tipo = t.id_tipo;

-- 3. Resumo financeiro de itens vendidos por encomenda
CREATE VIEW v_financeiro_itens AS
SELECT i.id_encomenda, p.nome, i.quantidade, p.preco, (i.quantidade * p.preco) AS subtotal
FROM item_encomenda i
JOIN produto p ON i.id_produto = p.id_produto;