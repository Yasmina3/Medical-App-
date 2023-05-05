from py_search.base import *
from py_search import *
from py_search.uninformed import depth_first_search, breadth_first_search
from py_search.informed import *
import tkinter as tk

class SearchGraph:

    def __init__(self, initial_node, goal_node, graph):
        self.state = initial_node
        self.goal = goal_node
        self.map = graph

    def legalActions(self):
        return list(self.map[self.state])

    def __hash__(self):
        return hash(self.state)

    def __eq__(self, other):
        if isinstance(other, SearchGraph):
            return self.state == other.state
        return False

    def __ne__(self, other):
        return not self == other

    def __repr__(self):
        return str(self)

    def __str__(self):
        return self.state


class GraphProblem(Problem):

    def heuristic(node):
        return 1    
    def successors(self, node):
        for neighbor in node.state.legalActions():
            new = SearchGraph(neighbor, node.state.goal, Application.get_graph_str)
            yield Node(new, node, neighbor)

    def goal_test(self, node, goal):
        return node.state.state == node.state.goal

class Graph:
    def __init__(self):
        self.nodes = []
        self.edges = []
        self.schema = {}

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
            self.schema[node1_id][node2_id] = cost
            self.schema[node2_id][node1_id] = cost
        except ValueError:
            label_result = tk.Label( text="Please enter valid integers")
            label_result.pack()

class Node:
    def __init__(self, node_id, x, y):
        self.node_id = node_id
        self.x = x
        self.y = y

class Application(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.graph = Graph()
        self.current_node = None
        self.start_state_id = None
        self.goal_state_id = None
        # self.current_cost = None
        self.create_widgets()

    def create_widgets(self):
        self.canvas = tk.Canvas(self.master, width=600, height=400)
        self.canvas.pack()

        self.mode = 'node'
        self.add_node_button = tk.Button(self.master, text="Add Node", command=self.set_mode_node)
        self.add_edge_button = tk.Button(self.master, text="Add Edge", command=self.set_mode_edge)
        self.delete_button = tk.Button(self.master, text="Delete Graph", command=self.delete_graph)
        self.set_cost = tk.Button(self.master, text="Update Cost", command=self.update_cost)
        # self.delete_node_button = tk.Button(self.master, text="Delete Node", command=self.delete_node)

        

        options = ["dpth first search", "breadth first search", "uniform cost search"]

        variable = tk.StringVar(self.master)
        variable.set(options[0])

        option_menu = tk.OptionMenu(self.master, variable, *options, command=self.chose_search)
        
        
        self.add_node_button.pack(side='left')
        self.add_edge_button.pack(side='left')
        self.delete_button.pack(side='left')
        self.set_cost.pack(side='left')
        option_menu.pack(side='left')
        
        # self.delete_node_button.pack(side='left')
        tk.Label(self.master, text="Start state: ").pack(side="left")
        start = tk.Entry(self.master)
        start.pack(side="left")

        tk.Label(self.master, text="Goal state: ").pack(side="left")
        goal = tk.Entry(self.master)
        goal.pack(side="left")

        self.apply_search = tk.Button(self.master, text="Apply search", command=lambda: self.search(int(start.get()), int(goal.get())))
        self.apply_search.pack(side='left')
        # self.start_state = int(start.get())
        # self.goal_state = int(goal.get())

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


    # important don't erase*********
    # def update_cost(self):
    #     self.mode = 'update_cost'
    #     label_first = tk.Label(root, text="first node")
    #     label_first.pack()
    #     entry1 = tk.Entry(root)
    #     entry1.pack()
    #     label_second = tk.Label(root, text="second node")
    #     label_second.pack()
    #     entry2 = tk.Entry(root)
    #     entry2.pack()
    #     label_cost = tk.Label(root, text="new cost")
    #     label_cost.pack()
    #     entry_cost = tk.Entry(root)
    #     entry_cost.pack()

    #     label_result = tk.Label(root, text="")
        
    #     button = tk.Button(root, text="OK", command=lambda: self.graph.cost_update_process(entry1.get(), entry2.get(), entry_cost.get()))
    #     button.pack()
    #     label_result.pack()

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

        button = tk.Button(top, text="Update Cost", command=lambda: self.combined_function(entry1.get(), entry2.get(), entry_cost.get()) )
        button.grid(row=3, columnspan=2)

        # print(f"updated cost from node {int(entry1.get())} to node {int(entry2.get())}")
        # print(self.graph.schema)


    def combined_function(self, entry_1, entry_2, entry_cost):
        self.graph.cost_update_process(entry_1, entry_2, entry_cost)
        self.update_cost_canvas(self.graph.get_node_by_id(int(entry_1)), self.graph.get_node_by_id(int(entry_2)))

    def add_node(self, event):
        x, y = event.x, event.y
        if x < 0 or y < 0 or x > self.canvas.winfo_width() or y > self.canvas.winfo_height():
            return
        node_id = len(self.graph.nodes) + 1
        node = Node(node_id, x, y)
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
        self.canvas.create_oval(x-20, y-20, x+20, y+20, fill='cyan')
        self.canvas.create_text(x, y, text=str(node.node_id))

    def draw_edge(self, node1, node2):
        x1, y1 = node1.x, node1.y
        x2, y2 = node2.x, node2.y
        edge_cost = self.graph.schema[node1.node_id][node2.node_id]
        self.canvas.create_line(x1, y1, x2, y2)
        label_x, label_y = (x1 + x2) / 2, (y1 + y2) / 2
        square = self.canvas.create_rectangle(label_x-10, label_y-10, label_x+10, label_y+10,
                                           fill='white', outline='white')
        edge_cost_label = self.canvas.create_text(label_x, label_y, text=str(edge_cost))

    def update_cost_canvas(self, node1, node2):
        x1, y1 = node1.x, node1.y
        x2, y2 = node2.x, node2.y
        edge_cost = self.graph.schema[node1.node_id][node2.node_id]
        label_x, label_y = (x1 + x2) / 2, (y1 + y2) / 2
        square = self.canvas.create_rectangle(label_x-10, label_y-10, label_x+10, label_y+10,
                                           fill='white', outline='white')
        edge_cost_label = self.canvas.create_text(label_x, label_y, text=str(edge_cost))

    def delete_graph(self):
        # clear the canvas
        self.canvas.delete("all")
        # clear the graph
        self.graph = Graph()
        self.current_node = None

    def search(self, start_id, goal_id):
        self.start_state_id = start_id
        self.goal_state_id = goal_id
        # graph_str = {str(key): value if not isinstance(value, dict) else {str(k): v for k, v in value.items()} for key, value in self.graph.schema.items()}
        initial = SearchGraph(str(start_id), str(goal_id), self.get_graph_str)
        problem = GraphProblem(initial)
        dfs = depth_first_search(problem)
        bfs = breadth_first_search(problem)
        best = best_first_search(problem)
        print("BFS Result: ")
        print(initial)
        for item in bfs:
            for action in item.path():
                print(action)

        print("DFS Result: ")
        print(initial)
        for item in dfs:
            for action in item.path():
                print(action)

        print("BestFS Result: ")
        print(initial)
        for item in best:
            for action in item.path():
                print(action)
        print("helloooooooooooooooooooooooooo")

    def chose_search(self, option):
            print(option)

    def get_start_state(self):
        return self.start_state_id

    def get_goal_state(self):
        return self.goal_state_id

    def get_graph_str(self):
        graph_str = {str(key): value if not isinstance(value, dict) else {str(k): v for k, v in value.items()} for key, value in self.graph.schema.items()}
        return graph_str




# root = tk.Tk()
# app = Application(master=root)
# app.mainloop()


graph = {
    'A': {'B': 2, 'C': 3},
    'B': {'A': 2, 'C': 4, 'D': 5},
    'C': {'A': 3, 'B': 4, 'D': 3},
    'D': {'B': 5, 'C': 3, 'E': 2},
    'E': {'D': 2, 'F': 3, 'G': 5},
    'F': {'C': 6, 'E': 3},
    'G': {'E': 5}
}

