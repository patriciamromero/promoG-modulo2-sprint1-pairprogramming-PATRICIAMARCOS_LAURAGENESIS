CREATE SCHEMA `tienda_zapatillas`;

USE `tienda_zapatillas`;

CREATE TABLE zapatillas( 
	id_zapatilla  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL,
    );

CREATE TABLE clientes( 
	id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45),
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal CHAR(5) NOT NULL
);
 
 CREATE TABLE Empleados( 
	id_empleado  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT, 
    fecha_incorporacion DATE NOT NULL
);
    
CREATE TABLE Facturas( 
	id_factura  INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatilla INT NOT NULL, 
    id_empleado INT NOT NULL, 
    id_cliente INT NOT NULL,
    CONSTRAINT fk_zapatilla
		FOREIGN KEY (id_zapatilla) 
        REFERENCES zapatillas (id_zapatilla),
	CONSTRAINT fk_empleado
		FOREIGN KEY (id_empleado) 
        REFERENCES Empleados (id_empleado),
	CONSTRAINT fk_cliente
		FOREIGN KEY (id_cliente) 
        REFERENCES clientes (id_cliente)
);
ALTER TABLE zapatillas ADD marca VARCHAR(45) NOT NULL;
ALTER TABLE zapatillas ADD talla INT NOT NULL;

ALTER TABLE Empleados 
MODIFY COLUMN salario FLOAT;

ALTER TABLE clientes DROP COLUMN pais;

ALTER TABLE facturas ADD COLUMN total FLOAT;

INSERT INTO zapatillas
	VALUES (1,'XQYUN','Negro','Nike',42),
			(2,'UOPMN','Rosas','Nike',39),
			(3,'OPNYT','Verdes','Adidas',35);
            
INSERT INTO Empleados 
    VALUES (1,'Laura','Alcobendas',25.987,'2010/09/03'),
			(2,'Maria','Sevilla','0','2001/04/11' ),
            (3,'Ester','Oviedo',30165.98,'2000/11/29');

INSERT INTO clientes
	VALUES (1,'Monica',1234567289,'monica@email.com', 'Calle Felicidad','Móstoles','Madrid',28176),
			(2,'Lorena',289345678,'lorena@email.com','Calle Alegria','Barcelona','Barcelona',12346),	
            (3,'Carmen',298463759,'carmen@email.com','Calle del Color','Vigo','Pontevedra',23456);

INSERT INTO facturas
	VALUES (1,123,'2001/12/11',1,2,1,54.98),
			(2,1234,'2005/05/23',1,1,3,89.91),
            (3,12345,'2015/09/18',2,3,3,76.23);
            
UPDATE zapatillas
SET color = 'amarilla'WHERE color= 'rosas';


UPDATE empleadas
SET tienda = 'A Coruña' WHERE id_empleado= 1;



