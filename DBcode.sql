DROP TABLE IF EXISTS SupplierLocation;
DROP TABLE IF EXISTS SupplierProduct;
DROP TABLE IF EXISTS EmployeeRole;
DROP TABLE IF EXISTS OrderItem;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Order_;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Branch;
DROP TABLE IF EXISTS Discount;
DROP TABLE IF EXISTS Review;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address VARCHAR(200),
    date_of_birth DATE,
    location_id INT,
    discount_id INT,
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    description VARCHAR(500),
    category VARCHAR(50),
    quantity_in_stock INT,
    date_added DATETIME
);

CREATE TABLE Order_ (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    position VARCHAR(50),
    address VARCHAR(200),
    location_id INT,
    salary INT,
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_person VARCHAR(100),
    address VARCHAR(200),
    phone_number VARCHAR(20),
    email VARCHAR(100),
    rating DECIMAL(2, 1),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE SupplierLocation(
    supplier_id INT,
    location_id INT,
	PRIMARY KEY (supplier_id, location_id),
  	FOREIGN KEY (location_id) REFERENCES Location(location_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

CREATE TABLE OrderItem (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    discount DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Order_(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE EmployeeRole (
    employee_id INT,
    role VARCHAR(50),
    start_date DATE,
    end_date DATE,
    department VARCHAR(50),
    supervisor_id INT,
    job_description TEXT,
    PRIMARY KEY (employee_id, role),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE SupplierProduct (
    supplier_id INT,
    product_id INT,
    product_name VARCHAR(100),
    product_description TEXT,
    PRIMARY KEY (supplier_id, product_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
CREATE TABLE Discount(
    discount_id INT,
    start_date DATE,
    end_date DATE,
    discount_percentage INT,
    min_order_amount INT,
    description TEXT
);

CREATE TABLE Location(
    location_id INT,
    address VARCHAR(200),
    city DATE,
    state VARCHAR(100),
    postal_code VARCHAR(100),
    country VARCHAR(100),
    location_name VARCHAR(100)
);

CREATE TABLE Branch(
    branch_id INT,
    branch_name VARCHAR(100),
    location_id INT,
    FOREIGN KEY (location_id) REFERENCES Location(location_id)
);

CREATE TABLE Review(
    review_id INT,
    product_id INT,
    customer_id INT,
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

INSERT INTO Customer (customer_id, first_name, last_name, email, phone_number, address, date_of_birth, location_id, discount_id)
VALUES
    (1, 'Alice', 'Johnson', 'alice@example.com', '+123456789', '123 Elm St', '1985-03-15', 1, 1),
    (2, 'Bob', 'Smith', 'bob@example.com', '+987654321', '456 Oak St', '1990-06-20', 2, 2),
    (3, 'Charlie', 'Williams', 'charlie@example.com', '+111223344', '789 Pine St', '1988-12-05', 3, 3),
    (4, 'David', 'Brown', 'david@example.com', '+444555666', '101 Cedar St', '1995-08-30', 4, 4),
    (5, 'Eve', 'Davis', 'eve@example.com', '+777888999', '202 Maple St', '1982-02-10', 5, 5);
    
INSERT INTO Product(product_id, product_name, price, description, category, quantity_in_stock, date_added)
VALUES
    (1, 'Laptop', 899.99, 'High-performance laptop', 'Electronics', 50, '2023-01-10 09:00:00'),
    (2, 'Smartphone', 599.99, 'Flagship smartphone', 'Electronics', 100, '2023-01-12 09:30:00'),
    (3, 'Desk Chair', 149.99, 'Ergonomic desk chair', 'Furniture', 30, '2023-01-14 10:15:00'),
    (4, 'T-shirt', 19.99, 'Cotton T-shirt', 'Apparel', 200, '2023-01-16 11:20:00'),
    (5, 'Coffee Maker', 49.99, 'Automatic coffee maker', 'Appliances', 40, '2023-01-18 12:45:00');
   
INSERT INTO Employee (employee_id, first_name, last_name, email, phone_number, hire_date, position, address, location_id, salary)
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '+123456789', '2022-05-01', 'Manager', '123 Main St', 1, 60000),
    (2, 'Mary', 'Smith', 'mary.smith@example.com', '+987654321', '2022-06-15', 'Sales Associate', '456 Elm St', 2, 40000),
    (3, 'James', 'Johnson', 'james.johnson@example.com', '+111223344', '2022-07-10', 'Cashier', '789 Oak St', 3, 35000),
    (4, 'Emma', 'Williams', 'emma.williams@example.com', '+444555666', '2022-08-20', 'Store Clerk', '101 Pine St', 4, 32000),
    (5, 'Michael', 'Brown', 'michael.brown@example.com', '+777888999', '2022-09-05', 'Supervisor', '202 Cedar St', 5, 45000);
    
INSERT or IGNORE into Supplier(supplier_id, supplier_name, contact_person, address, phone_number, email, rating, location_id)
VALUES
    (1, 'Tech Supplier', 'Alex Johnson', '123 Tech St', '+123456789', 'alex@example.com', 4.5, 1),
    (2, 'Furniture Co.', 'Olivia Smith', '456 Furnish St', '+987654321', 'olivia@example.com', 4.2, 2),
    (3, 'Clothing Supplier', 'Charlie Brown', '789 Fabric St', '+111223344', 'charlie@example.com', 4.0, 3),
    (4, 'Coffee Supply', 'Ella Davis', '101 Beans St', '+444555666', 'ella@example.com', 4.8, 2),
    (3, 'Coffee Supply', 'Ella Davis', '101 Beans St', '+444555666', 'ella@example.com', 4.8, 2),
    (5, 'Appliance Distributors', 'Ryan White', '202 Electronics St', '+777888999', 'ryan@example.com', 4.4, 5),
    (5, 'Appliance Distributors', 'Ryan White', '202 Electronics St', '+777888999', 'ryan@example.com', 4.4, 4),
    (6, 'Appliance Distributors', 'Ryan White', '202 Electronics St', '+777888999', 'ryan@example.com', 2.4, 4),
    (7, 'Appliance Distributors', 'Ryan White', '202 Electronics St', '+777888999', 'ryan@example.com', 3.4, 4);

INSERT or IGNORE into Location(location_id, address, city, state, postal_code, country, location_name)
VALUES
    (1, '123 Main St', 'New York', 'NY', '10001', 'USA', 'Downtown Store'),
    (2, '456 Elm St', 'Los Angeles', 'CA', '90001', 'USA', 'Westside Store'),
    (3, '789 Oak St', 'Chicago', 'IL', '60601', 'USA', 'Uptown Store'),
    (4, '101 Pine St', 'San Francisco', 'CA', '94101', 'USA', 'Bay Area Store'),
    (5, '202 Cedar St', 'Miami', 'FL', '33101', 'USA', 'Beachside Store');

INSERT INTO Branch (branch_id, branch_name, location_id)
VALUES
    (1, 'Main Branch', 1),
    (2, 'West Branch', 2),
    (3, 'North Branch', 3),
    (4, 'Bay Area Branch', 4),
    (5, 'Beach Branch', 5);
  
INSERT INTO Order_ (order_id, customer_id, order_date, total_amount, payment_method, status)
VALUES
    (1, 1, '2023-01-20 14:30:00', 150.00, 'Credit Card', 'Shipped'),
    (2, 2, '2023-02-15 11:45:00', 250.00, 'PayPal', 'Delivered'),
    (3, 3, '2023-03-10 09:20:00', 100.00, 'Cash', 'Shipped'),
    (4, 4, '2023-04-05 17:10:00', 75.00, 'Credit Card', 'Delivered'),
    (5, 5, '2023-05-01 10:00:00', 200.00, 'PayPal', 'Shipped');
   
INSERT INTO EmployeeRole (employee_id, role, start_date, end_date, department, supervisor_id, job_description)
VALUES
    (1, 'Manager', '2022-05-01', NULL, 'Management', NULL, 'Oversee store operations'),
    (2, 'Sales Associate', '2022-06-15', NULL, 'Sales', 1, 'Assist customers with purchases'),
    (3, 'Cashier', '2022-07-10', NULL, 'Sales', 1, 'Handle customer payments'),
    (4, 'Store Clerk', '2022-08-20', NULL, 'Sales', 2, 'Manage inventory and store layout'),
    (5, 'Supervisor', '2022-09-05', NULL, 'Management', 1, 'Supervise employees and ensure store operations run smoothly');
    
INSERT INTO SupplierProduct (supplier_id, product_id, product_name, product_description)
VALUES
    (1, 1, 'Laptop', 'High-performance laptop'),
    (2, 3, 'Desk Chair', 'Ergonomic desk chair'),
    (3, 4, 'T-shirt', 'Cotton T-shirt'),
    (4, 2, 'Smartphone', 'Flagship smartphone'),
    (5, 5, 'Coffee Maker', 'Automatic coffee maker');
   
INSERT INTO Review (review_id, product_id, customer_id, review_text, review_date)
VALUES
    (1, 1, 1, 'Great laptop, fast delivery!', '2023-01-25'),
    (2, 2, 2, 'Excellent smartphone, good value for money.', '2023-02-20'),
    (3, 3, 3, 'Very comfortable chair, recommended.', '2023-03-15'),
    (4, 4, 4, 'Nice T-shirt, fits well.', '2023-04-10'),
    (5, 5, 5, 'Love the coffee maker, it brews quickly.', '2023-05-05');

INSERT INTO Discount (discount_id, start_date, end_date, discount_percentage, min_order_amount, description)
VALUES
    (1, '2023-01-01', '2023-03-31', 10, 100, 'Spring Sale'),
    (2, '2023-04-01', '2023-06-30', 5, 50, 'Summer Discount'),
    (3, '2023-07-01', '2023-09-30', 15, 150, 'Back to School Sale'),
    (4, '2023-10-01', '2023-12-31', 20, 200, 'Year-End Clearance'),
    (5, '2023-02-14', '2023-02-14', 50, 50, 'Valentines Day Special');
    
INSERT INTO OrderItem (order_item_id, order_id, product_id, quantity, unit_price, discount)
VALUES
    (1, 1, 1, 2, 899.99, 0),
    (2, 2, 2, 1, 599.99, 0),
    (3, 3, 3, 4, 149.99, 0);