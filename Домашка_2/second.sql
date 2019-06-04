set serveroutput on;
/*
Из строки, сохраненной в переменной, 
удалить все цифровые символы и вывести результат на экран.
*/
declare
    string_to_clean$v nvarchar2(50) := 'Hell123o, D222om R097u';
begin
    --первый способ
    --string_to_clean$v:= regexp_replace(string_to_clean$v, '[0-9]');
    --второй способ (быстрее первого)
    --3 аргумент не может быть NULL, поэтому там стоит "a", которая заменяется на саму себя
    string_to_clean$v:= translate(string_to_clean$v, 'a0123456789', 'a');
    dbms_output.put_line('Строка после обработки:  '|| string_to_clean$v || '!' );
end;