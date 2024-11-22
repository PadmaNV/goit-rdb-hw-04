SELECT 
    o.id AS order_id,
    c.name AS customer_name,
    e.first_name AS employee_first_name,
    e.last_name AS employee_last_name,
    sh.name AS shipper_name,
    p.name AS product_name,
    p.price AS product_price,
    od.quantity AS quantity,
    cat.name AS category_name,
    sup.name AS supplier_name
FROM db_lec3.orders AS o
INNER JOIN db_lec3.order_details AS od ON o.id = od.order_id
INNER JOIN db_lec3.customers AS c ON o.customer_id = c.id
INNER JOIN db_lec3.employees AS e ON o.employee_id = e.employee_id
INNER JOIN db_lec3.shippers AS sh ON o.shipper_id = sh.id
INNER JOIN db_lec3.products AS p ON od.product_id = p.id
INNER JOIN db_lec3.categories AS cat ON p.category_id = cat.id
INNER JOIN db_lec3.suppliers AS sup ON p.supplier_id = sup.id
LIMIT 10;
