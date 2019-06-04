set serveroutput on;
/*
ƒл€ сохраненных в переменных координат x и y вывести, 
принадлежит ли точка закрашенной фигуре 
(при смене значений x и y, результат должен оставатьс€ корректным):
*/
declare
    x$n number(5,3) := -0.57;
    y$n x$n%TYPE := 0.57;
begin
    if x$n**2 + y$n**2 <= 1 and (x$n<=0 or y$n>=x$n) then
        dbms_output.put_line('“очка X= ' || x$n ||';Y= '|| y$n ||' принадлежит области' );
    else
        dbms_output.put_line('“очка X= ' || x$n ||';Y= '|| y$n ||' не принадлежит области' );
    end if;
    
end;