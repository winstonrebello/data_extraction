-- To create server and store host,port and dbname
CREATE SERVER remote_server
    FOREIGN DATA WRAPPER postgres_fdw
    OPTIONS (host (
                   SELECT host_name 
                   FROM dim.encrypted_connections 
                   WHERE id = 2
                ), 
             port (
                   SELECT port_no 
                   FROM dim.encrypted_connections 
                   WHERE id = 2
                ), 
             dbname (
                   SELECT db_name 
                   FROM dim.encrypted_connections 
                   WHERE id = 2
                )
            );

-- To create mapping which contain username and password
CREATE USER MAPPING FOR postgres
    SERVER remote_server
    OPTIONS (user (
                   SELECT username 
                   FROM dim.encrypted_connections 
                   WHERE id = 2
                ), password (
                   SELECT pgp_sym_decrypt(password, 'your_secret_key') 
                   FROM dim.encrypted_connections 
                   WHERE id = 2
                )
            );
