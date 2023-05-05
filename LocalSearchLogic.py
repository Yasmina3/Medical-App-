import tkinter as tk

def run_logic(window, pageTitle):
    window.title(pageTitle)
    window.geometry('800x500+250+50')
    window.resizable(False, False)
    window.config(background='#0E153A')

    title_label = tk.Label(window, text=pageTitle, font=("Arial", 24, 'bold'), bg='#0E153A', fg='#E2F3F5')
    title_label.pack(pady=50)

    button_frame = tk.Frame(window, bg='#0E153A')
    button_frame.pack(expand=True)

    # Button to open the Genetic Algorithms window
    genetic_button = tk.Button(button_frame, text="Genetic Algorithms", width=20, height=2, font=("Arial", 14), command=lambda: open_window("Genetic Algorithms", "Genetic Algorithms", "#95F8E4"), bg="#1CFFD0")
    genetic_button.pack(side=tk.LEFT, padx=20, pady=10)

    # Button to open the Hill Climbing window
    hill_button = tk.Button(button_frame, text="Hill Climbing", width=20, height=2, font=("Arial", 14), command=lambda: open_window("Hill Climbing", "Hill Climbing", "#95F8E4"), bg="#1CFFD0")
    hill_button.pack(side=tk.RIGHT, padx=20, pady=10)

def open_window(windowTitle, pageTitle, colrCode):
    # Create the new window
    window = tk.Toplevel()
    window.title(windowTitle)
    window.geometry('800x500+250+50')
    window.resizable(False, False)
    window.config(background=colrCode)

    # Create a label containing the text "hi"
    label = tk.Label(window, text=pageTitle)
    label.pack(padx=50, pady=50)
