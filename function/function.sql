/*
 * Function: get_balance
 * ---------------------
 * Retrieves the balance for a given account ID from the accounts table.
 *
 * Parameters:
 *   id (integer) - The unique identifier of the account.
 *
 * Returns:
 *   float8 - The balance associated with the specified account ID.
 *
 * Usage:
 *   SELECT get_balance(123);
 *
 * Notes:
 *   - Returns NULL if the account ID does not exist in the accounts table.
 *   - Assumes the accounts table has columns: account_id (integer), balance (float8).
 */
create or replace function get_balance(id integer)
returns float8 language plpgsql
as $$
declare
	amount float8;
begin
	select balance into amount from accounts where account_id = id;
	return amount;
end;
$$;

-- This anonymous PL/pgSQL block retrieves the balance for the account with ID 1
-- by calling the get_balance function, and then outputs the balance using a NOTICE.
-- Variables:
--   balance: integer variable to store the retrieved account balance.
-- Usage:
--   Useful for debugging or verifying the balance of a specific account.
do $$
declare
	balance integer;
begin
	balance := get_balance(1);
	raise notice 'balance: %', balance;
end;
$$;
	
