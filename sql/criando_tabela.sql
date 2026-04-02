
-- Crie uma tabela chamada resumo_vendas com: ( - produto / - categoria / - quantidade_total /- faturamento_total)

-- Primeiro, deletamos se já existir para evitar erro ao rodar de novo
DROP TABLE IF EXISTS resumo_vendas;

-- Criando a tabela
CREATE TABLE resumo_vendas AS
SELECT 
    produto, 
    categoria, 
    SUM(quantidade) AS quantidade_total,
    SUM(quantidade * preco_unitario) AS faturamento_total
FROM vendas
GROUP BY produto, categoria;

-- Verificando se a tabela foi criada corretamente
SELECT * FROM resumo_vendas;