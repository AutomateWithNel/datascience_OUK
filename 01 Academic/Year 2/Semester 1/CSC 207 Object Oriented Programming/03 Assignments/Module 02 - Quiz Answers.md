---
type: assignment
course_code: CSC 207
module: 2
---

# Module 02 - End of Module Assessment Quiz Answers

## Multiple Choice Questions

**What is the purpose of a class in Java?**
*   **To define a blueprint for objects**

**Which of the following statements correctly creates an instance of a class named Student?**
*   **Student student = new Student();**

**What is a constructor in Java?**
*   **A special method used to initialize objects**

**Given a class definition, which of the following correctly sets the name of the person to "John"?**
*   **Person p = new Person(); p.setName("John");**

**Which access modifier allows a class attribute or method to be accessible from any other class?**
*   **public**

---

## Matching Sections

**Match each class component to its correct description:**
*   Variables that hold the data/state of an object $\rightarrow$ **Attributes**
*   Functions that describe the behaviors of an object $\rightarrow$ **Method**
*   A blueprint for creating objects $\rightarrow$ **Class**
*   An instance of a class $\rightarrow$ **Objects**
*   A special method used to initialize objects $\rightarrow$ **Constructor**

**Match each concept with the correct explanation:**
*   Defines the structure of an object, including attributes and methods $\rightarrow$ **Class**
*   An instance created from a class $\rightarrow$ **Object**
*   Hiding the internal details of an object and exposing only what is necessary $\rightarrow$ **Encapsulation**
*   Special method that initializes an object $\rightarrow$ **Constructor**
*   The process of creating an object from a class $\rightarrow$ **Instantiation**

**Match each OOP term to its correct definition:**
*   Bundling data and methods into a single unit $\rightarrow$ **Encapsulation**
*   Creating an instance of a class (object creation) $\rightarrow$ **Instantiation**
*   A method that modifies or updates the value of an attribute $\rightarrow$ **Setter Method**
*   A method that retrieves the value of an attribute $\rightarrow$ **Getter Method**
*   Data that can only be accessed from within the class $\rightarrow$ **Private Attributes**

---

## Coding Implementations

### 1. Using Getter and Setter Methods (Car Class)

**Class Implementation**
```java
class Car {
    private String make;
    private String model;
    private int year;

    public void setMake(String make) { this.make = make; }
    public String getMake() { return make; }

    public void setModel(String model) { this.model = model; }
    public String getModel() { return model; }

    public void setYear(int year) { this.year = year; }
    public int getYear() { return year; }
}
```

**Test**
```java
Car car1 = new Car();
car1.setMake("Toyota");
car1.setModel("Corolla");
car1.setYear(2020);
System.out.println("Make: " + car1.getMake() + ", Model: " + car1.getModel() + ", Year: " + car1.getYear());
```

**Result**
```text
Make: Toyota, Model: Corolla, Year: 2020
```

---

### 2. Person Class

**Class Implementation**
```java
class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
        System.out.println("Name: " + this.name + ", Age: " + this.age);
    }
}
```

**Test**
```java
Person person = new Person("John Doe", 30);
```

**Result**
```text
Name: John Doe, Age: 30
```

---

### 3. Constructor Implementation (Book Class)

**Class Implementation**
```java
class Book {
    private String title;
    private String author;
    private int yearPublished;

    public Book(String title, String author, int yearPublished) {
        this.title = title;
        this.author = author;
        this.yearPublished = yearPublished;
        System.out.println("Title: " + this.title + ", Author: " + this.author + ", Year Published: " + this.yearPublished);
    }
}
```

**Test 1**
```java
Book book1 = new Book("The Great Gatsby", "F. Scott Fitzgerald", 1925);
```
**Expected**
```text
Title: The Great Gatsby, Author: F. Scott Fitzgerald, Year Published: 1925
```

**Test 2**
```java
Book book2 = new Book("1984", "George Orwell", 1949);
```
**Expected**
```text
Title: 1984, Author: George Orwell, Year Published: 1949
```

**Test 3**
```java
Book book3 = new Book("To Kill a Mockingbird", "Harper Lee", 1960);
```
**Expected**
```text
Title: To Kill a Mockingbird, Author: Harper Lee, Year Published: 1960
```

**Test 4**
```java
Book book4 = new Book("Moby-Dick", "Herman Melville", 1851);
```
**Expected**
```text
Title: Moby-Dick, Author: Herman Melville, Year Published: 1851
```
