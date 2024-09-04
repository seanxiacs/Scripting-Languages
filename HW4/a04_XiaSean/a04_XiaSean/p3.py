from tkinter import *

# Create a function that updates the display label
def update_display(value):
    global display_text
    display_text.set(value)

# Create a function that adds a digit to the current calculation
def add_character(char):
    global display_text
    current_text = display_text.get()
    update_display(current_text + char)

# Create a function that clears the current calculation
def clear_calculation():
    update_display("")

# Create a function that calculates the current expression and displays the result
def calculate_expression():
    global display_text
    try:
        result = str(eval(display_text.get()))
        update_display(result)
    except:
        update_display("Error")
    
def delete_entry():
    current_text = display_text.get()
    updated_text = current_text[:-1]
    display_text.set(updated_text)

# Create the main window and set its title
root = Tk()
root.title("Calculator")

# Create a StringVar to hold the display text
display_text = StringVar()
display_text.set("")

# Create the display label
display_label = Label(root, textvariable=display_text, font=("Arial", 16), anchor="e", bg="white", bd=5, relief=SUNKEN)
display_label.configure(takefocus=0)  # Add this line to disable focus on the label

# Create the digit buttons
button_0 = Button(root, text="0", font=("Arial", 16), command=lambda: add_character("0"))
button_1 = Button(root, text="1", font=("Arial", 16), command=lambda: add_character("1"))
button_2 = Button(root, text="2", font=("Arial", 16), command=lambda: add_character("2"))
button_3 = Button(root, text="3", font=("Arial", 16), command=lambda: add_character("3"))
button_4 = Button(root, text="4", font=("Arial", 16), command=lambda: add_character("4"))
button_5 = Button(root, text="5", font=("Arial", 16), command=lambda: add_character("5"))
button_6 = Button(root, text="6", font=("Arial", 16), command=lambda: add_character("6"))
button_7 = Button(root, text="7", font=("Arial", 16), command=lambda: add_character("7"))
button_8 = Button(root, text="8", font=("Arial", 16), command=lambda: add_character("8"))
button_9 = Button(root, text="9", font=("Arial", 16), command=lambda: add_character("9"))

# Create the parentheses buttons
button_open_parenthesis = Button(root, text="(", font=("Arial", 16), command=lambda: add_character("("))
button_close_parenthesis = Button(root, text=")", font=("Arial", 16), command=lambda: add_character(")"))

# Create the operator buttons
button_plus = Button(root, text="+", font=("Arial", 16), command=lambda: add_character("+"))
button_minus = Button(  root, text="-", font=("Arial", 16), command=lambda: add_character("-"))
button_multiply = Button(root, text="*", font=("Arial", 16), command=lambda: add_character("*"))
button_divide = Button(root, text="/", font=("Arial", 16), command=lambda: add_character("/"))

# Create the clear, calculate, and delete buttons
button_clear = Button(root, text="clear", font=("Arial", 16), command=clear_calculation)
button_calculate = Button(root, text="calc", font=("Arial", 16), command=calculate_expression)
button_delete = Button(root, text="del", font=("Arial", 16), command=delete_entry)

# Do the grids for all the buttons
display_label.grid(row=0, column=0, columnspan=4, padx=5, pady=5, sticky="nesw")
button_0.grid(row=1, column=0, padx=5, pady=5, sticky="nesw")
button_1.grid(row=1, column=1, padx=5, pady=5, sticky="nesw")
button_2.grid(row=1, column=2, padx=5, pady=5, sticky="nesw")
button_3.grid(row=1, column=3, padx=5, pady=5, sticky="nesw")
button_4.grid(row=2, column=0, padx=5, pady=5, sticky="nesw")
button_5.grid(row=2, column=1, padx=5, pady=5, sticky="nesw")
button_6.grid(row=2, column=2, padx=5, pady=5, sticky="nesw")
button_7.grid(row=2, column=3, padx=5, pady=5, sticky="nesw")
button_8.grid(row=3, column=0, padx=5, pady=5, sticky="nesw")
button_9.grid(row=3, column=1, padx=5, pady=5, sticky="nesw")

button_open_parenthesis.grid(row=3, column=2, padx=5, pady=5, sticky="nesw")
button_close_parenthesis.grid(row=3, column=3, padx=5, pady=5, sticky="nesw")

button_plus.grid(row=4, column=0, padx=5, pady=5, sticky="nesw")
button_minus.grid(row=4, column=1, padx=5, pady=5, sticky="nesw")
button_multiply.grid(row=4, column=2, padx=5, pady=5, sticky="nesw")
button_divide.grid(row=4, column=3, padx=5, pady=5, sticky="nesw")

button_clear.grid(row=5, column=0, padx=5, pady=5, sticky="nesw")
button_calculate.grid(row=5, column=1, padx=5, pady=5, sticky="nesw")
button_delete.grid(row=5, column=2, padx=5, pady=5, sticky="nesw")

# Start the main loop
root.mainloop()