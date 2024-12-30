-- Inserção de dados fictícios

-- Fornecedores
INSERT INTO Fornecedor (RazaoSocial, CNPJ) VALUES
('Fornecedor Alpha', '11.111.111/0001-11'),
('Fornecedor Beta', '22.222.222/0001-22'),
('Fornecedor Gama', '33.333.333/0001-33');

-- Produtos
INSERT INTO Produto (Categoria, Descricao, Valor) VALUES
('Eletrônicos', 'Smartphone 128GB', 1500.00),
('Eletrodomésticos', 'Geladeira Frost Free', 2800.00),
('Móveis', 'Cadeira de Escritório', 450.00);

-- Estoque
INSERT INTO Estoque (Local) VALUES
('Centro de Distribuição SP'),
('Centro de Distribuição RJ');

-- Produto no Estoque
INSERT INTO ProdutoNoEstoque (idProduto, idEstoque, Quantidade) VALUES
(1, 1, 100),
(2, 1, 50),
(3, 2, 200);

-- Terceiros Vendedores
INSERT INTO TerceiroVendedor (RazaoSocial, Local, CNPJ) VALUES
('Loja Parceira 1', 'Rua A, 123', '44.444.444/0001-44'),
('Loja Parceira 2', 'Avenida B, 456', '55.555.555/0001-55');

-- Produtos por Terceiros
INSERT INTO ProdutosPorTerceiros (idProduto, idTerceiroVendedor, Quantidade) VALUES
(1, 1, 20),
(2, 2, 15);

-- Clientes
INSERT INTO Cliente (Nome, Identificacao, Endereco) VALUES
('João da Silva', '123.456.789-00', 'Rua X, 789'),
('Empresa Y Ltda', '12.345.678/0001-12', 'Avenida Z, 321');

-- Pessoas Físicas
INSERT INTO PessoaFisica (idCliente, CPF) VALUES
(1, '12345678900');

-- Pessoas Jurídicas
INSERT INTO PessoaJuridica (idCliente, CNPJ) VALUES
(2, '12345678000112');

-- Cartões de Pagamento
INSERT INTO CartaoPagamento (idCliente, NomeTitular, NumeroCartao, DataValidade) VALUES
(1, 'João da Silva', '1111222233334444', '2026-12-31'),
(2, 'Empresa Y Ltda', '5555666677778888', '2027-06-30');

-- Pedidos
INSERT INTO Pedido (idCliente, Status, Descricao, Frete) VALUES
(1, 'Processando', 'Compra de Smartphone', 20.00),
(2, 'Enviado', 'Compra de Geladeira', 50.00);

-- Relacao de Produtos por Pedido
INSERT INTO RelacaoDeProdutoPorPedido (idProduto, idPedido, Quantidade) VALUES
(1, 1, 1),
(2, 2, 1);

-- Entregas
INSERT INTO Entrega (idPedido, Status, CodigoRastreo) VALUES
(1, 'Em trânsito', 'ABC123'),
(2, 'Entregue', 'XYZ456');
