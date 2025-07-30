-- Table: accounts
-- Description: Stores information about bank accounts.
-- Columns:
--   account_id     - Unique identifier for each account (Primary Key, auto-incremented).
--   customer_name  - Name of the account holder.
--   balance        - Current balance of the account.
--   created_at     - Timestamp when the account was created.
create table accounts (
	account_id serial primary key,
	customer_name varchar,
	balance float8,
	created_at timestamp
);

-- ============================================================
-- Table: transactions
-- Description: Stores transaction records for bank accounts.
-- Columns:
--   txn_id      : Unique identifier for each transaction (Primary Key).
--   account_id  : References the account associated with the transaction (Foreign Key to accounts table).
--   txn_type    : Type of transaction (e.g., deposit, withdrawal).
--   amount      : Amount involved in the transaction.
--   txn_date    : Date when the transaction occurred.
-- ============================================================
create table transactions(
	txn_id serial primary key,
	account_id integer,
	txn_type varchar,
	amount float8,
	txn_date date,
	FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

-- Table: txn_logs
-- Description: Stores transaction log entries, recording actions performed and their timestamps.
-- Columns:
--   log_id   : serial, Primary Key. Unique identifier for each log entry.
--   action   : varchar. Description of the action performed.
--   log_time : timestamp. The date and time when the action was logged.
create table txn_logs(
	log_id serial primary key,
	action varchar,
	log_time timestamp
);


