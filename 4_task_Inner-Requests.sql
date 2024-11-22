
-- 4.1 Визначте, скільки рядків ви отримали (за допомогою оператора COUNT).
SELECT COUNT(*) AS row_count
FROM db_lec3.orders AS o
INNER JOIN db_lec3.order_details AS od ON o.id = od.order_id
INNER JOIN db_lec3.customers AS c ON o.customer_id = c.id
INNER JOIN db_lec3.employees AS e ON o.employee_id = e.employee_id
INNER JOIN db_lec3.shippers AS sh ON o.shipper_id = sh.id
INNER JOIN db_lec3.products AS p ON od.product_id = p.id
INNER JOIN db_lec3.categories AS cat ON p.category_id = cat.id
INNER JOIN db_lec3.suppliers AS sup ON p.supplier_id = sup.id;

-- 4.2 Змініть декілька операторів INNER на LEFT чи RIGHT. Визначте, що 
-- відбувається з кількістю рядків. Чому? Напишіть відповідь у текстовому файлі.
SELECT COUNT(*) AS row_count_change
FROM db_lec3.orders AS o
LEFT JOIN db_lec3.order_details AS od ON o.id = od.order_id
LEFT JOIN db_lec3.customers AS c ON o.customer_id = c.id
INNER JOIN db_lec3.employees AS e ON o.employee_id = e.employee_id
INNER JOIN db_lec3.shippers AS sh ON o.shipper_id = sh.id
RIGHT JOIN db_lec3.products AS p ON od.product_id = p.id
RIGHT JOIN db_lec3.categories AS cat ON p.category_id = cat.id
RIGHT JOIN db_lec3.suppliers AS sup ON p.supplier_id = sup.id;
-- Висновок: В результаті заміни операторів INNER JOIN на LEFT JOIN або RIGHT
-- JOIN кількість рядків не змінилася (518 рядків). Це пояснюється тим, що у 
-- всіх таблицях бази даних немає записів, які не мають відповідностей у пов’язаних
-- таблицях. Якби такі записи існували, LEFT JOIN включив би їх у результат із 
-- заповненням NULL для відсутніх даних, а RIGHT JOIN працював би аналогічно для правої таблиці.

-- 4.3 Оберіть тільки ті рядки, де employee_id > 3 та ≤ 10.
SELECT COUNT(*)  AS row_count
FROM db_lec3.orders AS o
INNER JOIN db_lec3.order_details AS od ON o.id = od.order_id
INNER JOIN db_lec3.customers AS c ON o.customer_id = c.id
INNER JOIN db_lec3.employees AS e ON o.employee_id = e.employee_id
INNER JOIN db_lec3.shippers AS sh ON o.shipper_id = sh.id
INNER JOIN db_lec3.products AS p ON od.product_id = p.id
INNER JOIN db_lec3.categories AS cat ON p.category_id = cat.id
INNER JOIN db_lec3.suppliers AS sup ON p.supplier_id = sup.id
WHERE e.employee_id > 3 and e.employee_id <= 10;

-- 4.4 Згрупуйте за іменем категорії, порахуйте кількість рядків у групі,
-- середню кількість товару (кількість товару знаходиться в order_details.quantity)
SELECT 
    cat.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS avg_quantity
FROM db_lec3.orders AS o
INNER JOIN db_lec3.order_details AS od ON o.id = od.order_id
INNER JOIN db_lec3.customers AS c ON o.customer_id = c.id
INNER JOIN db_lec3.employees AS e ON o.employee_id = e.employee_id
INNER JOIN db_lec3.shippers AS sh ON o.shipper_id = sh.id
INNER JOIN db_lec3.products AS p ON od.product_id = p.id
INNER JOIN db_lec3.categories AS cat ON p.category_id = cat.id
INNER JOIN db_lec3.suppliers AS sup ON p.supplier_id = sup.id
GROUP BY cat.name;

-- 4.5 Відфільтруйте рядки, де середня кількість товару більша за 21.
SELECT 
    cat.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS avg_quantity
FROM db_lec3.orders AS o
INNER JOIN db_lec3.order_details AS od ON o.id = od.order_id
INNER JOIN db_lec3.customers AS c ON o.customer_id = c.id
INNER JOIN db_lec3.employees AS e ON o.employee_id = e.employee_id
INNER JOIN db_lec3.shippers AS sh ON o.shipper_id = sh.id
INNER JOIN db_lec3.products AS p ON od.product_id = p.id
INNER JOIN db_lec3.categories AS cat ON p.category_id = cat.id
INNER JOIN db_lec3.suppliers AS sup ON p.supplier_id = sup.id
GROUP BY cat.name
HAVING AVG(od.quantity) > 21;

-- 4.6 Відсортуйте рядки за спаданням кількості рядків.
SELECT 
    cat.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS avg_quantity
FROM db_lec3.orders AS o
INNER JOIN db_lec3.order_details AS od ON o.id = od.order_id
INNER JOIN db_lec3.customers AS c ON o.customer_id = c.id
INNER JOIN db_lec3.employees AS e ON o.employee_id = e.employee_id
INNER JOIN db_lec3.shippers AS sh ON o.shipper_id = sh.id
INNER JOIN db_lec3.products AS p ON od.product_id = p.id
INNER JOIN db_lec3.categories AS cat ON p.category_id = cat.id
INNER JOIN db_lec3.suppliers AS sup ON p.supplier_id = sup.id
GROUP BY cat.name
HAVING AVG(od.quantity) > 21
ORDER BY row_count DESC;

-- 4.7 Виведіть на екран (оберіть) чотири рядки з пропущеним першим рядком.
SELECT 
    cat.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS avg_quantity
FROM db_lec3.orders AS o
INNER JOIN db_lec3.order_details AS od ON o.id = od.order_id
INNER JOIN db_lec3.customers AS c ON o.customer_id = c.id
INNER JOIN db_lec3.employees AS e ON o.employee_id = e.employee_id
INNER JOIN db_lec3.shippers AS sh ON o.shipper_id = sh.id
INNER JOIN db_lec3.products AS p ON od.product_id = p.id
INNER JOIN db_lec3.categories AS cat ON p.category_id = cat.id
INNER JOIN db_lec3.suppliers AS sup ON p.supplier_id = sup.id
GROUP BY cat.name
HAVING AVG(od.quantity) > 21
ORDER BY row_count DESC
LIMIT 4 OFFSET 1;