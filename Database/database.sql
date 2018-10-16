DROP DATABASE IF EXISTS sagra;
CREATE DATABASE sagra;

USE sagra;

DROP TABLE IF EXISTS luoghi;
CREATE TABLE luoghi(
  id_l INTEGER AUTO_INCREMENT PRIMARY KEY ,
  name VARCHAR(50) NOT NULL UNIQUE,
  numeroTavoli INTEGER
);


DROP TABLE IF EXISTS utenti;
CREATE TABLE utenti(
  id_u INTEGER AUTO_INCREMENT PRIMARY KEY ,
  username VARCHAR(50) NOT NULL UNIQUE ,
  password VARCHAR(256) NOT NULL,
  tipo ENUM('user','admin') NOT NULL,
  luogoAsseganto INTEGER,
  FOREIGN KEY(luogoAsseganto) REFERENCES luoghi(id_l)
);

INSERT INTO users(username, password, type) VALUES ('admin',SHA2('admin',512),'admin'),
  ('user',SHA2('user',512),'user');


DROP TABLE IF EXISTS menu;
CREATE TABLE menu(
  id_m INTEGER AUTO_INCREMENT PRIMARY KEY ,
  nome VARCHAR(50) NOT NULL UNIQUE ,
  prezzo DOUBLE NOT NULL,
  tipo ENUM('Primo','Secondo','Contorno','Bibita','Dolce') NOT NULL
);

DROP TABLE IF EXISTS menuServito;
CREATE TABLE menuServito(
  id_ms INTEGER AUTO_INCREMENT PRIMARY KEY ,
  luogo INTEGER NOT NULL,
  elementoMenu INTEGER NOT NULL,
  FOREIGN KEY(luogo) REFERENCES luoghi(id_l),
  FOREIGN KEY(elementoMenu) REFERENCES menu(id_m)
);

DROP TABLE IF EXISTS ordini;
CREATE TABLE ordini(
  id_o INTEGER AUTO_INCREMENT PRIMARY KEY ,
  nome INTEGER NOT NULL,
  numeroCoperti INTEGER NOT NULL,
  asporto BOOL NOT NULL,
  ora TIME,
  data DATE,
  tavoloAsseganto INTEGER,
  commesso INTEGER NOT NULL ,
  FOREIGN KEY(commesso) REFERENCES utenti(id_u)
);

DROP TABLE IF EXISTS vendita;
CREATE TABLE vendita(
  id INTEGER AUTO_INCREMENT PRIMARY KEY ,
  quantita INTEGER NOT NULL ,
  formaggio BOOL,
  ordine INTEGER NOT NULL ,
  elementoMenu INTEGER NOT NULL ,
  FOREIGN KEY(ordine) REFERENCES menu(id_o),
  FOREIGN KEY(elementoMenu) REFERENCES menu(id_m)
);



