---
type: assignment
course_code: CSC 207
module: 1
---

# Module 01 - Test Knowledge Quiz Answers

## Multiple Choice & Theory

**Question 1: Which of the following types of inheritance is not supported in Java?**
*   **D. Multiple Inheritance through classes** (Java does not support inheriting from multiple classes to avoid the Diamond Problem, though it does allow multiple inheritance through interfaces).

**Question: What is inheritance in Object-Oriented Programming?**
*   **a. A feature that allows a class to inherit methods and fields from another class**

**Question: What is the primary benefit of inheritance in OOP?**
*   **d. It promotes code reuse and organizes code into hierarchical structures**

**Question: Which keyword is used in Java to indicate that a class is inheriting from another class?**
*   **a. extends**

**Question: Which of the following statements is true about method overriding in inheritance?**
*   **d. A subclass can override a method from its superclass to provide its own implementation**

**Question: Which type of inheritance is allowed in Java?**
*   **d. Multilevel inheritance and single inheritance** (And also *Multiple inheritance through interfaces* as indicated in option A).

---

## Matching Sections

**Matching (From Image/Question 6):**
*   The ability to use the same code across multiple classes $\rightarrow$ **Code Reusability**
*   The arrangement of classes in a parent-child relationship $\rightarrow$ **Hierarchical Structure**
*   Having multiple methods with the same name but different parameters $\rightarrow$ **Method Overloading**
*   Used to establish inheritance between two classes $\rightarrow$ **Extends**
*   A subclass providing its own version of a superclass method $\rightarrow$ **Method Overriding**

**Matching (From Text/Question 7):**
*   A type of inheritance where a class can inherit from only one class $\rightarrow$ **Single Inheritance**
*   A class that inherits from another class $\rightarrow$ **Subclass**
*   Redefining a superclass method in a subclass $\rightarrow$ **Method Overriding**
*   A type of inheritance where a class is a subclass of another subclass $\rightarrow$ **Multilevel Inheritance**
*   A class from which another class inherits $\rightarrow$ **Superclass**
*   A keyword used in Java to define inheritance $\rightarrow$ **extends**

---

## Code Implementations

**Coding 1: Animal and Dog (Method Overriding)**
```java
class Dog extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Dog barks");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog myDog = new Dog();
        myDog.makeSound();
    }
}
```

**Coding 2: Using super Keyword**
```java
class Car extends Vehicle {
    @Override
    public void start() {
        super.start(); // Call the superclass method
        System.out.println("Car started");
    }
}

public class Main {
    public static void main(String[] args) {
        Car myCar = new Car();
        myCar.start();
    }
}
```

**Coding 3: Inheritance with Constructors**
```java
class Employee extends Person {
    public Employee(String name, int id) {
        super(name); // Call the Person constructor
        System.out.println("Employee: " + name + ", ID: " + id);
    }
}

public class Main {
    public static void main(String[] args) {
        Employee emp = new Employee("Alice", 101);
    }
}
```

**Coding 4: Method Overriding (Shapes)**
```java
class Circle extends Shape {
    @Override
    public void draw() {
        System.out.println("Drawing circle");
    }
}

class Rectangle extends Shape {
    @Override
    public void draw() {
        System.out.println("Drawing rectangle");
    }
}

public class Main {
    public static void main(String[] args) {
        Circle circle = new Circle();
        circle.draw();
        
        Rectangle rectangle = new Rectangle();
        rectangle.draw();
    }
}
```

**Coding 5: Output Prediction (Dog)**
```java
// Code provided in snippet
Dog myDog = new Dog();
myDog.eat();
myDog.bark();
```
**Output:**
```text
This animal eats food.
The dog barks.
```
