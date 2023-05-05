from tkinter import *
from PIL import ImageTk, Image
import tkinter as tk
import connect4   #game code


def run_logic(window, page_title):
   
    title_label = Label(window, text="Start with Connect Four Game", font=("Arial", 24) , bg='#E2F3F5')
    title_label.pack(pady=50)
    title_label.place(x=200 , y = 30)

    descText = Label(window , wraplength= 750, text="Connect 4 is a two-player strategy game in which the players take turns dropping colored discs into a vertical grid. The objective of the game is to connect four of one's own discs of the same color next to each other vertically, horizontally, or diagonally before the opponent." , bg="#0E153A" , fg="white" , font=("System" , 15))
    descText.pack(padx=10, pady=10)
    descText.place(x = 25  , y = 100 )

    img = Image.open("img/connect4.png")
    img = img.resize((200, 200))
    img = ImageTk.PhotoImage(img)

    # create label to display image
    img_label = Label(window, image=img, bg='#0E153A')
    img_label.image = img
    img_label.pack()
    img_label.place(x=100, y=200)

    #create button to start the game
    button1 = Button(window, text="Get started!", width=20, height=2, bg="#1CFFD0", command=lambda:connect4.run_logic(window, "Play Connect Four"))
    button1.place(x = 520, y = 280)

    


