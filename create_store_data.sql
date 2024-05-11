CREATE TABLE dim.encrypted_connections (
    id SERIAL PRIMARY KEY,
    host_name TEXT,
    port_no TEXT,
    db_name TEXT,
    username TEXT,
    password BYTEA --encrypted password as BYTEA
);

-- Encrypt and store the password
INSERT INTO dim.encrypted_connections (host_name, port_no, db_name, username, password)
VALUES ('localhost','5444','postgres','postgres', pgp_sym_encrypt('passowrd', 'your_secret_key'));

-- Decrypt and retrieve connection information
SELECT *,
pgp_sym_decrypt(password, 'your_secret_key') AS password
FROM dim.encrypted_connections;
