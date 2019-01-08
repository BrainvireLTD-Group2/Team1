#!/usr/bin/python3

import tkinter as tk
from tkinter import messagebox
import sqlite3
import hashlib # Hashing library for securing passwords
import sys

class Application:
    def __init__(self, root):
        self.draw(root)

    def draw(self,root):
        # Form parameters:
        
        root.title("UFix Login")
        root.geometry("270x210")
        root.resizable(0,0)

        # Form Widgets:
        self.lblUsername = tk.Label(root, text = "Username:").grid(row = 0)
        self.lblPassword = tk.Label(root, text = "Password:").grid(row = 1)

        self.txtUsername = tk.Entry(root)
        self.txtPassword = tk.Entry(root, show = '*')

        self.txtUsername.grid(row=0, sticky="E")
        self.txtPassword.grid(row=1, sticky="E")
        self.txtUsername.grid(row=0, column=1)
        self.txtPassword.grid(row=1, column=1)

        self.btnLogin = tk.Button(root, text = "Login", command = self.btnLogin_clicked)
        self.btnLogin.grid(row = 2, column = 0)

        self.btnPolicy = tk.Button(root, text = "Policy", command = self.btnPolicy_clicked)
        self.btnPolicy.grid(row = 2, column = 1)

        self.btnExit = tk.Button(root, text = "Exit", command = self.btnExit_clicked)
        self.btnExit.grid(row = 2, column = 2)

    def btnPolicy_clicked(self):
        self.policytext = "This is a placeholder for the policy"
        tk.messagebox.showinfo(title = "Ufix Policy Document", message = self.policytext)

    def btnLogin_clicked(self):
        inserted_username = self.txtUsername.get()
        inserted_password = self.txtPassword.get()
        
        hash_object = hashlib.sha1(inserted_password.encode()) # Hash the user inserted password
        inserted_password = hash_object.hexdigest()

        database = DatabaseAccessor()
        database.connect()
        if database.verify(str(inserted_username), str(inserted_password)) == True:
            print("Enter Main Gui")
        database.disconnect()

    def btnExit_clicked(self):
        self.choice = tk.messagebox.askquestion('Ufix Login', 'Are you sure you want to exit?', icon="warning")
        if self.choice == 'yes':
            root.destroy()
            sys.exit() # Closes the program gracefully

class DatabaseAccessor:
    def connect(self):
        connection = sqlite3.connect('UfixAccounts.sqlite3')
        self.cursor = connection.cursor()
        self.cursor.execute('''CREATE TABLE IF NOT EXISTS `UfixAccounts`(`Username` TEXT NOT NULL, `Password` TEXT NOT NULL, PRIMARY KEY(`Username`))''')

    def disconnect(self):
        self.connection.close()
    
    def verify(self, username, passwordhash):
        self.cursor.execute("SELECT Username, Password FROM UfixAccounts WHERE Username=?", [username])
        self.all_accounts = self.cursor.fetchall()

        for row in self.all_accounts:
            if str(username) == str(row[0]) and str(passwordhash) == str(row[1]):
                print("Username & Password correct")
                return True
        tk.messagebox.showerror(title = "Login error", message = "Incorrect Username/Password!")
        return False

if __name__ == '__main__':
    root = tk.Tk()
    App = Application(root)
    root.mainloop()
