import tkinter as tk

from genetic import SimpleGeneticAlgorithm

def run_logic(window, pageTitle):
    window.title(pageTitle)
    window.geometry('800x500+250+50')
    window.resizable(False, False)
    window.config(background='#0E153A')

    title_label = tk.Label(window, text=pageTitle, font=("Arial", 24, 'bold'), bg='#0E153A', fg='#1CFFD0')
    title_label.pack(pady=50)

    button_frame = tk.Frame(window, bg='#0E153A')
    button_frame.pack(expand=True)

    # Button to open the Genetic Algorithms window
    genetic_button = tk.Button(button_frame, text="Genetic Algorithms", width=20, height=2, font=("Arial", 14), command=open_genetic_window, bg="#1CFFD0")
    genetic_button.pack(side=tk.LEFT, padx=20, pady=10)
    
    # Button to open the Hill Climbing window
    hill_button = tk.Button(button_frame, text="Hill Climbing", width=20, height=2, font=("Arial", 14), command=lambda: open_window("Hill Climbing", "Hill Climbing", "#1CFFD0"), bg="#1CFFD0")
    hill_button.pack(side=tk.RIGHT, padx=20, pady=10)

def open_genetic_window():
    # Create the Genetic Algorithms window
    genetic_window = tk.Toplevel()
    genetic_window.title("Genetic Algorithms")
    genetic_window.geometry("800x500")
    genetic_window.config(bg="#0E153A")

    def start_genetic_algorithm():
        population_size = population_size_entry.get()
        num_generations = num_generations_entry.get()
        num_iterations = num_iterations_entry.get()
        mutation_probability = mutation_probability_entry.get()

        # Create an instance of SimpleGeneticAlgorithm with the user-specified parameters
        gen = SimpleGeneticAlgorithm(pop_size=int(population_size), num_genes=5, n_iter=int(num_iterations), mutation_prob=int(mutation_probability))
        # Call the generateOffspring() method to start the genetic algorithm
        offspring = gen.generateOffspring()

        # Insert the offspring result into the text widget
        output_text.insert(tk.END, offspring + "\n")

    # Create a frame for the input fields and start button
    input_frame = tk.Frame(genetic_window, bg="#0E153A")
    input_frame.pack(pady=10, anchor="w")

    population_size_label = tk.Label(input_frame, text="Population Size:", font=("Arial", 12), bg="#1CFFD0")
    population_size_label.grid(row=0, column=0, sticky="w")
    population_size_entry = tk.Entry(input_frame, font=("Arial", 12))
    population_size_entry.grid(row=0, column=1, padx=(10, 0), sticky="w")

    num_generations_label = tk.Label(input_frame, text="Number of Generations:", font=("Arial", 12), bg="#1CFFD0")
    num_generations_label.grid(row=1, column=0, sticky="w")
    num_generations_entry = tk.Entry(input_frame, font=("Arial", 12))
    num_generations_entry.grid(row=1, column=1, padx=(10, 0), sticky="w")

    num_iterations_label = tk.Label(input_frame, text="Number of Iterations:", font=("Arial", 12), bg="#1CFFD0")
    num_iterations_label.grid(row=2, column=0, sticky="w")
    num_iterations_entry = tk.Entry(input_frame, font=("Arial", 12))
    num_iterations_entry.grid(row=2, column=1, padx=(10, 0), sticky="w")

    mutation_probability_label = tk.Label(input_frame, text="Mutation Probability:", font=("Arial", 12), bg="#1CFFD0")
    mutation_probability_label.grid(row=3, column=0, sticky="w")
    mutation_probability_entry = tk.Entry(input_frame, font=("Arial", 12))
    mutation_probability_entry.grid(row=3, column=1, padx=(10, 0), sticky="w")

    start_button = tk.Button(input_frame, text="Start", font=("Arial", 16), bg="#1CFFD0", command=start_genetic_algorithm)
    start_button.grid(row=4, column=0, columnspan=2, pady=20, sticky="w")

    output_frame = tk.Frame(genetic_window, bg="#0E153A")
    output_frame.pack(pady=10)
    
    output_title_label = tk.Label(output_frame, text="Genetic Output", font=("Arial", 14, 'bold'), bg="#0E153A", fg="white")
    output_title_label.pack(side=tk.LEFT)

    output_text = tk.Text(output_frame, font=("Arial", 12), bg="#0E153A", fg="white")
    output_text.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

    scrollbar = tk.Scrollbar(output_frame, command=output_text.yview)
    scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
    output_text.config(yscrollcommand=scrollbar.set)

def run_logic(window, pageTitle):
    window.title(pageTitle)
    window.geometry('800x500+250+50')
    window.resizable(False, False)
    window.config(background='#0E153A')

    title_label = tk.Label(window, text=pageTitle, font=("Arial", 24, 'bold'), bg='#0E153A', fg='#1CFFD0')
    title_label.pack(pady=50)

    button_frame = tk.Frame(window, bg='#0E153A')
    button_frame.pack(expand=True)

    # Button to open the Genetic Algorithms window
    genetic_button = tk.Button(button_frame, text="Genetic Algorithms", width=20, height=2, font=("Arial", 14), command=open_genetic_window, bg="#1CFFD0")
    genetic_button.pack(side=tk.LEFT, padx=20, pady=10)

    # Button to open the Hill Climbing window
    hill_button = tk.Button(button_frame, text="Hill Climbing", width=20, height=2, font=("Arial", 14), command=lambda: open_window("Hill Climbing", "Hill Climbing", "#1CFFD0"), bg="#1CFFD0")
    hill_button.pack(side=tk.RIGHT, padx=20, pady=10)
    window.mainloop()