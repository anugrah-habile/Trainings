from art import text2art
from colorama import Fore, Style, init

def print_logo():
    logo_text = "coffee shoppe"
    font = 'starwars'  
    
    styled_logo = text2art(logo_text, font=font)
    colored_logo = f"{Fore.MAGENTA}{styled_logo}{Style.RESET_ALL}"  

    print(colored_logo)


init()

print_logo()

print("Hello!! Welcome to the coffee shop.")

print("              ", "      Milk", "          Coffee","        Water", "      Price")
print("Americano:    ", "       1", "              3", "            0", "           80")
print("Cappuccino:   ", "       1", "              2", "            1", "          100")
print("Latte:        ", "       1", "              1", "            2", "          150")

Balance = 1200
Coffee = 10
Water = 20
Milk = 10

# Americano
# Cappuccino
# Latte


coffeeDetails = {
        1: [1, 3, 0],
        2: [1, 2, 1],
        3: [1, 1, 2]
    }

Cost = {
        1: 80,
        2: 100,
        3: 150
    }

while True:
    try:
        print(f"Your current balance is {Balance}Rs.")
        print(f"Items available: Coffee {Coffee}, Water {Water} and Milk {Milk}")
        print("Enter 1 to order an Americano.")
        print("Enter 2 to order an Cappuccino.")
        print("Enter 3 to order an Latte.")
        coffeType = int(input("Enter here: "))

        if coffeType>3 or coffeType<=0:
            print("Please enter a number from 1 to 3.")
        elif Coffee<coffeeDetails[coffeType][0] or Water<coffeeDetails[coffeType][1] or Milk<coffeeDetails[coffeType][2] or Balance<Cost[coffeType]:
            if Coffee<coffeeDetails[coffeType][0]:
                print("Insufficient Coffee.")
            if Water<coffeeDetails[coffeType][1]:
                print("Insufficient Water.")
            if Milk<coffeeDetails[coffeType][2]:
                print("Insufficient Milk.")
            if Balance<Cost[coffeType]:
                print("Insufficient Balance")
            break
        else:
            Balance-=Cost[coffeType]
            Coffee-=coffeeDetails[coffeType][0]
            Water-=coffeeDetails[coffeType][1]
            Milk-=coffeeDetails[coffeType][2]
            print("To order again enter anything, to exit enter 0.")
            checkNextOrder = input("Enter here : ")
            if checkNextOrder=="0":
                print(f"Your current balance is {Balance}Rs.")
                break
    except ValueError :
        print("Please enter a valid input")
    except:
        print("Some unknown error.")