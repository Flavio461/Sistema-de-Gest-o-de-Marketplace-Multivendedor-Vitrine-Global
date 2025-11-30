-- Apagar tabelas, caso existam. OBS: é necessário garantir que não hajam dados importantes nas tabelas quando o schema for executa, para evitar perda de dados
DROP TABLE IF EXISTS anuncio_fotos;
DROP TABLE IF EXISTS anuncios;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS cidades;

CREATE TABLE cidades (
	id INT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	uf CHAR(2) NOT NULL,
  -- Impõe restrições para exigir cidades únicas
	CONSTRAINT uq_cidades_nome_uf UNIQUE (nome, uf)
);

CREATE TABLE categorias (
	id INT PRIMARY KEY,
	nome VARCHAR(80) NOT NULL,
	descricao VARCHAR(255),
  -- Impõe restrições para exigir categorias únicas
	CONSTRAINT uq_categorias_nome UNIQUE (nome)
);

CREATE TABLE usuarios (
	id INT PRIMARY KEY,
	nome VARCHAR(120) NOT NULL,
	email VARCHAR(180) NOT NULL,
	password_hash VARCHAR(255) NOT NULL,
	telefone VARCHAR(30),
	whatsapp VARCHAR(30),
	link_whatsapp VARCHAR(255),
	tipo VARCHAR(20) NOT NULL,
	data_cadastro TIMESTAMP NOT NULL,
	ativo BOOLEAN NOT NULL DEFAULT TRUE,
	cidade_id INT NOT NULL,
  -- Impõe restrições para emails repetidos e define a chave estrangeira
	CONSTRAINT uq_usuarios_email UNIQUE (email),
	CONSTRAINT fk_usuarios_cidades FOREIGN KEY (cidade_id) REFERENCES cidades(id)
);

CREATE TABLE anuncios (
	id INT PRIMARY KEY,
	usuario_id INT NOT NULL,
	categoria_id INT NOT NULL,
	cidade_id INT NOT NULL,
	titulo VARCHAR(120) NOT NULL,
	descricao TEXT,
	preco DECIMAL(10,2) NOT NULL,
	condicao VARCHAR(20) NOT NULL,
	status VARCHAR(20) NOT NULL DEFAULT 'ATIVO',
	data_publicacao TIMESTAMP NOT NULL,
	data_encerramento TIMESTAMP NULL,

  -- Impõe restrições para preços (maior que zero), define as condições possíveis dos itens, os estados ('ATIVO','VENDIDO','EXPIRADO') e define as chaves estrangeiras
	CONSTRAINT fk_anuncios_usuarios FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
	CONSTRAINT fk_anuncios_categorias FOREIGN KEY (categoria_id) REFERENCES categorias(id),
	CONSTRAINT fk_anuncios_cidades FOREIGN KEY (cidade_id) REFERENCES cidades(id),

	CONSTRAINT ck_anuncios_preco CHECK (preco > 0),
	CONSTRAINT ck_anuncios_condicao CHECK (condicao IN ('NOVO','USADO','DEFEITUOSO')),
	CONSTRAINT ck_anuncios_status CHECK (status IN ('ATIVO','VENDIDO','EXPIRADO'))
);

CREATE TABLE anuncio_fotos (
	id INT PRIMARY KEY,
	anuncio_id INT NOT NULL,
	url VARCHAR(500) NOT NULL,
	legenda VARCHAR(120),
	ordem INT NOT NULL DEFAULT 1,
	principal BOOLEAN NOT NULL DEFAULT FALSE,
  -- Define a chave estrangeira
	CONSTRAINT fk_fotos_anuncios FOREIGN KEY (anuncio_id) REFERENCES anuncios(id) ON DELETE CASCADE
);
