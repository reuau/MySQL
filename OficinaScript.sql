1. Esquema Lógico (Modelo Relacional)
  
CREATE DATABASE Oficina;
USE Oficina;

CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    CPF VARCHAR(45),
    Nome VARCHAR(45)
);

CREATE TABLE OrdemServico (
    idOrdemServico INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(45),
    Descricao VARCHAR(45),
    Valor FLOAT,
    DataServico DATE,
    Cliente_idCliente INT,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Colaboradores (
    idColaboradores INT PRIMARY KEY AUTO_INCREMENT,
    Matricula VARCHAR(45),
    Nome VARCHAR(45)
);

CREATE TABLE Almoxarifado (
    idAlmoxarifado INT PRIMARY KEY AUTO_INCREMENT,
    IDProduto VARCHAR(45),
    Descricao VARCHAR(45),
    Quantidade VARCHAR(45)
);

CREATE TABLE AvaliacaoServico (
    OrdemServico_idOrdemServico INT,
    OrdemServico_Cliente_idCliente INT,
    Colaboradores_idColaboradores INT,
    AvaliacaoEspecialidade VARCHAR(45),
    ValorOrcamento VARCHAR(45),
    TipoServico VARCHAR(45),
    FOREIGN KEY (OrdemServico_idOrdemServico) REFERENCES OrdemServico(idOrdemServico),
    FOREIGN KEY (Colaboradores_idColaboradores) REFERENCES Colaboradores(idColaboradores),
    FOREIGN KEY (OrdemServico_Cliente_idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE ResultadoOrcamento (
    Colaboradores_idColaboradores INT,
    Almoxarifado_idAlmoxarifado INT,
    DisponibilidadePeca VARCHAR(45),
    ValorOrcamento VARCHAR(45),
    Pagamento VARCHAR(45),
    FOREIGN KEY (Colaboradores_idColaboradores) REFERENCES Colaboradores(idColaboradores),
    FOREIGN KEY (Almoxarifado_idAlmoxarifado) REFERENCES Almoxarifado(idAlmoxarifado)
);



2. Inserção de Dados para Testes

-- Clientes
INSERT INTO Cliente (CPF, Nome) VALUES 
('12345678900', 'João Silva'),
('98765432100', 'Maria Oliveira'),
('11122233344', 'Carlos Souza');

-- Colaboradores
INSERT INTO Colaboradores (Matricula, Nome) VALUES 
('MAT001', 'Paulo Mendes'),
('MAT002', 'Ana Clara');

-- Almoxarifado
INSERT INTO Almoxarifado (IDProduto, Descricao, Quantidade) VALUES 
('P001', 'Filtro de óleo', '30'),
('P002', 'Correia dentada', '15');

-- Ordem de Serviço
INSERT INTO OrdemServico (Tipo, Descricao, Valor, DataServico, Cliente_idCliente) VALUES 
('Revisão', 'Troca de óleo e filtro', 150.00, '2025-04-10', 1),
('Manutenção', 'Troca de correia', 300.00, '2025-04-11', 2);

-- Avaliação de Serviço
INSERT INTO AvaliacaoServico (OrdemServico_idOrdemServico, OrdemServico_Cliente_idCliente, Colaboradores_idColaboradores, AvaliacaoEspecialidade, ValorOrcamento, TipoServico) VALUES 
(1, 1, 1, 'Boa', '150.00', 'Revisão'),
(2, 2, 2, 'Excelente', '300.00', 'Manutenção');

-- Resultado Orçamento
INSERT INTO ResultadoOrcamento (Colaboradores_idColaboradores, Almoxarifado_idAlmoxarifado, DisponibilidadePeca, ValorOrcamento, Pagamento) VALUES 
(1, 1, 'Disponível', '150.00', 'Pago'),
(2, 2, 'Disponível', '300.00', 'Pendente');


3. Consultas SQL 

####### SQL SIMPLES ##################
SELECT Nome, CPF FROM Cliente;


####### WHERE Statement ##############
SELECT * FROM OrdemServico 
WHERE Valor > 200;

####### Atributo Derivado #######
SELECT 
    Nome,
    CONCAT('Cliente: ', Nome, ' - CPF: ', CPF) AS Identificacao
FROM Cliente;


###### ORDER BY ################
SELECT * FROM OrdemServico 
ORDER BY Valor DESC;


###### HAVING Statement ########
SELECT Cliente_idCliente, COUNT(*) AS TotalServicos
FROM OrdemServico
GROUP BY Cliente_idCliente
HAVING COUNT(*) > 1;


####### JOINs ##################
-- Lista clientes, ordem de serviço e o nome do colaborador que avaliou
SELECT 
    c.Nome AS Cliente,
    os.Descricao AS Servico,
    col.Nome AS Colaborador,
    av.AvaliacaoEspecialidade
FROM Cliente c
JOIN OrdemServico os ON c.idCliente = os.Cliente_idCliente
JOIN AvaliacaoServico av ON os.idOrdemServico = av.OrdemServico_idOrdemServico
JOIN Colaboradores col ON av.Colaboradores_idColaboradores = col.idColaboradores;

-- Verifica disponibilidade de peças utilizadas pelos colaboradores nos serviços
SELECT 
    col.Nome AS Colaborador,
    alm.Descricao AS Peca,
    ro.DisponibilidadePeca,
    ro.ValorOrcamento
FROM ResultadoOrcamento ro
JOIN Colaboradores col ON ro.Colaboradores_idColaboradores = col.idColaboradores
JOIN Almoxarifado alm ON ro.Almoxarifado_idAlmoxarifado = alm.idAlmoxarifado;
