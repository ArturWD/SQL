create or replace package SimplePackage as
    function Feb(n integer)
        return integer;
    procedure Split
    (
        strToSplit varchar2, 
        splitCharacter varchar2, 
        leftStr out varchar2, 
        rightStr out varchar2);
    function isPalindrome(str varchar2)
        return boolean; 
end SimplePackage;

create or replace package body SimplePackage as
    function ReverseString(strToReverse varchar2)
    return varchar2
    is
        reversedString varchar2(32000);
    begin
        FOR i in reverse 1..length(strToReverse) LOOP
                reversedString := reversedString||substr(strToReverse, i, 1);
        END LOOP;
        return reversedString;
    end ReverseString;
    function Feb(n integer)
    return integer
    is
    begin
        if n=0 then
            return 0;
        elsif n=1 then
            return 1;
        else
            return Feb(n-1)+Feb(n-2);
        end if;  
    end Feb;
    procedure Split
    (
        strToSplit varchar2, 
        splitCharacter varchar2, 
        leftStr out varchar2, 
        rightStr out varchar2)
    is
        splitIndex integer;
    begin
        splitIndex:= instr(strToSplit, splitCharacter);
        if splitIndex = 0 then
            leftStr:= 'The string does not contain passed split character.';
        else
            leftStr:= substr(strToSplit, 1, splitIndex-1);
            rightStr:= substr(strToSplit,splitIndex+1);
        end if;
        
    end Split;
    function isPalindrome(str varchar2)
    return boolean
    is
    begin
        if lower(replace(str, ' ')) = lower( replace( ReverseString(str), ' ') ) then
            return true;
        end if;
        return false;
    end isPalindrome;
end SimplePackage;

set serveroutput on;
declare
    rightStr varchar2(1000);
    leftStr varchar2(1000);
begin
    dbms_output.put_line('Febonachi for 10 is '||SimplePackage.Feb(10));
    SimplePackage.Split('Amazing split | by character!', '|', leftStr, rightStr);
    dbms_output.put_line('leftStr is '||leftStr);
    dbms_output.put_line('rightStr is '||rightStr);
    
    if SimplePackage.isPalindrome('А роза упала на лапу Азора ') then
        dbms_output.put_line('Palindrome');
    else
        dbms_output.put_line('Not palndrome');
    end if;
end;