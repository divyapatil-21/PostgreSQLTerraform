\# PostgreSQL Infrastructure Automation



\## Overview



PostgreSQL Infrastructure Automation is a cross-platform automation project that installs, configures, and validates a PostgreSQL environment on both Windows and Ubuntu/Linux systems.



The project is designed to automate the complete database deployment lifecycle, including:



\* PostgreSQL Installation

\* PostgreSQL Configuration

\* Database Creation

\* Table Creation

\* Seed Data Loading

\* Deployment Verification



The goal is to enable a fresh machine setup with a single command.



\---



\# Architecture



```text

Git Clone

&#x20;   │

&#x20;   ▼

Setup Script

&#x20;   │

&#x20;   ├── Windows (setup.bat)

&#x20;   │       │

&#x20;   │       ├── Precheck

&#x20;   │       ├── PostgreSQL Detection

&#x20;   │       ├── Auto Download PostgreSQL

&#x20;   │       ├── Silent Installation

&#x20;   │       ├── Database Creation

&#x20;   │       ├── Table Creation

&#x20;   │       ├── Seed Data Load

&#x20;   │       └── Verification

&#x20;   │

&#x20;   └── Linux (setup.sh)

&#x20;           │

&#x20;           ├── Precheck

&#x20;           ├── PostgreSQL Installation

&#x20;           ├── PostgreSQL Configuration

&#x20;           ├── Database Creation

&#x20;           ├── Table Creation

&#x20;           ├── Seed Data Load

&#x20;           └── Verification

```



\---



\# Project Structure



```text

PostgreSQLTerraform/

│

├── config/

│   └── app-config.ps1

│

├── database/

│   ├── schema/

│   └── seed/

│

├── scripts/

│   ├── windows/

│   └── linux/

│

├── setup.bat

├── setup.sh

├── start.bat

├── start.sh

│

└── terraform/

```



\---



\# Database Details



Database Name:



```text

DataManagementDB

```



Tables:



```text

customers

products

orders

```



\---



\# Windows Deployment



\## Prerequisites



\* Windows 10 or Windows 11

\* Administrator PowerShell

\* Internet Connection

\* Git Installed



\## Clone Repository



```powershell

git clone https://github.com/divyapatil-21/PostgreSQLTerraform.git



cd PostgreSQLTerraform

```



\## Run Deployment



```powershell

.\\setup.bat

```



\## What Happens Internally



```text

1\. Precheck

2\. PostgreSQL Detection

3\. Auto Download PostgreSQL Installer

4\. Silent Installation

5\. PostgreSQL Configuration

6\. Database Creation

7\. Table Creation

8\. Seed Data Loading

9\. Deployment Verification

```



\---



\# Ubuntu Deployment



\## Prerequisites



\* Ubuntu 22.04+

\* Sudo Access

\* Internet Connection

\* Git Installed



\## Clone Repository



```bash

git clone https://github.com/divyapatil-21/PostgreSQLTerraform.git



cd PostgreSQLTerraform

```



\## Grant Permissions



```bash

chmod +x setup.sh

chmod +x scripts/linux/\*.sh

```



\## Run Deployment



```bash

sudo ./setup.sh

```



\## What Happens Internally



```text

1\. Precheck

2\. PostgreSQL Installation

3\. PostgreSQL Configuration

4\. Database Creation

5\. Table Creation

6\. Seed Data Loading

7\. Deployment Verification

```



\---



\# Verification Commands



\## Windows



Database Check



```powershell

\& "C:\\Program Files\\PostgreSQL\\16\\bin\\psql.exe" -U postgres -p 5433 -l

```



\---



\## Ubuntu



Database List



```bash

sudo -u postgres psql -p 5433 -l

```



Connect Database



```bash

sudo -u postgres psql -p 5433 -d DataManagementDB

```



Show Tables



```sql

\\dt

```



View Data



```sql

SELECT \* FROM customers;



SELECT \* FROM products;



SELECT \* FROM orders;

```



Exit PostgreSQL



```sql

\\q

```



\---



\# Start Scripts



\## Windows



```powershell

.\\start.bat

```



Purpose:



\* Validate PostgreSQL Service

\* Validate Database Connectivity

\* Display Current Database



\---



\## Ubuntu



```bash

./start.sh

```



Purpose:



\* Validate PostgreSQL Service

\* Validate Database Connectivity

\* Display Current Database



\---



\# Troubleshooting



\## PostgreSQL Not Installed



Run:



```powershell

.\\setup.bat

```



or



```bash

sudo ./setup.sh

```



The installation process will automatically continue.



\---



\## Permission Denied (Linux)



Run:



```bash

chmod +x setup.sh

chmod +x scripts/linux/\*.sh

```



\---



\## PostgreSQL Service Check



Windows:



```powershell

sc query postgresql-x64-16

```



Linux:



```bash

sudo systemctl status postgresql

```



\---



\# Features



\* Cross Platform Automation

\* Fresh Machine Support

\* Auto PostgreSQL Installation

\* Silent Installation

\* Database Provisioning

\* Seed Data Loading

\* Deployment Verification

\* Lightweight Repository

\* GitHub Ready



\---



\# Tested Platforms



| Platform         | Status |

| ---------------- | ------ |

| Windows 10       | Tested |

| Windows 11       | Tested |

| Ubuntu 22.04 LTS | Tested |



\---



\# Author



Divya Patil



PostgreSQL Infrastructure Automation Project



