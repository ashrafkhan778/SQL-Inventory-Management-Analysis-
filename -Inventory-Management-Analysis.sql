create database Inventory_Management  ;
use  Inventory_Management ;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    category VARCHAR(50),
    supplier INT,
    unit_price DECIMAL(10, 2),
    reorder_level INT
);
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT,
    quantity_on_hand INT,
    reorder_point INT,
    reorder_quantity INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    order_status VARCHAR(20)
);
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(100),
    address VARCHAR(100));
CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    product_id INT,
    contact_name VARCHAR(100),
    contact_phone VARCHAR(20),
    contact_email VARCHAR(100),
    address VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_id, product_name, description, category, supplier, unit_price, reorder_level)
VALUES 
(1001, 'Laptop', '15-inch screen, 8GB RAM, 256GB SSD', 'Electronics', 201, 60000, 5),
(1002, 'Smartphone', '6.5-inch screen, 4GB RAM, 64GB Storage', 'Electronics', 202, 20000, 10),
(1003, 'Tablet', '10-inch screen, 3GB RAM, 32GB Storage', 'Electronics', 201, 15000, 7),
(1004, 'Smartwatch', '1.5-inch screen, Heart Rate Monitor', 'Electronics', 203, 8000, 12),
(1005, 'Headphones', 'Wireless, Noise Cancelling', 'Electronics', 204, 5000, 15),
(1006, 'Monitor', '24-inch, Full HD', 'Electronics', 201, 12000, 10),
(1007, 'Keyboard', 'Mechanical, RGB Backlit', 'Electronics', 202, 4000, 8),
(1008, 'Mouse', 'Wireless, Ergonomic', 'Electronics', 203, 2000, 5),
(1009, 'Printer', 'Laser, All-in-One', 'Electronics', 204, 15000, 6),
(1010, 'Camera', 'DSLR, 24MP', 'Electronics', 205, 45000, 4),
(1011, 'Bluetooth Speaker', 'Portable, Waterproof', 'Electronics', 201, 3000, 9),
(1012, 'External Hard Drive', '1TB, USB 3.0', 'Electronics', 202, 4500, 12),
(1013, 'Router', 'Dual Band, 1200Mbps', 'Electronics', 203, 2500, 7),
(1014, 'Smart TV', '50-inch, 4K UHD', 'Electronics', 204, 55000, 3),
(1015, 'Webcam', '1080p, Built-in Microphone', 'Electronics', 205, 3500, 6),
(1016, 'Microwave Oven', '20L, Convection', 'Home Appliances', 206, 8000, 4),
(1017, 'Refrigerator', 'Double Door, 300L', 'Home Appliances', 207, 25000, 2),
(1018, 'Washing Machine', 'Front Load, 6.5kg', 'Home Appliances', 208, 18000, 5),
(1019, 'Air Conditioner', '1.5 Ton, Inverter', 'Home Appliances', 209, 35000, 3),
(1020, 'Water Purifier', 'RO+UV, 7L', 'Home Appliances', 206, 15000, 6),
(1021, 'Blender', '600W, 1.5L Jar', 'Home Appliances', 210, 3000, 8),
(1022, 'Iron', 'Steam, 1500W', 'Home Appliances', 207, 2000, 10),
(1023, 'Vacuum Cleaner', 'Bagless, 1800W', 'Home Appliances', 208, 9000, 4),
(1024, 'Toaster', '2-Slice, 800W', 'Home Appliances', 210, 1500, 5),
(1025, 'Electric Kettle', '1.7L, 2000W', 'Home Appliances', 206, 2500, 6),
(1026, 'Dishwasher', '14 Place Settings, Stainless Steel', 'Home Appliances', 209, 40000, 2),
(1027, 'Oven', '30L, Convection', 'Home Appliances', 210, 12000, 3),
(1028, 'Hair Dryer', '1800W, Ionic', 'Personal Care', 202, 2500, 10),
(1029, 'Electric Shaver', 'Cordless, Waterproof', 'Personal Care', 204, 4500, 8),
(1030, 'Fitness Tracker', 'Heart Rate Monitor, GPS', 'Personal Care', 205, 6000, 7);
INSERT INTO Inventory (inventory_id, product_id, quantity_on_hand, reorder_point, reorder_quantity)
VALUES 
(301, 1001, 50, 5, 10),
(302, 1002, 100, 10, 20),
(303, 1003, 75, 7, 15),
(304, 1004, 60, 12, 25),
(305, 1005, 90, 15, 30),
(306, 1006, 40, 10, 20),
(307, 1007, 120, 8, 15),
(308, 1008, 85, 5, 10),
(309, 1009, 35, 6, 12),
(310, 1010, 25, 4, 8),
(311, 1011, 70, 9, 18),
(312, 1012, 80, 12, 20),
(313, 1013, 65, 7, 15),
(314, 1014, 15, 3, 5),
(315, 1015, 45, 6, 10),
(316, 1016, 30, 4, 8),
(317, 1017, 20, 2, 5),
(318, 1018, 55, 5, 12),
(319, 1019, 28, 3, 7),
(320, 1020, 48, 6, 10),
(321, 1021, 60, 8, 15),
(322, 1022, 120, 10, 20),
(323, 1023, 40, 4, 10),
(324, 1024, 55, 5, 12),
(325, 1025, 80, 6, 15),
(326, 1026, 18, 2, 5),
(327, 1027, 22, 3, 7),
(328, 1028, 75, 10, 18),
(329, 1029, 55, 8, 12),
(330, 1030, 70, 7, 15);
INSERT INTO Orders (order_id, order_date, customer_id, order_status)
VALUES 
(401, '2024-08-01', 101, 'Shipped'),
(402, '2024-08-05', 102, 'Pending'),
(403, '2024-08-07', 103, 'Delivered'),
(404, '2024-08-09', 104, 'Shipped'),
(405, '2024-08-11', 105, 'Cancelled'),
(406, '2024-08-12', 106, 'Shipped'),
(407, '2024-08-13', 107, 'Delivered'),
(408, '2024-08-14', 108, 'Pending'),
(409, '2024-08-15', 109, 'Shipped'),
(410, '2024-08-16', 110, 'Delivered'),
(411, '2024-08-17', 111, 'Pending'),
(412, '2024-08-18', 112, 'Cancelled'),
(413, '2024-08-19', 113, 'Shipped'),
(414, '2024-08-20', 114, 'Delivered'),
(415, '2024-08-21', 115, 'Pending'),
(416, '2024-08-22', 116, 'Shipped'),
(417, '2024-08-23', 117, 'Cancelled'),
(418, '2024-08-24', 118, 'Delivered'),
(419, '2024-08-25', 119, 'Shipped'),
(420, '2024-08-26', 120, 'Pending'),
(421, '2024-08-27', 121, 'Shipped'),
(422, '2024-08-28', 122, 'Delivered'),
(423, '2024-08-29', 123, 'Cancelled'),
(424, '2024-08-30', 124, 'Shipped'),
(425, '2024-08-31', 125, 'Pending'),
(426, '2024-09-01', 126, 'Delivered'),
(427, '2024-09-02', 127, 'Shipped'),
(428, '2024-09-03', 128, 'Pending'),
(429, '2024-09-04', 129, 'Cancelled'),
(430, '2024-09-05', 130, 'Delivered');
INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, unit_price)
VALUES 
(501, 401, 1001, 2, 60000),
(502, 402, 1002, 1, 20000),
(503, 403, 1003, 3, 15000),
(504, 404, 1004, 1, 8000),
(505, 405, 1005, 4, 5000),
(506, 406, 1006, 2, 12000),
(507, 407, 1007, 1, 4000),
(508, 408, 1008, 3, 2000),
(509, 409, 1009, 1, 15000),
(510, 410, 1010, 1, 45000),
(511, 411, 1011, 2, 3000),
(512, 412, 1012, 1, 4500),
(513, 413, 1013, 2, 2500),
(514, 414, 1014, 1, 55000),
(515, 415, 1015, 1, 3500),
(516, 416, 1016, 2, 8000),
(517, 417, 1017, 1, 25000),
(518, 418, 1018, 1, 18000),
(519, 419, 1019, 2, 35000),
(520, 420, 1020, 1, 15000),
(521, 421, 1021, 3, 3000),
(522, 422, 1022, 2, 2000),
(523, 423, 1023, 1, 9000),
(524, 424, 1024, 2, 1500),
(525, 425, 1025, 3, 2500),
(526, 426, 1026, 1, 40000),
(527, 427, 1027, 1, 12000),
(528, 428, 1028, 2, 2500),
(529, 429, 1029, 2, 4500),
(530, 430, 1030, 3, 6000);
INSERT INTO Supplier (supplier_id, supplier_name, product_id, contact_name, contact_phone, contact_email, address)
VALUES 
(201, 'Tech Distributors India', 1001, 'Shriya Verma', '011-12345678', 'shriya.verma@techdistributors.in', '123 Tech Street, New Delhi, India'),
(202, 'Gadget Suppliers India', 1002, 'Rohit Sharma', '022-23456789', 'rohit.sharma@gadgetsuppliers.in', '456 Gadget Avenue, Mumbai, India'),
(203, 'Device World India', 1003, 'Sneha Mehta', '033-34567890', 'sneha.mehta@deviceworld.in', '789 Device Road, Kolkata, India'),
(204, 'Electro Mart India', 1004, 'Arjun Singh', '044-45678901', 'arjun.singh@electromart.in', '101 Electro Lane, Chennai, India'),
(205, 'Digital Hub India', 1005, 'Aditi Rao', '011-56789012', 'aditi.rao@digitalhub.in', '202 Digital Circle, New Delhi, India'),
(206, 'Home Essentials India', 1016, 'Ravi Kumar', '080-67890123', 'ravi.kumar@homeessentials.in', '303 Home Boulevard, Bengaluru, India'),
(207, 'Kitchen Supplies Co. India', 1017, 'Pooja Desai', '020-78901234', 'pooja.desai@kitchensupplies.in', '404 Kitchen Street, Pune, India'),
(208, 'Appliance Depot India', 1018, 'Vikram Malhotra', '079-89012345', 'vikram.malhotra@appliancedepot.in', '505 Appliance Avenue, Ahmedabad, India'),
(209, 'Cooling Systems Ltd. India', 1019, 'Neha Kapoor', '040-90123456', 'neha.kapoor@coolingsystems.in', '606 Cooling Road, Hyderabad, India'),
(210, 'Smart Tech India', 1021, 'Rakesh Nair', '0471-01234567', 'rakesh.nair@smarttech.in', '707 Smart Drive, Thiruvananthapuram, India');

 
Select * FROM Orders ;
Select * from Order_Items ;
Select * from Supplier ;
Select * from Products ;
Select * from Inventory ;


