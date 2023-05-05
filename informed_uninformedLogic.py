def run_logic(window, pageTitle):
    import graph

    # root = tk.Tk()
    window.geometry("{}x{}+0+0".format(window.winfo_screenwidth(), window.winfo_screenheight()))
    app = graph.Application(master=window)
    app.mainloop()