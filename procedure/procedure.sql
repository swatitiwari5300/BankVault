-- ============================================================================
-- Procedure: open_account
-- Description: 
--   Creates a new account record in the 'accounts' table with the provided 
--   customer name and initial balance. The current timestamp is recorded as 
--   the account creation time.
--
-- Parameters:
--   customer_name (varchar) - The name of the customer opening the account.
--   balance (float8)        - The initial balance to be set for the account.
--
-- Usage:
--   CALL open_account('John Doe', 1000.00);
--
-- Notes:
--   - Assumes the 'accounts' table has columns: customer_name, balance, created_at.
--   - The 'created_at' field is automatically set to the current timestamp.
-- ============================================================================
create or replace procedure open_account(customer_name varchar, balance float8)
language plpgsql as $$
begin
	insert into accounts(customer_name, balance, created_at)
	values(customer_name, balance, now());
end;
$$;

/*
    Procedure: deposit

    Description:
        Adds a specified amount to the balance of an account and records the transaction.
        If the account does not exist, raises an exception.

    Parameters:
        id (integer)      - The unique identifier of the account to deposit into.
        amount (float8)   - The amount of money to deposit.

    Behavior:
        - Updates the 'accounts' table by increasing the balance of the specified account.
        - Inserts a record into the 'transactions' table to log the deposit.
        - Raises an exception if no account with the given id exists.
*/
create or replace procedure deposit(id integer, amount float8)
language plpgsql as $$
begin
	update accounts set balance = balance+amount where account_id = id;
	insert into transactions(account_id, txn_type, amount, txn_date)
	values (id, 'DEPOSIT', amount, current_date);
	
	IF NOT FOUND THEN
        RAISE EXCEPTION 'No account exists for account_id = %', id;
	end if;
end;
$$;

/*
    Procedure: withdraw

    Description:
        Deducts a specified amount from the balance of an account identified by its ID.
        Records the withdrawal as a transaction in the transactions table.
        Raises an exception if the account does not exist.

    Parameters:
        id (integer)      - The unique identifier of the account.
        amount (float8)   - The amount to withdraw from the account.

    Behavior:
        - Updates the balance of the specified account by subtracting the withdrawal amount.
        - Inserts a record into the transactions table with the withdrawal details.
        - If no account matches the provided ID, raises an exception indicating the account does not exist.
*/
create or replace procedure withdraw(id integer, amount float8)
language plpgsql as $$
begin
	update accounts set balance = balance-amount where account_id = id;
	insert into transactions(account_id, txn_type, amount, txn_date)
	values (id, 'WITHDRAWAL', amount, current_date);
	
	IF NOT FOUND THEN
        RAISE EXCEPTION 'No account exists for account_id = %', id;
	end if;
end;
$$;

-- This script demonstrates the usage of stored procedures for basic banking operations:
-- 1. open_account: Opens a new account for the user 'swati' with an initial deposit of 899.0.
-- 2. deposit: Deposits an amount of 400 into account with ID 1.
-- 3. withdraw: Withdraws an amount of 400 from account with ID 1.
call open_account('swati', 899.0);
call deposit(1, 400);
call withdraw(1, 400);

