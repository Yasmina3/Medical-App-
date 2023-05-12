import pygame
import sys
import time

"""
Tic Tac Toe Player
"""

# import math
from copy import deepcopy
# import numpy as np


def run_logic(window, page_title):
    class tictactoe:
        X = "X"
        O = "O"
        EMPTY = None

        def initial_state():
            """
            Returns starting state of the board.
            """
            return [[tictactoe.EMPTY, tictactoe.EMPTY, tictactoe.EMPTY],
                    [tictactoe.EMPTY, tictactoe.EMPTY, tictactoe.EMPTY],
                    [tictactoe.EMPTY, tictactoe.EMPTY, tictactoe.EMPTY]]

        # helper

        def get_diagonal(board):
            return [[board[0][0], board[1][1], board[2][2]],
                    [board[0][2], board[1][1], board[2][0]]]

        # helper

        def get_columns(board):
            columns = []

            for i in range(3):
                columns.append([row[i] for row in board])

            return columns

        # helper

        def three_in_a_row(row):
            return True if row.count(row[0]) == 3 else False

        def player(board):
            #    Returns player who has the next turn on a board.
            count_x = 0
            count_o = 0
            for i in board:
                for j in i:
                    if (j == "X"):
                        count_x = count_x+1
                    if (j == "O"):
                        count_o = count_o+1
            return tictactoe.O if count_x > count_o else tictactoe.X

        def actions(board):
            """
            Returns set of all possible actions (i, j) available on the board.
            """
            action = set()
            for i, row in enumerate(board):
                for j, vall in enumerate(row):
                    if (vall == tictactoe.EMPTY):
                        action.add((i, j))
            return action

        def result(board, action):
            """
            Returns the board that results from making move (i, j) on the board.
            """
            i, j = action
            if (board[i][j] != tictactoe.EMPTY):
                raise Exception("Invalid Move ")
            next_move = tictactoe.player(board)
            deep_board = deepcopy(board)
            deep_board[i][j] = next_move
            return deep_board

        def winner(board):
            """
            Returns the winner of the game, if there is one.

            new_board=deepcopy(board)
            new_board=zip(*new_board)
            diagonal_one=[board[item][item] for item in range(3)]
            diagonal_two=[board[item][2-item] for item in range(3)]


            #checking for X
            if(any(all(j==X for j in i) for i in board) or any(all(j==X for j in i) for i in new_board) or all(itm == X for itm in diagonal_one) or all(itm == X for itm in diagonal_two)):
                return X 
            if(any(all(j==O for j in i) for i in board) or any(all(j==O for j in i) for i in new_board) or all(itm == O for itm in diagonal_one) or all(itm == O for itm in diagonal_two)):
                print("inside Winner O")
                return O
            return None
            """
            rows = board + \
                tictactoe.get_diagonal(board) + tictactoe.get_columns(board)
            for row in rows:
                current_palyer = row[0]
                if current_palyer is not None and tictactoe.three_in_a_row(row):
                    return current_palyer
            return None

        def terminal(board):
            """
            Returns True if game is over, False otherwise.
            """
            xx = tictactoe.winner(board)
            if (xx is not None):
                return True
            if (all(all(j != tictactoe.EMPTY for j in i) for i in board)):
                return True
            return False

        def utility(board):
            """
            Returns 1 if X has won the game, -1 if O has won, 0 otherwise.
            """
            xx = tictactoe.winner(board)
            if (xx == tictactoe.X):
                return 1
            elif (xx == tictactoe.O):
                return -1
            else:
                return 0

        # Helper for aplha_beta_prining

        def max_alpha_beta_pruning(board, alpha, beta):
            if (tictactoe.terminal(board) == True):
                return tictactoe.utility(board), None
            vall = float("-inf")
            best = None
            for action in tictactoe.actions(board):
                min_val = tictactoe.min_alpha_beta_pruning(
                    tictactoe.result(board, action), alpha, beta)[0]
                if (min_val > vall):
                    best = action
                    vall = min_val
                alpha = max(alpha, vall)
                if (beta <= alpha):
                    break
            return vall, best

        def min_alpha_beta_pruning(board, alpha, beta):
            if (tictactoe.terminal(board) == True):
                return tictactoe.utility(board), None
            vall = float("inf")
            best = None
            for action in tictactoe.actions(board):
                max_val = tictactoe.max_alpha_beta_pruning(
                    tictactoe.result(board, action), alpha, beta)[0]
                if (max_val < vall):
                    best = action
                    vall = max_val
                beta = min(beta, vall)
                if (beta <= alpha):
                    break
            return vall, best

        def minimax(board):
            """
            Returns the optimal action for the current player on the board.
            """
            if tictactoe.terminal(board):
                return None
            if (tictactoe.player(board) == tictactoe.X):
                return tictactoe.max_alpha_beta_pruning(board, float("-inf"), float("inf"))[1]
            elif (tictactoe.player(board) == tictactoe.O):
                return tictactoe.min_alpha_beta_pruning(board, float("-inf"), float("inf"))[1]
            else:
                raise Exception("Error in Caculating Optimal Move")

    pygame.init()
    size = width, height = 600, 400

    # Colors
    black = (0, 0, 0)
    white = (255, 255, 255)

    screen = pygame.display.set_mode(size)

    mediumFont = pygame.font.Font(
        "_tic_tac_toe\OpenSans-Regular.ttf", 28)
    largeFont = pygame.font.Font(
        "_tic_tac_toe\OpenSans-Regular.ttf", 40)
    moveFont = pygame.font.Font(
        "_tic_tac_toe\OpenSans-Regular.ttf", 60)

    user = None
    board = tictactoe.initial_state()
    ai_turn = False

    while True:

        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                sys.exit()

        screen.fill(black)

        # Let user choose a player.
        if user is None:

            # Draw title
            title = largeFont.render("Play Tic-Tac-Toe", True, white)
            titleRect = title.get_rect()
            titleRect.center = ((width / 2), 50)
            screen.blit(title, titleRect)

            # Draw buttons
            playXButton = pygame.Rect((width / 8), (height / 2), width / 4, 50)
            playX = mediumFont.render("Play as X", True, black)
            playXRect = playX.get_rect()
            playXRect.center = playXButton.center
            pygame.draw.rect(screen, white, playXButton)
            screen.blit(playX, playXRect)

            playOButton = pygame.Rect(
                5 * (width / 8), (height / 2), width / 4, 50)
            playO = mediumFont.render("Play as O", True, black)
            playORect = playO.get_rect()
            playORect.center = playOButton.center
            pygame.draw.rect(screen, white, playOButton)
            screen.blit(playO, playORect)

            # Check if button is clicked
            click, _, _ = pygame.mouse.get_pressed()
            if click == 1:
                mouse = pygame.mouse.get_pos()
                if playXButton.collidepoint(mouse):
                    time.sleep(0.2)
                    user = tictactoe.X
                elif playOButton.collidepoint(mouse):
                    time.sleep(0.2)
                    user = tictactoe.O

        else:

            # Draw game board
            tile_size = 80
            tile_origin = (width / 2 - (1.5 * tile_size),
                           height / 2 - (1.5 * tile_size))
            tiles = []
            for i in range(3):
                row = []
                for j in range(3):
                    rect = pygame.Rect(
                        tile_origin[0] + j * tile_size,
                        tile_origin[1] + i * tile_size,
                        tile_size, tile_size
                    )
                    pygame.draw.rect(screen, white, rect, 3)

                    if board[i][j] != tictactoe.EMPTY:
                        move = moveFont.render(board[i][j], True, white)
                        moveRect = move.get_rect()
                        moveRect.center = rect.center
                        screen.blit(move, moveRect)
                    row.append(rect)
                tiles.append(row)

            game_over = tictactoe.terminal(board)
            player = tictactoe.player(board)

            # Show title
            if game_over:
                winner = tictactoe.winner(board)
                if winner is None:
                    title = f"Game Over: Tie."
                else:
                    title = f"Game Over: {winner} wins."
            elif user == player:
                title = f"Play as {user}"
            else:
                title = f"Computer thinking..."
            title = largeFont.render(title, True, white)
            titleRect = title.get_rect()
            titleRect.center = ((width / 2), 30)
            screen.blit(title, titleRect)

            # Check for AI move
            if user != player and not game_over:
                if ai_turn:
                    time.sleep(0.5)
                    move = tictactoe.minimax(board)
                    board = tictactoe.result(board, move)
                    ai_turn = False
                else:
                    ai_turn = True

            # Check for a user move
            click, _, _ = pygame.mouse.get_pressed()
            if click == 1 and user == player and not game_over:
                mouse = pygame.mouse.get_pos()
                for i in range(3):
                    for j in range(3):
                        if (board[i][j] == tictactoe.EMPTY and tiles[i][j].collidepoint(mouse)):
                            board = tictactoe.result(board, (i, j))

            if game_over:
                againButton = pygame.Rect(
                    width / 3, height - 65, width / 3, 50)
                again = mediumFont.render("Play Again", True, black)
                againRect = again.get_rect()
                againRect.center = againButton.center
                pygame.draw.rect(screen, white, againButton)
                screen.blit(again, againRect)
                click, _, _ = pygame.mouse.get_pressed()
                if click == 1:
                    mouse = pygame.mouse.get_pos()
                    if againButton.collidepoint(mouse):
                        time.sleep(0.2)
                        user = None
                        board = tictactoe.initial_state()
                        ai_turn = False

        pygame.display.flip()
