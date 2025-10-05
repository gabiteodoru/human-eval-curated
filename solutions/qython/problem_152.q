compare:{[game;guess]
    "Return array showing how far off each guess was from actual score.
    If guessed correctly, value is 0, otherwise it's the absolute difference.
    ";
    :abs[game-guess]
    }