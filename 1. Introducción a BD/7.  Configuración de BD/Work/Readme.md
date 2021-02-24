# Work

## MySQL

#Configuración:
#Elegir MySQL
#Free tier
#Standat create
#Poner identificador
#Cambiar nombre de usuario y colocar contraseña
#Desactivar autoscaling
#Seleccionar acceso público
#En configuración adicional desactivamos los backups automáticos


CREATE DATABASE luis;
#CREATE DATABASE lerma;
#DROP DATABASE lerma; // Para eliminar

CREATE TABLE luis.users2 (
id INT NOT NULL PRIMARY KEY, 
gender VARCHAR(2), 
age  INT, 
occupation INT, 
zipcode VARCHAR (15)
);

#DROP TABLE luis.users;

DESCRIBE luis.users;

#INSERT INTO luis.users2 (id, gender, age, occupation, zipcode) VALUES (1, "F", 25, 9, "01000");

#https://www.convertcsv.com/csv-to-sql.htm
