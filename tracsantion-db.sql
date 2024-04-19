CREATE DATABASE mydatabase;

\c mydatabase;

CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE OrderDetails (
    orderdetail_id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category_id INT,
    price DECIMAL,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Shippers (
    shipper_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE Suppliers (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    contact_name VARCHAR(100),
    phone VARCHAR(20)
);


-- Thêm giá trị vào bảng Customers
INSERT INTO Customers (name, email) VALUES
    ('John Doe', 'john@example.com'),
    ('Jane Smith', 'jane@example.com'),
    ('Alice Johnson', 'alice@example.com'),
    ('Bob Brown', 'bob@example.com'),
    ('Charlie Davis', 'charlie@example.com'),
    ('Emma Wilson', 'emma@example.com'),
    ('Frank Martinez', 'frank@example.com'),
    ('Grace Lee', 'grace@example.com'),
    ('Henry Taylor', 'henry@example.com'),
    ('Ivy Garcia', 'ivy@example.com');

-- Thêm giá trị vào bảng Categories
INSERT INTO Categories (name) VALUES
    ('Category A'),
    ('Category B'),
    ('Category C'),
    ('Category D'),
    ('Category E'),
    ('Category F'),
    ('Category G'),
    ('Category H'),
    ('Category I'),
    ('Category J');

-- Thêm giá trị vào bảng Employees
INSERT INTO Employees (name, email) VALUES
    ('Alice Adams', 'alice.adams@example.com'),
    ('Bob Brown', 'bob.brown@example.com'),
    ('Charlie Clark', 'charlie.clark@example.com'),
    ('David Davis', 'david.davis@example.com'),
    ('Emma Evans', 'emma.evans@example.com'),
    ('Frank Fisher', 'frank.fisher@example.com'),
    ('Grace Green', 'grace.green@example.com'),
    ('Henry Harris', 'henry.harris@example.com'),
    ('Ivy Irving', 'ivy.irving@example.com'),
    ('Jack Jackson', 'jack.jackson@example.com');

-- Thêm giá trị vào bảng OrderDetails
INSERT INTO OrderDetails (order_id, product_id, quantity, price) VALUES
    (1, 1, 2, 10.99),
    (1, 2, 1, 20.50),
    (2, 3, 3, 15.75),
    (2, 4, 2, 8.99),
    (3, 5, 1, 12.25),
    (3, 6, 4, 9.50),
    (4, 7, 2, 18.75),
    (4, 8, 3, 14.99),
    (5, 9, 5, 11.50),
    (5, 10, 1, 25.00);

-- Thêm giá trị vào bảng Orders
INSERT INTO Orders (customer_id, order_date) VALUES
    (1, '2024-01-01'),
    (2, '2024-01-02'),
    (3, '2024-01-03'),
    (4, '2024-01-04'),
    (5, '2024-01-05'),
    (6, '2024-01-06'),
    (7, '2024-01-07'),
    (8, '2024-01-08'),
    (9, '2024-01-09'),
    (10, '2024-01-10');

-- Thêm giá trị vào bảng Products
INSERT INTO Products (name, category_id, price) VALUES
    ('Product 1', 1, 10.99),
    ('Product 2', 1, 20.50),
    ('Product 3', 2, 15.75),
    ('Product 4', 2, 8.99),
    ('Product 5', 3, 12.25),
    ('Product 6', 3, 9.50),
    ('Product 7', 4, 18.75),
    ('Product 8', 4, 14.99),
    ('Product 9', 5, 11.50),
    ('Product 10', 5, 25.00);

-- Thêm giá trị vào bảng Shippers
INSERT INTO Shippers (name, phone) VALUES
    ('Shipper A', '123-456-7890'),
    ('Shipper B', '234-567-8901'),
    ('Shipper C', '345-678-9012'),
    ('Shipper D', '456-789-0123'),
    ('Shipper E', '567-890-1234'),
    ('Shipper F', '678-901-2345'),
    ('Shipper G', '789-012-3456'),
    ('Shipper H', '890-123-4567'),
    ('Shipper I', '901-234-5678'),
    ('Shipper J', '012-345-6789');

-- Thêm giá trị vào bảng Suppliers
INSERT INTO Suppliers (name, contact_name, phone) VALUES
    ('Supplier A', 'John Smith', '123-456-7890'),
    ('Supplier B', 'Jane Doe', '234-567-8901'),
    ('Supplier C', 'Alice Johnson', '345-678-9012'),
    ('Supplier D', 'Bob Brown', '456-789-0123'),
    ('Supplier E', 'Charlie Davis', '567-890-1234'),
    ('Supplier F', 'Emma Wilson', '678-901-2345'),
    ('Supplier G', 'Frank Martinez', '789-012-3456'),
    ('Supplier H', 'Grace Lee', '890-123-4567'),
    ('Supplier I', 'Henry Taylor', '901-234-5678'),
    ('Supplier J', 'Ivy Garcia', '012-345-6789');
