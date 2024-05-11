
-- column's naming convention should match with remote table schema
CREATE FOREIGN TABLE remote_table (
    customer_code varchar(50),
    custmer_name varchar(50), 
    customer_type varchar(50)
)
SERVER remote_server
  -- your remote schemas name and table name to be inserted 
OPTIONS (schema_name 'stg', table_name 'customers');

-- after successful data extraction use this statement to fetch foreign table

select * from remote_table;
