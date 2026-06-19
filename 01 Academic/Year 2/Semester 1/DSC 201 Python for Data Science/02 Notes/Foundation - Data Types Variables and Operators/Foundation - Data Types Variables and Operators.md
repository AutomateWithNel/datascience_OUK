---
type: lecture-note
year: 2
semester: 1
course_code: DSC 201
course_title: Python for Data Science
module: foundation
source_files:
  - [[../../01 Source Materials/Foundation - Data Types Variables and Operators/DSC 201 - Foundation - Data Types and Variables.pdf]]
  - [[../../01 Source Materials/Foundation - Data Types Variables and Operators/DSC 201 - Foundation - Data Types Variables and Operators Slides.pdf]]
tags:
  - source-backed
  - dsc201
  - python
  - variables
  - data-types
  - operators
---

# Foundation - Data Types, Variables, and Operators

## Source
- [[../../01 Source Materials/Foundation - Data Types Variables and Operators/DSC 201 - Foundation - Data Types and Variables.pdf]]
- [[../../01 Source Materials/Foundation - Data Types Variables and Operators/DSC 201 - Foundation - Data Types Variables and Operators Slides.pdf]]

## Learning Outcomes
By the end of this topic, you should be able to:
1. Define variables and explain why they are used.
2. Identify and use common Python data types.
3. Apply operators to manipulate data.
4. Write simple programs using variables, data types, and operators.

## Key Ideas
- An identifier is a name given to a variable, function, or module.
- Keywords are reserved words with predefined meaning in Python. They cannot be used as identifiers.
- A variable is a named memory placeholder used to store data for future use.
- Python does not require you to explicitly declare a variable's data type before assigning a value.
- Assignment uses the `=` sign, for example `number = 10`.
- Variable names are case-sensitive, so `Number` and `number` are different names.

## Variable Naming Rules
- A variable should start with a letter or underscore.
- A variable can contain letters, digits, and underscores.
- A variable name should not start with a number.
- A variable name should not contain spaces.
- Python keywords such as `for`, `while`, and `class` cannot be used as variable names.
- Descriptive lowercase names are preferred.
- Use underscores to separate words, for example `student_name`.

## Main Data Types
- `str`: text or characters, written with single quotes, double quotes, or triple quotes.
- `int`: whole numbers such as `10` or `-25`.
- `float`: decimal numbers such as `12.5` or `-3.14`.
- `bool`: Boolean values, either `True` or `False`.
- `NoneType`: represents no value, written as `None`.

## String Operations and Functions
- String concatenation combines strings using `+`.
- String repetition repeats a string using `*`.
- `str(value)` converts a value to a string.
- `len(string)` returns the number of characters in a string.
- `max(string)` returns the character with the highest ASCII value.
- `min(string)` returns the character with the lowest ASCII value.
- `string.capitalize()` capitalizes the first letter.
- `string.upper()` converts a string to uppercase.
- `string.lower()` converts a string to lowercase.

## Input and Casting
- `input()` reads user input from the keyboard.
- The value returned by `input()` is a string.
- Use `int(input())` to convert input to an integer.
- Use `float(input())` to convert input to a floating-point number.
- F-strings can format output with embedded variables, for example:

```python
names = "Caren Lete"
other_name = "Oumalama"
print(f"my names are {names} and my other name is {other_name}")
```

## Operators
- Arithmetic operators: `+`, `-`, `*`, `/`, `%`, `//`, `**`.
- Relational operators: `<`, `>`, `==`, `!=`, `<=`, `>=`.
- Logical operators: `and`, `or`, `not`.
- Assignment operators: `=`, `+=`, `-=`, `*=`, `/=`.

## Practical Task Patterns
- Ask the user to enter two numbers and print their sum, difference, product, and quotient.
- Calculate the remainder when one integer is divided by another.
- Ask for a circle radius and compute the area.
- Compute simple interest using `SI = P * R * T / 100`.
- Swap the values of two variables and print the values before and after swapping.

## What To Remember For Exam Use
- Python automatically decides the type of a variable from the assigned value.
- `3 + 4.0` returns a `float` because one operand is a float.
- `type([1, 2, 3])` returns `<class 'list'>`.
- `type(True)` returns `<class 'bool'>`.
- `type(None)` returns `<class 'NoneType'>`.
- Valid Python variable names can use underscores but cannot contain spaces or hyphens.

## Questions
- Should `map` be treated as a built-in function rather than a built-in data type in quiz answers?
- Should practical tasks use `math.pi` or an approximate value like `3.142` for circle area?
