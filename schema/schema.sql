create table accounts (
	account_id serial primary key,
	customer_name varchar,
	balance float8,
	created_at timestamp
);

create table transactions(
	txn_id serial primary key,
	account_id integer,
	txn_type varchar,
	amount float8,
	txn_date date,
	FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

create table txn_logs(
	log_id serial primary key,
	action varchar,
	log_time timestamp
);


