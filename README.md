# E-Commerce SQL Database 🛒

![Language](https://img.shields.io/badge/Language-SQL-blue)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-336791?logo=postgresql&logoColor=white)](https://postgresql.org/)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

A PostgreSQL database schema for a simple e-commerce platform, built as a portfolio project. Includes normalized tables, sales history tracking, and ready-to-use analytical queries — no ORM, no framework, just plain SQL.

## 🚀 Features

* Normalized schema: users, categories, products and purchases as separate tables
* Unique constraints on username and email, hashed passwords
* Purchase history table decoupled from live stock (tracks price at time of sale)
* Data integrity via foreign keys and `CHECK` constraints (no negative price/quantity)
* Indexes on the most queried columns (purchase date, product, category)
* Ready-made analytical queries: monthly revenue, best-selling products, revenue by category, top spenders
* Zero dependencies: just run the `.sql` files against PostgreSQL

## 📁 Project structure

```
ecommerce-sql-db/
├── schema.sql       # core tables: users, categories, products
├── purchases.sql     # purchases table (sales history)
├── queries.sql         # example analytical queries
├── seed.sql               # sample data to populate the database
└── README.md
```

## 🎨 Schema

```mermaid
erDiagram
    USERS ||--o{ PURCHASES : makes
    PRODUCTS ||--o{ PURCHASES : "sold in"
    CATEGORIES ||--o{ PRODUCTS : groups

    USERS {
        int user_id PK
        string username
        string email
        string password_hash
        timestamp created_at
    }
    CATEGORIES {
        int category_id PK
        string name
    }
    PRODUCTS {
        int product_id PK
        string description
        int category_id FK
        numeric price
        int quantity
    }
    PURCHASES {
        int purchase_id PK
        int user_id FK
        int product_id FK
        int quantity
        numeric unit_price
        timestamp purchase_date
    }
```

## ▶️ Usage

No build tools required. Clone the repo and run the SQL files against a PostgreSQL database:

```bash
psql -U postgres -d your_database -f schema.sql
psql -U postgres -d your_database -f purchases.sql
psql -U postgres -d your_database -f seed.sql
```

Then try the example queries in `queries.sql`.

## ⚠️ Disclaimer

This is a portfolio project meant to demonstrate schema design and query writing — not a production-ready e-commerce backend.

## 👨‍💻 Author

Francesco Falone — personal project / SQL portfolio piece.

## 📄 License

This project is licensed under the MIT License — see [LICENSE](LICENSE).
