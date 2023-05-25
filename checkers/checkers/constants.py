import pygame

WIDTH, HEIGHT = 600, 600
ROWS, COLS = 8, 8
SQUARE_SIZE = WIDTH // COLS

# rgb
BROWN = (153, 76, 0)
BEIGE = (255, 178, 102)
WHITE = (255, 229, 204)
BLUE = (51, 123, 255)
GREY = (128, 128, 128)

CROWN = pygame.transform.scale(
    pygame.image.load("checkers\_assets\crown.png"), (44, 25)
)
