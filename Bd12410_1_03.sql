use information_schema;
select database();
show tables;

show tables from sys;

use sys;
show columns
from information_schema.tables;

-- comentario 
select * from information_schema.tables;

select table_schema, table_name, 
table_rows 
from information_schema.tables
where
table_schema = 'patito23';




