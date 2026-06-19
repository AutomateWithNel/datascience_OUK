---
type: lecture-note
year: 2
semester: 1
course_code: CSC 209
course_title: Database Systems
module: 11
source_files: []
tags:
  - csc209
  - module-11
---

# Module 11 - Distributed Databases

## Introduction to Databases and DBMS
A database is an ordered collection of related data built for a specific purpose, often organized into tables representing real-world entities. A Database Management System (DBMS) enables the creation, maintenance, and manipulation of these databases. 
- **Examples of DBMS Packages:** MySQL, Oracle, SQL Server, PostgreSQL, dBASE, FoxPro.
- **Application Areas:** ATMs, Train Reservation Systems, Employee Management, Student Information Systems.

## Database Schema Architecture (ANSI/SPARC)
Databases are often represented through a three-schema architecture to separate the user application from the physical database:
1. **Internal Level (Internal Schema):** Describes the physical structure, internal storage details, and access paths.
2. **Conceptual Level (Conceptual Schema):** Describes the structure of the whole database (entities, attributes, relationships) while hiding physical storage details.
3. **External Level (View Level):** Describes the portion of a database relevant to a specific user, hiding the rest.

## DBMS Models
- **Hierarchical DBMS:** Parent-child relationships using a "tree" data structure. Fast and simple.
- **Network DBMS:** Many-to-many relationships using a "graph" data structure.
- **Relational DBMS (RDBMS):** Database represented as tables of values (rows = tuples, columns = attributes). The most popular model.
- **Object-Oriented DBMS:** Uses small, reusable elements called objects accessed through pointers.

## Distributed DBMS (DDBMS)
A Distributed Database is a collection of logically interrelated databases physically spread across various locations that communicate via a computer network. A DDBMS manages this as if it were stored in a single location.

### Why Use a Distributed Database?
- **Distributed Organizational Units:** Organizations are globally distributed and need local data.
- **Data Sharing:** Units need to communicate and share resources.
- **OLTP and OLAP Support:** Synchronized data supports both transactional and analytical processing.
- **Database Recovery:** Replication ensures data remains accessible even if one site fails.
- **Multiple Applications Support:** Provides uniform functionality across different platforms.

### Disadvantages and Challenges
- **Complexity and Cost:** Demands complex software to provide transparency and coordination.
- **Processing Overhead:** Additional calculations and network communications are needed for uniformity.
- **Data Integrity:** Synchronizing updates across multiple sites is challenging.
- **Improper Distribution:** Bad data distribution can lead to very slow query responses.

## Types of Distributed Databases
### Homogeneous Distributed Database
All sites use identical DBMS and operating systems.
- **Autonomous:** Independent databases integrated by a controlling application (message passing).
- **Non-autonomous:** Central/master DBMS coordinates updates across sites.

### Heterogeneous Distributed Database
Different sites have different operating systems, DBMS products, or data models.
- **Federated:** Independent systems integrated to function as a single database system.
- **Un-federated:** Databases accessed through a central coordinating module.

## DDBMS Architectures
Architectures depend on Distribution, Autonomy, and Heterogeneity:
- Client-Server Architecture
- Peer-to-Peer Architecture
- Multi-DBMS Architecture

## Design Alternatives and Strategies
Design alternatives include: Non-replicated/non-fragmented, Fully replicated, Partially replicated, Fragmented, or Mixed.

**Primary Strategies:**
- **Replication:** Storing separate copies of the database at two or more sites.
- **Fragmentation:** Dividing a table into a set of smaller tables (fragments). Types include horizontal, vertical, and hybrid. **Reconstructiveness** is a requirement (the original table must be able to be reconstructed from fragments).

## Distribution Transparency
Transparency is the separation of high-level semantics from low-level implementation details, hiding the complexities of distribution from the user.
- **Location transparency:** User does not need to know where data is physically stored.
- **Fragmentation transparency:** User does not need to know how data is fragmented.
- **Replication transparency:** User does not need to know if data is replicated.

## Database Control
Database control ensures correct data is provided to authentic users by enforcing regulations. The three dimensions are:
1. **Authentication:** Ensuring only legitimate users gain access. Enforced at the client computer level and database software level.
2. **Access Control:** A user's rights/privileges for DBMS operations (create, drop, update, query). Often managed via **Roles**.
3. **Integrity Constraints:** Enforcing rules for correct data, including Data type integrity, Entity integrity, and Referential integrity.
