--Cartesian product เชื่อมโยงที่คำสั่ง where
--แสดงชื่อประเภทสินค้า: ชื่อสินค้าและราคา
select CategoryName,ProductName,UnitPrice 
from Products,Categories 
where Products.CategoryID=Categories.CategoryID 
--เขียนแบบ join
select CategoryName,ProductName,UnitPrice 
from Products join Categories 
on Products.CategoryID=Categories.CategoryID
--ตัวย่อ
select CategoryName,ProductName,UnitPrice 
from Products as P join Categories as C 
on P.CategoryID=C.CategoryID
--จงแสดงข้อมูลหมายเลขใบสั่งซื้อและชื่อบริษัทขนส่งสินค้า
--Cartesian Product
select CompanyName,OrderID 
from Orders,Shippers 
where Shippers.ShipperID = Orders.ShipVia
--Join Operator
select CompanyName,OrderID 
from Orders join Shippers 
on Shippers.ShipperID = Orders.ShipVia
--ต้องการรหัสสินค้า ชื่อสินค้า บริษัทผู้จำหน่าย ประเทศ
select p.ProductID,p.ProductName,s.CompanyName,s.CompanyName 
from Products p join Suppliers s 
on p.SupplierID = s.SupplierID
select p.ProductID,p.ProductName,s.CompanyName,s.CompanyName 
from Products p, Suppliers s 
where p.SupplierID = s.SupplierID
--จงแสดงข้อมูลหมายเลขใบวั่งซื้อและชื่อบริษัทขนส่งสินค้าของใบสั่งซื้อหมายเลข 10275
--Cartesian Product
select CompanyName,OrderID from Orders,Shippers where shi
