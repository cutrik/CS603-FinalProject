from tkinter import *
from tkinter import messagebox

import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="Ankush@11",
    database="universityManagement"
    )

def everything():
    def Ok():
        uname = e1.get()
        password = e2.get()
        cursor = db.cursor()

        query = 'select count(*) from login where username =%s and password = %s;'
        
        cursor.execute(query,(uname, password))
        result=cursor.fetchall()

        cursor.close()

        if(uname == "" and password == "") :
            messagebox.showinfo("", "Blank Not allowed")
:
        elif(result[0][0]):
            messagebox.showinfo("","Login Success")
            top.destroy()
            main.destroy()

        else :
            messagebox.showinfo("","Incorrect Username and Password")
            
    main = Tk()
    main.withdraw()
    top = Toplevel()
    top.title("Login")
    top.geometry("300x200")

    Label(top, text="Username").place(x=10, y=10)
    Label(top, text="Password").place(x=10, y=40)

    e1 = Entry(top)
    e1.place(x=140, y=10)

    e2 = Entry(top)
    e2.place(x=140, y=40)
    e2.config(show="*")


    Button(top, text="Login", command=Ok ,height = 3, width = 13).place(x=10, y=100)
    top.mainloop()
