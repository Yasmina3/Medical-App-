import tkinter as tk
from tkinter import ttk
import datetime
import CSP_main

class Application(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Country Data Entry")
        self.configure(bg='#0E153A')  # Set background color
        self.country_data = []

        self.geometry("900x600")  # Set window size
        self.map_theorem_label = tk.Label(self, text="The four color map theorem:", font=("Georgia", 16, "bold italic"), bg='#96d4c7')
        self.map_theorem_label.pack(pady=0)

        self.map_theorem_text = tk.Label(self, text="No more than four colors are required to color the regions of any map\nso that no two adjacent regions have the same color", font=("Georgia", 14, "italic"), bg='#96d4c7')
        self.map_theorem_text.pack(pady=0)

        self.title_label = tk.Label(self, text="Please enter the number of countries in your map!", font=("Helvetica", 14))
        self.title_label.pack(pady=20)

        self.num_countries_entry = tk.Entry(self, font=("Helvetica", 12))
        self.num_countries_entry.pack()

        self.num_countries_button = tk.Button(self, text="Enter", command=self.enter_num_countries, font=("Helvetica", 12), bg='#28c7a6')
        self.num_countries_button.pack(pady=10)

    def enter_num_countries(self):
        num_countries = int(self.num_countries_entry.get())
        self.num_countries_entry.config(state=tk.DISABLED)
        self.num_countries_button.config(state=tk.DISABLED)

        self.subtitle_label = tk.Label(self, text="Enter neighboring countries separated by commas i.e 1,2,3", font=("Helvetica", 14))
        self.subtitle_label.pack(pady=10)

        self.scrollable_frame = ttk.Frame(self, height=200)  
        self.scrollable_frame.pack(fill=tk.BOTH, expand=True)

        self.canvas = tk.Canvas(self.scrollable_frame, bg='#0E153A', height=200)  
        self.canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

        self.scrollbar = ttk.Scrollbar(self.scrollable_frame, orient=tk.VERTICAL, command=self.canvas.yview)
        self.scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

        self.canvas.configure(yscrollcommand=self.scrollbar.set)
        self.canvas.bind("<Configure>", self.adjust_canvas_scrollregion)

        self.inner_frame = tk.Frame(self.canvas, bg='#0E153A')
        self.canvas.create_window((0, 0), window=self.inner_frame, anchor=tk.NW)

        self.country_entries = []
        for i in range(num_countries):
            label = tk.Label(self.inner_frame, text=f"Country {i}:", font=("Helvetica", 12, "bold"), bg='#0E153A', fg='#28c7a6')
            label.pack()
            entry = tk.Entry(self.inner_frame, font=("Helvetica", 12))
            entry.pack()
            self.country_entries.append(entry)

        self.submit_button = tk.Button(self, text="Submit", command=self.submit_data, font=("Helvetica", 12), bg='#28c7a6')
        self.submit_button.pack(pady=10)

    def adjust_canvas_scrollregion(self, event):
        self.canvas.configure(scrollregion=self.canvas.bbox("all"))

    def submit_data(self):
        num_countries = len(self.country_entries)
        error_messages = []
        for i, entry in enumerate(self.country_entries):
            neighbors = entry.get()
            neighbors_list = neighbors.split(",")
            for neighbor in neighbors_list:
                neighbor = int(neighbor)
                if neighbor != i and 0 <= neighbor < num_countries:
                    self.country_data.append((i, neighbor))
                else:
                    error_message = f"Invalid neighbor country '{neighbor}' for country '{i}'"
                    error_messages.append(error_message)
                    break  # Stop checking neighbors for this country if there's an invalid one

        if error_messages:
            error_window = tk.Tk()
            error_window.title("Error Messages")

            for i, error in enumerate(error_messages):
                label = tk.Label(error_window, text=error, bg='#f58c8c')
                label.pack()

            error_window.mainloop()
        else:
            self.write_to_file()
            self.color_button = tk.Button(self, text="Color The Map!", command=self.color_map, font=("Helvetica", 12), bg='#28c7a6')
            self.color_button.pack(pady=10)

    def write_to_file(self):
        current_time = datetime.datetime.now().strftime("%c")
        with open("Countries.txt", "w") as file:
            file.write("# Coloring Problem, generated at: " + current_time + "\n")
            file.write("# Colors\n")
            file.write("colors = 4\n")
            file.write("# Graph:\n")
            for data in self.country_data:
                country = data[0]
                neighbor = data[1]
                file.write(f"{country},{neighbor}\n")

        print("Country data has been stored in Countries.txt file.")

    def color_map(self):
        print("colors")
        CSP_main.main()


def run_logic(pageTitle):
    app = Application()
    app.mainloop()


windowTitle = "CSP"
pageTitle = "CSP"

