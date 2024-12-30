-- Queries SQL mais complexas para o banco de dados

-- 1. Recuperações simples com SELECT Statement
-- Pergunta: Quais são os produtos disponíveis no sistema?
SELECT idProduto, Categoria, Descricao, Valor
FROM Produto;

-- 2. Filtros com WHERE Statement
-- Pergunta: Quais produtos possuem valor acima de 50?
SELECT idProduto, Categoria, Descricao, Valor
FROM Produto
WHERE Valor > 50;

-- 3. Crie expressões para gerar atributos derivados
-- Pergunta: Qual o valor total dos produtos no estoque (Valor * Quantidade)?
SELECT p.idProduto, p.Descricao, (p.Valor * pe.Quantidade) AS ValorTotal
FROM Produto p
JOIN ProdutoNoEstoque pe ON p.idProduto = pe.idProduto;

-- 4. Defina ordenações dos dados com ORDER BY
-- Pergunta: Liste os clientes em ordem alfabética pelo nome.
SELECT idCliente, Nome, Identificacao, Endereco
FROM Cliente
ORDER BY Nome ASC;

-- 5. Condições de filtros aos grupos - HAVING Statement
-- Pergunta: Quais estoques têm mais de 100 produtos no total?
SELECT pe.idEstoque, SUM(pe.Quantidade) AS TotalProdutos
FROM ProdutoNoEstoque pe
GROUP BY pe.idEstoque
HAVING SUM(pe.Quantidade) > 100;

-- 6. Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
-- Pergunta: Quais pedidos incluem informações sobre os clientes e os produtos?
SELECT c.Nome AS Cliente, p.Descricao AS Produto, rp.Quantidade, pd.Status
FROM RelacaoDeProdutoPorPedido rp
JOIN Pedido pd ON rp.idPedido = pd.idPedido
JOIN Cliente c ON pd.idCliente = c.idCliente
JOIN Produto p ON rp.idProduto = p.idProduto;

-- 7. Pergunta: Algum vendedor também é fornecedor?
SELECT tv.RazaoSocial
FROM TerceiroVendedor tv
JOIN Fornecedor f ON tv.CNPJ = f.CNPJ;

-- 8. Relação de produtos, fornecedores e estoques
-- Pergunta: Qual é a relação entre produtos, fornecedores e locais de estoque?
SELECT p.Descricao AS Produto, f.RazaoSocial AS Fornecedor, e.Local AS Estoque
FROM Produto p
JOIN ProdutoNoEstoque pe ON p.idProduto = pe.idProduto
JOIN Estoque e ON pe.idEstoque = e.idEstoque
JOIN Fornecedor f ON p.idProduto = f.idFornecedor;

-- 9. Relação de nomes dos fornecedores e nomes dos produtos
-- Pergunta: Quais produtos são fornecidos por cada fornecedor?
SELECT f.RazaoSocial AS Fornecedor, p.Descricao AS Produto
FROM Produto p
JOIN Fornecedor f ON p.idProduto = f.idFornecedor;

-- Pergunta: Qual é a quantidade de pedidos para cada status?
SELECT Status, COUNT(*) AS TotalPedidos
FROM Pedido
GROUP BY Status;

-- Pergunta: Quais são os três produtos mais vendidos?
SELECT p.Descricao AS Produto, SUM(rp.Quantidade) AS QuantidadeVendida
FROM RelacaoDeProdutoPorPedido rp
JOIN Produto p ON rp.idProduto = p.idProduto
GROUP BY p.Descricao
ORDER BY QuantidadeVendida DESC
LIMIT 3;


