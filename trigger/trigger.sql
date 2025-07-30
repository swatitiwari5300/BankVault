-- ============================================================================
-- Function: audit_log()
-- Purpose : Trigger function to log actions performed on a table.
--           Inserts a record into the txn_logs table with the type of action
--           (TG_OP: INSERT, UPDATE, DELETE) and the current timestamp.
-- Returns : NEW row for further processing in the trigger context.
-- Usage   : Attach this function to a table trigger to automatically log
--           changes (INSERT, UPDATE, DELETE) to the txn_logs table.
-- ============================================================================
create or replace function audit_log()
returns trigger 
as $$
begin
	insert into txn_logs (action, log_time)
	values (TG_OP, now());
	return new;
end;
$$ language plpgsql;


-- =================================================================================
-- The trigger txn_action is designed to automatically log an audit record every time 
--a new row is inserted into the transactions table. It uses the audit_log() trigger 
--function to capture the event.
-- =============================================================================
create trigger txn_action
after insert on transactions
for each row
execute function audit_log();