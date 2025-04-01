CREATE DATABASE IF NOT EXISTS db_discoteca
COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_discoteca;

CREATE TABLE IF NOT EXISTS tb_tipo_artista (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL
)  AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_gravadora (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
)  AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_genero (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL
)  AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_artista (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    id_tipo_artista INTEGER,
CONSTRAINT fk_tipo_artista_id FOREIGN KEY (id_tipo_artista)
REFERENCES tb_tipo_artista (id)
)  AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_disco (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    duracao TIME,
    ano_lancamento DATE NOT NULL,
    id_artista INTEGER,
    id_gravadora INTEGER,
    id_genero INTEGER,
CONSTRAINT fk_artista_id FOREIGN KEY (id_artista)
REFERENCES tb_artista (id),
CONSTRAINT fk_gravadora_id FOREIGN KEY (id_gravadora)
REFERENCES tb_gravadora (id),
CONSTRAINT fk_genero_id FOREIGN KEY (id_genero)
REFERENCES tb_genero (id)
)  AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS tb_musica (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    tempo_duracao TIME,
    id_disco INTEGER,
CONSTRAINT fk_disco_id FOREIGN KEY (id_disco)
REFERENCES tb_disco (id)
)  AUTO_INCREMENT=1;