---------------------------------Booking
select * from stp_BusinessDivision
select * from ShippingAgent
select * from BACustomerRegistration
select * from ImportBooking
select * from GenerateOrder
select * from Logistics where PreDispatched=1
update Logistics set ModeOfTransportation='Train'
update GenerateOrder set OrderNo=(select Format(max(orderno)+1,'000000'))
delete from Logistics where logisticsid< 20198

insert into GenerateOrder 
select (select Format(max(orderno)+1,'000000') from GenerateOrder), cus.CustomerID, 20007,'Import',b.[BL Number],
b.CRO, null,null, b.orderdate,null,null,1,b.InvoiceAmount,1,sa.ShippingAgentId, left(b.FreeDays,2), null,b.VesselBerthingDate, sl.ShippingLineId,
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
--ShippingLine
select * from ShippingLine where ShippingLineName in (select distinct ShippingLineName from ImportBooking)

insert into ShippingLine 
select distinct ShippingLineName,ShippingLineName,null, '0001-01-01 00:00:00.0000000', 0 from ImportBooking
where ShippingLineName  not in (select distinct ShippingLineName from ShippingLine )

---------------------------------Logistic
select distinct EmptyReturnLocation from ImportLogistic
select * from location
select * from Logistics
select * from ImportLogistic
 insert into location values ('SAPT',1,0)
  insert into location values ('AHMED CONTAINER TERMINAL TPX',1,0)
update ImportLogistic set EmptyReturnLocation='LAHORE' where EmptyReturnLocation like '%PICT / PMS / TRY TO DROP OFF AT LAHORE%'
select * from stp_City where CityName in (select distinct FromLocation from ImportLogistic)
select * from ContainerTypes
select * from PortAndTerminal where PortName='FRIENDS YARD PICT'

insert into Logistics
select o.OrderID, log.FromLocation, log.ToLocation,null,null,1,log.CreatedDate, log.JobType, log.ContainerNo,
null,null,log.ContainerSize, log.ContainerWeight,null,null,null,1,log.EmptyReturnLocation, log.EmptyReturnDate,
'PreDispatched', log.ModeOfTransportation, (case when log.PreDispatched = 'YES' then 1 else 0 end), log.Comodities
from ImportLogistic log
inner join GenerateOrder o on o.BL = log.[BL Number]
inner join location l on l.locationname = log.FromLocation


--------------------ReadyForDispatched
select * from ReadyForDispatched
select * from ImportReadyForDispatched

insert into ReadyForDispatched
select  o.OrderID,o.OrderNo, rfd.ContainerNo,  log.ContainerSize, rfd.[BL Number], rfd.DOGranty,
rfd.ImportEIR, rfd.PortWeighment, rfd.OutSidePortWeighment, rfd.GD, rfd.BL, 1, null,null,null,null
from ImportReadyForDispatched rfd
inner join GenerateOrder o on o.BL = rfd.[BL Number]
inner join Logistics log on log.ContainerNo = rfd.ContainerNo
inner join location l on l.locationname = log.FromLocation

--------------------PreDispatched
select * from Logistics where PreDispatched=1
select * from PreDispatchedMovement
select * from ImportPreDispatched

insert into PreDispatchedMove	ment 
select  o.OrderID,o.OrderNo, pd.ContainerNo,  log.ContainerSize, pd.[BL Number], pd.FromLocation, pd.FromDateTime, 
pd.ToLocation, pd.ToDateTime, pd.TransporterName, pd.VehicleNumber, 1, null,null,null,null
from ImportPreDispatched pd
inner join GenerateOrder o on o.BL = pd.[BL Number]
inner join Logistics log on log.ContainerNo = pd.ContainerNo