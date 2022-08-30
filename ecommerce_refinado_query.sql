-- Quantos pedidos foram feitos por cada cliente?
SELECT  c.idClient, CONCAT(Fname, ' ', LName) AS 'Client', COUNT(*) AS 'Number of orders'
FROM clients c
	INNER JOIN orders o ON c.idClient = o.idOrderClient
    INNER JOIN productOrder po ON po.idPOorder = o.idOrder
GROUP BY idClient;

-- Quanntos clientes tem presente
SELECT count(*) FROM clients;

-- clientes que são pj
SELECT CONCAT(Fname, ' ', LName) AS 'Client', CNPJ, socialName  FROM clients, pessoajuridica
WHERE idClient = idPJclient;

-- Clientes que compraram com dois cartões
SELECT CONCAT(Fname, ' ', LName) AS 'Client' FROM clients
		INNER JOIN orders ON idOrderClient = idClient
        INNER JOIN payments ON idPorder = idOrder
        WHERE typePayment = 'Dois cartões';
        
-- Quantos bancos estão cadastrados como cartão
SELECT bankName AS 'Bank Name',
	   count(*) AS 'Number of Account' FROM card
GROUP BY bankName;

-- Usuarios que fizeram pagamento com dois cartões e que tem nome do banco como Nubank
SELECT * FROM card
		INNER JOIN payments ON idCpayment = idPayment    
WHERE typePayment = 'Dois cartões'
GROUP BY cardNumber
HAVING bankName = 'Nubank';


