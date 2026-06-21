---
type: lecture-note
year: 2
semester: 1
course_code: DSC 201
course_title: Python for Data Science
module: 1
source_files:
  - [[../01 Source Materials/DSC 201 - Module 01 - NumPy.pdf]]
tags:
  - dsc201
  - module-01
  - numpy
---

# Module 01 - Introduction to NumPy

## Source
- [[../01 Source Materials/DSC 201 - Module 01 - NumPy.pdf]]

## Learning Outcomes
By the end of this module, you should be able to:
1. Identify the purpose of Numpy `ndarray` and NumPy universal functions (`ufuncs`) in different scenarios.
2. Explain how to access and modify elements in a `ndarray`.
3. Use Numpy functions to perform linear algebra operations on matrices, such as matrix multiplication and finding eigenvalues.
4. Design and implement a program to generate, save, and load pseudorandom numbers using Numpy.

## Key Concepts (From Source)

### Introduction to NumPy
- **NumPy** stands for Numerical Python. It is a library used for handling large multidimensional arrays and matrices, providing efficient operations and mathematical functions.
- To install and import:
  ```python
  pip install numpy
  import numpy as np
  ```
- Unlike Python lists, NumPy arrays contain elements of only **one data type**. If multiple types are present, NumPy will attempt to cast them.

### Array Creation
- **From a list:** `np.array(my_list)`
- **From scratch:**
  - `np.zeros(shape)`: Array filled with zeros.
  - `np.zeros_like(array)`: Array of zeros with the same shape/attributes as a given array.
  - `np.ones(shape)`: Array filled with ones.
  - `np.ones_like(array)`: Array of ones matching a given array.
  - `np.full(shape, fill_value)`: Array filled with a specified value.
  - `np.asarray(input)`: Converts input to an array.
  - `np.arange(start, stop, step)`: Returns an array of evenly spaced values within a given interval.
  - `np.eye(rows, cols, k)`: Creates an identity matrix (1s on the diagonal, 0s elsewhere).

### Attributes of `ndarray`
- `ndim`: The number of axes (dimensions) of the array.
- `shape`: A tuple indicating the size of the array in each dimension (rows, columns).
- `size`: The total number of elements in the array.
- `dtype`: The data type of the elements in the array.

### Basic Operations
- Arithmetic operations are applied **element-wise**.
- Addition: `array_a + array_b`
- Subtraction: `array_d - array_c`
- Matrix Multiplication: Instead of `*` (which is element-wise), use the `@` operator or the `.dot()` function.
- **Unary operations:** NumPy provides functions to compute the sum (`.sum()`), find the minimum (`.min()`), and maximum (`.max()`) elements of an array.

### Universal Functions (ufuncs)
- NumPy provides universal functions for performing mathematical operations element-wise across arrays, such as `np.cos()`, `np.sin()`, and `np.exp()`.
