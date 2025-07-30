create or replace procedure open_account(customer_name varchar, balance float8)
language plpgsql as $$
begin
	insert into accounts(customer_name, balance, created_at)
	values(customer_name, balance, now());
end;
$$;

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

call open_account('swati', 899.0);
call deposit(1, 400);
call withdraw(1, 400);

