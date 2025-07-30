# 💳 BankVault: A Mini Core Banking System using PostgreSQL PL/pgSQL

> A compact project built to demonstrate key concepts of PostgreSQL’s procedural language (PL/pgSQL) through a real-world banking simulation.

---

## 📘 Project Overview

**BankVault** is a minimal yet practical simulation of a core banking system that includes:
- Opening accounts
- Handling deposits and withdrawals
- Tracking transaction history
- Logging every operation for auditing
- Gracefully handling runtime errors

This project is designed for learning and demonstration purposes, ideal for showcasing your PostgreSQL skills in interviews or on professional platforms like LinkedIn.

---

## 🧩 Concepts Demonstrated

The project uses the following PL/pgSQL features, each organized into dedicated folders:

| Folder        | Description |
|---------------|-------------|
| `tables/`      | SQL scripts for creating required tables (`accounts`, `transactions`, `txn_logs`) |
| `procedures/`  | Contains procedures for account operations like opening, depositing, withdrawing, and printing transaction history |
| `functions/`   | Includes reusable logic like the audit logging function |
| `triggers/`    | Contains triggers that automatically log transactions into an audit table |
| `cursors/`     | Demonstrates use of explicit cursors to fetch and display data |
| `exceptions/`  | Covers error-handling scenarios for runtime errors |
