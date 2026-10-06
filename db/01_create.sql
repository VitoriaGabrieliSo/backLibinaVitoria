CREATE DATABASE IF NOT EXISTS api_filmes
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE api_filmes;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL
);

CREATE TABLE filmes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    duracao INT NOT NULL,
    classificacao VARCHAR(10) NOT NULL,
    sinopse TEXT,
    poster VARCHAR(500)
);

CREATE TABLE generos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE genero_filme (
    id_filme INT NOT NULL,
    id_genero INT NOT NULL,

    PRIMARY KEY (id_filme, id_genero),

    FOREIGN KEY (id_filme) REFERENCES filmes(id),
    FOREIGN KEY (id_genero) REFERENCES generos(id)
);

CREATE TABLE favoritos (
    id_filme INT NOT NULL,
    id_usuario INT NOT NULL,

    PRIMARY KEY (id_filme, id_usuario),

    FOREIGN KEY (id_filme) REFERENCES filmes(id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);
