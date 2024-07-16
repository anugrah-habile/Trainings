import math

def add (num1, num2):
    return num1 + num2

def subtract (num1, num2):
    return num1 - num2

def multiply (num1, num2):
    return num1 * num2

def division (num1, num2):
    if num2 == 0:
        return ("Error: Division by zero")
    return num1 / num2

def expo (num1, num2):
    return num1 ** num2

def root (num1):
    if num1 < 0:
        return ("Error")
    return math.sqrt(num1)


print("Please select operation to be performed \n")
print("1 for addition")
print("2 for substraction")
print("3 for multiplication")
print("4 for division")
print("5 for exponential")
print("6 for square root function\n")

input1 = input("Select Operation :")

if input1 == '6':
    n1 = float(input("Enter number: "))
        

elif input1 in ['1', '2', '3', '4', '5']:
    n1 = float(input("Enter first number: "))
    n2 = float(input("Enter second number: "))

else:
    print("Invalid input")
    exit()



if input1 == '1':
    print(add(n1, n2))

elif input1 == '2':
    print(subtract(n1, n2))

elif input1 == '3':
    print(multiply(n1, n2))

elif input1 == '4':
    print(division(n1, n2))

elif input1 == '5':
    print(expo(n1, n2))

elif input1 == '6':
    print(root(n1))

else:
    print("Invalid input")