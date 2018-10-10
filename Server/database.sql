DROP DATABASE IF EXISTS sagra;
CREATE DATABASE sagra;

USE sagra;

DROP TABLE IF EXISTS utenti;
CREATE TABLE utenti(
  id INTEGER AUTO_INCREMENT PRIMARY KEY ,
  username VARCHAR(50) NOT NULL UNIQUE ,
  password VARCHAR(256) NOT NULL,
  tipo ENUM('user','admin') NOT NULL
);

INSERT INTO utenti(username, password, tipo) VALUES ('admin',SHA2('admin',512),'admin'),
  ('user',SHA2('user',512),'user');

DROP TABLE IF EXISTS menu;
CREATE TABLE menu(
  id INTEGER AUTO_INCREMENT PRIMARY KEY ,
  nome VARCHAR(50) NOT NULL UNIQUE ,
  prezzo DOUBLE NOT NULL,
  tipo ENUM('Primo','Secondo','Contorno','Bibita','Dolce') NOT NULL
);
