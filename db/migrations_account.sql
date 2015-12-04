CREATE DATABASE shopping_account;
\c shopping_account;
CREATE TABLE accounts (id SERIAL PRIMARY KEY, user_name VARCHAR(255), user_email VARCHAR(255), password_digest VARCHAR(255), is_admin BOOLEAN);
\dt;
-- SELECT * FROM accounts;
