
create database ecommerce;
use ecommerce;

--  criar tabela cliente
create table clients(
    idClient into auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char (11) not null,
    Address varchar(30),
    constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;


-- criar tabela produto

-- size = dimensao do produto
create table product(
    idProduct into auto_increment primary key,
    Pname varchar(10) not null,
    Classification_kids bool default false,
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Moveis') not null,
    avaliacao float default 0,
    size varchar(10),
 --   constraint unique_cpf_client unique (CPF)
);

-- para ser continuado no desafio: termine de implementar a tabela e crie a conexao com as tabelas necessarias
-- reflita essa modificacao no diagrama de esquema relacional
create table payments(
    idClient int primary key,
    id_payment int,
    typePayment enum('Boleto','Cartao','Dois cartoes'),
    limitAvailable float,
    primary key(idClient,id_payment)
);

-- criar tabela pedido
create table orders(
    idOrder int auto_increment primary key,
    idOrderClient int,
    OrderStatus enum('Cancelado','Confirmado','Em processo') default 'Em processamento',
    OrderDescription varchar(255),
    SendValue float default 10,
    paymentCash bool default false,
    constraint fk_client foreign key (idOrderClient) references clients(idClient)
);

-- criar table estoque
create table produtStorage(
    idProdStorage int auto_increment primary key,
    StorageLocation varchar(255),
    quantity int default 0
);

-- criar table fornecedor
create table supplier(
    idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

desc supplier;

-- criar table vendedor

create table seller(
    idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
    idPseller int,
    idProduct int,
    prodQuantity int default 1,
    primary key (idPseller, idProduct)
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller)
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

create table productOrder(
    idPOProduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponivel','Sem estoque') default 'Disponivel',
    primary key (idPOproduct, idPOorder),
    constraint fk_productOrder_seller foreign key (idPOProduct) references product(idProduct),
    constraint fk_productOrder_product foreign key (idPOorder) references orders(idOrder)
);

create table storageLocation(
    idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct,idLstorage),
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storafe foreign key (idLstorage) references productStorage(idProdStorage)  
);

create table productSupplier(
    idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier,idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references product(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)  
);


show tables;

show database; 
use information_schema;
show tables;
desc _constriants;






