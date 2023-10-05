-- Database Creation 

CREATE DATABASE ikea_inventory;
USE ikea_inventory;

-- Product Table

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(50),
    stock_quantity INT,
    price DECIMAL(10, 2)
);

INSERT INTO products (product_id, product_name, category, stock_quantity, price)
VALUES
    (1, 'Meja LACK', 'Furniture', 100, 49.99),
    (2, 'Lampu RIGGAD', 'Lighting', 75, 29.99),
    (3, 'Kursi POÄNG', 'Furniture', 50, 79.99),
    (4, 'Lemari BILLY', 'Furniture', 120, 129.99),
    (5, 'Karpet RENS', 'Home Decor', 200, 19.99);

-- Item Entry Table
CREATE TABLE product_receipts (
    receipt_id INT PRIMARY KEY,
    product_id INT,
    receipt_date DATE,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO product_receipts (receipt_id, product_id, receipt_date, quantity)
VALUES
    (1, 1, '2023-09-10', 50),
    (2, 2, '2023-09-11', 30),
    (3, 1, '2023-09-15', 30),
    (4, 4, '2023-09-20', 80),
    (5, 5, '2023-09-25', 100);

-- Sales Table

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity INT,
    total_price DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO sales (sale_id, product_id, sale_date, quantity, total_price)
VALUES
    (1, 1, '2023-09-12', 20, 999.80),
    (2, 3, '2023-09-14', 5, 399.95),
    (3, 2, '2023-09-18', 15, 449.85),
    (4, 4, '2023-09-22', 40, 5199.60),
    (5, 1, '2023-09-25', 10, 499.90);