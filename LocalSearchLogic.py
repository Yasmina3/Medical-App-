import tkinter as tk
from genetic import start_genetic_algorithm

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
    genetic_button = tk.Button(button_frame, text="Genetic Algorithms", width=20, height=2, font=("Arial", 14), command=open_genetic_window, bg="#1CFFD0")
    genetic_button.pack(side=tk.LEFT, padx=20, pady=10)
    
    # Button to open the Hill Climbing window
    hill_button = tk.Button(button_frame, text="Hill Climbing", width=20, height=2, font=("Arial", 14), command=lambda: open_window("Hill Climbing", "Hill Climbing", "#95F8E4"), bg="#1CFFD0")
    hill_button.pack(side=tk.RIGHT, padx=20, pady=10)

def open_genetic_window():
    # Create the Genetic Algorithms window
    genetic_window = tk.Toplevel()
    genetic_window.title("Genetic Algorithms")
    genetic_window.geometry("800x500")
    genetic_window.config(bg="#95F8E4")

    # Create the four input fields
    population_size_label = tk.Label(genetic_window, text="Population Size:", font=("Arial", 12), bg="#95F8E4")
    population_size_label.pack(pady=10)
    population_size_entry = tk.Entry(genetic_window, font=("Arial", 12))
    population_size_entry.pack()

    num_generations_label = tk.Label(genetic_window, text="Number of Generations:", font=("Arial", 12), bg="#95F8E4")
    num_generations_label.pack(pady=10)
    num_generations_entry = tk.Entry(genetic_window, font=("Arial", 12))
    num_generations_entry.pack()

    num_iterations_label = tk.Label(genetic_window, text="Number of Iterations:", font=("Arial", 12), bg="#95F8E4")
    num_iterations_label.pack(pady=10)
    num_iterations_entry = tk.Entry(genetic_window, font=("Arial", 12))
    num_iterations_entry.pack()

    mutation_probability_label = tk.Label(genetic_window, text="Mutation Probability:", font=("Arial", 12), bg="#95F8E4")
    mutation_probability_label.pack(pady=10)
    mutation_probability_entry = tk.Entry(genetic_window, font=("Arial", 12))
    mutation_probability_entry.pack()

    # Add a button to start the Genetic Algorithm
    start_button = tk.Button(genetic_window, text="Start", font=("Arial", 14), bg="#1CFFD0", command=lambda: start_genetic_algorithm(population_size_entry.get(), num_generations_entry.get(), num_iterations_entry.get(), mutation_probability_entry.get()))
    start_button.pack(pady=20)
    
    # Create a new window to display the output
    output_window = tk.Toplevel()
    output_window.title("Genetic Algorithm Output")
    
    # Create a label to display the output
    output_label = tk.Label(output_window, text="Your genetic algorithm output here")
    output_label.pack()

