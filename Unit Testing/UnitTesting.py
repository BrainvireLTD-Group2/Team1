from unittest import TestCase
from mainGUI import DatabaseAccessor
import sqlite3
from mainGUI import Application
import tkinter as tk

class test(TestCase):
    def test_wrong_password(self):
        username = "user"
        password = "pass"
        DatabaseAccessor.connect(self)
        self.assertFalse(DatabaseAccessor.verify(self, username=username, passwordhash=password))

    def test_correct_password(self):
        username = "username"
        password = "password"
        DatabaseAccessor.connect(self)
        self.assertTrue(DatabaseAccessor.verify(self, username=username, passwordhash=password))
    def test_diconnect(self):
        self.connection = sqlite3.connect('UfixAccounts.sqlite3')
        DatabaseAccessor.disconnect(self)
    def test_policy(self):
        Application.btnPolicy_clicked(self)
    def test_connect(self):
        DatabaseAccessor.connect(self)
    def test_ApplicationClas(self):
        Root = tk.Tk()
        Application(root=Root)



if __name__ == '__main__':
    root = tk.Tk()
    App = Application(root)
    root.mainloop()










