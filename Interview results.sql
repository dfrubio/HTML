CREATE database interview;  
USE interview; 
CREATE TABLE PRUEBAESTUDIANTE(
Eid int NOT NULL,
Nombre text, 
Especialidad text,
Grado text,
PRIMARY KEY(Eid)
);  
CREATE TABLE PRUEBACLASE(
Nombre varchar(255), 
Horario text, 
Aula text, 
PRIMARY KEY(Nombre)
);  
CREATE TABLE PRUEBAINSCRIPCION(
Eid int NOT NULL, 
NombreClase varchar(255), 
Posicion int NOT NULL, 
foreign key (Eid) references PRUEBAESTUDIANTE(Eid),
foreign key (NombreClase) references PRUEBACLASE(Nombre)
);  

insert into PRUEBAESTUDIANTE(Eid, Nombre, Especialidad, Grado) values (100, 'Jones', 'Historia', 'GR');  
insert into PRUEBAESTUDIANTE(Eid, Nombre, Especialidad, Grado) values (150, 'Parks', 'Contabilidad', 'SO');  
insert into PRUEBAESTUDIANTE(Eid, Nombre, Especialidad, Grado) values (200, 'Baker', 'Matematicas', 'GR');  
insert into PRUEBAESTUDIANTE(Eid, Nombre, Especialidad, Grado) values (250, 'Glass', 'Historia', 'SN');  
insert into PRUEBAESTUDIANTE(Eid, Nombre, Especialidad, Grado) values (300, 'Baker', 'Contabilidad', 'SN');  
insert into PRUEBAESTUDIANTE(Eid, Nombre, Especialidad, Grado) values (350, 'Russell', 'Matematicas', 'JR');  
insert into PRUEBAESTUDIANTE(Eid, Nombre, Especialidad, Grado) values (400, 'Rey', 'Contabilidad', 'FR');  
insert into PRUEBAESTUDIANTE(Eid, Nombre, Especialidad, Grado) values (450, 'Jones', 'Historia', 'SN');  
  

insert into PRUEBACLASE(Nombre, Horario, Aula) values ('BA200', 'M-F9', 'SC110'); 
insert into PRUEBACLASE(Nombre, Horario, Aula) values ('BD445', 'MWF3', 'SC213'); 
insert into PRUEBACLASE(Nombre, Horario, Aula) values ('BF410', 'MWF8', 'SC213'); 
insert into PRUEBACLASE(Nombre, Horario, Aula) values ('CS150', 'MWF3', 'EA304');  


insert into PRUEBAINSCRIPCION(Eid, NombreClase, Posicion) values (100, 'BD445', 1);  
insert into PRUEBAINSCRIPCION(Eid, NombreClase, Posicion) values (150, 'BA200', 1);  
insert into PRUEBAINSCRIPCION(Eid, NombreClase, Posicion) values (200, 'BD445', 2);  
insert into PRUEBAINSCRIPCION(Eid, NombreClase, Posicion) values (300, 'CS150', 1);  
insert into PRUEBAINSCRIPCION(Eid, NombreClase, Posicion) values (400, 'BA200', 2);  
insert into PRUEBAINSCRIPCION(Eid, NombreClase, Posicion) values (400, 'BF410', 1);  
insert into PRUEBAINSCRIPCION(Eid, NombreClase, Posicion) values (450, 'BA200', 3);   

SELECT Especialidad, count(*) FROM PRUEBAESTUDIANTE
	group by Especialidad 
    Having count(*)>1; 
    
SELECT * FROM PRUEBACLASE, PRUEBAINSCRIPCION 
INNER JOIN PRUEBAINSCRIPCION ON Horario = 'M-F9'; 

SELECT distinct PRUEBAINSCRIPCION.Eid, PRUEBAINSCRIPCION.NombreClase, PRUEBAINSCRIPCION.Posicion, PRUEBACLASE.Nombre, PRUEBACLASE.Horario, PRUEBACLASE.Aula
FROM PRUEBAINSCRIPCION
INNER JOIN PRUEBACLASE ON PRUEBAINSCRIPCION.NombreClase = PRUEBACLASE.Nombre WHERE PRUEBACLASE.Horario = 'M-F9';
