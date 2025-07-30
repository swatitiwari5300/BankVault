create or replace function audit_log()
returns trigger 
as $$
begin
	insert into txn_logs (action, log_time)
	values (TG_OP, now());
	return new;
end;
$$ language plpgsql;

create trigger txn_action
after insert on transactions
for each row
execute function audit_log();