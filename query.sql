SELECT
    fact_sales.quantity,
    dim_product.product_name,
    dim_supplier.supplier_address,
    dim_employee.first_name AS employee_first_name,
    dim_employee.last_name AS employee_last_name
FROM
    fact_sales
JOIN
    dim_product ON fact_sales.product_id = dim_product.product_id
JOIN
    dim_supplier ON fact_sales.supplier_id = dim_supplier.supplier_id
JOIN
    dim_employee ON fact_sales.employee_id = dim_employee.employee_id
WHERE
    EXTRACT(MONTH FROM fact_sales.action_date) = EXTRACT(MONTH FROM CURRENT_DATE)
    AND EXTRACT(YEAR FROM fact_sales.action_date) = EXTRACT(YEAR FROM CURRENT_DATE);

--Tính tổng doanh số bán hàng theo từng nhà cung cấp trong năm hiện tại:
SELECT
    dim_supplier.supplier_id,
    dim_supplier.supplier_address,
    SUM(fact_sales.price * fact_sales.quantity) AS total_sales
FROM
    fact_sales
JOIN
    dim_supplier ON fact_sales.supplier_id = dim_supplier.supplier_id
WHERE
    EXTRACT(YEAR FROM fact_sales.action_date) = EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY
    dim_supplier.supplier_id,
    dim_supplier.supplier_address;

--Liệt kê các nhân viên trên 30 tuổi
SELECT
    *
FROM
    dim_employee
WHERE
    birth_year < EXTRACT(YEAR FROM CURRENT_DATE)-30;

--top 5 sản phẩm số lượng nhiều nhaats tháng  :
SELECT *
FROM product
WHERE product_id IN (
    SELECT
        product_id
    FROM
        orderdetail
    WHERE
        order_id IN(
        SELECT order_id FROM orders
        WHERE
        EXTRACT(YEAR FROM order_date) = EXTRACT(YEAR FROM CURRENT_DATE) AND
        EXTRACT(MONTH FROM order_date) = EXTRACT(MONTH FROM CURRENT_DATE)
        )
        GROUP BY
        product_id
    ORDER BY
        SUM(quantity) DESC
    LIMIT 5
);
--top 5 category doanh thu cao nhat thang
SELECT *
FROM category
WHERE category_id IN(
    SELECT category_id
    FROM product
    WHERE product_id IN
        (SELECT product.product_id
        FROM orderdetail JOIN product ON orderdetail.product_id = product.product_id
        WHERE
        order_id IN(
        SELECT order_id FROM orders
        WHERE
        EXTRACT(YEAR FROM order_date) = EXTRACT(YEAR FROM CURRENT_DATE) AND
        EXTRACT(MONTH FROM order_date) = EXTRACT(MONTH FROM CURRENT_DATE)
        )
        GROUP BY
        product.product_id
    ORDER BY
        SUM(quantity * price) DESC
        )
        )
LIMIT 5;
--tong doanh thu theo gioi tinh
SELECT
    c.gender,
    SUM(od.quantity * p.price) AS total_revenue
FROM
    orderdetail od
JOIN
    product p ON od.product_id = p.product_id
JOIN
    orders o ON od.order_id = o.order_id
JOIN
    customers c ON o.customer_id = c.customer_id
WHERE
    EXTRACT(YEAR FROM o.order_date) = EXTRACT(YEAR FROM CURRENT_DATE)
    AND EXTRACT(MONTH FROM o.order_date) = EXTRACT(MONTH FROM CURRENT_DATE)
GROUP BY
    c.gender;
---tong doanh thu theo do tuoi
SELECT
    CASE
        WHEN age < 18 THEN 'Dưới 18'
        WHEN age BETWEEN 18 AND 35 THEN 'Từ 18 đến 35'
        ELSE 'Trên 35'
    END AS age_group,
    SUM(od.quantity * p.price) AS total_revenue
FROM
    orderdetail od
JOIN
    product p ON od.product_id = p.product_id
JOIN
    orders o ON od.order_id = o.order_id
JOIN
    customers c ON o.customer_id = c.customer_id
WHERE
    EXTRACT(YEAR FROM o.order_date) = EXTRACT(YEAR FROM CURRENT_DATE)
    AND EXTRACT(MONTH FROM o.order_date) = EXTRACT(MONTH FROM CURRENT_DATE)
GROUP BY
    age_group
ORDER BY
    age_group;
