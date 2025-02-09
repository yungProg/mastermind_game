# mastermind_game

Create a board containing 12 rows each with 4 cells
available colors are [yellow, orange, green, blue, purple, pink]
Computer creates and store a random array of 4 colors
It can repeat the colors in arbitrary combination
human player is allowed to make guess by inputting 4 random colors
Guessed code is checked if it has the same configuration as secret code
    If a guessed peg is in the same position to its correspondent in the secret code a red peg is appended to the guessed code
    If a guessed peg is in different position compared to its correspondent, a white peg is appended to the guessed code
    If neither condition passes nothing is appended to the guess code
Player has 12 guesses. Game ends if he exhausts all the guesses or predict correct code.

red, red, blue, yellow
green, blue, yellow, yellow

commit:
    update valid guess check criteria

To be done:
    - validate secret maker's code
    - add replay option
    - write computers algorithm to generate secret
    - write computer's algorithm to guess code
    - allow human vs human, human vs computer, computer vs human and computer vs computer