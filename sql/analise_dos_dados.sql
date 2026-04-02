-- Criar o banco de dados
CREATE DATABASE desafio_ecommerce;

-- Criar a tabela (Execute dentro do Query Tool do banco acima)
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    data_venda DATE,
    cliente VARCHAR(150),
    produto VARCHAR(150),
    categoria VARCHAR(100),
    quantidade INT,
    preco_unitario NUMERIC(10, 2),
    vendedor VARCHAR(150),
    cidade VARCHAR(100),
    estado VARCHAR(50)
);

-- Filtrando a tabela pelas 5 primeiras linhas
SELECT * FROM vendas LIMIT 5;

-- 1. Qual o faturamento total por produto?

SELECT
	produto,
	SUM(quantidade * preco_unitario) AS faturamento_total
FROM vendas
GROUP BY produto
ORDER BY faturamento_total DESC;

-- 2. Qual o faturamento total por categoria?

SELECT 
    categoria, 
    SUM(quantidade * preco_unitario) AS faturamento_total
FROM vendas
GROUP BY categoria
ORDER BY faturamento_total DESC;

-- 3. Qual o ticket médio por cliente?
SELECT
	cliente,
	ROUND(AVG(quantidade * preco_unitario)) AS ticket_medio
FROM vendas
GROUP BY cliente
ORDER BY ticket_medio DESC;

-- 4. Qual o faturamento total por vendedor?
SELECT
	vendedor,
	SUM(quantidade * preco_unitario) AS faturamento_total
FROM vendas
GROUP BY vendedor
ORDER BY faturamento_total DESC;

-- 5. Qual o faturamento por mês?
SELECT 
    TO_CHAR(data_venda, 'Month') AS mes,
    SUM(quantidade * preco_unitario) AS faturamento_total
FROM vendas
GROUP BY mes, EXTRACT(MONTH FROM data_venda)
ORDER BY EXTRACT(MONTH FROM data_venda);

-- 6. Quais são os 5 produtos mais vendidos?
SELECT
	produto,
	SUM(quantidade) AS total_quantidade
FROM vendas
GROUP BY produto
ORDER BY total_quantidade DESC 
LIMIT 5;

-- 7. Qual cidade possui maior faturamento?
SELECT
	cidade,
	SUM(quantidade * preco_unitario) AS faturamento_total
FROM vendas
GROUP BY cidade
ORDER BY faturamento_total DESC;

-- 8. Qual cliente mais comprou em valor?
SELECT
	cliente,
	SUM(quantidade * preco_unitario) AS total_gasto
FROM vendas
GROUP BY cliente
ORDER BY total_gasto
LIMIT 1;
