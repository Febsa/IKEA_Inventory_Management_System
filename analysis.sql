-- Product Stock Analysis

-- 1. Total Stock Per Category
SELECT category, SUM(stock_quantity) AS total_stock
FROM products
GROUP BY category;

-- 2. Low Stock
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 50;

-- Sales Analysis

-- 1. Best Selling Products
SELECT product_name, SUM(quantity) AS jumlah_terjual
FROM sales
JOIN products ON sales.product_id = products.product_id
GROUP BY product_name
ORDER BY jumlah_terjual DESC
LIMIT 5;

-- 2. Total Revenue
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS bulan, SUM(total_price) AS total_pendapatan
FROM sales
GROUP BY bulan
ORDER BY bulan;

-- 3. Best Customers
SELECT customer_id, customer_name, SUM(total_price) AS total_pembelian
FROM sales
GROUP BY customer_id, customer_name
ORDER BY total_pembelian DESC
LIMIT 1;

-- Goods Entry Analysis

-- 1. Average Monthly Income
SELECT DATE_FORMAT(receipt_date, '%Y-%m') AS bulan, AVG(quantity) AS rata_rata_pemasukan
FROM product_receipts
GROUP BY bulan
ORDER BY bulan;

-- 2. Latest Income
SELECT product_name, receipt_date, quantity
FROM product_receipts
JOIN products ON product_receipts.product_id = products.product_id
ORDER BY receipt_date DESC
LIMIT 5;