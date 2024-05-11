# Data Extraction
1. To extract data from external database, in this scenario we are using the PostgreSQL native postgres_fdw extension to access data stored in PostgreSQL DB instances external to your RDS for PostgreSQL DB instance.
2. We are using foreign data wrapper (FDW), it allows you to access and interact with external data sources in database management systems.
-----------------------------------------------------------------------------------------------------------------------------------------------
# Requirements
(Execute this script's  to install extension.)

CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE EXTENSION postgres_fdw;

-----------------------------------------------------------------------------------------------------------------------------------------------
# Setup
Step-by-step process for any installations, configurations, or initializations necessary to run the project.

1. Creating the Configuration Table
We start by creating a table to store the connection details of the external database.
![image](https://github.com/winstonrebello/data_extraction/assets/63299212/6fb0c98b-abfc-45f1-bf55-30de93ead055)

    To insert data in created table.

![image](https://github.com/winstonrebello/data_extraction/assets/63299212/f1a04394-e421-40fd-bc42-4619f5857c6e)

2. Setting up the Foreign Data Wrapper
Next, we create a server using PostgreSQL Foreign Data Wrapper (postgres_fdw). This allows us to connect to the external database.

![image](https://github.com/winstonrebello/data_extraction/assets/63299212/654db57c-dc14-43e1-9eb9-40489303069f)

4. Creating User Mapping
We create a user mapping to map the local PostgreSQL user to a user on the external server.
![image](https://github.com/winstonrebello/data_extraction/assets/63299212/24e6a4e5-3f83-4552-8399-3e536f99c167)

5. Creating Foreign Table
Finally, we create a foreign table that represents a table on the external database.
![image](https://github.com/winstonrebello/data_extraction/assets/63299212/653712e9-7f59-4c50-ab74-afc1645efb39)

-----------------------------------------------------------------------------------------------------------------------------------------------

# Usage

We can now query data can use select/update/delete statements from the external database as if it were a local table.
Join operatores can be used in  the local and external databases to perform more complex analyses.
