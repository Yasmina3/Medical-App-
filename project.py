from pickle import EXT1
import tkinter as tk
from tkinter import *
import  informed_uninformedLogic
import Games
import LocalSearchLogic
import CSPLogic


root = tk.Tk()
root.title('AI pro')
root.geometry('800x500+250+50')
root.resizable(False, False)
root.config(background = '#0E153A')

title_label = tk.Label(root, text="Artificail Intelligence Pro", font=("Arial", 24) , bg='#E2F3F5')
title_label.pack(pady=50)
title_label.place(x=250 , y = 30)


descText = tk.Label(root , wraplength= 750, text=" Artificial Intelligene toolbox for problem solving, that offers tools to apply search algorithms like : informed and uninformed , local search with varities. we provide difrenet games and we allow you to visiualise your prolem's graphs and trees   " , bg="#0E153A" , fg="white" , font=("System" , 15))
descText.pack(padx=10, pady=10)
descText.place(x = 25  , y = 100 )


def on_leave(event):
    button.config(bg='#95F8E4')

def open_window(windowTitle , pageTitle ,colrCode):
        # Create the new window
        window = tk.Toplevel(root)
        window.title(windowTitle)
        window.geometry('800x500+250+50')
        window.resizable(False, False)
        window.config(background = colrCode)
            # Create a label containing the window title
        if windowTitle!="Local search":
          label = tk.Label(window, text=pageTitle)
          label.pack(padx=50 , pady=50)


        if windowTitle == "informed/uninformed":
            informed_uninformedLogic.run_logic(window, pageTitle)
        elif windowTitle == "Local search":
            LocalSearchLogic.run_logic(window, pageTitle)
        elif windowTitle == "Games":
            Games.run_logic(window, pageTitle)
        elif windowTitle == "CSP":
            CSPLogic.run_logic(window, pageTitle)





        

button = tk.Button(root, text="Informed/Uninformed ", width= 20 , height=2 , command=lambda: open_window("informed/uninformed", "Informed and Uninformed Algorithms" , '#95F8E4'), bg="#1CFFD0")
button.bind('<Leave>', on_leave)
button.place( x = 540, y = 230)

button = tk.Button(root, text="Local search", width= 20 , height=2 , command=lambda: open_window("Local search" , "Local Search Algorithms" , '#95F8E4') , bg="#1CFFD0")
button.bind('<Leave>', on_leave)
button.place( x = 540, y = 280)

button = tk.Button(root, text="Play Game", width= 20 , height=2 , command=lambda:open_window("Games" , " PLAY GAMES" , '#0E153A') , bg="#1CFFD0")
button.bind('<Leave>', on_leave)
button.place( x = 540, y = 330)

button = tk.Button(root, text="CS problems", width= 20 , height=2 , command=lambda:open_window("CSP" , " Constraints Satisfaction Problems" , '#95F8E4') , bg="#1CFFD0")
button.bind('<Leave>', on_leave)
button.place( x = 540, y = 380)

homePhoto = PhotoImage(file="img/BG.png")
home_labl = tk.Label(root, image=homePhoto , bg="#0E153A" , background=None)
home_labl.pack()
home_labl.place(x=100, y=180)


root.mainloop()
