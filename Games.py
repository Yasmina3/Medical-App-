from pickle import EXT1
import tkinter as tk
from tkinter import *
import startconn4
from _tic_tac_toe import runner
# from checkers import main


def open_window(windowTitle, pageTitle, colrCode, parent_window):
    # Create the new window
    new_window = tk.Toplevel(parent_window)
    new_window.title(windowTitle)
    new_window.geometry('800x500+250+50')
    new_window.resizable(False, False)
    new_window.config(background=colrCode)

    # Create a label containing the text "hi"
    label = tk.Label(new_window, text=pageTitle)
    label.pack(padx=50, pady=50)

    if windowTitle == "Connect Four":
        startconn4.run_logic(new_window, pageTitle)
    if windowTitle == "Tic Tac Toe":
        runner.run_logic(new_window, pageTitle)
    # if windowTitle == "Checkers":
    #     main.run_logic(new_window, pageTitle)
    # when we add the other games we will put them in these if elses

    # elif windowTitle == "Local search":
        #LocalSearchLogic.run_logic(new_window, pageTitle)
    # elif windowTitle == "Games":
        #Games.run_logic(new_window, pageTitle)


def run_logic(window, pageTitle):
    button1 = tk.Button(window, text="Connect Four", width=20, height=2,  bg="#1CFFD0",
                        command=lambda: open_window("Connect Four", "start connect 4", '#0E153A', window))
    button1.place(x=200, y=200)

    button2 = tk.Button(window, text="Game 2", width=20,
                        height=2, bg="#1CFFD0")
    button2.place(x=400, y=200)
    button3 = tk.Button(window, text="Tic Tac Toe", width=20, height=2,
                        bg="#1CFFD0", command=lambda: open_window("Tic Tac Toe", "start Tic Tac Toe", '#0E153A', window))
    button3.place(x=200, y=300)

    # button4 = tk.Button(window, text="Checkers", width=20, height=2,
    #                     bg="#1CFFD0", command=lambda: open_window("Checkers", "start Checkers", '#0E153A', window))
    # button4.place(x=400, y=300)
