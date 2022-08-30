INSERT INTO clients(Fname, Minit, Lname, Identification, Address)
		VALUES('Maria','M','Silva', 'PJ', 'rua silva de prata 29, Carangola - Cidade das flores'),
			  ('Matheus','O', 'Pimentel', 'PF', 'rua alemeda 289, Centro - Cidade das flores'),
              ('Ricardo', 'F', 'Silva', 'PF', 'avenida alemeda vinha 1009, Centro - Cidade das flores'),
              ('Julia', 'S', 'França', 'PJ', 'rua lareijras 861, Centro - Cidade das flores'),
              ('Roberta', 'G', 'Assis', 'PJ', 'avenida koller 19 , Centro - Cidade das flores'),
              ('Isabela', 'M', 'Cruz', 'PF', 'rua alemeda das flores 28, Centro - Cidade das flores');
SELECT * FROM clients;

INSERT INTO pessoafisica(CPF,idPFclient)
		VALUES(12345678998, 2),
			  (45698712365, 3),
              (69874123658, 6);
SELECT * FROM pessoafisica;

INSERT INTO pessoajuridica(CNPJ, socialName, idPJclient)
		VALUES(89654782165894, 'Super Tech', 1),
			  (75369841252246, 'Gênio digital', 4),
              (95565478122365, 'Fast delivery', 5);
SELECT * FROM pessoajuridica;

INSERT INTO product(Pname, classification_kids, category, avaliação, size)
		VALUES('Fone de ouvido', FALSE, 'Eletrônico', '4', NULL),
			  ('Barbie Elsa', TRUE, 'Brinquedos', '3', NULL),
              ('Body Carters', TRUE, 'Vestimenta', '5', NULL),
              ('Microfone Vedo - Youtuber', FALSE, 'Eletrônico', '4', NULL),
              ('Sofá retrátil', FALSE, 'Móveis', '3', '3x57x80'),
              ('Farinha de arroz', FALSE, 'Alimentos', '2', NULL),
              ('Fire Stick Amazon', FALSE, 'Eletrônico', '3', NULL);
SELECT * FROM product;

INSERT INTO orders(idOrderClient, orderDescription, sendValue)
		VALUES(1,'compra via aplicativo', DEFAULT),
			  (2, 'compra via aplicativo', 50),
              (3, NULL, NULL),
              (4, 'compra via web site', 150),
              (5, NULL, DEFAULT),
              (6, 'compra via web site', 13);		
SELECT * FROM orders;

INSERT INTO payments(typePayment, idPorder)
		VALUES ('Boleto', 5),
			   ('Deposito', 3),
               ('Cartão', 1),
               ('Dois cartões', 2),
               ('Dois cartões', 4),
               ('Boleto', 6);
SELECT * FROM payments;

INSERT INTO card(cardNumber, expiration, cardName, bankName, idCpayment)
		VALUES(123456, '2024-09-16', 'MARIA M.SILVA', 'Itau', 3),			  
              (784566, '2027-04-24', 'MATHEUS O. PIMENTEL', 'Nubank', 4),
              (123456, '2028-04-24', 'MATHEUS O. PIMENTEL', 'itau', 4),
              (951753, '2028-06-04', 'JULIA S. FRANÇA', 'Itau', 5),
              (996653, '2032-06-04', 'JULIA S. FRANÇA', 'Bradesco', 5);
SELECT * FROM card;

INSERT INTO boleto(numberBoleto, expiration, issueDate, idBpayment)
		VALUES(7863254189, '2025-01-04', '2017-02-15', 1),
			  (5469872236, '2030-06-08', '2019-06-02',6);
SELECT * FROM boleto;

INSERT INTO deposito(bankName, agency, bankAccount, idDPayment)
		VALUES('Banco do Brasil', 0123, 000123459, 2);
SELECT * FROM deposito;

INSERT INTO delivery(orderStatus, trackingCode, idDorder)
		VALUES(DEFAULT, 456987, 1),
			  (DEFAULT, 123654, 2),
              ('Cancelado', 568974, 3),
              ('Confirmado', 236598, 4),
              ('Confirmado', 258963, 5),
              (DEFAULT, 214568, 6);
SELECT * FROM delivery;

INSERT INTO productstorage (storageLocation,quantity)
		VALUES('Rio de Janeiro', 1000),
			  ('Rio de Janeiro', 500),
              ('São Paulo',10),
              ('São Paulo', 100),
              ('São Paulo', 10),
              ('Brasília', 60);
SELECT * FROM productstorage;

INSERT INTO supplier(socialName, CNPJ, contact)
		VALUES('Almeida e filhos', 123456789123456, '21985474'),
			  ('Eletrônicos Silva', 854519649143457, '21985484'),
              ('Eletrônicos Valma', 934567893934695, '21975474');
SELECT * FROM supplier;

INSERT INTO seller(socialName, abstName, CNPJ, CPF, location, contact)
		VALUES('Tech eletronics', NULL, 123456789456321, NULL,'Rio de Janeiro', 2199462187),
			  ('Boutique Durgas', NULL, NULL, 123456783, 'Rio de Janeiro', 219567895),
              ('Kids World', NULL, 456789123654485, NULL, 'São Paulo', 1198657484);              
SELECT * FROM seller;

INSERT INTO productseller(idPseller, idPproduct, prodQuantity)
		VALUES(1, 6, 80),
			  (2, 7, 10);
SELECT * FROM productseller;

INSERT INTO productorder(idPOproduct, idPOorder, poQuantity,poStatus)
		VALUES(1, 1, 2, NULL),
			  (2, 1, 1, NULL),
              (3, 2, 1, NULL);
SELECT * FROM productorder;

INSERT INTO storagelocation(idLproduct, idLstorage, location)
		VALUES(1, 2, 'RJ'),
			  (2, 6, 'GO');
SELECT * FROM storagelocation;

INSERT INTO productsupplier(idPSsupplier, idPSproduct, quantatiy)
		VALUES(1, 1, 500),
			  (1, 2, 400),
              (2, 4, 633),
              (3, 3, 5),
              (2, 5, 10);
SELECT * FROM productsupplier;
              










              
              