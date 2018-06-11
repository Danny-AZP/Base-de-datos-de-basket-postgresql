-- Codigo para crear base de datos 
CREATE DATABASE basket
  WITH OWNER = "Danny"
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'Spanish_Ecuador.1252'
       LC_CTYPE = 'Spanish_Ecuador.1252'
       CONNECTION LIMIT = -1;

-- Codigo para crear una tabla 
create sequence jugador_sec;
create table jugador(
    idjugador int default nextval('jugador_sec') primary key,
    nombre varchar(50),
    apellido varchar(50),
    fechaNacimiento date,
    nacionalidad character varying(50)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE jugador OWNER TO "Danny";
-- Codigo para insertar valores en la tabla creada
INSERT INTO jugador(
            nombre, apellido, fechaNacimiento, nacionalidad)
    VALUES ('Paul', 'Jhonson', '1992/10/03', 'Estadounidense'),
    ('Javier', 'Thompson', '1989/07/30', 'Canadiense'),
    ('Matias', 'Smith', '1995/02/16', 'Estadounidense'),
    ('Joel', 'Miller', '1991/06/24', 'Mexicano'),
    ('Manu', 'Ginobili', '1990/09/30', 'Canadiense'),
--creando la otra tabla
create sequence equipo_sec;
CREATE TABLE equipo
(
  idequipo integer NOT NULL DEFAULT nextval('equipo_sec'),
  nombre varchar(50),
  CONSTRAINT equipo_pkey PRIMARY KEY (idequipo)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE equipo OWNER TO "Danny";
-- insertar datos dentro de la segunda tabla
INSERT INTO equipo(
            nombre)
    VALUES ('Spurs'),
    ('Celtics'),
    ('Cavaliers'),
    ('Golden State Warriors'),
    ('Chicago bulls'),
    ('Los Angeles Lakers'),
    ('Miami heat'),
    ('Knicks');
    --como designar la llave foranea y con la accion de que cuando borre se ejecute en cascada
    ALTER TABLE jugador ADD FOREIGN KEY (idequipo) REFERENCES equipo (idequipo) ON UPDATE NO ACTION ON DELETE CASCADE;

-- Codigo para eliminar una columna sin alterar el contenido de la tabla
    -- ALTER TABLE jugador DROP COLUMN equipo
-- Codigo para añadir una columna a la tabla con datos obligatorios
-- ALTER TABLE jugador ADD COLUMN Tipo_de_sangre   character varying (20) NOT NULL;
    --codigo luego de haber designado la foreignkey
CREATE TABLE jugador
(
  idjugador integer NOT NULL DEFAULT nextval('jugador_sec'::regclass),
  nombre character varying(50),
  apellido character varying(50),
  fechanacimiento date,
  nacionalidad character varying(50),
  idequipo integer,
  CONSTRAINT jugador_pkey PRIMARY KEY (idjugador),
  CONSTRAINT jugador_idequipo_fkey FOREIGN KEY (idequipo)
      REFERENCES equipo (idequipo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE jugador OWNER TO "Danny";
--codigo para insertar el id del equipo con el jugador
UPDATE jugador
   SET idequipo=3
 WHERE idjugador=1;
--codigo para consultar el nombre del jugador y el equipo en el que esta con un inner join
select j.nombre, eq.nombre from jugador j
inner join equipo eq on eq.idequipo=j.idequipo
