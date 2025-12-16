CREATE TABLE VEHICLERENT (
   VEHICLE_ID NUMBER(8,0) PRIMARY KEY,
   MANUFACTURER VARCHAR2(75) NOT NULL,
   MODELNAME VARCHAR2(20),
   TYPE VARCHAR2(10),
   RENT_DATE DATE,
   RETURN_DATE DATE
);

INSERT INTO VEHICLERENT VALUES(1, 'Honda', 'City', 'Car',TO_DATE('2018-02-20','YYYY-MM-DD'), TO_DATE('2018-02-23','YYYY-MM-DD'));
INSERT INTO VEHICLERENT VALUES(2, 'Hyundai', 'i20', 'Car',TO_DATE('2018-03-10','YYYY-MM-DD'), TO_DATE('2018-03-13','YYYY-MM-DD'));
select * from VEHICLERENT

create or replace procedure calculaterent_pr(vehicleid in number)
is
rent_duration number;
rentamount number;
begin
select (return_date-rent_date) into rent_duration
from VEHICLERENT
where vehicle_id=vehicleid;
rentamount:=rent_duration*50;
end;

declare
rentamount number;
begin
 calculaterent_pr(2);
 dbms_output.put_line('rent='||rentamount);
 end;

execute calculaterent_pr(1)
select * from hr.employees
select country_id,count(country_id) from countries
group by country_id

create or replace procedure hremp_pr(departmentid in number)
is
hremp hr.employees%rowtype;
begin
loop
select * into hremp
from hr.employees
where department_id=departmentid;
dbms_output.put_line(hremp.salary||':'||hremp.hire_date||';'||hremp.employee_id);
end loop;
end;

declare
salary number;
employeeid number;
hiredate date;
begin
hremp_pr(90,salary,employeeid,hiredate);
end;

create or replace procedure count_loc_pr(countryid in char)
is
cursor count_loc_cr is
select c.country_id,c.country_name,l.city,l.postal_code from countries c,locations l
where c.country_id=l.country_id and c.country_id=countryid;
r_count_loc count_loc_cr%rowtype;
begin
open count_loc_cr;
loop
fetch count_loc_cr into r_count_loc ;
exit when count_loc_cr%notfound;
dbms_output.put_line(r_count_loc.country_name||','||r_count_loc.postal_code||','||r_count_loc.city);
end loop;
close count_loc_cr;
end;

execute count_loc_pr('UK');

declare
countryname varchar2(40);
city varchar2(40);
postalcode varchar2(40);
begin
count_loc_pr('US',countryname,city,postalcode);
dbms_output.put_line(countryname||':'||city||':'||postalcode);
end;


declare 
cursor count_loc_cr is
select c.country_id,country_name,city,postal_code from countries c,locations l
where c.country_id=l.country_id and l.country_id='&t';
r_count_loc count_loc_cr%rowtype;
begin
open count_loc_cr;
loop
fetch count_loc_cr into r_count_loc ;
exit when count_loc_cr%notfound;
dbms_output.put_line(r_count_loc.country_id||':'||r_count_loc.city);
end loop;
close count_loc_cr;
end;


CREATE OR REPLACE procedure get_total_sales_pr(
    in_year PLS_INTEGER,total_sales out number
) 
IS
    l_total_sales NUMBER := 0;
BEGIN
    -- get total sales
    SELECT SUM(unit_price * quantity)
    INTO l_total_sales
    FROM order_items
    INNER JOIN orders USING (order_id)
    WHERE status = 'Shipped'
    GROUP BY EXTRACT(YEAR FROM order_date)
    HAVING EXTRACT(YEAR FROM order_date) = in_year;
    total_sales:=l_total_sales;
    -- return the total sales
END;

set serverout on 
declare
total_sales number;
begin 
get_total_sales_pr(2017,total_sales);
dbms_output.put_line(total_sales);
end;


create or replace procedure country_loc_pr(countryid in countries.country_id%type,country_loc_cr out sys_refcursor)
is
begin
open country_loc_cr for
select country_id,region_id from countries 
where country_id=countryid;
end;

declare 
country_loc_cr sys_refcursor;
countryname  countries.country_name%type;
regionid countries.region_id%type;
begin
country_loc_pr('US',country_loc_cr);
loop
fetch country_loc_cr into
countryname,
regionid;
exit when country_loc_cr%notfound;
dbms_output.put_line(countryname||';'||regionid);
end loop;
close country_loc_cr;
end;


execute country_loc_pr('UK')

create or replace procedure updt_pr(employeeid in employees.employee_id%type)
is
begin
update employees
set first_name='Mayur'
where employee_id=employeeid;
if sql%rowcount>0 then
dbms_output.put_line(sql%rowcount);
else 
dbms_output.put_line('no record found');
end if;
end;

exec updt_pr(107);