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
--จงแสดงหมายเลขใบสั่งซื้อ,ชื่อบริษัทลูกค้า,สถานที่ส่งของ,และพนักงานผู้ดูแล
--Cartesian Product
select o.OrderID เลขใบสั่งซื้อ,c.CompanyName ลูกค้า,e.FirstName พนักงาน,o.ShipAddress ส่งไปที่ 
from Orders o,Customers c,Employees e 
where o.CustomerID=c.CustomerID and o.EmployeeID=e.EmployeeID
--join operetor
select o.OrderID เลขใบสั่งซื้อ,c.CompanyName ลูกค้า,e.FirstName พนักงาน,o.ShipAddress ส่งไปที่ 
from Orders o join Customers c on o.CustomerID=c.CustomerID join Employees e on o.EmployeeID=e.EmployeeID
--ต้องการ รหัสพนักงาน ชื่อพนักงาน จ านวนใบสั่งซื้อที่เกี่ยวข้อง ผลรวมของค่าขนส่งในปี 1998
select e.EmployeeID,FirstName,COUNT(*) as [จำนวน order],sum(Freight) as [Sum of Freight] 
from Employees e join Orders o on e.EmployeeID = o.EmployeeID
where year(OrderDate) = 1998
group by e.EmployeeID,FirstName
--ต้องการรหัสสินค้าชื่อสินค้าที่ nancy ขายได้ทั้งหมดเรียงตามลำดับรหัสสินค้า
select distinct p.ProductID,p.ProductName 
from Employees e join Orders o on e.EmployeeID = o.EmployeeID 
				 join [Order Details] od on o.OrderID = od.OrderID 
				 join Products p on od.ProductID = p.ProductID
where e.FirstName = 'Nancy'
order by ProductID
--ต้องการชื่อบริษัทลูกค้าชื่อ Around the Horn ซื้อสินค้าที่มาจากประเทศอะไรบ้าง
select distinct s.Country 
from Customers c join orders o on c.CustomerID = o.CustomerID
				 join [Order Details] od on o.OrderID = od.OrderID
				 join Products p on od.ProductID = p.ProductID
				 join Suppliers s on s.SupplierID = p.SupplierID
where c.CompanyName = 'Around the Horn'
-- บริษัทลูกค้าซื้อ Around the Horn ซื้อสินค้าอะไรบ้างจำนวนเท่าใด
select p.ProductID,p.ProductName,sum(Quantity) as [sum of Quantity]
from Customers c join Orders o on c.CustomerID = o.CustomerID
				 join [Order Details] od on od.OrderID = o.OrderID
				 join Products p on p.ProductID = od.ProductID
where c.CompanyName = 'Around the Horn'
group by p.ProductID,p.ProductName
order by 1
--ต้องการหมายเลขใบสั่งซื้อ ชื่อพนักงาน และยอดขายในใบสั่งซื้อนั้น
select o.OrderID,e.FirstName, 
       sum((od.Quantity * od.UnitPrice * (1-od.Discount))) as Totalcash
from Orders o join Employees e on o.EmployeeID = e.EmployeeID
			  join [Order Details] od on o.OrderID = od.OrderID
group by o.OrderID,e.FirstName
order by OrderID
