create database db_zer@dengue;

USE db_zer@dengue;

CREATE TABLE CT_USUARIO
(
	IDPESSOA INT PRIMARY KEY NOT NULL,
	NOME VARCHAR (50) NOT NULL,
	EMAIL VARCHAR (50) UNIQUE NOT NULL,
	SENHA VARCHAR (10) NOT NULL,
	CPF CHAR (11),
	DATA_NASC DATE NOT NULL,
	SEXO VARCHAR(1) NOT NULL, --M MASCULINO, F FEMININO, P PERSONALIZADO
	DATA_CADASTRO DATETIME NOT NULL,
	LOGIN_DATAACESSO VARCHAR (15) NOT NULL --HORA QUE EFETUADO LOGIN
	

);
CREATE TABLE CT_CADASTRO
( 
	NOME VARCHAR (50) NOT NULL,
	EMAIL VARCHAR (50) UNIQUE NOT NULL,
	SENHA VARCHAR (50) NOT NULL,
	CPF CHAR (11),
	DATA_NASC DATE,
	SEXO VARCHAR(1),
	DATA_CADASTRO DATETIME,
	IDPESSOA INT NOT NULL,
	FOREIGN KEY (IDPESSOA) REFERENCES CT_USUARIO (IDPESSOA)
);	

CREATE TABLE CT_LOGIN
(
	EMAIL VARCHAR (50) UNIQUE NOT NULL,
	SENHA VARCHAR (10) NOT NULL,
	IDPESSOA INT,
	LOGIN_DATAACESSO VARCHAR (15) NOT NULL,
	FOREIGN KEY (IDPESSOA) REFERENCES CT_USUARIO (IDPESSOA)
);

CREATE TABLE PT_POST
(	
	ID_POST INT PRIMARY KEY NOT NULL,
	IDPESSOA INT,
	NOME VARCHAR (50) NOT NULL,
	TITULO VARCHAR (25) NOT NULL, --DESCRICAO DA PUBLICACAO
	CONTEUDO TEXT NOT NULL,
	LOCALDESCRITO VARCHAR (100) NOT NULL, --LOCALIZACAO DO FOCO
	ID_FOTO INT, -- SE CASO FOR FEITO UPLOUD DE IMAGENS
	FOTO_DATA_ENV DATETIME,
	LOGIN_DATAACESSO VARCHAR (15),
	FOREIGN KEY (IDPESSOA) REFERENCES CT_USUARIO (IDPESSOA),

);

CREATE TABLE POST_FOTO
( 
	ID_FOTO INT PRIMARY KEY NOT NULL,
	IDPESSOA INT,
	ID_POST INT,
	ARQUIVO VARCHAR (999) NOT NULL,
	IMAGEM VARBINARY (MAX) NOT NULL,
	FOTO_DATA_ENV DATETIME NOT NULL,
	LOGIN_DATAACESSO VARCHAR (15) NOT NULL,
	FOREIGN KEY (ID_POST) REFERENCES PT_POST (ID_POST)
);

CREATE TABLE REGISTRO_PUBLICACAO
(
	IDPESSOA INT NOT NULL,
	NOME VARCHAR (50) NOT NULL,
	CPF CHAR (11),
	ID_POST INT NOT NULL,
	TITULO VARCHAR (25) NOT NULL,
	LOGIN_DATAACESSO VARCHAR (15),
	FOREIGN KEY (ID_POST) REFERENCES PT_POST (ID_POST),
);

CREATE TABLE COMENTARIOS 
( 
	ID_COMENT INT PRIMARY KEY,
	CORPO TEXT NOT NULL,
	ID_POST INT,
	FOREIGN KEY (ID_POST) REFERENCES PT_POST (ID_POST)
);

