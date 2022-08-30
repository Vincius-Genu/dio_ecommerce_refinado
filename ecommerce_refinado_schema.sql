-- Criação do banco de dados para o cenário de E-commerce
CREATE DATABASE ecommerce_refinado;
USE ecommerce_refinado;
-- DROP DATABASE ecommerce_refinado;

-- TABELA CLIENT
CREATE TABLE clients(
		idClient INT AUTO_INCREMENT PRIMARY KEY,
        Fname VARCHAR(10) NOT NULL,
        Minit CHAR(3),
        Lname VARCHAR(20),
        Identification ENUM('PJ', 'PF') DEFAULT 'PF',
        Address VARCHAR(255)        
);
ALTER TABLE clients AUTO_INCREMENT =1;

-- TABELA PESSOA FÍSICA
CREATE TABLE pessoaFisica(
		idPessoaFisica INT AUTO_INCREMENT PRIMARY KEY,
        CPF CHAR(11) NOT NULL,
        idPFclient INT,        
        CONSTRAINT unique_cpf_pessoa_fisica UNIQUE (CPF),
        CONSTRAINT fk_pf_clients_client FOREIGN KEY (idPFclient) REFERENCES clients(idClient)
);
ALTER TABLE pessoaFisica AUTO_INCREMENT =1;

-- TABELA PESSOA JURÍDICA
CREATE TABLE pessoaJuridica(
		idPessoaJuridica INT AUTO_INCREMENT PRIMARY KEY,
        CNPJ CHAR(14) NOT NULL,
        socialName VARCHAR(50) NOT NULL,
        idPJclient INT,        
        CONSTRAINT unique_cpf_pessoa_juridica UNIQUE (CNPJ),
        CONSTRAINT fk_pj_clients_client FOREIGN KEY (idPJclient) REFERENCES clients(idClient)
);
ALTER TABLE pessoaJuridica AUTO_INCREMENT =1;

-- TABELA PRODUCT
CREATE TABLE product(
		idProduct INT AUTO_INCREMENT PRIMARY KEY,
        Pname VARCHAR(50) NOT NULL,
        classification_kids BOOL DEFAULT FALSE,
        category ENUM('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') NOT NULL,        
        avaliação FLOAT DEFAULT 0,
        size VARCHAR(20)        
);
ALTER TABLE product AUTO_INCREMENT =1;

-- criar tabela pedido
CREATE TABLE orders(
		idOrder INT AUTO_INCREMENT PRIMARY KEY,
		idOrderClient INT,        
        orderDescription VARCHAR(255),
        sendValue FLOAT DEFAULT 10,               
        CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient)        				             
);
ALTER TABLE orders AUTO_INCREMENT =1;

-- TABELA PAYMENTS
CREATE TABLE payments(
		idPayment INT PRIMARY KEY AUTO_INCREMENT,
        typePayment ENUM('Boleto', 'Cartão', 'Dois cartões', 'Deposito'),   
		idPorder INT,	     
        CONSTRAINT fk_clients_payment_client FOREIGN KEY (idPorder) REFERENCES orders(idOrder)
);
ALTER TABLE payments AUTO_INCREMENT =1;

-- TABELA CARTÃO
CREATE TABLE card(
	idCard INT AUTO_INCREMENT PRIMARY KEY,
	cardNumber VARCHAR(16) NOT NULL,
	expiration DATE NOT NULL,
	cardName VARCHAR(50) NOT NULL,
	bankName VARCHAR(20) NOT NULL,
    idCpayment INT,
    CONSTRAINT fk_car_payments_payment FOREIGN KEY (idCpayment) REFERENCES payments(idPayment)
);
ALTER TABLE card AUTO_INCREMENT =1;

-- TABELA BOLETO
CREATE TABLE boleto(
		idBoleto INT AUTO_INCREMENT PRIMARY KEY,
        numberBoleto VARCHAR(50) NOT NULL,
        expiration DATE NOT NULL,
        issueDate DATE NOT NULL,
        idBpayment INT,
        CONSTRAINT fk_boleto_payment_payment FOREIGN KEY (idBpayment) REFERENCES payments(idPayment)
);
ALTER TABLE boleto AUTO_INCREMENT =1;

-- TABELA DEPÓSITO
CREATE TABLE deposito(
		idDeposito INT AUTO_INCREMENT PRIMARY KEY,
        bankName VARCHAR(20) NOT NULL,
        agency VARCHAR(20) NOT NULL,
        bankAccount VARCHAR(45) NOT NULL,
        idDPayment INT,
        CONSTRAINT fk_deposito_payment_payment FOREIGN KEY (idDPayment) REFERENCES payments(idPayment)
);
ALTER TABLE deposito AUTO_INCREMENT =1;

-- TABELA DELIVERY
CREATE TABLE delivery(
		idDelivery INT AUTO_INCREMENT PRIMARY KEY,
		orderStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
        trackingCode VARCHAR(10),
        idDorder INT,
        CONSTRAINT fk_delivery_orders_order FOREIGN KEY (idDorder) REFERENCES orders(idOrder)      
);
ALTER TABLE delivery AUTO_INCREMENT =1;

-- Criar tabela estoque
CREATE TABLE productStorage(
		idProdStorage INT AUTO_INCREMENT PRIMARY KEY,		
        storageLocation VARCHAR(50),
        quantity INT DEFAULT 0        
);
ALTER TABLE productStorage AUTO_INCREMENT =1;

-- Criar tabela fornecedor
CREATE TABLE supplier(
		idSupplier INT AUTO_INCREMENT PRIMARY KEY,		
        socialName VARCHAR(50) NOT NULL,
        CNPJ CHAR(15) NOT NULL,
        contact CHAR(11) NOT NULL,
        CONSTRAINT unique_supplier UNIQUE (CNPJ)        
);
ALTER TABLE supplier AUTO_INCREMENT =1;

-- Criar tabela vendedor
CREATE TABLE seller(
		idSeller INT AUTO_INCREMENT PRIMARY KEY,		
        socialName VARCHAR(255) NOT NULL,
        abstName VARCHAR(255),
        CNPJ CHAR(15),
        CPF CHAR(9),
        location VARCHAR(255),
        contact CHAR(11) NOT NULL,
        CONSTRAINT unique__cnpj_seller UNIQUE (CNPJ),
        CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);
ALTER TABLE seller AUTO_INCREMENT =1;

CREATE TABLE productSeller(
		idPseller INT,
        idPproduct INT,
        prodQuantity INT NOT NULL DEFAULT 1,
        PRIMARY KEY (idPseller, idPproduct),
        CONSTRAINT fk_product_seller FOREIGN KEY (idPseller) REFERENCES seller(idSeller),
        CONSTRAINT fk_product_product FOREIGN KEY (idPproduct) REFERENCES product(idProduct)        
);

CREATE TABLE productOrder(
		idPOproduct INT,
        idPOorder INT,
        poQuantity INT DEFAULT 1,
        poStatus ENUM ('Disponível', 'Sem estoque') DEFAULT 'Disponível',
        PRIMARY KEY (idPOproduct, idPOorder),
        CONSTRAINT fk_productorder_seller FOREIGN KEY (idPOproduct) REFERENCES product(idProduct),
        CONSTRAINT fk_productorder_product FOREIGN KEY (idPOorder) REFERENCES orders(idOrder)
);

CREATE TABLE storageLocation(
		idLproduct INT,
        idLstorage INT,
        location VARCHAR(255) NOT NULL,
        PRIMARY KEY (idLproduct, idLstorage),
		CONSTRAINT fk_storage_location_product FOREIGN KEY (idLproduct) REFERENCES product(idProduct),
        CONSTRAINT fk_storage_location_storage FOREIGN KEY (idLstorage) REFERENCES productStorage(idProdStorage)
);

CREATE TABLE productSupplier(
		idPSsupplier INT,
        idPSproduct INT,
        quantatiy INT NOT NULL,
        PRIMARY KEY (idPSsupplier, idPSproduct),
        CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idPSsupplier) REFERENCES supplier(idSupplier),
        CONSTRAINT fk_product_supplier_product FOREIGN KEY (idPSproduct) REFERENCES product(idProduct)
);

SHOW TABLES;

-- USE information_schema;
-- SHOW TABLES;
-- DESC table_cosntraints;
-- DESC referential_constraints;
-- SELECT * FROM refrential_constraints WHERE constraint_schema = 'ecommerce';