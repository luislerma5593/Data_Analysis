# Work

## MySQL

- Configuración:
- Elegir MySQL
- Free tier
- Standat create
- Poner identificador
- Cambiar nombre de usuario y colocar contraseña
- Desactivar autoscaling
- Seleccionar acceso público
- En configuración adicional desactivamos los backups automáticos

```sql
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
```

https://www.convertcsv.com/csv-to-sql.htm

### Pasos para crear una base de datos

- Crear una cuenta de AWS.

- Seleccionar Soporte de nivel Basic (Gratis).

- Abrir RDS en los productos (Servicios para BD relacionales).

- Seleccionar SGBD.

- Deshabilitar “Enable Storage Autoscaling”.

- Habilitar el acceso público.

- Deshabilitar “Enable Automatic Backups”.

- Deshabilitar “Deletion Protection”.

- Ir a “Security” y “Editar reglas de entrada”.

- Seleccionar “Cualquier lugar”.

- Se puede importar el CSV, o abrir un script creado con https://www.convertcsv.com/csv-to-sql.htm

## Mongo DB

Se crea el servidor en Mongo DB Atlas: https://www.mongodb.com/cloud/atlas/lp/try2?utm_source=google&utm_campaign=gs_americas_mexico_search_core_brand_atlas_desktop&utm_term=mongo%20atlas&utm_medium=cpc_paid_search&utm_ad=e&utm_ad_campaign_id=12212624326&gclid=Cj0KCQiA7NKBBhDBARIsAHbXCB79hBGcTDaRhJ6dujp6wq5lIe6eMCbiawX6Dhv2bavIFjnbac-r234aAsv6EALw_wcB

1. Security > Database Access -> Create User
2. Security > Network Access -> Anywhere
3. Connect > Connect using MongoDB Compass
4. Copiar el string de conexión



Una vez que se está en el software,

- Crear Database
- Crear colección 
- Import Data


