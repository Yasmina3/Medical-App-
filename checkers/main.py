import pygame
from checkers.checkers.constants import WIDTH, HEIGHT, SQUARE_SIZE, BROWN, BEIGE
from checkers.checkers.game import Game
from checkers.minimax.algorithm import alpha_beta


def run_logic(window, page_title):
    pygame.font.init()

    pygame.display.set_caption("Checkers")
    icon = pygame.image.load("checkers/_assets/_2004327.png")
    pygame.display.set_icon(icon)

    button_font = pygame.font.SysFont("arial", 40)
    button_text = button_font.render("  Play  ", True, (255, 255, 255))

    button_rect = button_text.get_rect(center=(WIDTH / 2, HEIGHT / 2 + 200))

    WIN = pygame.display.set_mode((WIDTH, HEIGHT))
    FPS = 60

    def get_row_col_from_mouse(pos):
        x, y = pos
        row = y // SQUARE_SIZE
        col = x // SQUARE_SIZE
        return row, col

    def start_game():
        run = True
        clock = pygame.time.Clock()
        game = Game(WIN)

        while run:
            clock.tick(FPS)

            if game.turn == BEIGE:
                value, new_board = alpha_beta(
                    game.get_board(), 4, float("-inf"), float("inf"), BEIGE, game
                )
                game.ai_move(new_board)

            if game.winner() is not None:
                print(game.winner())
                run = False

            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    run = False

                if event.type == pygame.MOUSEBUTTONDOWN:
                    pos = pygame.mouse.get_pos()
                    row, col = get_row_col_from_mouse(pos)
                    game.select(row, col)

            game.update()

        # pygame.quit()

    def draw_start_screen():
        WIN.fill((135, 206, 235))
        title_image = pygame.image.load("checkers/_assets/_2004327.png")
        title_image = pygame.transform.scale(
            title_image,
            (int(title_image.get_width() / 2), int(title_image.get_height() / 2)),
        )
        title_rect = title_image.get_rect(center=(WIDTH / 2, HEIGHT / 4))
        WIN.blit(title_image, title_rect)

        description_font = pygame.font.SysFont("arial", 24)
        description_text = "Checkers is a classic adversarial game played on a square board with alternating dark and light squares. Players strategically move their pieces to capture their opponent's pieces, aiming to eliminate all opposing checkers or block their moves."

        lines = []
        current_line = ""
        words = description_text.split()

        for word in words:
            if len(current_line + " " + word) <= 45:  # Maximum characters per line
                current_line += " " + word
            else:
                lines.append(current_line.strip())
                current_line = word

        lines.append(current_line.strip())

        description_rect = pygame.Rect(
            WIDTH / 2 - 250, HEIGHT / 3 + 100, 500, 200
        )  # Adjust the rectangle dimensions as needed
        y = description_rect.y

        for line in lines:
            line_surface = description_font.render(line, True, (0, 0, 0))
            line_rect = line_surface.get_rect(midtop=(description_rect.centerx, y))
            WIN.blit(line_surface, line_rect)
            y += line_rect.height

        pygame.draw.rect(WIN, (0, 0, 0), button_rect, border_radius=10)
        pygame.draw.rect(
            WIN, (255, 0, 0), button_rect.inflate(-10, -10), border_radius=10
        )
        WIN.blit(button_text, button_rect.move(0, -5))
        pygame.display.update()

    def main():
        run = False
        while not run:
            draw_start_screen()

            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    run = True
                elif event.type == pygame.MOUSEBUTTONDOWN:
                    pos = pygame.mouse.get_pos()
                    if button_rect.collidepoint(pos):
                        start_game()
                        run = True

        pygame.quit()

    main()
