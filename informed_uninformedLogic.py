def run_logic(window, pageTitle):
    import graph_gui

    # root = tk.Tk()
    window.geometry("{}x{}+0+0".format(window.winfo_screenwidth(), window.winfo_screenheight()))
    app = graph_gui.Application(master=window)
    app.mainloop()