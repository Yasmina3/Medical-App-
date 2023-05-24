from py_search.base import *
from py_search import *
from py_search.uninformed import depth_first_search, breadth_first_search
from py_search.informed import best_first_search
import tkinter as tk


class Graph:
    def __init__(self):
        self.nodes = []
        self.edges = []
        self.schema = {}
        self.heuristic = {}

    def add_node(self, node):
        self.nodes.append(node)
        node_id = node.node_id
        self.schema[node_id] = {}

    def add_edge(self, node1, node2):
        node1_id = node1.node_id
        node2_id = node2.node_id

        self.edges.append((node1, node2))
        edge_cost = 1
        self.schema[node1_id][node2_id] = edge_cost
        self.schema[node2_id][node1_id] = edge_cost
        print(self.schema)

    def get_node_by_id(self, id):
        for node in self.nodes:
            if node.node_id == id:
                return node
        return None  # if no node with the given id is found

    def cost_update_process(self, entry1, entry2, entry_cost):
        try:
            node1_id = int(entry1)
            node2_id = int(entry2)
            cost = int(entry_cost)
            if node1_id in self.schema and node2_id in self.schema[node1_id]:
                # Check if the edge already exists and has a value
                if self.schema[node1_id][node2_id] is not None:
                    self.schema[node1_id][node2_id] = cost
                    self.schema[node2_id][node1_id] = cost
            # else:
            #     # Edge does not exist, print a message to indicate that the nodes are not connected
            #     label_result = tk.Label( self.master, text="Please enter valid integers")
        except ValueError:
            label_result = tk.Label( self.master, text="Please enter valid integers")
            label_result.pack()

    def set_heuristic_process(self, entry_node, entry_heuristic):
        try:
            nodeh_id = int(entry_node)
            # node2_id = int(entry2)
            heur = int(entry_heuristic)
            if nodeh_id in self.schema:
                # Check if the edge already exists and has a value
                self.heuristic[str(nodeh_id)] = heur
            # else:
            #     # Edge does not exist, print a message to indicate that the nodes are not connected
            #     label_result = tk.Label( self.master, text="Please enter valid integers")
        except ValueError:
            label_result = tk.Label( self.master, text="Please enter valid integers")
            label_result.pack()

class Node_a:
    def __init__(self, node_id, x, y):
        self.node_id = node_id
        self.x = x
        self.y = y

class get_graph:
    my_graph = 0
    my_heuristic = 0
    def __init__(self):
        get_graph.my_graph = 0
        get_graph.my_heuristic = 0

IU_graph = get_graph()

class Application(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.graph = Graph()
        self.current_node = None
        self.start_state_id = None
        self.maxMin = True
        self.create_widgets()

    def create_widgets(self):
         
        
        
        
    
        label = tk.Label(self.master, text="Apply hill climbing on your tree!", foreground="#FEFF86" ,bg="#0E153A" , font=("System" , 15))
        label.place(x=100, y=50)

        self.canvas = tk.Canvas(self.master, width=700, height=430 )#, width=600, height=400
        self.canvas.pack(side="top")
        self.canvas.place(x=100 , y=100)

        self.button_frame = tk.Frame(self.master)  # Create a frame to hold the buttons
        self.button_frame.pack(side="top" , anchor="ne")
        self.button_frame.place(x=870 , y=100)
        
        self.search_frame = tk.Frame(self.master)  # Create a frame
        self.search_frame.pack()
        self.search_frame.place(x=250, y=580)
       

        

        self.mode = 'node'
        self.add_node_button = tk.Button(self.button_frame, text="Add Node", width= 20 , height=2 , command=self.set_mode_node, bg="#1CFFD0")
        self.add_edge_button = tk.Button(self.button_frame, text="Add Edge", width= 20 , height=2, command=self.set_mode_edge, bg="#1CFFD0")
        self.delete_button = tk.Button(self.button_frame, text="Delete Graph", width= 20 , height=2, command=self.delete_graph, bg="#1CFFD0")
        self.set_cost = tk.Button(self.button_frame, text="Update Cost", width= 20 , height=2, command=self.update_cost, bg="#1CFFD0")
        self.set_heuristic = tk.Button(self.button_frame, text="Set heuristics", width= 20 , height=2, command=self.get_heuristic, bg="#1CFFD0")
        
        

        options = [ "Minimize" , "Maximize"]

        variable = tk.StringVar(self.master)
        variable.set(options[0])

        self.algorithm = tk.StringVar()
        self.algorithm.set("Minimize")

        option_menu = tk.OptionMenu(self.search_frame, variable, *options, command=self.chose_option)
        

        
        self.add_node_button.pack(side='top')
        self.add_edge_button.pack(side='bottom')
        self.delete_button.pack(side='bottom')
        self.set_cost.pack(side='bottom')
        self.set_heuristic.pack(side='bottom')

        option_menu.pack(side='left')
        
        tk.Label(self.search_frame, text="Start state: ").pack(side="left")
        self.start = tk.Entry(self.search_frame)
        self.start.pack(side="left")

        self.result_path = tk.StringVar()
        self.result_path.set("Not found")

        self.apply_search = tk.Button(self.search_frame, text="Apply search", width= 20 , height=2, command=lambda: self.search(int(self.start.get()), self.algorithm.get()), bg="#1CFFD0")
        self.apply_search.pack(side='left' , padx=30)
      
        self.canvas.bind('<Button-1>', self.handle_click)

    def set_mode_node(self):
        self.mode = 'node'

    def set_mode_edge(self):
        self.mode = 'edge'

    def set_mode_update_cost(self):
        self.mode = 'update_cost'

    def handle_click(self, event):
        if self.mode == 'node':
            self.add_node(event)

        elif self.mode == 'edge':
            self.add_edge(event)

    def update_cost(self):
        self.mode = 'update_cost'
        top = tk.Toplevel()
        top.title("Update Cost")
        tk.Label(top, text="First Node: ").grid(row=0, column=0)
        entry1 = tk.Entry(top)
        entry1.grid(row=0, column=1)
        tk.Label(top, text="Second Node: ").grid(row=1, column=0)
        entry2 = tk.Entry(top)
        entry2.grid(row=1, column=1)
        tk.Label(top, text="New Cost: ").grid(row=2, column=0)
        entry_cost = tk.Entry(top)
        entry_cost.grid(row=2, column=1)

        button = tk.Button(top, text="Update Cost", command=lambda: self.combined_function(entry1.get(), entry2.get(), entry_cost.get()), bg="#1CFFD0" )
        button.grid(row=3, columnspan=2)

    def combined_function(self, entry_1, entry_2, entry_cost):
        self.graph.cost_update_process(entry_1, entry_2, entry_cost)
        self.update_cost_canvas(self.graph.get_node_by_id(int(entry_1)), self.graph.get_node_by_id(int(entry_2)))


    def get_heuristic(self):
        self.mode = 'get_heuristic'
        top2 = tk.Toplevel()
        top2.title("get heuristic")
        tk.Label(top2, text="Node: ").grid(row=0, column=0)
        entry_node = tk.Entry(top2)
        entry_node.grid(row=0, column=1)
        tk.Label(top2, text="Heuristic value: ").grid(row=2, column=0)
        entry_heuristic = tk.Entry(top2)
        entry_heuristic.grid(row=2, column=1)

        button = tk.Button(top2, text="Set heuristic", command=lambda: self.combined_function2(entry_node.get(), entry_heuristic.get()), bg="#1CFFD0" )
        button.grid(row=3, columnspan=2)

    def combined_function2(self, entry_node, entry_heuristic):
        self.graph.set_heuristic_process(entry_node, entry_heuristic)
        self.set_heuristic_canvas(self.graph.get_node_by_id(int(entry_node)), entry_heuristic)


 
    def add_node(self, event):
        x, y = event.x, event.y
        if x < 0 or y < 0 or x > self.canvas.winfo_width() or y > self.canvas.winfo_height():
            return
        node_id = len(self.graph.nodes) + 1
        node = Node_a(node_id, x, y)
        self.graph.add_node(node)
        self.draw_node(node)
        print(f"Added node {node.node_id} at ({node.x}, {node.y})")
               
    def add_edge(self, event):
        if self.current_node is None:
            self.current_node = self.get_node_at(event.x, event.y)
        else:
            target_node = self.get_node_at(event.x, event.y)
            if target_node is not None and target_node != self.current_node:
                self.graph.add_edge(self.current_node, target_node)
                self.draw_edge(self.current_node, target_node)
                print(f"Added edge from node {self.current_node.node_id} to node {target_node.node_id}")
                print(self.graph.schema)
            self.current_node = None

    def get_node_at(self, x, y):
        for node in self.graph.nodes:
            if abs(node.x - x) <= 10 and abs(node.y - y) <= 10:
                return node
        return None

    def draw_node(self, node):
        x, y = node.x, node.y
        self.canvas.create_oval(x-15, y-15, x+15, y+15, fill='cyan', tags="node")
        self.canvas.create_text(x, y, text=str(node.node_id), tags="label")

    def draw_edge(self, node1, node2):
        x1, y1 = node1.x, node1.y
        x2, y2 = node2.x, node2.y
        edge_cost = self.graph.schema[node1.node_id][node2.node_id]
        self.canvas.create_line(x1, y1, x2, y2, width=3)
        self.canvas.tag_raise("node")
        self.canvas.tag_raise("label")
        self.canvas.tag_raise("heuristic")
        self.canvas.tag_raise("heuristic_label")
        label_x, label_y = (x1 + x2) / 2, (y1 + y2) / 2
        square = self.canvas.create_rectangle(label_x-8, label_y-8, label_x+8, label_y+8,
                                           fill='white', outline='black')
        edge_cost_label = self.canvas.create_text(label_x, label_y, text=str(edge_cost))

    def update_cost_canvas(self, node1, node2):
        x1, y1 = node1.x, node1.y
        x2, y2 = node2.x, node2.y
        edge_cost = self.graph.schema[node1.node_id][node2.node_id]
        label_x, label_y = (x1 + x2) / 2, (y1 + y2) / 2
        square = self.canvas.create_rectangle(label_x-8, label_y-8, label_x+8, label_y+8,
                                           fill='white', outline='black')
        edge_cost_label = self.canvas.create_text(label_x, label_y, text=str(edge_cost))


    def set_heuristic_canvas(self, node_h, heuristic):
        x1, y1 = node_h.x, node_h.y
        x2, y2 = node_h.x - 30, node_h.y - 30
        label_x, label_y = (x1 + x2) / 2, (y1 + y2) / 2
        heuristic_square = self.canvas.create_rectangle(label_x-8, label_y-8, label_x+8, label_y+8,
                                           fill='yellow', outline='black', tags="heuristic")
        heuristic_label = self.canvas.create_text(label_x, label_y, text=str(heuristic), tags="heuristic_label")

    def delete_graph(self):
        # clear the canvas
        self.canvas.delete("all")
        # clear the graph
        self.graph = Graph()
        self.current_node = None
        self.start_state_id = None
      
        self.create_widgets()
        

    def construct_successor_list(self , graph, heuristic):
        successor_list = {}

        for node in graph:
            successors = []

            for successor in graph[node]:
                successors.append([str(successor), graph[node][successor]])

            successor_list[str(node)] = successors

        for node in successor_list:
            for successor in successor_list[node]:
                successor[1] = heuristic[successor[0]]

        return successor_list

    
    def MoveGen(self, N , SuccList):
        New_list = list()
        if N in SuccList.keys():
            New_list = SuccList[N]
    
        return New_list


    def Sort(self ,L, ascending=True):
        L.sort(key=lambda x: x[1], reverse=not ascending)
        return L

    def heu(self ,Node):
        return Node[1]



    def Append(self ,L1 , L2):
        New_List = list(L1)+list(L2)
        return New_List

    def compare(self ,a , b , n):
        if n:
            return (a<b)
        else:
            return (a>b)


    def search(self, Start, algorithm):
       
        IU_graph.my_graph = self.get_graph_str()
        print(IU_graph.my_graph)
       
        IU_graph.my_heuristic = self.graph.heuristic
        print(IU_graph.my_heuristic)

        if algorithm == "Minimize":    
          self.maxMin=True
        else:
           self.maxMin=False

        print(self.maxMin)
        SuccList =  self.construct_successor_list(IU_graph.my_graph , IU_graph.my_heuristic)
        print(SuccList)
        global Closed
        N = str(Start)
        Child = self.MoveGen(N , SuccList)  #list
        self.Sort(Child , self.maxMin) 
        heu = IU_graph.my_heuristic[str(Start)]
        N = [Start , heu ]
        print("\nStart = " , N)
        print("Sorted child list : " , Child)
        print("-----------------")
        print("alg"+algorithm)
        
        newNode = Child[0]
        CLOSED = [N]


        while self.compare(self.heu(newNode) , self.heu(N) , self.maxMin):
            print("\n -----------------")
            N = newNode
            print("N = " , N)
            CLOSED = self.Append(CLOSED, [N])
            Child = self.MoveGen(N[0] , SuccList)
            self.Sort(Child , not self.maxMin)
            print("sorted child list : " , Child)
            print("closed : " , CLOSED)
            if len(Child) == 0:
                break

            newNode = Child[0]


        print("hii climbing completed with node : " , N[0] , " of value  :" , N[1])
        Closed = CLOSED
      
        
        print("---------------------")
        print(IU_graph.my_heuristic)
        
        
        self.search_result = tk.Label(self.master, text="")
        self.search_result.pack()
        self.search_result.place(x = 870 , y = 370)
        self.search_result.config(text= "Result: hill climbing completed with node :"+ str(N[0]) + " with the value :  "+str(N[1]))
   

    def chose_option(self, option):
            self.algorithm.set(option)


    def get_start_state(self):
        return self.start_state_id

    

    def get_graph_str(self):
        graph_str = {
        str(key): value if not isinstance(value, dict) else {
            str(k): v for k, v in value.items()
        } for key, value in self.graph.schema.items() if value
        }
        return graph_str