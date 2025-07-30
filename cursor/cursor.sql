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
	
call print_txn_history(1);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	