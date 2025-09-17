use zoom;


delimiter //
create function addition(a int, b int)
return int
delimiterstic
begin
return(a-b)
end;
delimiter ;
select addition (2,4) as sum
