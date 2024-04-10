--Projeto de Banco de Dados

CREATE DATABASE Jogo_OnLine;

USE Jogo_OnLine2;

CREATE TABLE Jogador (
	idJogador INT AUTO_INCREMENT PRIMARY KEY,
	nomeConta VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	senha VARCHAR(255) NOT NULL,
	mora INT NOT NULL,
	capacidade INT NOT NULL,
	gemaE INT NOT NULL
);

DESCRIBE Jogador;

CREATE TABLE Login (
	idLogin INT AUTO_INCREMENT PRIMARY KEY,
	idJogador INT NOT NULL,
	dataHoraInicial DATETIME NOT NULL,
	dataHoraFinal DATETIME NOT NULL,
	FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador)
);

DESCRIBE Login;

CREATE TABLE HistoricoNivelConta (
	idHistoricoConta INT AUTO_INCREMENT PRIMARY KEY,
	idJogador INT NOT NULL,
	nivel INT NOT NULL,
	dataHora DATETIME NOT NULL,
	FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador)
);

DESCRIBE HistoricoNivelConta;

CREATE TABLE Missao (
	idMissao INT AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(255) NOT NULL,
	local VARCHAR(255) NOT NULL,
	recompensas VARCHAR(255) NOT NULL
);

DESCRIBE Missao;

CREATE TABLE MissoesStatus (
	idJogador INT NOT NULL,
	idMissao INT NOT NULL,
	status VARCHAR(255) NOT NULL,
	FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador),
	FOREIGN KEY (idMissao) REFERENCES Missao(idMissao)
);

DESCRIBE MissoesStatus;

CREATE TABLE Item (
	idItem INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	descricao VARCHAR(255) NOT NULL
);

DESCRIBE Item;

CREATE TABLE Outro (
	idItem INT NOT NULL PRIMARY KEY,
	tipo VARCHAR(255) NOT NULL,
	preco INT NOT NULL,
	FOREIGN KEY (idItem) REFERENCES Item(idItem)
);

DESCRIBE Outro;

CREATE TABLE Arma (
	idItem INT NOT NULL PRIMARY KEY,
	tipo VARCHAR(255) NOT NULL,
	passiva VARCHAR(255),
	raridade INT NOT NULL,
	FOREIGN KEY (idItem) REFERENCES Item(idItem)
);

DESCRIBE Arma;

CREATE TABLE ItemList (
	idList INT PRIMARY KEY,
	idJogador INT NOT NULL,
	idItem INT NOT NULL,
	quantidade INT NOT NULL,
	nivel INT,
	FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador),
	FOREIGN KEY (idItem) REFERENCES Item(idItem)
);

DESCRIBE ItemList;

CREATE TABLE Personagem (
	idPersonagem INT NOT NULL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	tipo VARCHAR(255) NOT NULL
);

DESCRIBE Personagem;

CREATE TABLE Habilidade (
	idHabilidade INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	custoMagia INT NOT NULL
);

DESCRIBE Habilidade;

CREATE TABLE PersonagemAdq (
	idAct INT NOT NULL  PRIMARY KEY,
	idJogador INT NOT NULL,
	idPersonagem INT NOT NULL,
	aquisicao DATE NOT NULL,
	idList INT,
	nivel INT NOT NULL,
	constelacao INT NOT NULL,
	FOREIGN KEY (idJogador) REFERENCES Jogador(idJogador),
	FOREIGN KEY (idPersonagem) REFERENCES Personagem(idPersonagem),
	FOREIGN KEY (idList) REFERENCES ItemList(idList)
);

DESCRIBE PersonagemAdq;

CREATE TABLE Atributos (
	idAtt INT AUTO_INCREMENT PRIMARY KEY,
	idAct INT,
	idList INT,
	vida INT NOT NULL,
	ataque INT NOT NULL,
	defesa INT NOT NULL,
	stamina INT NOT NULL,
	bonusCura INT NOT NULL,
	FOREIGN KEY (idAct) REFERENCES PersonagemAdq(idAct),
	FOREIGN KEY (idList) REFERENCES ItemList(idList)
);

DESCRIBE Atributos;

CREATE TABLE Personagem_Habilidades (
	idPersonagem INT NOT NULL,
	idHabilidade INT NOT NULL,
	FOREIGN KEY (idPersonagem) REFERENCES Personagem(idPersonagem),
	FOREIGN KEY (idHabilidade) REFERENCES Habilidade(idHabilidade)
);

INSERT INTO Jogador (nomeConta, email, senha, mora, capacidade, gemaE) VALUES 
	('Rafa', 'rafa@example.com', 'rafa123', 25110, 300, 121),
	('Mel', 'mel@example.com', 'mel456', 54440, 400, 487),
	('Ilson', 'ilson@example.com', 'ilson789', 124900, 500, 323),
	('Lucas', 'lucas@example.com', 'lucas123', 100000, 600, 250),
	('Ana', 'ana@example.com', 'ana456', 75000, 450, 180),
	('Pedro', 'pedro@example.com', 'pedro789', 82000, 550, 310),
	('Maria', 'maria@example.com', 'maria123', 63000, 400, 150),
	('Julia', 'julia@example.com', 'julia456', 90000, 500, 200),
	('Carlos', 'carlos@example.com', 'carlos789', 110000, 700, 400),
	('Camila', 'camila@example.com', 'camila123', 98000, 600, 350);

INSERT INTO Login (idJogador, dataHoraInicial, dataHoraFinal) VALUES
	(1, '2024-04-06 08:00:00', '2024-04-06 10:00:00'),
	(1, '2024-04-07 12:00:00', '2024-04-07 14:00:00'),
	(1, '2024-04-08 16:00:00', '2024-04-08 18:00:00'),
	(1, '2024-04-09 20:00:00', '2024-04-09 22:00:00'),
	(2, '2024-05-06 08:00:00', '2024-05-06 10:00:00'),
	(2, '2024-05-07 12:00:00', '2024-05-07 14:00:00'),
	(3, '2024-06-26 08:00:00', '2024-06-26 10:00:00'),
	(3, '2024-06-27 12:00:00', '2024-06-27 14:00:00'),
	(3, '2024-06-28 16:00:00', '2024-06-28 18:00:00');

CREATE VIEW Login_View AS
SELECT l.idLogin, j.nomeConta AS nomeJogador, l.dataHoraInicial, l.dataHoraFinal
FROM Login l
INNER JOIN Jogador j ON l.idJogador = j.idJogador;

SELECT * FROM Login_View;

INSERT INTO HistoricoNivelConta (idJogador, nivel, dataHora) VALUES
	(1, 1, '2024-04-01 00:00:00'),
	(1, 2, '2024-04-02 00:00:00'),
	(1, 3, '2024-04-03 00:00:00'),
	(1, 4, '2024-04-04 00:00:00'),
	(1, 5, '2024-04-05 00:00:00'),
	(1, 6, '2024-04-06 00:00:00'),
	(1, 7, '2024-04-07 00:00:00'),
	(1, 8, '2024-04-08 00:00:00'),
	(1, 9, '2024-04-09 00:00:00'),
	(1, 10, '2024-04-10 00:00:00'),
	(1, 11, '2024-04-11 00:00:00'),
	(1, 12, '2024-04-12 00:00:00'),
	(1, 13, '2024-04-13 00:00:00'),
	(1, 14, '2024-04-14 00:00:00'),
	(1, 15, '2024-04-15 00:00:00'),
	(1, 16, '2024-04-16 00:00:00'),
	(1, 17, '2024-04-17 00:00:00'),
	(1, 18, '2024-04-18 00:00:00'),
	(1, 19, '2024-04-19 00:00:00'),
	(1, 20, '2024-04-20 00:00:00'),
	(1, 21, '2024-04-21 00:00:00'),
	(1, 22, '2024-04-22 00:00:00'),
	(1, 23, '2024-04-23 00:00:00'),
	(1, 24, '2024-04-24 00:00:00'),
	(1, 25, '2024-04-25 00:00:00'),
	(1, 26, '2024-04-26 00:00:00'),
	(1, 27, '2024-04-27 00:00:00'),
	(1, 28, '2024-04-28 00:00:00'),
	(1, 29, '2024-04-29 00:00:00'),
	(1, 30, '2024-04-30 00:00:00'),
	(2, 1, '2024-05-01 00:00:00'),
	(2, 2, '2024-05-02 00:00:00'),
	(2, 3, '2024-05-03 00:00:00'),
	(2, 4, '2024-05-04 00:00:00'),
	(2, 5, '2024-05-05 00:00:00'),
	(2, 6, '2024-05-06 00:00:00'),
	(2, 7, '2024-05-07 00:00:00'),
	(2, 8, '2024-05-08 00:00:00'),
	(2, 9, '2024-05-09 00:00:00'),
	(2, 10, '2024-05-10 00:00:00'),
	(3, 1, '2024-06-01 00:00:00'),
	(3, 2, '2024-06-02 00:00:00'),
	(3, 3, '2024-06-03 00:00:00'),
	(3, 4, '2024-06-04 00:00:00'),
	(3, 5, '2024-06-05 00:00:00');

SELECT * FROM HistoricoNivelConta;		

INSERT INTO Missao (descricao, local, recompensas) VALUES
	('Pegue 5 baldes de agua', 'Floresta', '10000 moedas de mora'),
	('Derrote o chefe da caverna', 'Caverna Negra', 'Flor de Aco'),
	('Resgate o prisioneiro', 'Torre do Castelo', 'Pergaminho de magia'),
	('Encontre o artefato perdido', 'Ruinas Antigas', 'Minerio de Refinamento Fino'),
	('Proteja a aldeia dos bandidos', 'Aldeia dos Camponeses', 'Pocao Protetora'),
	('Explore a masmorra', 'Masmorra Sombria', '5 Gemas Essenssiais'),
	('Defenda a fronteira', 'Fronteira Sul', '20000 moedas de mora'),
	('Colete ervas medicinais', 'Floresta', 'Pocao Dendrocida'),
	('Recupere o tesouro perdido', 'Ilha Deserta', 'Mapa do tesouro'),
	('Entregue uma mensagem urgente', 'Cidade Real', '5000 moedas de mora'),
	('Purifique o santuario', 'Montanha Sagrada', 'Reliquia antiga'),
	('Cace o lobo solitario', 'Floresta', 'Garras afiadas'),
	('Ajude os viajantes perdidos', 'Caminho do Vale', 'Bico de Ibis');

SELECT * FROM Missao;

INSERT INTO MissoesStatus (idJogador, idMissao, status) VALUES
	(1, 1, 'Completa'),
	(1, 2, 'Completa'),
	(1, 3, 'Completa'),
	(1, 4, 'Ativa'),
	(1, 5, 'Disponivel'),
	(1, 6, 'Bloqueada'),
	(2, 7, 'Completa'),
	(2, 1, 'Completa'),
	(2, 8, 'Ativa'),
	(2, 9, 'Bloqueada'),
	(2, 10, 'Disponivel'),
	(3, 11, 'Disponivel'),
	(3, 12, 'Disponivel'),
	(3, 13, 'Ativa');

SELECT * FROM MissoesStatus;

CREATE VIEW Jogador_Missoes_View AS
SELECT jm.idJogador, m.descricao AS missao, m.local, m.recompensas
FROM MissoesStatus jm
JOIN Missao m ON jm.idMissao = m.idMissao;

INSERT INTO Item (idItem, nome, descricao)
VALUES
	(1, 'Pocao de Cura', 'Recupera HP do jogador'),
	(2, 'Pocao de Mana', 'Recupera MP do jogador'),
	(3, 'Bomba', 'Causa dano em area'),
	(4, 'Pocao de Resistencia', 'Aumenta a resistencia temporariamente'),
	(5, 'Pergaminho de Fogo', 'Invoca uma explosao de fogo'),
	(6, 'Pergaminho de Gelo', 'Invoca uma tempestade de gelo'),
	(7, 'Mapa do Tesouro', 'Um mapa que leva ao tesouro escondido'),
	(8, 'Reliquia Perdida', 'Uma reliquia perdida ha seculos'),
	(9, 'A Fisgada', 'Esta era a amada lanca de um famoso bandido de Inazuma'),
	(10, 'Espada de Prata', 'Uma espada para afastar demonios.'),
	(11, 'Mensageiro', 'Dizem que ele foi usado para comunicacoes de longa distancia'),
	(12, 'Pocao de Velocidade', 'Aumenta a velocidade temporariamente'),
	(13, 'Pergaminho de Cura', 'Um pergaminho que cura ferimentos leves'),
	(14, 'Chave do Templo', 'Uma chave para acessar o templo antigo'),
	(15, 'Olho do Juramento','Um tesouro nacional do Reino de Byakuya guardado no Dainichi Mikoshi');

SELECT * FROM Item;

INSERT INTO Outro(idItem, tipo, preco)
VALUES
	(1, 'Consumivel', 5000),
	(2, 'Consumivel', 5000),
	(3, 'Consumivel', 10000),
	(4, 'Consumivel', 6000),
	(5, 'Produto', 20000),
	(6, 'Produto', 20000),
	(7, 'Missao', 0),
	(8, 'Missao', 0),
	(12, 'Consumivel', 7000),
	(13, 'Produto', 8000),
	(14, 'Missao', 0);

SELECT * FROM Outro;

INSERT INTO Arma(idItem, tipo, passiva, raridade)
VALUES
	(9, 'Lanca', 'Aumenta o dano em 20', 4),
	(10, 'Espada', NULL, 2),
	(11, 'Arco', 'Aplica 10 de dano de sangramento', 3),  
	(15, 'Catalizador', 'Aumenta a defesa em 20', 4);

SELECT * FROM Arma;

INSERT INTO Personagem (idPersonagem, nome, descricao, tipo) VALUES
	(1, 'Diluc', 'Um cavaleiro ardente que empunha uma espada de duas maos.', 'Pyro'),
	(2, 'Jean', 'A Grande Mestra da Cavalaria de Mondstadt.', 'Anemo'),
	(3, 'Keqing', 'A Feiticeira Celestial de Liyue.', 'Electro'),
	(4, 'Venti', 'O Deus dos Ventos de Mondstadt.', 'Anemo'),
	(5, 'Klee', 'Uma bruxa explosiva de Mondstadt.', 'Pyro'),
	(6, 'Mona', 'A Astrologista de Liyue.', 'Hydro'),
	(7, 'Qiqi', 'A zumbi guardia dos secretos conhecimentos de Bubu Pharmacy.', 'Cryo'),
	(8, 'Ganyu', 'A secretaria do Qixing e uma emissaria incomum em Liyue.', 'Cryo'),
	(9, 'Zhongli', 'Um consultor contratado pelo Conselho de Liyue.', 'Geo'),
	(10, 'Albedo', 'Um alquimista talentoso de Mondstadt.', 'Geo'),
	(11, 'Xiao', 'Um vigilante yaksha.', 'Anemo'),
	(12,'Hu Tao', 'A diretora da Funeraria Wangsheng.', 'Pyro'),
	(13, 'Rosaria', 'Uma freira de Mondstadt.', 'Cryo'),
	(14, 'Eula', 'Capita dos Cavaleiros de Favonius.', 'Cryo'),
	(15, 'Ayaka', 'Princesa da Familia Kamisato.', 'Cryo'),
	(16, 'Raiden Ei', 'A Shogun Eletro do Inazuma.', 'Electro'),
	(17, 'Razor', 'Um jovem lobisomem de Wolvendom.', 'Electro'),
	(18, 'Lisa', 'Uma bruxa de Mondstadt.', 'Electro'),
	(19, 'Sucrose', 'Uma alquimista assistente de Mondstadt.', 'Anemo'),
	(20, 'Barbara', 'A Deusa da Fonte de Mondstadt.', 'Hydro'),
	(21, 'Ningguang', 'Uma arquiteta rica e misteriosa de Liyue.', 'Geo'),
	(22, 'Beidou', 'A Capita dos Crimsons, conhecida como "Rainha dos Mares".', 'Electro'),
	(23, 'Xingqiu', 'Um jovem espadachim da Familia Feiyun.', 'Hydro');

SELECT * FROM Personagem;

INSERT INTO Habilidade (nome, descricao, custoMagia) VALUES
	('Bola de fogo', 'Uma esfera flamejante que queima tudo em seu caminho', 10),
	('Bola de agua', 'Uma esfera de agua poderosa que pode extinguir chamas', 7),
	('Bola de terra', 'Uma esfera de terra que pode causar tremores no solo', 10),
	('Bola de vento', 'Uma esfera de vento que pode derrubar inimigos', 10),
	('Bola de lama', 'Uma esfera de lama pegajosa que prende os oponentes', 11),
	('Bola de barro', 'Uma esfera feita de barro que pode cegar os inimigos', 15),
	('Bola de raio', 'Uma esfera eletrica que causa danos eletricos', 7),
	('Bola de som', 'Uma esfera de som que pode atordoar os inimigos', 10),
	('Bola de papel', 'Uma esfera de papel cortante que pode ferir os oponentes', 5),
	('Bola de trovao', 'Uma esfera de trovao que causa estrondos ensurdecedores', 20),
	('Bola de madeira', 'Uma esfera feita de madeira que pode prender os inimigos', 15),
	('Bola de plastico', 'Uma esfera de plastico que pode ser inflamavel', 5);

SELECT * FROM Habilidade;

INSERT INTO Personagem_Habilidades (idPersonagem, idHabilidade) VALUES
	(1, 1), 
	(1, 2), 
	(2, 3), 
	(3, 4), 
	(4, 5), 
	(5, 6), 
	(6, 7), 
	(7, 8), 
	(8, 9), 
	(9, 10),
	(10, 11),
	(11, 12),
	(12, 1),
	(13, 2),
	(14, 3),
	(15, 4),
	(16, 5),
	(17, 6),
	(18, 7),
	(19, 8),
	(20, 9),
	(21, 10),
	(22, 11),
	(23, 12);


SELECT * FROM Personagem_Habilidades;

INSERT INTO ItemList (idList, idJogador, idItem, quantidade, nivel)
VALUES
	(1, 1, 10, 1, 20),
	(2, 1, 11, 1, 34),
	(3, 1, 11, 1, 10),
	(4, 1, 15, 1, 80),
	(5, 1, 15, 1, 27),
	(6, 1, 11, 1, 70),
	(7, 1, 9, 1, 75),
	(8, 1, 8, 1, NULL),
	(9, 1, 1, 10, NULL),
	(10, 2, 10, 1, 50),
	(11, 2, 15, 1, 22),
	(12, 2, 2, 15, NULL),
	(13, 2, 3, 15, NULL),
	(14, 2, 7, 1, NULL),
	(15, 3, 11, 1, 70),
	(16, 3, 1, 25, NULL),
	(17, 3, 3, 15, NULL),
	(18, 3, 7, 1, NULL),
	(19, 3, 12, 20, NULL);

SELECT * FROM ItemList;		


INSERT INTO PersonagemAdq (idAct, idJogador, idPersonagem, aquisicao, idList, nivel, constelacao)
VALUES 
	(1, 1, 1, '2024-01-15', NULL, 5, 0), -- Diluc
	(2, 1, 2, '2024-02-20', 1, 20, 1), -- Jean
	(3, 1, 3, '2024-03-25', 2, 50, 2), -- Keqing
	(4, 1, 4, '2024-04-30', 3, 55, 0), -- Venti
	(5, 1, 5, '2024-05-05', NULL, 5, 0), -- Klee
	(6, 1, 6, '2024-06-10', 4, 90, 6), -- Mona
	(7, 1, 7, '2024-07-15', 5, 40, 2), -- Qiqi
	(8, 1, 8, '2024-08-20', 6, 80, 2), -- Ganyu
	(9, 1, 9, '2024-09-25', NULL, 17, 0), -- Zhongli
	(10, 1, 10, '2024-10-30', NULL, 17, 0), -- Albedo
	(11, 1, 11, '2024-11-05', 7, 74, 4), -- Xiao
	(12, 1, 12, '2024-12-10', NULL, 17, 0), -- Hu Tao
	(13, 1, 13, '2025-01-15', NULL, 17, 0), -- Rosaria
	(14, 1, 14, '2025-02-20', NULL, 47, 3), -- Eula
	(15, 1, 15, '2025-03-25', NULL, 27, 0); -- Ayaka

INSERT INTO PersonagemAdq (idAct, idJogador, idPersonagem, aquisicao, idList, nivel, constelacao)
VALUES 
	(16, 2, 1, '2024-01-15', NULL, 17, 0), -- Diluc
	(17, 2, 16, '2024-02-20', 10, 87, 5), -- Raiden Ei
	(18, 2, 17, '2024-03-25', NULL, 17, 0), -- Razor
	(19, 2, 2, '2024-04-30', NULL, 17, 0), -- Jean
	(20, 2, 18, '2024-05-05', NULL, 17, 0), -- Lisa
	(21, 2, 19, '2024-06-10', 11, 34, 2), -- Sucrose
	(22, 2, 20, '2024-07-15', NULL, 17, 0), -- Barbara
	(23, 2, 21, '2024-08-20', NULL, 17, 0), -- Ningguang
	(24, 2, 22, '2024-09-25', NULL, 17, 0), -- Beidou
	(25, 2, 23, '2024-10-30', NULL, 17, 0); -- Xingqiu

INSERT INTO PersonagemAdq (idAct, idJogador, idPersonagem, aquisicao, idList, nivel, constelacao)
VALUES 
	(26, 3, 1, '2024-01-15', NULL, 17, 0), -- Diluc
	(27, 3, 5, '2024-02-20', NULL, 17, 0), -- Klee
	(28, 3, 18, '2024-03-25', NULL, 17, 0), -- lisa
	(29, 3, 8, '2024-04-30', 11, 90, 6), -- Ganyu
	(30, 3, 10, '2024-05-05', NULL, 17, 0); -- Albedo

SELECT * FROM PersonagemAdq;

CREATE VIEW MeusPersonagens_View AS
SELECT MP.idJogador, MP.idPersonagem, P.nome AS nome_personagem, MP.aquisicao
FROM PersonagemAdq MP
JOIN Personagem P ON MP.idPersonagem = P.idPersonagem;

SELECT * FROM MeusPersonagens_View;

INSERT INTO Atributos (idAtt, idAct, idList, vida, ataque, defesa, stamina, bonusCura)
VALUES
	-- Atributos dos personagens de Rafa
	(1, 1, NULL, 100, 50, 80, 70, 60),   -- Diluc
	(2, 2, NULL, 90, 70, 60, 80, 50),    -- Jean
	(3, 3, NULL, 80, 80, 70, 60, 70),    -- Keqing
	(4, 4, NULL, 70, 90, 50, 90, 40),    -- Venti
	(5, 5, NULL, 60, 100, 90, 40, 80),   -- Klee
	(6, 6, NULL, 50, 110, 40, 100, 30),  -- Mona
	(7, 7, NULL, 40, 120, 30, 110, 20),  -- Qiqi
	(8, 8, NULL, 30, 130, 20, 120, 10),  -- Ganyu
	(9, 9, NULL, 20, 140, 10, 130, 0),   -- Zhongli
	(10, 10, NULL, 10, 150, 0, 140, 0),   -- Albedo
	(11, 11, NULL, 0, 160, 0, 150, 0),    -- Xiao
	(12, 12, NULL, 10, 150, 0, 140, 0),   -- Hu Tao
	(13, 13, NULL, 20, 140, 10, 130, 0),  -- Rosaria
	(14, 14, NULL, 30, 130, 20, 120, 10), -- Eula
	(15, 15, NULL, 40, 120, 30, 110, 20), -- Ayaka
	-- Atributos dos personagens de Mel
	(16, 16, NULL, 150, 40, 100, 80, 70), -- Diluc
	(17, 17, NULL, 140, 50, 90, 70, 80),   -- Raiden Ei
	(18, 18, NULL, 130, 60, 80, 60, 90),   -- Razor
	(19, 19, NULL, 120, 70, 70, 50, 100),  -- Jean
	(20, 20, NULL, 110, 80, 60, 40, 110),  -- Lisa
	(21, 21, NULL, 100, 90, 50, 30, 120),  -- Sucrose
	(22, 22, NULL, 90, 100, 40, 20, 130),  -- Barbara
	(23, 23, NULL, 80, 110, 30, 10, 140),  -- Ningguang
	(24, 24, NULL, 70, 120, 20, 0, 150),   -- Beidou
	(25, 25, NULL, 60, 130, 10, 0, 160),   -- Xingqiu
	-- Atributos dos personagens de Ilson
	(26, 26, NULL, 110, 80, 70, 60, 50),  -- Diluc
	(27, 27, NULL, 120, 70, 80, 50, 40),  -- Klee
	(28, 28, NULL, 130, 60, 90, 40, 30),  -- Lisa
	(29, 29, NULL, 140, 50, 100, 30, 20), -- Ganyu
	(30, 30, NULL, 150, 40, 110, 20, 10), -- Albedo
	(31, NULL, 1, 0, 78, 0, 0, 0),
	(32, NULL, 2, 0, 123, 0, 15, 0),
	(33, NULL, 3, 0, 20, 0, 0, 0),
	(34, NULL, 4, 0, 0, 0, 0, 50),
	(35, NULL, 5, 0, 40, 0, 0, 0),
	(36, NULL, 6, 0, 0, 0, 15, 0),
	(37, NULL, 7, 0, 300, 0, 0, 0),
	(38, NULL, 10, 0, 0, 0, 0, 50),
	(39, NULL, 11, 0, 40, 0, 0, 0),
	(40, NULL, 15, 0, 230, 0, 15, 0);

SELECT * FROM Atributos;

CREATE VIEW Personagem_Habilidade_View AS
SELECT 
	P.idPersonagem,
	P.nome AS nome_personagem,
	P.tipo AS tipo_personagem,
	H.nome AS habilidade
FROM 
    Personagem P
JOIN 
	Personagem_Habilidades PH ON P.idPersonagem = PH.idPersonagem
JOIN 
	Habilidade H ON PH.idHabilidade = H.idHabilidade;

SELECT * FROM Personagem_Habilidade_View;