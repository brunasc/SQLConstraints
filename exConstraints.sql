CREATE DATABASE exConstraints
GO
USE exConstraints

CREATE TABLE livro(
codigo_livro        INT				NOT NULL,
nome				VARCHAR(100)	NULL,
lingua				VARCHAR(50)		NULL		CHECK(lingua = 'PT-BR'),
ano					INT				NULL		CHECK(ano >= 1990)
PRIMARY KEY(codigo_livro)
)

CREATE TABLE edicoes(
isbn				INT				NOT NULL,
preco				DECIMAL(7,2)	NULL,
ano					INT				NULL,
num_paginas			INT				NULL,		
qtd_estoque			INT				NULL
PRIMARY KEY(isbn),
CONSTRAINT edi_pre_ano_pag CHECK( preco > 0.00 AND ano >= 1993 AND num_paginas > 0)
)

CREATE TABLE autor(
codigo_autor		INT				NOT NULL,
nome				VARCHAR(100)    NULL		UNIQUE,
dt_nasc				DATE			NULL,
pais				VARCHAR(50)		NULL		CHECK(pais ='Brasil' OR pais='Alemanha'),
biografia			VARCHAR(Max)	NULL
PRIMARY KEY(codigo_autor)
)

CREATE TABLE editora(
codigo_editora		INT				NOT NULL,
nome				VARCHAR(50)     NULL		UNIQUE,
logradouro			VARCHAR(255)	NULL,
numero				INT				NULL		CHECK(numero > 0),
cep					CHAR(8)			NULL,
telefone			CHAR(11)		NULL
PRIMARY KEY(codigo_editora)
)

CREATE TABLE livro_autor (
livrocodigo_livro	INT NOT NULL,
autorcodigo_autor INT NOT NULL,
PRIMARY KEY(livrocodigo_livro, autorcodigo_autor),
FOREIGN KEY(autorcodigo_autor) REFERENCES autor(codigo_autor),
FOREIGN KEY (livrocodigo_livro) REFERENCES livro(codigo_livro)
)

CREATE TABLE livro_edicoes_editora(
edicoesisbn	INT NOT NULL,
editoracodigo_editora	INT NOT NULL,
livrocodigo_livro INT NOT NULL,
PRIMARY KEY (edicoesisbn, editoracodigo_editora, livrocodigo_livro),
FOREIGN KEY (edicoesisbn) REFERENCES edicoes(isbn),
FOREIGN KEY (editoracodigo_editora) REFERENCES editora(codigo_editora),
FOREIGN KEY(livrocodigo_livro) REFERENCES livro(codigo_livro)
)