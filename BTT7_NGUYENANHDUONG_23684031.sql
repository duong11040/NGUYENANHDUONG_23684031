CREATE DATABASE QLBH
go
USE QLBH;
-- Tạo bảng Suppliers
CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL
);

-- Tạo bảng Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    SupplierID INT,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    UnitInStock INT NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
ALTER TABLE Products ADD CategoryID INT;
ALTER TABLE Products ADD FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID);
UPDATE Products SET CategoryID = 1 WHERE ProductID IN (1,2,3);  
UPDATE Products SET CategoryID = 2 WHERE ProductID IN (4,5,6);  

-- Tạo bảng Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CompanyName VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    City VARCHAR(50),
    Region VARCHAR(50),
    Country VARCHAR(50)
);

-- Tạo bảng Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    LastName VARCHAR(50) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    BirthDate DATE,
    City VARCHAR(50)
);

-- Tạo bảng Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
	Shipdate DATE,
	Shipcity VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Tạo bảng OrderDetails
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL,
    Discount DECIMAL(5, 2) DEFAULT 0.00,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Shippers
	(ShipperID INT,
	CompanyName VARCHAR(50),
	PRIMARY KEY (ShipperID)
);
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);
-- Thêm dữ liệu vào Suppliers
INSERT INTO Suppliers (SupplierID, SupplierName)
VALUES 
    (1, 'Công ty GameBlood'),
    (2, 'Công ty Hoa Sen Gaming'),
    (3, 'Công ty TechnoPro');

-- Thêm dữ liệu vào Products
INSERT INTO Products (ProductID, ProductName, SupplierID, UnitPrice, UnitInStock)
VALUES 
	(1, 'Laptop Asus', 1, 1500.00, 4),
    (2, 'Laptop Dell', 2, 1000.00, 10),
    (3, 'Loa Marshall', 3, 50.00, 10),
    (4, 'Bàn phím Aula F75', 1, 250.00, 10),
    (5, 'Màn hình Samsung', 2, 150.00, 20),
	(6, 'Màn hình Sony', 3, 1500.00, 20);
INSERT INTO Products (ProductID, ProductName, SupplierID, UnitPrice, UnitInStock, CategoryID)
VALUES
    (7, 'USB 32GB', 1, 10.00, 500, 2),  
    (8, 'Cáp HDMI', 2, 15.00, 400, 2); 

-- Thêm dữ liệu vào Customers
INSERT INTO Customers (CustomerID, CompanyName, Address, City, Region, Country)
VALUES
	(1, 'Công ty PNJ', '12 Lê Lợi', 'Đà Nẵng', 'Miền Trung', 'Việt Nam'),
    (2, 'Công ty FPT', '1 Nguyễn Văn Bảo', 'HCM', 'Miền Nam', 'Việt Nam'),
    (3, 'Công ty Romands', '12 Lê Thị Hồng', 'HCM', 'Miền Nam', 'Việt Nam'),
    (4, 'Công ty Oliver', '100 Nguyễn Thái Sơn', 'HCM', 'Miền Nam', 'Việt Nam'),
    (5, 'Công ty Trung Nguyên', '212 Quang Trung', 'Hà Nội', 'Miền Bắc', 'Việt Nam');

-- Thêm dữ liệu vào Employees

INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, City)
VALUES
	(1, 'Hứa', 'Quang Hán', '1980-03-08', N'Hà Nội'),
    (2, 'Fuller', 'Văn Hải', '1960-10-02', N'TP HCM'),
    (3, 'Tang', 'Diên', '1970-01-02', N'Đà Nẵng'),
    (4, 'Ôn', 'Dĩ Phàm', '1972-10-23', N'Hà Nội'),
	(5, 'Park', 'Bo-Gum', '1972-10-23', N'Hà Nội');



-- Thêm dữ liệu vào Orders
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, ShipDate, ShipCity)
VALUES 
    (1, 1, 1, '1997-07-14','1997-07-16','Madrid'),
    (2, 2, 2, '1997-04-16','1997-12-14','Madrid'),
    (3, 3, 3, '1996-07-12','1996-07-16','Barcalona'),
	(4, 2, 1, '1996-12-15','1996-12-16','Liverpool'),
    (5, 4, 4, '1996-12-08','1996-12-21','Manchester'),
	(10248, 2, 4, '1997-01-02','1997-12-21','Bayern Munich');
-- Thêm đơn hàng mới trong quý 1 năm 1998
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, ShipDate, ShipCity) VALUES  
    (11, 1, 2, '1998-01-15', '1998-01-20', 'Hà Nội'),  
    (12, 2, 3, '1998-02-10', '1998-02-15', 'HCM'),  
    (13, 3, 4, '1998-03-05', '1998-03-10', 'Đà Nẵng');  
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, ShipDate, ShipCity) VALUES  
    (6, 1, 1, '1997-06-15', '1997-06-20', 'Hà Nội'),  
    (7, 2, 2, '1997-09-20', '1997-09-25', 'HCM'),  
    (8, 3, 3, '1997-12-10', '1997-12-15', 'Đà Nẵng'),  
    (9, 4, 4, '1997-05-05', '1997-05-10', 'Tokyo'),  
    (10, 5, 5, '1997-08-08', '1997-08-12', 'Seoul'); 
-- Thêm đơn hàng vào tháng 3/1997
INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, ShipDate, ShipCity) VALUES  
    (14, 1, 1, '1997-03-10', '1997-03-15', 'Hà Nội'),  
    (15, 2, 2, '1997-03-18', '1997-03-23', 'HCM'),  
    (16, 3, 3, '1997-03-25', '1997-03-30', 'Đà Nẵng');  


-- Thêm dữ liệu vào OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount)
VALUES 
    (1, 1, 1600.00, 2, 10.00),
    (2, 1, 1200.00, 3, 10.00),
    (3, 3, 50.00, 5, 3.00),
    (4, 4, 280.00, 1, 2.00),
    (5, 2, 180.00, 4, 1.00),
    (10248, 2, 1300.00, 1, 2.00);
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES  
    (6, 1, 1500.00, 10, 5.00),  
    (6, 2, 1000.00, 5, 0.00),   
    (7, 3, 50.00, 100, 10.00),  
    (7, 4, 250.00, 20, 5.00),   
    (8, 5, 150.00, 50, 0.00),   
    (9, 6, 1500.00, 15, 2.00),    
    (10, 2, 1000.00, 30, 5.00);
-- Thêm dữ liệu vào OrderDetails với số lượng bán lớn
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES  
    (11, 3, 50.00, 150, 5.00),  
    (11, 4, 250.00, 100, 2.00),  
    (12, 5, 150.00, 200, 0.00),  
    (13, 6, 1500.00, 250, 1.00);
-- Thêm dữ liệu vào OrderDetails để đảm bảo tổng tiền > 4000
INSERT INTO OrderDetails (OrderID, ProductID, UnitPrice, Quantity, Discount) VALUES  
    (14, 1, 1500.00, 5, 5.00),  -- 5 laptop Asus
    (14, 2, 1000.00, 4, 2.00),  -- 4 laptop Dell
    (15, 3, 50.00, 100, 10.00), -- 100 loa Marshall
    (16, 5, 150.00, 50, 0.00),  -- 50 màn hình Samsung
    (16, 6, 1500.00, 10, 2.00); -- 10 màn hình Sony
-- Thêm dữ liệu vào bảng Categories
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Accessories');

-- Thêm dữ liệu vào bảng Shippers
INSERT INTO Shippers (ShipperID, CompanyName) VALUES
(1, 'FastShip'),
(2, 'SafeCourier');


---- TRUY VẤN ----

--- Câu 1:
SELECT o.OrderID, o.OrderDate, ToTalAccount = SUM(od.Quantity*od.UnitPrice)
FROM Orders o join OrderDetails od on o.OrderID = od.OrderID
GROUP BY o.OrderID, o.OrderDate
--- Câu 2:
SELECT o.OrderID, o.OrderDate, ToTalAccount = SUM(od.Quantity*od.UnitPrice)
FROM Orders o join OrderDetails od ON o.OrderID = od.OrderID
WHERE o.ShipCity = 'Madrid'
GROUP BY o.OrderID, o.OrderDate

--- Câu 3:
SELECT p.ProductID, p.ProductName, CountOfOrders = COUNT(p.ProductID)
FROM Products p join OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING COUNT(p.ProductID) >= all(
		SELECT COUNT(p.ProductID)
		FROM Products p join OrderDetails od ON p.ProductID = od.ProductID
		GROUP BY p.ProductID, p.ProductName)
--- Câu 4:
SELECT  c.CustomerID, c.CompanyName, CountOfOrder = COUNT(o.CustomerID)
FROM Customers c join Orders o ON c.CustomerID = o.CustomerID
GROUP BY  c.CustomerID, c.CompanyName

--- Câu 5:
SELECT e.EmployeeID, CountOfOrder = COUNT(*), Total = SUM(od.Quantity*od.UnitPrice)
FROM Employees e JOIN Orders o ON o.EmployeeID = e.EmployeeID
				JOIN OrderDetails od ON od.OrderID = o.OrderID
GROUP BY e.EmployeeID
--- Câu 6: 
SELECT 
    e.EmployeeID, 
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployName,
    MONTH(o.OrderDate) AS Month_Salary,
    SUM(od.Quantity * od.UnitPrice) * 0.1 AS Salary
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1996
GROUP BY e.EmployeeID, e.FirstName, e.LastName, MONTH(o.OrderDate)
ORDER BY MONTH(o.OrderDate) ASC, SUM(od.Quantity * od.UnitPrice) * 0.1 DESC;
--- Câu 7:
SELECT 
    c.CustomerID, 
    c.CompanyName, 
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)) AS TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE o.OrderDate BETWEEN '1996-12-31' AND '1998-01-01'
GROUP BY c.CustomerID, c.CompanyName
HAVING SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)) > 20000
ORDER BY TotalAmount DESC;
--- Câu 8:
SELECT
    c.CustomerID, 
    c.CompanyName, 
    COUNT(o.OrderID) AS TotalOrders, 
    SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)) AS TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE o.OrderDate BETWEEN '1996-12-31' AND '1998-01-01'
GROUP BY c.CustomerID, c.CompanyName
HAVING SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)) > 20000
ORDER BY c.CustomerID ASC, TotalAmount DESC;
--- Câu 9:
SELECT 
    c.CategoryID,
    c.CategoryName,
    SUM(p.UnitInStock) AS Total_UnitsInStock,
    AVG(p.UnitPrice) AS Average_UnitPrice
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryID, c.CategoryName
HAVING SUM(p.UnitInStock) > 300 AND AVG(p.UnitPrice) < 25;
--- Câu 10:
SELECT 
    c.CategoryID, 
    c.CategoryName, 
    COUNT(p.ProductID) AS TotalOfProducts
FROM Categories c
LEFT JOIN Products p ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryID, c.CategoryName
HAVING COUNT(p.ProductID) < 10
ORDER BY c.CategoryName ASC, TotalOfProducts DESC;
--- Câu 11:
SELECT 
    p.ProductID,
    p.ProductName,
    SUM(od.Quantity) AS SumofQuantity
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE YEAR(o.OrderDate) = 1998 
    AND MONTH(o.OrderDate) BETWEEN 1 AND 3 
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.Quantity) > 200;
--- Câu 12:
SELECT 
    c.CustomerID, 
    c.CompanyName, 
    FORMAT(o.OrderDate, 'MM-yyyy') AS Month_Year, 
    SUM(od.UnitPrice * od.Quantity) AS Total
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CompanyName, FORMAT(o.OrderDate, 'MM-yyyy')
ORDER BY Month_Year, Total DESC;
--- Câu 13:
SELECT TOP 1 
    e.EmployeeID, 
    e.LastName, 
    e.FirstName, 
    SUM(od.UnitPrice * od.Quantity) AS TotalSales
FROM Orders o
JOIN Employees e ON o.EmployeeID = e.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1997 AND MONTH(o.OrderDate) = 7
GROUP BY e.EmployeeID, e.LastName, e.FirstName
ORDER BY TotalSales DESC;
--- Câu 14:
SELECT TOP 3 
    c.CustomerID, 
    c.CompanyName, 
    COUNT(o.OrderID) AS TotalOrders
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE YEAR(o.OrderDate) = 1996
GROUP BY c.CustomerID, c.CompanyName
ORDER BY TotalOrders DESC;
--- Câu 15:
SELECT 
    e.EmployeeID,
    e.LastName,
    e.FirstName,
    COUNT(o.OrderID) AS CountOfOrderID,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount / 100)) AS SumOfTotal
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 1997 
    AND MONTH(o.OrderDate) = 3 
GROUP BY e.EmployeeID, e.LastName, e.FirstName
HAVING SUM(od.UnitPrice * od.Quantity * (1 - od.Discount / 100)) > 4000;