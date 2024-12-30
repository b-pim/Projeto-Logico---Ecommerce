CREATE DATABASE ecommerce;
USE ecommerce;

-- Tabelas principais
CREATE TABLE Fornecedor (
    idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(18) UNIQUE NOT NULL
);

CREATE TABLE Produto (
    idProduto INT AUTO_INCREMENT PRIMARY KEY,
    Categoria VARCHAR(100) NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Estoque (
    idEstoque INT AUTO_INCREMENT PRIMARY KEY,
    Local VARCHAR(100) NOT NULL
);

CREATE TABLE ProdutoNoEstoque (
    idProduto INT,
    idEstoque INT,
    Quantidade INT NOT NULL CHECK (Quantidade >= 0),
    PRIMARY KEY (idProduto, idEstoque),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) ON DELETE CASCADE,
    FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque) ON DELETE CASCADE
);

-- Tabelas de relacionamento
CREATE TABLE TerceiroVendedor (
    idTerceiroVendedor INT AUTO_INCREMENT PRIMARY KEY,
    RazaoSocial VARCHAR(100) NOT NULL,
    Local VARCHAR(100),
    CNPJ VARCHAR(18) UNIQUE NOT NULL
);

CREATE TABLE ProdutosPorTerceiros (
    idProduto INT,
    idTerceiroVendedor INT,
    Quantidade INT NOT NULL CHECK (Quantidade >= 0),
    PRIMARY KEY (idProduto, idTerceiroVendedor),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) ON DELETE CASCADE,
    FOREIGN KEY (idTerceiroVendedor) REFERENCES TerceiroVendedor(idTerceiroVendedor) ON DELETE CASCADE
);

CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Identificacao VARCHAR(18) UNIQUE NOT NULL, -- CPF ou CNPJ
    Endereco VARCHAR(255) NOT NULL
);

CREATE TABLE PessoaFisica (
    idCliente INT PRIMARY KEY,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

CREATE TABLE PessoaJuridica (
    idCliente INT PRIMARY KEY,
    CNPJ VARCHAR(18) UNIQUE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

CREATE TABLE CartaoPagamento (
    idCartaoPagamento INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    NomeTitular VARCHAR(100) NOT NULL,
    NumeroCartao VARCHAR(16) UNIQUE NOT NULL,
    DataValidade DATE NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    Status ENUM('Processando', 'Enviado', 'Entregue', 'Cancelado') DEFAULT 'Processando',
    Descricao VARCHAR(255),
    Frete DECIMAL(10, 2) NOT NULL CHECK (Frete >= 0),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

CREATE TABLE RelacaoDeProdutoPorPedido (
    idProduto INT,
    idPedido INT,
    Quantidade INT NOT NULL CHECK (Quantidade > 0),
    PRIMARY KEY (idProduto, idPedido),
    FOREIGN KEY (idProduto) REFERENCES Produto(idProduto) ON DELETE CASCADE,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido) ON DELETE CASCADE
);

CREATE TABLE Entrega (
    idEntrega INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT,
    Status ENUM('Pendente', 'Em trânsito', 'Entregue', 'Cancelada') DEFAULT 'Pendente',
    CodigoRastreo VARCHAR(50),
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido) ON DELETE CASCADE
);
