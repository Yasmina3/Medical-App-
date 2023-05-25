import pygame
from .constants import BROWN, BEIGE, BLUE, SQUARE_SIZE
from .board import Board


class Game:
    def __init__(self, win):
        self._init()
        self.win = win
        self.message = None  # Initialize the message variable

    def update(self):
        self.board.draw(self.win)
        self.draw_valid_moves(self.valid_moves)
        self.winner()  # Check for a winner
        self.display_message()  # Call the display_message method
        pygame.display.update()

    def _init(self):
        self.selected = None
        self.board = Board()
        self.turn = BROWN
        self.valid_moves = {}

    def winner(self):
        result = self.board.winner()
        return result

    def reset(self):
        self._init()

    def select(self, row, col):
        if self.selected:
            result = self._move(row, col)
            if not result:
                self.selected = None
                self.select(row, col)

        piece = self.board.get_piece(row, col)
        if piece != 0 and piece.color == self.turn:
            self.selected = piece
            self.valid_moves = self.board.get_valid_moves(piece)
            return True

        return False

    def display_message(self):
        if self.message:
            font = pygame.font.SysFont(None, 48)
            text = font.render(self.message, True, (0, 0, 0))
            text_rect = text.get_rect()
            text_rect.center = (
                self.win.get_width() // 2,
                self.win.get_height() // 2,
            )  # Set the position of the message on the window

            button_width = text_rect.width + 30
            button_height = text_rect.height + 30
            button_rect = pygame.Rect(
                text_rect.centerx - button_width // 2,
                text_rect.centery - button_height // 2,
                button_width,
                button_height,
            )

            # Check if the button is clicked
            mouse_pos = pygame.mouse.get_pos()
            if button_rect.collidepoint(mouse_pos):
                pygame.draw.rect(
                    self.win, (0, 255, 255), button_rect
                )  # Darken the button on hover
            else:
                pygame.draw.rect(
                    self.win, (0, 255, 255), button_rect
                )  # Default button color

            self.win.blit(text, text_rect)

        else:
            if not any(
                self.board.get_valid_moves(piece)
                for piece in self.board.get_all_pieces(self.turn)
            ):
                if self.turn == BROWN:
                    no_moves_message = (
                        "Beige wins!"  # Set the message for beige's victory
                    )
                else:
                    no_moves_message = (
                        "Brown wins!"  # Set the message for brown's victory
                    )

                font = pygame.font.SysFont(None, 48)
                text = font.render(no_moves_message, True, (0, 0, 0))
                text_rect = text.get_rect()
                text_rect.center = (
                    self.win.get_width() // 2,
                    self.win.get_height() // 2,
                )
                button_width = text_rect.width + 30
                button_height = text_rect.height + 30
                button_rect = pygame.Rect(
                    text_rect.centerx - button_width // 2,
                    text_rect.centery - button_height // 2,
                    button_width,
                    button_height,
                )

                # Check if the button is clicked
                mouse_pos = pygame.mouse.get_pos()
                if button_rect.collidepoint(mouse_pos):
                    pygame.draw.rect(
                        self.win, (0, 255, 255), button_rect
                    )  # Darken the button on hover
                else:
                    pygame.draw.rect(
                        self.win, (0, 255, 255), button_rect
                    )  # Default button color

                self.win.blit(text, text_rect)

    def _move(self, row, col):
        piece = self.board.get_piece(row, col)
        if self.selected and piece == 0 and (row, col) in self.valid_moves:
            self.board.move(self.selected, row, col)
            skipped = self.valid_moves[(row, col)]
            if skipped:
                self.board.remove(skipped)
            self.change_turn()
        else:
            return False

        if not self.board.get_valid_moves(self.selected):
            # No valid moves for the current player
            self.change_turn()

        return True

    def draw_valid_moves(self, moves):
        for move in moves:
            row, col = move
            pygame.draw.circle(
                self.win,
                BLUE,
                (
                    col * SQUARE_SIZE + SQUARE_SIZE // 2,
                    row * SQUARE_SIZE + SQUARE_SIZE // 2,
                ),
                15,
            )

    def change_turn(self):
        self.valid_moves = {}
        if self.turn == BROWN:
            self.turn = BEIGE
        else:
            self.turn = BROWN

    def get_board(self):
        return self.board

    def ai_move(self, board):
        self.board = board
        self.change_turn()
