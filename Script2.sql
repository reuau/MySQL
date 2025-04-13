show tables;
- idClient, Fname, Minit, Lname, CPF, Address
insert into Clients (Fname,Minit, Lname, CPF, Address)
    values('Maria','M','Silva',123456789,'rua silva de parta 29','Carangola- Cidade das Flores'),
        ('Matheus','O','Pimentel','987654321','rua alemeda 289','Centro -  Cidade das Flores'),
         ('Ricardo','F','Silva','456789123','avenida alemeda vinha 1009','Centro - Cidade das Flores'),
        ('Julia','S','Franca',789123456,'rua lareijras 861', 'centro  -  cidades das flores'),
    ('Roberta','G','Assis',987654321,'Avenida koller 19', 'Centro - Cidade das flores'),
        ('Isabela','M','Cruz',678912345,'rua alemeda das flores 28','Centro - das Flores');

insert into product (Pname, classification_kis, category, avaliacao,size) values
       ('Fone de ouvid',false,'Eeltronico','4',null),
       ('Barbie Elsa',true, 'brinquedos','3',null),
       ('Body Carters',true, 'Vestimenta','5',null),
       ('Microfone Vedo - Youtuer', false,'Eletronico','4',null),
       ('Sofa retratil',false,'Moveis','3','3x57x80'),
       ('Farinha de arroz',false,'moveis','3','3x57x80'),
       ('Fire stick Amazon',false,'Eletronico','3',null);

select * from clients;
select * from product;

    
queries_and_data_insertion

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
             (1, null, 'compra via aplicativo',null,1)
             (2, null,'compra via aplicativo',150,0)
             (3,'Confirmado',null,null,1),
             (4, null,'comrpra via web site',150,0);

-- idPproduct, idPOorder, PQuatity,poStatus
select * from orders;
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
                       (1,5,2, null),
                       (2,5,1,null),
                       (3,6,1,null);


insert into productStorage (storageLocation, quantity) values
                        ('Rio de Janeiro, 1000'),
                        ('Rio de janeiro, 500'),
                        ('São Paulo',10),
                        ('São Paulo',100),
                        ('Sao Paulo',10),
                        ('Brasilia',60);

insert int storageLocation (idLproduct, idLstorage, location) values
            (1,2,'RJ'),
            (2,6,'GO')

insert into supplier (SocialName,CNPJ,contact) values
         ('Almeida e filhos',123456789123456,'21987654'),
         ('Eletronicos Silva',876567893934695,'21985484'),
         ('Eletronicos Valma',9345678934695,'21975474');

select * from supplier;

insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
       (1,1,500),
       (1,2,400),
       (2,4,633),
       (3,3,5),
       (2,5,10);


insert into seller (SocialName, AbstName,CNPJ,CPF,location, contact) values
    ('Tech eletronics',null,123456789456321,null,'Rio de janeiro',219946287),
    ('Botique Durgas',null,null,123456783,'Rio de janeiro',219567895),
    ('Kids World',null,4567891234485,null,'Sao Paulo',1198657484);


select * from seller;

insert int productSeller (idPseller, idPProduct, prodQuantity) values
   (1,6,80),
   (2,7,10);

select * from clients c, orders o where c.idClient = idOrderClient;
select Fname,Lname, idorder, orderstatus from clients c, orders o where c.idclient = idorderClient;

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue,paymentCash)values
  (2,default,'compra via aplicativo',null,1);

select count(*) from clients c, orders o 
    where c.idClient = idOrderClient;

selet * from orders;
select* from clients inner join orderes on idClient = idOrderClient
                     inner join product p on idPOorder =  idOrder;
