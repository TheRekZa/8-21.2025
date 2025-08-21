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
select CompanyName,OrderID 
from Orders,Shippers 
where Shippers.ShipperID = Orders.ShipVia 
and OrderID = 10275
--join Operator
select CompanyName,OrderID 
from Orders join Shippers 
on Shippers.ShipperID = Orders.ShipVia 
where OrderID = 10275
--ต้องการรหัสพนักงาน ชื่อพนักงาน รหัสใบสี่งซื้อที่เกี่ยวข้อง เรียงตามลำดับรหัสพนักงาน
select e.EmployeeID,FirstName,OrderID 
from Employees as e join Orders as o on e.EmployeeID = o.EmployeeID
order by EmployeeID
--ต้องการรหัสสินค้า เมือง แสดงประเทศของบริษัทผู้จำหน่าย
select ProductID,ProductName,City,Country 
from Products p join Suppliers s 
on p.SupplierID = s.SupplierID
--ต้องการชื่อบริษัทขนส่ง และจำนวนใบสั่งซื้อที่เกี่ยวข้อง
select CompanyName,COUNT(*) 
from Orders o join Suppliers s 
on o.ShipVia = s.SupplierID
group by CompanyName
--ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขายได้
select p.ProductID,p.ProductName,sum(Quantity) as จำนวนที่ขายได้ทั้งหมด
from Products p join [Order Details] od 
on p.ProductID = od.ProductID
group by p.ProductID,p.ProductName
order by 1
