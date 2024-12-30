# Desafio de Projeto: Banco de Dados E-commerce

## Contexto do Projeto
O objetivo deste projeto é a criação de um banco de dados relacional para um sistema de e-commerce. O esquema lógico apresentado organiza informações fundamentais relacionadas a produtos, fornecedores, estoques, clientes, pedidos e entregas, além de permitir a integração de vendedores terceiros. O design visa atender a cenários reais de operações em e-commerce, como controle de estoque, processamento de pedidos, rastreamento de entregas e análise de dados.

## Esquema Lógico do Banco de Dados
O banco de dados é composto pelas seguintes entidades e relações:

### 1. Entidades Principais
- **Fornecedor**: Armazena informações sobre os fornecedores dos produtos, incluindo Razão Social e CNPJ.
- **Produto**: Contém os dados dos produtos cadastrados no sistema, como categoria, descrição e valor.
- **Estoque**: Representa os locais onde os produtos estão armazenados.
- **Cliente**: Registra os dados dos clientes, que podem ser pessoas físicas ou jurídicas, com CPF ou CNPJ, respectivamente.
- **Pedido**: Detalha os pedidos realizados pelos clientes, incluindo status, descrição e valor do frete.
- **Entrega**: Rastreamento das entregas associadas aos pedidos.

### 2. Relacionamentos
- **ProdutoNoEstoque**: Relaciona produtos aos estoques, indicando quantidades.
- **ProdutosPorTerceiros**: Relaciona produtos oferecidos por vendedores terceiros.
- **RelacaoDeProdutoPorPedido**: Mapeia os produtos incluídos em cada pedido.

### 3. Subtipos de Cliente
- **PessoaFisica**: Clientes identificados por CPF.
- **PessoaJuridica**: Clientes identificados por CNPJ.

### 4. Métodos de Pagamento
- **CartaoPagamento**: Registra informações sobre cartões usados por clientes para pagamento.

## Funcionalidades Suportadas
- Controle detalhado de estoque por produto e localização.
- Gerenciamento de pedidos, incluindo status e rastreamento de entregas.
- Registro de clientes e suas formas de pagamento.
- Integração de produtos de vendedores terceiros.

## Queries de Análise de Dados
O projeto suporta consultas avançadas para atender a necessidades de análise de dados, como:
- Quantidade de pedidos por cliente.
- Produtos mais vendidos e sua distribuição.
- Análise de fornecedores com e sem produtos associados.
- Identificação de clientes com maior gasto.
- Integração entre fornecedores e vendedores terceiros.

## Estrutura do Repositório
- **`schema.sql`**: Arquivo com o esquema lógico do banco de dados.
- **`populate.sql`**: Script para povoar o banco de dados com dados fictícios.
- **`queries.sql`**: Conjunto de queries para análise e exploração dos dados.
