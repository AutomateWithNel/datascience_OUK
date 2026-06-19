---
type: quiz-answers
course_code: DSC 201
course_title: Python for Data Science
module: 1
tags:
  - dsc201
  - module-01
  - quiz
  - numpy
---

# Module 01 - Quizzes

## Availability Summary

| Module | Quiz | Moodle state | Questions read | Action |
| --- | --- | --- | --- | --- |
| Module 1 | Comprehension Quiz | finished | 0 | Review blocked by Moodle |
| Module 1 | Module 1 Practical Task | finished | 1 | Review readable |
| Module 1 | Test Your Knowledge | finished | 1 | Review readable |
| Module 2 | Module 2 Mastery quiz | in progress | 5 | Questions and answers below |
| Module 2 | Module 2: Practical task | in progress | 4 | Questions and answers below |
| Module 2 | Module 2_end quiz | in progress | 7 | Questions and answers below |
| Module 3 | Module 3 Mastery quiz | in progress | 8 | Questions and answers below |
| Module 4 | Module 4 Mastery quiz | in progress | 5 | Questions and answers below |
| Module 5 | Module 5:Test Your Knowledge | in progress | 8 | Questions and answers below |

---

## Comprehension Quiz
*Note: Review is blocked by Moodle. Below are the class quiz questions and answers.*

### Question 1
**How can you create a 2x2 identity matrix using NumPy?**
* **d. np.eye(2)** (Correct - `np.eye()` creates an identity matrix with the specified number of rows/columns).

### Question 2
**How do you create a 1D array of numbers from 0 to 9 in NumPy?**
* **d. np.arange(0, 10)** (Correct - `arange` returns evenly spaced values within a given interval, similar to Python's `range()`).

### Question 3
**How do you find the index of the maximum value in a NumPy array a?**
* **a. Both B and D (a.argmax() and np.argmax(a))** (Correct - both the array method `a.argmax()` and the numpy function `np.argmax(a)` return the index of the maximum value). *(Note: The original option text had a typo saying "Both A and B", but logically it refers to the two valid functions listed).*

### Question 4
**If a = np.array([[1, 2], [3, 4]]), what does a.T return?**
* **b. array([[1, 3], [2, 4]])** (Correct - `.T` returns the transpose of the matrix, swapping rows and columns).

### Question 5
**What does the function np.mean() do when applied to a NumPy array?**
* **a. Calculates the mean (average) value** (Correct).

### Question 6
**What will be the result of the following code? `np.array([1, 2, 3]) * 2`**
* **a. array([2, 4, 6])** (Correct - arithmetic operations in NumPy are performed element-wise).

### Question 7
**Which function is used to create a NumPy array?**
* **c. numpy.array()** (Correct).

### Question 8
**Which NumPy function is used to find the square root of each element in an array?**
* **d. np.sqrt()** (Correct - this is the standard universal function for square roots).

### Question 9
**Which of the following methods will create an array of zeros with shape (3, 4)?**
* **d. np.zeros((3, 4))** (Correct - the shape must be passed as a tuple, hence the double parentheses).

### Question 10
**Which of the following operations will correctly add two arrays, a and b, element-wise?**
* **c. Both B and D** (Correct - you can use the built-in `+` operator `a + b` or the universal function `np.add(a, b)`). *(Note: Original text likely meant "Both B and D").*

---

## Module 1 Practical Task (Practical Quiz)
*Note: Read from completed review.*

### Question 1
**Prompt:** Create two NumPy arrays with the elements `1, 2, 3, 4, 5` and `5, 4, 3, 2, 1`. Calculate and display element-wise addition, subtraction, multiplication, and division of these arrays.

#### 1. Import the Library and Create the Arrays
```python
import numpy as np

arr1 = np.array([1, 2, 3, 4, 5])
arr2 = np.array([5, 4, 3, 2, 1])
```

#### 2. Calculate Element-Wise Operations
```python
addition = arr1 + arr2
subtraction = arr1 - arr2
multiplication = arr1 * arr2
division = arr1 / arr2
```

#### 3. Display the Output
```python
print(f"Addition: {addition}")
print(f"Subtraction: {subtraction}")
print(f"Multiplication: {multiplication}")
print(f"Division: {division}")
```

**Expected Output:**
```text
Addition: [6 6 6 6 6]
Subtraction: [-4 -2  0  2  4]
Multiplication: [5 8 9 8 5]
Division: [0.2 0.5 1.  2.  5. ]
```

### Question 2
**Prompt:** Create a NumPy array with values `[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]`. Calculate and print the square root and logarithm (base 10) of each element in the array. Display the original array, the resultant square root array, and the resultant log array formatted to 2 decimal places.

#### 1. Create the Original Array
```python
import numpy as np

original_vals = np.array([1, 4, 9, 16, 25, 36, 49, 64, 81, 100])
```

#### 2. Calculate Square Roots and Logarithms
```python
sqrt_vals = np.sqrt(original_vals)
log10_vals = np.log10(original_vals)
```

#### 3. Format and Display the Output
```python
np.set_printoptions(precision=2, suppress=True)

print(f"Original values: {original_vals}")
print(f"Square roots: {sqrt_vals}")
print(f"Logarithms (base 10): {log10_vals}")
```

**Expected Output:**
```text
Original values: [  1   4   9  16  25  36  49  64  81 100]
Square roots: [ 1.  2.  3.  4.  5.  6.  7.  8.  9. 10.]
Logarithms (base 10): [0.   0.6  0.95 1.2  1.4  1.56 1.69 1.81 1.91 2.  ]
```

---

## Test Your Knowledge (Test Knowledge Assignment)
*Note: Read from completed review.*

### Question 1
**How can you create a 3x3 array of ones?**
* **d. np.ones((3, 3))** (Correct - the shape of the array must be passed as a tuple, which is why the double parentheses are used).

### Question 2
**What does the function np.arange(5, 15, 2) produce?**
* **b. An array of numbers from 5 to 15 with a step of 2** (Correct - the arguments are `start=5`, `stop=15` (exclusive), and `step=2`, which will output the array `[5, 7, 9, 11, 13]`).

### Question 3
**What will be the result of the following code? `np.array([1, 2, 3]) ** 2`**
* **b. array([1, 4, 9])** (Correct - the `**` operator raises each individual element in the array to the power of 2).

### Question 4
**Which NumPy function would you use to find the maximum value in an array?**
* **b. np.max()** (Correct - `np.max()` returns the maximum value. Note that `np.argmax()` would return the *index* of the maximum value, and `np.maximum()` is used to compare two arrays element-wise).
