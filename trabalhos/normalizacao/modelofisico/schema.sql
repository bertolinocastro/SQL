/*
 *
 *	Trabalho pontuado da disciplina de Banco de Dados
 *	Prof.: Tiago Menegaz
 *	Semestre: 2016.2
 *	Curso: CAI TEC Informática - Desenvolvimento de Software
 *
 *	Trabalho em equipe.
 *
 *
 */

CREATE DATABASE `engenharialtda`
	DEFAULT CHARACTER SET utf8
	DEFAULT COLLATE utf8_general_ci;

USE engenharialtda;

CREATE TABLE `endereco` (
	cod_end INT NOT NULL AUTO_INCREMENT,
	rua VARCHAR(255),
	cep BIGINT,
	PRIMARY KEY cod_end (cod_end)
);

CREATE TABLE `cargo` (
	cod_cargo INT NOT NULL AUTO_INCREMENT,
	nome_cargo VARCHAR(255),
	sal_cargo REAL,
	PRIMARY KEY cod_cargo (cod_cargo)
);

CREATE TABLE `funcionario` (
	cod_func INT NOT NULL AUTO_INCREMENT,
	nome_func VARCHAR(255) NOT NULL,
	dt_inicio_func DATE DEFAULT "0000-00-00",
	cod_cargo INT,
	cod_end INT,
	PRIMARY KEY cod_func (cod_func),
	FOREIGN KEY (cod_cargo) REFERENCES cargo (cod_cargo),
	FOREIGN KEY (cod_end) REFERENCES endereco (cod_end)
);

CREATE TABLE `telefone` (
	cod_func INT,
	telefone BIGINT,
	PRIMARY KEY telefone (telefone),
	FOREIGN KEY (cod_func) REFERENCES funcionario (cod_func)
);

CREATE TABLE `projeto` (
	cod_proj INT NOT NULL AUTO_INCREMENT,
	desc_proj TEXT,
	PRIMARY KEY cod_proj (cod_proj)
);

CREATE TABLE `peca` (
	cod_peca INT NOT NULL AUTO_INCREMENT,
	desc_peca TEXT,
	PRIMARY KEY cod_peca (cod_peca)
);

CREATE TABLE `fornecedor` (
	cod_forn INT NOT NULL AUTO_INCREMENT,
	nome_forn VARCHAR(255),
	PRIMARY KEY cod_forn (cod_forn)
);

CREATE TABLE `equipe` (
	cod_equipe INT NOT NULL AUTO_INCREMENT,
	desc_equipe VARCHAR(255),
	PRIMARY KEY cod_equipe (cod_equipe)
);

CREATE TABLE `remessa` (
	cod_forn INT,
	cod_peca INT,
	cod_proj INT,
	PRIMARY KEY rem_pec_forn_proj (cod_peca,cod_forn,cod_proj),
	FOREIGN KEY (cod_forn) REFERENCES fornecedor (cod_forn),
	FOREIGN KEY (cod_peca) REFERENCES  peca (cod_peca),
	FOREIGN KEY (cod_proj) REFERENCES  projeto (cod_proj)
);

CREATE TABLE `equipe_proj` (
	cod_proj INT,
	cod_equipe INT,
	FOREIGN KEY (cod_proj) REFERENCES projeto (cod_proj),
	FOREIGN KEY (cod_equipe) REFERENCES equipe (cod_equipe),
	UNIQUE KEY (cod_proj,cod_equipe)
);

CREATE TABLE `equipe_func` (
	cod_func INT,
	cod_equipe INT,
	FOREIGN KEY (cod_func) REFERENCES funcionario (cod_func),
	FOREIGN KEY (cod_equipe) REFERENCES equipe (cod_equipe),
	UNIQUE KEY (cod_func,cod_equipe)
);

CREATE TABLE `func_proj` (
	cod_proj INT,
	cod_func INT,
	FOREIGN KEY (cod_proj) REFERENCES projeto (cod_proj),
	FOREIGN KEY (cod_func) REFERENCES funcionario (cod_func),
	UNIQUE KEY (cod_proj,cod_func)
);
