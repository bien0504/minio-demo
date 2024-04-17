CREATE DATABASE mydatabase;

USE mydatabase;

CREATE TABLE customers(
    customer_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(256) NULL,
    age INT NULL,
    gender VARCHAR(10) NULL,
    address VARCHAR(256) NULL
    );
CREATE TABLE category (
    category_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(256) NOT NULL,
    description TEXT
);
CREATE TABLE product (
    product_id INT NOT NULL PRIMARY KEY,
    category_id INT NOT NULL,
    name VARCHAR(256) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description TEXT,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);
CREATE TABLE orders (
    order_id INT NOT NULL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE orderdetail (
    order_detail_id INT NOT NULL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
INSERT INTO customers (customer_id, name, age, gender, address)
VALUES
(1, 'John Doe', 35, 'Male', '123 Main Street'),
(2, 'Jane Smith', 28, 'Female', '456 Elm Street'),
(3, 'Alice Johnson', 42, 'Female', '789 Oak Street'),
(4, 'Robert Williams', 45, 'Male', '321 Maple Avenue'),
(5, 'Emily Brown', 31, 'Female', '567 Pine Road'),
(6, 'Michael Davis', 29, 'Male', '876 Cedar Lane'),
(7, 'Jennifer Wilson', 38, 'Female', '234 Birch Street'),
(8, 'William Jones', 33, 'Male', '890 Cherry Lane'),
(9, 'Elizabeth Taylor', 40, 'Female', '432 Walnut Avenue'),
(10, 'David Martinez', 27, 'Male', '765 Spruce Court'),
(11, 'Sarah Anderson', 39, 'Female', '543 Sycamore Drive'),
(12, 'Daniel Thomas', 36, 'Male', '678 Elm Court'),
(13, 'Jessica Garcia', 26, 'Female', '345 Oak Lane'),
(14, 'Christopher Hernandez', 43, 'Male', '987 Maple Court'),
(15, 'Amanda Young', 30, 'Female', '210 Pine Street'),
(16, 'Matthew King', 32, 'Male', '678 Cedar Lane'),
(17, 'Samantha Scott', 34, 'Female', '543 Birch Road'),
(18, 'James White', 37, 'Male', '890 Walnut Court'),
(19, 'Michelle Lee', 41, 'Female', '321 Cherry Drive'),
(20, 'Andrew Lopez', 44, 'Male', '456 Sycamore Lane');
INSERT INTO category (category_id, name, description)
VALUES
(1, 'Electronics', 'Electronic devices and gadgets'),
(2, 'Clothing', 'Clothing and apparel'),
(3, 'Books', 'Books and literature'),
(4, 'Home & Kitchen', 'Home and kitchen appliances'),
(5, 'Toys & Games', 'Toys and games for children'),
(6, 'Beauty & Personal Care', 'Beauty and personal care products'),
(7, 'Sports & Outdoors', 'Sporting goods and outdoor equipment'),
(8, 'Automotive', 'Automotive parts and accessories'),
(9, 'Health & Household', 'Health and household essentials'),
(10, 'Tools & Home Improvement', 'Tools and home improvement products'),
(11, 'Baby', 'Baby care and essentials'),
(12, 'Grocery & Gourmet Food', 'Grocery items and gourmet foods'),
(13, 'Pet Supplies', 'Pet food and supplies'),
(14, 'Office Products', 'Office supplies and stationery'),
(15, 'Jewelry', 'Jewelry and accessories'),
(16, 'Movies & TV', 'Movies and television shows'),
(17, 'Music', 'Music albums and CDs'),
(18, 'Video Games', 'Video games and gaming accessories'),
(19, 'Patio, Lawn & Garden', 'Patio, lawn, and garden products'),
(20, 'Industrial & Scientific', 'Industrial and scientific equipment');
INSERT INTO product (product_id, category_id, name, price, description)
VALUES
(1, 1, 'Laptop', 999.99, 'High-performance laptop'),
(2, 1, 'Smartphone', 699.99, 'Latest smartphone model'),
(3, 2, 'T-shirt', 19.99, 'Casual cotton t-shirt'),
(4, 2, 'Jeans', 39.99, 'Classic denim jeans'),
(5, 3, 'Novel', 12.99, 'Bestselling fiction novel'),
(6, 3, 'Textbook', 89.99, 'Educational textbook'),
(7, 4, 'Blender', 49.99, 'Kitchen blender for smoothies'),
(8, 4, 'Cookware Set', 129.99, 'Complete set of kitchen cookware'),
(9, 5, 'Board Game', 24.99, 'Classic board game for family fun'),
(10, 5, 'LEGO Set', 49.99, 'Building blocks LEGO set'),
(11, 6, 'Shampoo', 9.99, 'Hair care shampoo'),
(12, 6, 'Face Cream', 29.99, 'Moisturizing face cream'),
(13, 7, 'Yoga Mat', 19.99, 'Exercise yoga mat'),
(14, 7, 'Running Shoes', 79.99, 'Sporty running shoes'),
(15, 8, 'Car Battery', 99.99, 'Automotive car battery'),
(16, 8, 'Tire Pump', 29.99, 'Portable tire air pump'),
(17, 9, 'Vitamin C', 14.99, 'Health supplement vitamin C tablets'),
(18, 9, 'Toilet Paper', 6.99, 'Essential household toilet paper rolls'),
(19, 10, 'Drill Set', 79.99, 'Power drill set for home improvement'),
(20, 10, 'Paint Brushes', 12.99, 'Assorted paint brushes for art projects');
INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
(1, 1, '2024-04-15', 120.50),
(2, 2, '2024-04-15', 75.25),
(3, 3, '2024-04-14', 230.00),
(4, 4, '2024-04-14', 45.75),
(5, 5, '2024-04-13', 99.99),
(6, 6, '2024-04-13', 200.00),
(7, 7, '2024-04-12', 150.50),
(8, 8, '2024-04-12', 75.00),
(9, 9, '2024-04-11', 300.25),
(10, 10, '2024-04-11', 150.75),
(11, 11, '2024-04-10', 80.00),
(12, 12, '2024-04-10', 90.25),
(13, 13, '2024-04-09', 45.99),
(14, 14, '2024-04-09', 180.50),
(15, 15, '2024-04-08', 250.00),
(16, 16, '2024-04-08', 175.75),
(17, 17, '2024-04-07', 120.25),
(18, 18, '2024-04-07', 90.99),
(19, 19, '2024-04-06', 60.50),
(20, 20, '2024-04-06', 300.00);
INSERT INTO orderdetail (order_detail_id, order_id, product_id, quantity, unit_price, total_price)
VALUES
(1, 1, 1, 1, 999.99, 999.99),
(2, 2, 3, 2, 19.99, 39.98),
(3, 3, 5, 1, 12.99, 12.99),
(4, 4, 7, 1, 49.99, 49.99),
(5, 5, 9, 3, 24.99, 74.97),
(6, 6, 11, 2, 9.99, 19.98),
(7, 7, 13, 1, 19.99, 19.99),
(8, 8, 15, 4, 99.99, 399.96),
(9, 9, 17, 1, 14.99, 14.99),
(10, 10, 19, 2, 79.99, 159.98),
(11, 11, 2, 1, 699.99, 699.99),
(12, 12, 4, 1, 39.99, 39.99),
(13, 13, 6, 1, 89.99, 89.99),
(14, 14, 8, 1, 129.99, 129.99),
(15, 15, 10, 1, 49.99, 49.99),
(16, 16, 12, 1, 29.99, 29.99),
(17, 17, 14, 1, 79.99, 79.99),
(18, 18, 16, 1, 29.99, 29.99),
(19, 19, 18, 2, 6.99, 13.98),
(20, 20, 20, 3, 12.99, 38.97);