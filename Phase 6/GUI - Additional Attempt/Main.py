from tkinter import *
from tkinter import messagebox
import Login

Login.everything()

root = Tk()
Label(root,text='Diary Management System',font=('Arial',20)).pack(side=TOP,pady=10)
root.title('Diary Management System')
photo=PhotoImage(file="C:\\Users\\HP\\OneDrive\\Desktop\\Amar\\png-transparent-diary-computer-icons-user-g-suite-my-diary.png")
Button(root,text='click me !',image=photo).pack(side=TOP)
#canvas = Canvas(root, width=800, height=1500)
#canvas.pack()
#img = PhotoImage(file="C:\\Users\\HP\\OneDrive\\Desktop\\Amar\\png-transparent-diary-computer-icons-user-g-suite-my-diary.png")
#canvas.create_image(-150,-100, image=img, anchor=NW)
#b=Button(root,text="Main Menu",activeforeground="white",bg="green",bd="10")
#b.pack(side=BOTTOM)

root.mainloop()

