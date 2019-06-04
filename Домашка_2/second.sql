set serveroutput on;
/*
�� ������, ����������� � ����������, 
������� ��� �������� ������� � ������� ��������� �� �����.
*/
declare
    string_to_clean$v nvarchar2(50) := 'Hell123o, D222om R097u';
begin
    --������ ������
    --string_to_clean$v:= regexp_replace(string_to_clean$v, '[0-9]');
    --������ ������ (������� �������)
    --3 �������� �� ����� ���� NULL, ������� ��� ����� "a", ������� ���������� �� ���� ����
    string_to_clean$v:= translate(string_to_clean$v, 'a0123456789', 'a');
    dbms_output.put_line('������ ����� ���������:  '|| string_to_clean$v || '!' );
end;