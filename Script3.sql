Com base no banco de dados ecommerce, aqui vão os exemplos, cada um com sua respectiva explicação:

##1. Recuperações simples com SELECT Statement
-- Lista os nomes dos clientes e seus CPFs
SELECT Fname, Lname, CPF FROM Clients;


##2. Filtros com WHERE Statement
-- Seleciona os produtos da categoria 'Eletronico'
SELECT Pname, category FROM Product WHERE category = 'Eletronico';

-- Clientes com nome começando com 'M'
SELECT * FROM Clients WHERE Fname LIKE 'M%';


##3. Crie expressões para gerar atributos derivados
-- Nome completo dos clientes como atributo derivado
SELECT CONCAT(Fname, ' ', Minit, '. ', Lname) AS Nome_Completo FROM Clients;

-- Soma total de valor com frete (usando COALESCE para lidar com valores NULL)
SELECT idOrder, 
       COALESCE(sendValue, 0) + 50 AS Total_com_Frete 
FROM Orders;


##4. Defina ordenações dos dados com ORDER BY
-- Lista de produtos ordenados pela avaliação decrescente
SELECT Pname, avaliacao FROM Product ORDER BY avaliacao DESC;

-- Clientes ordenados alfabeticamente pelo sobrenome
SELECT Fname, Lname FROM Clients ORDER BY Lname ASC;


##5. Condições de filtros aos grupos – HAVING Statement
-- Quantidade de pedidos por cliente, mas só mostra quem fez mais de 1 pedido
SELECT idOrderClient, COUNT(*) AS total_pedidos 
FROM Orders 
GROUP BY idOrderClient 
HAVING COUNT(*) > 1;


##6. Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados
-- Lista nome dos clientes e os produtos comprados (via junção entre orders e productOrder)
SELECT 
    c.Fname, c.Lname, 
    p.Pname, po.poQuantity 
FROM Clients c
JOIN Orders o ON c.idClient = o.idOrderClient
JOIN ProductOrder po ON o.idOrder = po.idPOorder
JOIN Product p ON po.idPOproduct = p.idProduct;

-- Produtos e seus fornecedores
SELECT 
    p.Pname, s.SocialName, ps.quantity 
FROM Product p
JOIN ProductSupplier ps ON p.idProduct = ps.idPsProduct
JOIN Supplier s ON ps.idPsSupplier = s.idSupplier;
