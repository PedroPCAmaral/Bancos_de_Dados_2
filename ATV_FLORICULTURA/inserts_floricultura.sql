
-- 1. CLIENTE --
INSERT INTO cliente (nome, email) VALUES 
('Ana Silva', 'ana.silva@email.com'),
('Bruno Costa', 'bruno.costa@email.com'),
('Carla Souza', 'carla.souza@email.com'),
('Daniel Oliveira', 'daniel.oli@email.com'),
('Fernanda Lima', 'fernanda.lima@email.com'),
('Gabriel Santos', 'gabriel.santos@email.com'),
('Helena Rocha', 'helena.rocha@email.com'),
('Igor Gomes', 'igor.gomes@email.com'),
('Juliana Paiva', 'juliana.paiva@email.com'),
('Lucas Mendes', 'lucas.mendes@email.com');

-- 2. TELEFONE_CLIENTE --
INSERT INTO telefone_cliente (numero, id_cliente) VALUES 
('(11) 91111-1111', 1),
('(11) 92222-2222', 2),
('(11) 93333-3333', 3),
('(21) 94444-4444', 4),
('(21) 95555-5555', 5),
('(31) 96666-6666', 6),
('(31) 97777-7777', 7),
('(41) 98888-8888', 8),
('(41) 99999-9999', 9),
('(51) 90000-0000', 10);

-- 3. LOCAL_ENTREGA --
INSERT INTO local_entrega (endereco, cidade, complemento) VALUES 
('Rua das Flores, 100', 'São Paulo', 'Casa'),
('Av. Paulista, 500', 'São Paulo', 'Apto 12'),
('Rua Amazonas, 40', 'São Caetano', 'Bloco B'),
('Rua Chile, 200', 'Santo André', 'Casa'),
('Av. Brasil, 1500', 'Rio de Janeiro', 'Loja 2'),
('Rua Sete, 88', 'Belo Horizonte', 'Fundos'),
('Rua da Paz, 77', 'Curitiba', 'Apto 101'),
('Rua do Sol, 44', 'Guarulhos', 'Casa'),
('Alameda Santos, 9', 'São Paulo', 'Apto 91'),
('Av. Central, 30', 'Osasco', 'Sala 4');

-- 4. TIPO_PRODUTO --
INSERT INTO tipo_produto (descricao) VALUES 
('Flores'), ('Chocolates'), ('Presentes'), ('Cartão'), ('Vinhos'), 
('Cestas'), ('Pelúcias'), ('Plantas'), ('Perfumes'), ('Balões');

-- 5. PRODUTO --
INSERT INTO produto (nome, preco, id_tipo) VALUES 
('Buquê de Rosas', 120.00, 1),
('Caixa Bombom', 45.90, 2),
('Urso de Pelúcia', 89.00, 7),
('Cartão Amor', 12.00, 4),
('Vinho Tinto', 75.00, 5),
('Cesta Café da Manhã', 150.00, 6),
('Orquídea Branca', 95.00, 8),
('Balão Coração', 25.00, 10),
('Kit Perfume Floral', 110.00, 9),
('Lírios Amarelos', 130.00, 1);

-- 6. ENCOMENDA --
INSERT INTO encomenda (data, status, id_cliente, id_local) VALUES 
('2026-04-01', 'Entregue', 1, 1),
('2026-04-02', 'Entregue', 2, 2),
('2026-04-03', 'Pendente', 3, 3),
('2026-04-04', 'Cancelado', 4, 4),
('2026-04-05', 'Em Rota', 5, 5),
('2026-04-06', 'Entregue', 6, 6),
('2026-04-07', 'Pendente', 7, 7),
('2026-04-08', 'Pendente', 8, 8),
('2026-04-08', 'Em Preparo', 9, 9),
('2026-04-08', 'Aguardando', 10, 10);

-- 7. ITEM_ENCOMENDA --
INSERT INTO item_encomenda (quantidade, id_encomenda, id_produto) VALUES 
(1, 1, 1), -- Encomenda 1 leva Produto 1
(2, 2, 2), -- Encomenda 2 leva Produto 2
(1, 3, 3), -- Encomenda 3 leva Produto 3
(5, 4, 4), -- Encomenda 4 leva Produto 4
(1, 5, 5), -- Encomenda 5 leva Produto 5
(1, 6, 6), -- Encomenda 6 leva Produto 6
(1, 7, 7), -- Encomenda 7 leva Produto 7
(3, 8, 8), -- Encomenda 8 leva Produto 8
(1, 9, 9), -- Encomenda 9 leva Produto 9
(2, 10, 10); -- Encomenda 10 leva Produto 10