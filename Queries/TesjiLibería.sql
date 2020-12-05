CREATE TABLE nacionalidad(id_nacionalidad INT(3) PRIMARY KEY,
	nacionalidad VARCHAR(50) UNIQUE NOT NULL) ;   

CREATE TABLE autor
(
    id_autor INT(3) PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(30) NOT NULL,
    apellido2 VARCHAR(30) NOT NULL,
    id_nacionalidad INT(3) NOT NULL, 
    CONSTRAINT FOREIGN KEY(id_nacionalidad) REFERENCES nacionalidad(id_nacionalidad)
    );

CREATE TABLE editorial(id_editorial INT(3) PRIMARY KEY,
	editorial VARCHAR(100) NOT NULL) ;   


CREATE TABLE libro
(
    id_libro INT(4) PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    ISBN VARCHAR(30) NOT NULL,
    id_editorial INT(3) NOT NULL,
    id_autor INT(3) NOT NULL, 
    CONSTRAINT FOREIGN KEY(id_editorial) REFERENCES editorial(id_editorial),
    CONSTRAINT FOREIGN KEY(id_autor) REFERENCES autor(id_autor)    
    );


CREATE TABLE usuario
(
id_usuario INT(11) PRIMARY KEY,
nombre VARCHAR(30) NOT NULL , 
	apellido1 VARCHAR(30) NOT NULL, 
apellido2 VARCHAR(30) NOT NULL, 
	correo VARCHAR(50) UNIQUE NOT NULL, 
	telefono VARCHAR(30) UNIQUE NOT NULL, 
	direccion VARCHAR(50) NOT NULL
);
  
CREATE TABLE prestamo
(
id_prestamo INT(8) PRIMARY KEY,
	fecha_prestamo DATE NOT NULL, 
	fecha_entrega DATE NOT NULL,
	id_usuario INT(11) NOT NULL, 
	CONSTRAINT FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario)
) ;

CREATE TABLE prestamo_libro
(
    id_prestamo_libro INT(11) PRIMARY KEY,
    id_prestamo INT(8) NOT NULL,
    id_libro INT(8) NOT NULL, 
    CONSTRAINT FOREIGN KEY(id_prestamo) REFERENCES prestamo(id_prestamo),
    CONSTRAINT FOREIGN KEY(id_libro) REFERENCES libro(id_libro)    
    );
