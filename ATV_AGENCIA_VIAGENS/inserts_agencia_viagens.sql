-- INSERT FUNCIONARIOS  -- 

INSERT INTO funcionario (nome, sobrenome, cargo) VALUES
('Carlos','Silva','Vendedor'),
('Ana','Souza','Atendente'),
('Pedro','Oliveira','Gerente'),
('Lucas','Pereira','Consultor'),
('Mariana','Costa','Vendedor');


-- INSERT CLIENTES --

INSERT INTO cliente (nome, sobrenome, cpf, email, fk_funcionario_idFuncionario) VALUES
('Joao','Almeida','11111111111','joao@email.com',1),
('Maria','Fernandes','22222222222','maria@email.com',2),
('Jose','Santos','33333333333','jose@email.com',3),
('Paula','Lima','44444444444','paula@email.com',4),
('Ricardo','Rocha','55555555555','ricardo@email.com',5),
('Fernanda','Dias','66666666666','fernanda@email.com',1),
('Bruno','Melo','77777777777','bruno@email.com',2),
('Juliana','Ribeiro','88888888888','juliana@email.com',3),
('Rafael','Martins','99999999999','rafael@email.com',4),
('Camila','Barbosa','00000000000','camila@email.com',5);


-- TELEFONES (1:N) --

INSERT INTO telefone (numero, fk_cliente_idCliente) VALUES
('62999990001',1),
('62999990002',2),
('62999990003',3),
('62999990004',4),
('62999990005',5),
('62999990006',6),
('62999990007',7),
('62999990008',8),
('62999990009',9),
('62999990010',10);


-- DESTINOS (5) --

INSERT INTO destino (cidade, pais) VALUES
('Paris','Franca'),
('Roma','Italia'),
('Nova York','EUA'),
('Tokyo','Japao'),
('Rio de Janeiro','Brasil');


-- PACOTES (5) --

INSERT INTO pacote (nome, descricao, valor, duracao_dias) VALUES
('Europa Classica','Viagem Europa',8000,10),
('Italia Completa','Tour Italia',6000,8),
('EUA Experience','Viagem EUA',7000,9),
('Japao Tech','Viagem Japao',9000,12),
('Rio Ferias','Turismo Rio',3000,5);


-- RELACAO PACOTE_DESTINO --

INSERT INTO pacote_destino VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);


-- RELACAO CLIENTE_PACOTE --

INSERT INTO cliente_pacote VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,1),(7,2),(8,3),(9,4),(10,5);

