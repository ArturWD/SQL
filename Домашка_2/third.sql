set serveroutput on;
/*
��� ����������� � ���������� ��������� x � y �������, 
����������� �� ����� ����������� ������ 
(��� ����� �������� x � y, ��������� ������ ���������� ����������):
*/
declare
    x$n number(5,3) := -0.57;
    y$n x$n%TYPE := 0.57;
begin
    if x$n**2 + y$n**2 <= 1 and (x$n<=0 or y$n>=x$n) then
        dbms_output.put_line('����� X= ' || x$n ||';Y= '|| y$n ||' ����������� �������' );
    else
        dbms_output.put_line('����� X= ' || x$n ||';Y= '|| y$n ||' �� ����������� �������' );
    end if;
    
end;