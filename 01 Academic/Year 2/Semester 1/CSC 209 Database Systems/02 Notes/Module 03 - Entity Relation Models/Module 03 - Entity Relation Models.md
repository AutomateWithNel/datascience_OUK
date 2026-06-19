---
type: lecture-note
year: 2
semester: 1
course_code: CSC 209
course_title: Database Systems
module: 3
source_files:
  - [[../../01 Source Materials/Module 03 - Entity Relation Models/CSC 209 - Module 03 - Entity Relation Modeling.pdf]]
tags:
  - source-backed
  - csc209
  - module-03
---

# Module 03 - Entity Relation Models

## Source
- [[../../01 Source Materials/Module 03 - Entity Relation Models/CSC 209 - Module 03 - Entity Relation Modeling.pdf]]

## Key Ideas
- The ER model is used to capture the overall logical structure of a database before implementation.
- Database design moves from understanding user data needs, to conceptual modeling, to logical design, and finally physical design.
- The three basic ER concepts emphasized by the source are entity sets, relationship sets, and attributes.
- ER modeling helps avoid bad designs by making structure, relationships, and business requirements visible early.

## Definitions
- `Entity`: a distinguishable object or concept in the enterprise.
- `Attribute`: a property that describes an entity.
- `Relationship`: an association among two or more entities.
- `Cardinality`: the number-pattern of participation between entities, such as `1:1`, `1:N`, or `M:N`.
- `ER diagram`: a graphical representation of entities, attributes, and relationships.

## Design Flow From The Source
- First, characterize the data needs of users fully.
- Next, choose a data model and convert requirements into a conceptual schema.
- Then, describe the operations or transactions that will be performed on the data.
- Finally, move to logical and physical design for implementation.

## Why ER Modeling Matters
- It helps model the enterprise clearly before building tables.
- It reduces the risk of redundancy and incompleteness in the final schema.
- It provides a bridge between real-world requirements and relational database design.

## Diagram Symbols Mentioned
- Rectangles represent entities.
- Ellipses represent attributes.
- Diamonds represent relationships.
- Lines connect entities to attributes and relationships.

## Questions
- Which ER extensions does your lecturer expect: weak entities, specialization, aggregation, or only core ER?
- Will exam questions require drawing ER diagrams or only interpreting them?
