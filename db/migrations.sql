CREATE DATABASE shopping;
\c shopping;
CREATE TABLE items (id SERIAL PRIMARY KEY, name VARCHAR(255), quantity INTEGER);
