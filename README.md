# SQL-Inventory-Management-Analysis-

# Project Overview
This project involves using SQL to perform various analyses on an inventory management system. The goal is to generate insights into the inventory, supplier relationships, and sales performance. The SQL queries included in this project cover a range of functionalities, such as calculating total products, analyzing supplier distribution, and evaluating sales revenue.

# Project Structure
Inventory Table: Contains details about the products in the inventory, such as product IDs and reorder points.

Products Table: Stores product information, including product names, categories, and unit prices.

Orders Table: Captures order details, including order status and order dates.

Order_Items Table: Represents the relationship between products and orders, including the quantity ordered and the price per unit.

Supplier Table: Contains supplier information, including names and contact details.

Key SQL Queries

Total Number of Products in Inventory:


SELECT COUNT(*) AS Total_Number_Of_Products
FROM Inventory;
Unique Product Categories Offered by the Company:


SELECT DISTINCT Category
FROM Products;
Average Unit Price of All Products:


SELECT AVG(Unit_Price) AS Average_Unit_Price
FROM Products;
Total Number of Delivered Orders:


SELECT COUNT(*) AS Delivered_Orders
FROM Orders
WHERE Order_Status = 'Delivered';
Total Number of Suppliers:


SELECT COUNT(*) AS Number_Of_Suppliers
FROM Supplier;
Products with Unit Price Above ₹350,000:


SELECT Product_Name
FROM Products
WHERE Unit_Price > 350000;
Highest and Lowest Unit Price:


SELECT MAX(Unit_Price) AS Highest_Unit_Price, MIN(Unit_Price) AS Lowest_Unit_Price
FROM Products;
Total Number of Pending Orders:


SELECT COUNT(*) AS Pending_Orders
FROM Orders
WHERE Order_Status = 'Pending';
Number of Products in the 'Electronics' Category:


SELECT COUNT(*) AS Number_Of_Electronics_Category_Product
FROM Products
WHERE Category = 'Electronics';
List of Supplier Names and Contact Details:


SELECT Supplier_Name, Contact_Email, Contact_Phone
FROM Supplier;
Products with Reorder Points Between 2 and 8:


SELECT A.Product_Name, A.Category, B.Inventory_ID, B.Reorder_Point
FROM Products AS A
JOIN Inventory AS B ON A.Product_ID = B.Product_ID
WHERE B.Reorder_Point BETWEEN 2 AND 8;
Total Revenue Generated from All Orders:


SELECT A.Product_ID, A.Product_Name, B.Quantity * B.Unit_Price AS Total_Amount
FROM Products AS A
JOIN Order_Items AS B ON A.Product_ID = B.Product_ID;
Product Category with the Highest Revenue:


SELECT B.Category, SUM(A.Quantity * A.Unit_Price) AS Total_Revenue
FROM Order_Items AS A
JOIN Products AS B ON A.Product_ID = B.Product_ID
GROUP BY B.Category;
Losses Incurred on Cancelled Orders:

SELECT C.Product_Name, C.Category, B.Quantity * B.Unit_Price AS Total_Amount
FROM Orders AS A
JOIN Order_Items AS B ON A.Order_ID = B.Order_ID
JOIN Products AS C ON B.Product_ID = C.Product_ID
WHERE A.Order_Status = 'Cancelled';
Number of Orders Placed in August:


SELECT COUNT(*) AS Orders_Count
FROM Orders
WHERE MONTH(Order_Date) = 8;
Classify Products Based on Unit Price:


SELECT Product_ID, Product_Name, Unit_Price,
CASE
    WHEN Unit_Price > 45000 THEN 'Premium'
    WHEN Unit_Price > 30000 THEN 'High'
    WHEN Unit_Price > 15000 THEN 'Medium'
    ELSE 'Low'
END AS Price_Category
FROM Products;
Supplier Distribution Across All Products:


SELECT A.Product_ID, A.Product_Name, A.Category, B.*
FROM Products AS A
LEFT JOIN Supplier AS B ON A.Product_ID = B.Product_ID;
Total Sales Revenue by Category Above ₹200,000:


SELECT A.Category, SUM(B.Quantity * B.Unit_Price) AS Total_Sales
FROM Products AS A
JOIN Order_Items AS B ON A.Product_ID = B.Product_ID
GROUP BY A.Category
HAVING SUM(B.Quantity * B.Unit_Price) > 200000;

# Conclusion
This project demonstrates how SQL can be effectively used to manage and analyze inventory data. The queries provided offer a comprehensive view of inventory status, sales performance, and supplier relationships, 

enabling better decision-making for inventory management.


This README provides a summary of the project, its structure, and key SQL queries used. You can modify or expand it to fit specific project details or additional queries.
