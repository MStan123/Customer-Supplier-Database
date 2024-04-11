SELECT price FROM Product
GROUP BY product_id
LIMIT 2;
-------------------------------------------
SELECT price, product_name, category FROM Product
ORDER BY price DESC
LIMIT 5;
-----------------------------
UPDATE Customer
SET address = 'Baku, Azerbaijan';

UPDATE Customer
SET first_name = 'Petr'
WHERE customer_id = 1;

SELECT * FROM Customer;
-------------------------------
SELECT Customer.customer_id, Customer.first_name,
    CASE
        WHEN Order_.payment_method = 'Credit Card' THEN 'Allowed'
        ELSE 'Not Allowed'
    END AS can_vote
FROM Customer
JOIN Order_
ON Customer.customer_id = Order_.customer_id;
----------------------------------------------
SELECT COUNT(*) AS total_suppliers
FROM Supplier;

SELECT AVG(rating) AS average_rating
FROM Supplier;

SELECT MAX(rating) AS highest_rating, MIN(rating) AS lowest_rating
FROM Supplier;

SELECT supplier_name, rating
FROM Supplier
WHERE rating > 4.0;

SELECT
    CASE
        WHEN rating >= 4.0 THEN 'Highly Rated'
        WHEN rating >= 3.0 THEN 'Moderately Rated'
        ELSE 'Low Rated'
    END AS rating_category,
    COUNT(*) AS count
FROM Supplier
GROUP BY rating_category;
-----------------------------------------------------
SELECT
    S.supplier_id,
    S.supplier_name AS supplier_name,
    P.product_id,
    P.product_name AS product_name
FROM
    Supplier AS S
JOIN
    SupplierProduct AS SP ON S.supplier_id = SP.supplier_id
JOIN
    Product AS P ON SP.product_id = P.product_id
ORDER BY
    S.supplier_id, P.product_id;
-----------------------------------------------------
SELECT
    OI.order_item_id,
    OI.order_id,
    OI.product_id,
    OI.quantity,
    OI.unit_price,
    SP.supplier_id
FROM
    OrderItem AS OI
JOIN
    SupplierProduct AS SP ON OI.product_id = SP.product_id;
