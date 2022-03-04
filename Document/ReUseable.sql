
select * from stati
select * from BACustomerRegistration where Customer_Name like '%MUGHAL STEEL%'


select * from GenerateOrder
select * from Logistics
select * from ReadyForDispatched
select * from predispatchedmovement
select * from DispatchedOrder
select * from IntransactTrain
select * from ReDispatched
select * from DeliveryTrain
select * from EmptyDropOff
 update Logistics set status='ReDispatched', PreDispatched=1
truncate table EmptyDropOff

drop table ReDispatched
GO

Create table EmptyDropOff(
ID [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
[OrderId] [int] NOT NULL,
[OrderNo] [varchar](9) NOT NULL,
[ContainerNo] [nvarchar](250) NOT NULL,
[ContainerSize] [nvarchar](250) NOT NULL,
[BLnumber] [nvarchar](250) NULL,


ShippingLineName nvarchar(250),
EIRNo nvarchar(250),
ExpenseAtEmptyLocation numeric(18, 0),
Remarks nvarchar(100), 
DeliveryDate datetime, 
 

IsCompleted bit default(0),
[CreatedBy] [nvarchar](250) NULL,
[CreateDate] datetime NULL,
[UpdatedBy] [nvarchar](250) NULL,
[UpdateDate] datetime NULL,
[IsDeleted] bit DEFAULT(0),
)