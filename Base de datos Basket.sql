-- Codigo para crear base de datos 
CREATE DATABASE postgres
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Spanish_Ecuador.1252'
       LC_CTYPE = 'Spanish_Ecuador.1252'
       CONNECTION LIMIT = -1;
-- Codigo para crear una tabla 
create sequence jugador_sec;
create table jugador(
    idjugador int
    default nextval('jugador_sec') primary key,
    nombre varchar(50),
    apellido varchar(50),
    estatura int,
    fecha_de_nacimiento date,
    equipo varchar(50)
);
-- Codigo para insertar valores en la tabla creada
INSERT INTO jugador(
            nombre, apellido, estatura, fecha_de_nacimiento, equipo)
    VALUES ('Paul', 'Jhonson', 2.02, '1992/10/03', 'Bulls'),
    ('Javier', 'Thompson', 1.93, '1989/07/30', 'Celtics'),
    ('Matias', 'Smith', 2.13, '1995/02/16', 'Cavaliers'),
    ('Joel', 'Miller', 1.98, '1991/06/24', 'Spurs'),
    ('Manu', 'Ginobili', 1.98, '1990/09/30', 'Miami heat');
-- Codigo para eliminar una columna sin alterar el contenido de la tabla
    ALTER TABLE jugador DROP COLUMN equipo
-- Codigo para añadir una columna a la tabla con datos obligatorios
ALTER TABLE jugador ADD COLUMN Tipo_de_sangre   character varying (20) NOT NULL;
    
