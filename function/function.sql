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

do $$
declare
	balance integer;
begin
	balance := get_balance(1);
	raise notice 'balance: %', balance;
end;
$$;
	
