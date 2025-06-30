-- init.sql
-- This script initializes the entire CRM SQL database and runs all KPIs.

SOURCE sql/schema.sql;
SOURCE sql/seed_users.sql;
SOURCE sql/seed_products.sql;
SOURCE sql/seed_transactions.sql;
SOURCE sql/seed_transaction_items.sql;
SOURCE queries/kpis.sql;
