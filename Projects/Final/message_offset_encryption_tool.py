"""
Author: Robby Stohel
File: message_offset_encryption_tool.py

This program asks the user if they would like to encrypt ('e') or
decrypt ('d') a message. It checks their response then asks for the
messsage to process. The message is encrypted/decrypted and 
returned to the user.

encrypt ex. Input: "test" > Output: "uftu"
decrypt ex. Input: "uftu" > Output: "test"
"""

def get_op():
    """ Function to get a valid operation ('e' or 'd') and return it """
    print("Thank you for using the Message Offset Encryption Tool.")
    flag = 0
    op = ''
    
    while flag == 0:
        op = input("Do you want to Encrypt(e) or Decrypt(d)? ")

        if op == 'e' or op == 'd':
            flag += 1
        else:
            print("Invalid input. Must be 'e' to encrypt or 'd' to decrypt.")
            print("")
            
    return op

def get_message():
    """ Function to take the message as input and returns it """
    message = input("Please enter the message to process: ")
    return message

def encrypt(message):
    """ Function to encrypt the message and return it """
    temp = ""

    for char in message:
        temp += chr(ord(char) + 1)
    return temp

def decrypt(message):
    """ Function to decrypt the message and return it """
    temp = ""

    for char in message:
        temp += chr(ord(char) - 1)
    return temp


def main():
    """ Main driver to run program """
    message = ""
    operation = ''
    pro_message = ""

    # Gets operation and message
    operation = get_op()
    message = get_message()

    # Selects appropriate operation
    if operation == 'e':
        pro_message = encrypt(message)
    elif operation == 'd':
        pro_message = decrypt(message)

    # Prints approperiate response and processed message
    if operation == 'e':
        print("Decrypted message: ", pro_message)
    elif operation == 'd':
        print("Encrypted message: ", pro_message)

if __name__ == "__main__":
    main()
