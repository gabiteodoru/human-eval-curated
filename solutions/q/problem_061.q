correct_bracketing: {[brackets] if[0=count brackets; :1b]; depth: sums ?[brackets="(";1;-1]; (0=last depth) and 0<=(min depth)}
