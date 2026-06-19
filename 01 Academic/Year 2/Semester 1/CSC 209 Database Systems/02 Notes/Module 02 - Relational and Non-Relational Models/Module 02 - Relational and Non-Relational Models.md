---
type: lecture-note
year: 2
semester: 1
course_code: CSC 209
course_title: Database Systems
module: 2
source_files:
  - [[../../01 Source Materials/Module 02 - Relational and Non-Relational Models/CSC 209 - Module 02 - The Relational Model.pdf]]
  - [[../../01 Source Materials/Module 02 - Relational and Non-Relational Models/CSC 209 - Module 02 - Relational Model and Languages.pdf]]
tags:
  - source-backed
  - csc209
  - module-02
---

# Module 02 - Relational and Non-Relational Models

## Source
- [[../../01 Source Materials/Module 02 - Relational and Non-Relational Models/CSC 209 - Module 02 - The Relational Model.pdf]]
- [[../../01 Source Materials/Module 02 - Relational and Non-Relational Models/CSC 209 - Module 02 - Relational Model and Languages.pdf]]

## Key Ideas
- A database model defines the logical structure of a database and how data is stored, organized, and manipulated.
- The source introduces several models: hierarchical, network, relational, object-oriented, document-based, and key-value.
- The relational model is the dominant model in modern database systems and is based on E. F. Codd's work.
- In the relational model, data is logically organized into relations, usually represented as tables made of rows and columns.
- Relations are strengthened by keys, integrity rules, and relational languages such as SQL.

## Non-Relational Gap
- Add any course source on document, key-value, graph, or column-family databases here.

## Relational Vs Non-Relational
- Relational databases use tables, fixed schemas, normalization, and SQL.
- Non-relational databases use more flexible structures such as documents, key-value pairs, graphs, or column stores.
- Relational systems are stronger when data is structured, relationships are important, and consistency and transactions matter.
- Non-relational systems are often preferred when data is unstructured or semi-structured and horizontal scalability is a major need.

## Relational Model Terms From The Source
- `Relation`: a table with rows and columns.
- `Attribute`: a named column of a relation.
- `Tuple`: a row in a relation.
- `Domain`: the set of allowable values for an attribute.
- `Primary key`: a unique identifier for tuples in a relation.
- `Foreign key`: an attribute that links one relation to another.

## Historical Points Worth Remembering
- E. F. Codd proposed the relational model in 1970.
- System R was important in proving the practicality of the relational model.
- SQL emerged as the major relational query language through relational system development.
- Commercial RDBMS products grew out of early relational research projects.

## Modeling Guidance From The Source
- Identify entities and their attributes first.
- Choose primary keys for each entity.
- Define relationships such as one-to-one, one-to-many, and many-to-many.
- Use foreign keys to enforce those relationships.
- Normalize the database to reduce redundancy and anomalies.

## When To Choose Which Model
- Choose a relational model for structured data, strong consistency, and complex relationships.
- Choose a non-relational model when schema flexibility, scale, or high-speed simple access is more important.
- In scenario questions, check data structure, relationship complexity, transaction needs, and expected scale before deciding.

## Questions
- Which non-relational models does your lecturer emphasize beyond document and key-value systems?
- Does the course expect formal definitions of entity integrity and referential integrity in this module, or later with SQL and design topics?
