a. Get all the details from the person table including email ID, phone
number and phone number type. 

select p.firstname, p.lastname,e.emailaddress,n.phonenumber,t.name 
from person.person p join 
person.emailaddress e 
on p.businessentityid = e.BusinessEntityID 
join person.personphone n 
on e.businessentityid = n.businessentityid 
join person.phonenumbertype t 
on n.phonenumbertypeid = t.phonenumbertypeid;

select * from person.emailaddress;
select * from person.personphone
select * from person.phonenumbertype;

b. Get the details of the sales header order made in May 2011

select * from sales.salesorderheadersalesreason;
select * from sales.salesorderheader;

select * from sales.salesorderheader
where OrderDate between  '2011-05-01' and '2011-06-01';

select * from sales.salesorderheader
where month(OrderDate) = 5 and year(OrderDate)=2011;


c. Get the details of the sales details order made in the month of May
2011

select * from sales.SalesOrderDetail o
join sales.salesorderheader h
on h.SalesOrderID=o.SalesOrderID
where OrderDate between '2011-05-01 00:00:00:000' and '2011-06-01 00:00:00:000';


d. Get the total sales made in May 2011

select sum(TotalDue) as TotalSales 
from sales.SalesOrderHeader h
where month(OrderDate)= 5 and year(OrderDate)=2011;

e. Get the total sales made in the year 2011 by month order by
increasing sales

select sum(TotalDue) as TotalSales, month(OrderDate) as month
from sales.SalesOrderHeader 
where year(OrderDate)=2011
group by month(OrderDate)
order by sum(TotalDue) desc;

f. Get the total sales made to the customer with FirstName='Gustavo'
and LastName ='Achong'

select sum(Totaldue) as TotalSales from sales.SalesOrderHeader h
join sales.Customer c
on h.CustomerID=c.CustomerID
join person.person p 
on p.BusinessEntityID=c.PersonID
where p.FirstName ='Gustavo' and p.LastName='achong';


