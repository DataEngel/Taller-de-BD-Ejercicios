CREATE DATABASE tesjipizzeria; 

CREATE TABLE tipopizza(idtipopizza INT(2) PRIMARY KEY,
	nombrepizza VARCHAR(30) UNIQUE NOT NULL) ;   

CREATE TABLE tamanio(
	idtamanio INT(2), 
	nombretamanio VARCHAR(20) UNIQUE NOT NULL,
	PRIMARY KEY(idtamanio)); 

CREATE TABLE pizzatamanio 
(
    idpizzatamanio INT(2) PRIMARY KEY,
    idtipopizza INT(2) NOT NULL,
    idtamanio INT(2) NOT NULL,
    precio FLOAT(6,2) NOT NULL,
    CONSTRAINT FOREIGN KEY(idtipopizza) REFERENCES tipopizza(idtipopizza),
    FOREIGN KEY(idtamanio) REFERENCES tamanio(idtamanio)
    );

CREATE TABLE ingrediente(idingredinte INT(2) PRIMARY KEY,
	nombreingrediente VARCHAR(20) UNIQUE NOT NULL) ;   

CREATE TABLE unidadmedida(
	idunidadmedida INT(2), 
	nombreunidadmedida VARCHAR(20) UNIQUE NOT NULL,
	PRIMARY KEY(idunidadmedida)); 
CREATE TABLE receta 
(
    idreceta INT(2) PRIMARY KEY,
    idpizzatamanio INT(2) NOT NULL,
    cantidad INT(2) NOT NULL,
    idingredinte INT(2),
    idunidadmedida INT(2), 
    CONSTRAINT FOREIGN KEY(idpizzatamanio) REFERENCES pizzatamanio(idpizzatamanio),
    FOREIGN KEY(idingredinte) REFERENCES ingrediente(idingredinte),
    FOREIGN KEY(idunidadmedida) REFERENCES unidadmedida(idunidadmedida)
    );

ALTER TABLE `tesjipizzeria2`.`pizzatamanio` 
ADD COLUMN `preciomayoreo` VARCHAR(45) NOT NULL;
