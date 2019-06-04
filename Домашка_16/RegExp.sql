select *
from locations
where regexp_like(street_address, '^[^0-9]');

select *
from locations
where regexp_like(street_address, '[A-Z|a-z]{10, }');

select regexp_replace(phone_number, '([0-9]{3})(\.)([0-9]{3})', '\3.\1') from employees;