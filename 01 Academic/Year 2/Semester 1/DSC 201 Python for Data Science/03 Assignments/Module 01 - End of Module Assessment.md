---
type: assignment
course_code: DSC 201
module: 1
---

# Module 01 - End of Module Assessment (Submission)

## Question 1
```python
import numpy as np

arr = np.array([4, 8, 15, 16, 23, 42])

mean_val = np.mean(arr)
median_val = np.median(arr)
std_val = np.std(arr)

print(f"Mean: {mean_val}")
print(f"Median: {median_val}")
print(f"Standard Deviation: {std_val:.2f}")
```

**Output:**
```text
Mean: 18.0
Median: 15.5
Standard Deviation: 12.40
```

---

## Question 2
```python
import numpy as np

arr1 = np.array([1, 2, 3, 4, 5])
arr2 = np.array([5, 4, 3, 2, 1])

addition = arr1 + arr2
subtraction = arr1 - arr2
multiplication = arr1 * arr2
division = arr1 / arr2

print(f"Addition: {addition}")
print(f"Subtraction: {subtraction}")
print(f"Multiplication: {multiplication}")
print(f"Division: {division}")
```

**Output:**
```text
Addition: [6 6 6 6 6]
Subtraction: [-4 -2  0  2  4]
Multiplication: [5 8 9 8 5]
Division: [0.2 0.5 1.  2.  5. ]
```

---

## Question 3
```python
import numpy as np

vals = np.array([1, 4, 9, 16, 25, 36, 49, 64, 81, 100])
sqrt_vals = np.sqrt(vals)

print(f"Square Roots: {sqrt_vals}")
```

**Output:**
```text
Square Roots: [ 1.  2.  3.  4.  5.  6.  7.  8.  9. 10.]
```
