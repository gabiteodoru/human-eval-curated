iscube: {[a] cbrt: abs[a] xexp 1%3; rounded: "j"$cbrt; candidate1: (signum[a] * rounded) xexp 3; candidate2: (signum[a] * rounded + 1) xexp 3; (a = candidate1) or a = candidate2};
