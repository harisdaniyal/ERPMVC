select * from stp_BusinessDivision
select * from ShippingAgent

select * from BACustomerRegistration
select * from ImportBooking
select * from GenerateOrder
insert into GenerateOrder 
select (select Format(max(orderno)+1,'000000') from GenerateOrder), cus.CustomerID, 20007,'Import',b.[BL Number],
b.CRO, null,null, b.orderdate,null,null,null,b.InvoiceAmount,1,sa.ShippingAgentId, left(b.FreeDays,2), null,b.VesselBerthingDate, sl.ShippingLineId,
b.BookingPOCName
from ImportBooking b 
left join BACustomerRegistration cus on cus.Customer_Name = b.CustomerName
left join ShippingAgent sa on sa.name = b.ShippingAgentName
left join ShippingLine sl on sl.ShippingLineName = b.ShippingLineName


--BACustomerRegistration
select * from BACustomerRegistration where  Customer_Name in (select distinct CustomerName from ImportBooking)
insert into BACustomerRegistration (Customer_Name) 
select distinct CustomerName from ImportBooking
--ShippingAgent
select * from ShippingAgent where name in (select distinct ShippingAgentName from ImportBooking )
insert into ShippingAgent (name, Line, IsDeleted) 
select distinct ShippingAgentName, ShippingAgentName, 0 from ImportBooking

select * from ShippingLine where ShippingLineName in (select distinct ShippingLineName from ImportBooking )
insert into ShippingLine 
select distinct ShippingLineName,ShippingLineName,null, '0001-01-01 00:00:00.0000000', 0 from ImportBooking
where ShippingLineName  not in (select distinct ShippingLineName from ShippingLine )