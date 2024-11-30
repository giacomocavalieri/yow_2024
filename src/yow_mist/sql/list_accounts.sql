-- return all accounts that joined
-- in a 1 month window before a given
-- date.
select
    account.display_name,
    account.link,
    account.handle
from
    account
