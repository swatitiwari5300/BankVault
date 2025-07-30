/*
    Procedure: print_txn_history

    Description:
        Prints the transaction history for a given account ID. The procedure uses a cursor to iterate over
        all transactions associated with the specified account, ordered by transaction date, and outputs
        each transaction's ID, type, amount (in INR), and date using RAISE NOTICE.

    Parameters:
        id (integer) - The account ID for which the transaction history will be printed.

    Usage:
        CALL print_txn_history(<account_id>);

    Notes:
        - The procedure assumes the existence of a 'transactions' table with columns: txn_id, txn_type, amount, txn_date, and account_id.
        - Output is sent to the client as NOTICE messages.
*/
create or replace procedure print_txn_history(id integer)
language plpgsql
as $$
declare 
	txn_cursor cursor for
	select txn_id, txn_type, amount, txn_date from transactions 
	where account_id = id order by txn_date;
	
	v_txn_id transactions.txn_id%TYPE;
	v_txn_type transactions.txn_type%TYPE;
	v_amount transactions.amount%TYPE;
	v_txn_date transactions.txn_date%TYPE;
	
begin
	open txn_cursor;
	loop
	
	fetch txn_cursor into v_txn_id, v_txn_type, v_amount, v_txn_date;
	exit when not found;
	
	raise notice 'Txn ID: %, Type: %, Amount: INR %, Date: %',
                     v_txn_id, v_txn_type, v_amount, v_txn_date;
    end loop;

    close txn_cursor;
end;
$$;
	
-- Calls the stored procedure `print_txn_history` with the argument `1`.
-- This procedure is likely used to print or retrieve the transaction history
-- for the account or entity identified by the ID `1`.
call print_txn_history(1);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	