---
type: assignment
course_code: CSC 207
module: 1
---

# Module 01 - Programming Paradigms Report

**Prompt:** Listen to the provided video (https://www.youtube.com/watch?v=B1p5OlO5tWg&t=2s) explaining different programming techniques and benefits of OOP. Read the choral programming paper. Write a one-page report on different programming paradigms, structuring a simple program that calculates the area of a rectangle in both a procedural language (C) and an object-oriented language (Java) to bring out the paradigm differences.

---

## Programming Paradigms: Procedural vs. Object-Oriented

A programming paradigm dictates the fundamental style and logical structure of how software is written. While newer paradigms like choreographic programming (as discussed by Giallorenzo et al., 2024, focusing on distributed systems and communications as first-class entities) are emerging, the two most historically dominant paradigms are Procedural Programming and Object-Oriented Programming (OOP).

### Procedural Programming (e.g., C)
Procedural programming relies on a sequence of computational steps to be carried out. It structures the program around functions (procedures) and the flow of data. Data and the functions that manipulate that data are kept completely separate.

**Example: Calculating Rectangle Area in C**
```c
#include <stdio.h>

// Data structure is passive and separate from behavior
struct Rectangle {
    int width;
    int height;
};

// Function operates on the data structure
int calculateArea(struct Rectangle rect) {
    return rect.width * rect.height;
}

int main() {
    struct Rectangle myRect;
    myRect.width = 5;
    myRect.height = 10;
    
    printf("Area: %d\n", calculateArea(myRect));
    return 0;
}
```
*Characteristics:* The code is executed top-down. The `Rectangle` structure holds state, but it relies on external functions like `calculateArea` to give it meaning. If the program grows, managing which functions modify which structs becomes complex.

### Object-Oriented Programming (e.g., Java)
OOP shifts the focus from functions to "objects"—self-contained entities that bundle both state (attributes) and behavior (methods). This encapsulation makes code more modular, secure, and intuitive for modeling real-world problems.

**Example: Calculating Rectangle Area in Java**
```java
// Class bundles data and behavior together
class Rectangle {
    private int width;
    private int height;

    // Constructor
    public Rectangle(int width, int height) {
        this.width = width;
        this.height = height;
    }

    // Method operates on its own internal state
    public int calculateArea() {
        return this.width * this.height;
    }
}

public class Main {
    public static void main(String[] args) {
        // Instantiate an object
        Rectangle myRect = new Rectangle(5, 10);
        System.out.println("Area: " + myRect.calculateArea());
    }
}
```
*Characteristics:* The `Rectangle` class encapsulates both the dimensions and the logic to calculate its area. Access to the dimensions can be restricted (using `private`), preventing unintended interference from the `main` program.

### Conclusion
Procedural programming is straightforward and efficient for small scripts or system-level tasks. However, as demonstrated by the Java example, OOP's encapsulation provides better code organization, data security, and reusability, making it vastly superior for large, complex, and scalable software systems.
