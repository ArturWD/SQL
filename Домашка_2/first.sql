set serveroutput on;
/*
��� ����� �� 1 �� 30: ������� ��� �����, ��������� ������ �� 3, 
��� ���� ������ ����� ������������� �������� �� �-1�
*/
begin
    for i in 1..30 loop
        if i mod 3 = 0 and i mod 2 =0 then  
            dbms_output.put_line(i * -1);
        elsif i mod 3 = 0 then
            dbms_output.put_line(i);
        end if;
    end loop;
end;