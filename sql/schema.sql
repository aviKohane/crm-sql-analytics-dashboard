CREATE DATABASE crm_dashboard;

USE crm_dashboard;

CREATE TABLE users (
    user_id INT NOT NULL,
    full_name VARCHAR(255),
    phone_number VARCHAR(20),
    created_at DATETIME,
    PRIMARY KEY (user_id)
);

CREATE TABLE products (
    product_id INT NOT NULL,
    product_name VARCHAR(255),
    product_quantity INT,
    product_price DECIMAL(10, 2),
    PRIMARY KEY (product_id)
);

CREATE TABLE transactions (
    transaction_id INT NOT NULL,
    user_id INT NOT NULL,
    transaction_date DATETIME,
    payment_status VARCHAR(255),
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE transaction_items (
    transaction_items_id INT NOT NULL,
    transaction_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    unit_price DECIMAL(10, 2),
    PRIMARY KEY (transaction_items_id),
    FOREIGN KEY (transaction_id) REFERENCES transactions(transaction_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);