---
type: assignment
course_code: CSC 207
module: 1
---

# Module 01 - Case Studies

## Case Study 1 & 2: Online Library Management System

**Prompt:** An online library management system is designed to manage the borrowing and returning of books in a library. This system needs to handle multiple types of users (e.g., students, teachers, librarians) and maintain a catalog of books. The system should be scalable, easy to maintain, and modular to allow for future enhancements. Explain the different programming paradigms that can be used in developing a system for the same.

### 1. Procedural Programming Paradigm
In a procedural approach, the library system would be designed around the flow of data and the specific procedures (functions) required to manage the library.

*   **Structure:** Data structures (like `structs` in C) would be defined for `User` and `Book`. Separate functions would be written to manipulate these structures, such as `borrow_book(User, Book)`, `return_book(User, Book)`, and `add_user(User)`.
*   **Drawbacks for this system:** As the system scales to handle different types of users (students vs. teachers) and complex states, procedural code can become a tangled web of functions and global data. Maintaining data integrity (ensuring a student doesn't bypass borrowing rules) is difficult because the data is not encapsulated; any function can technically modify the `User` or `Book` records directly.

### 2. Object-Oriented Programming (OOP) Paradigm
OOP is exceptionally well-suited for this library system because the prompt requires handling distinct "entities" with specific behaviors, scalability, and modularity.

*   **Structure:** The system would be modeled using Classes to represent real-world entities. 
    *   **Classes & Objects:** A `Book` class would store attributes like title and ISBN, and methods like `checkAvailability()`.
    *   **Inheritance:** A base `User` class could handle basic login logic, while derived subclasses like `StudentUser`, `TeacherUser`, and `Librarian` would inherit common attributes but define their own specific borrowing limits or administrative privileges.
    *   **Encapsulation:** The system's state is protected. For example, the `is_borrowed` status of a `Book` object can only be changed via a secure `borrow()` method, preventing accidental data corruption.
    *   **Polymorphism:** A single method `calculateLateFee()` could be implemented differently for students (who might pay a fine) versus teachers (who might have a grace period).
*   **Benefits for this system:** OOP directly answers the prompt's requirements for modularity and scalability. Adding a new user type in the future simply requires creating a new subclass, without breaking or rewriting existing code.
