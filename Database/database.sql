DROP DATABASE IF EXISTS festival;
CREATE DATABASE festival;

USE festival;

DROP TABLE IF EXISTS places;
CREATE TABLE places(
  id INTEGER AUTO_INCREMENT PRIMARY KEY ,
  name VARCHAR(50) NOT NULL UNIQUE
);


DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id INTEGER AUTO_INCREMENT PRIMARY KEY ,
  username VARCHAR(50) NOT NULL UNIQUE ,
  password VARCHAR(256) NOT NULL,
  type ENUM('user','admin') NOT NULL
);

INSERT INTO users(username, password, type) VALUES ('admin',SHA2('admin',512),'admin'),
  ('user',SHA2('user',512),'user');

DROP TABLE IF EXISTS UsersForPlaces;
CREATE TABLE UsersForPlaces(
  id INTEGER AUTO_INCREMENT PRIMARY KEY ,
  idUser INTEGER NOT NULL REFERENCES  users(id),
  idPlaces INTEGER NOT NULL REFERENCES places(id)
);

DROP TABLE IF EXISTS menu;
CREATE TABLE menu(
  id INTEGER AUTO_INCREMENT PRIMARY KEY ,
  nome VARCHAR(50) NOT NULL UNIQUE ,
  prezzo DOUBLE NOT NULL,
  tipo ENUM('Primo','Secondo','Contorno','Bibita','Dolce') NOT NULL
);

DROP TABLE IF EXISTS menuForPlaces;
CREATE TABLE menuForPlaces(
  id INTEGER AUTO_INCREMENT PRIMARY KEY ,
  idMenu INTEGER NOT NULL REFERENCES menu(id),
  idPlaces INTEGER NOT NULL REFERENCES places(id)
);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
  id INTEGER AUTO_INCREMENT PRIMARY KEY ,
  name VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
  id INTEGER AUTO_INCREMENT PRIMARY KEY ,
  idCostumer INTEGER NOT NULL REFERENCES customers(id),
  quantity INTEGER NOT NULL,
  idMenu INTEGER NOT NULL REFERENCES menu(id)
);


