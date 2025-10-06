candidate: bf;

check:{[candidate]
    .qython.assert2[any any (.[candidate;;`] each {(x;`$x)}("Jupiter";"Neptune"))  ~/:\: {(x;`$x)} ("Saturn";"Uranus");"First test error"];
    .qython.assert2[any any (.[candidate;;`] each {(x;`$x)}("Earth";"Mercury")) ~/:\: {(x;`$x)} enlist "Venus";"Second test error"];
    .qython.assert2[any any (.[candidate;;`] each {(x;`$x)}("Mercury";"Uranus")) ~/:\: {(x;`$x)} ("Venus";"Earth";"Mars";"Jupiter";"Saturn");"Third test error"];
    .qython.assert2[any any (.[candidate;;`] each {(x;`$x)}("Neptune";"Venus")) ~/:\: {(x;`$x)} ("Earth";"Mars";"Jupiter";"Saturn";"Uranus");"Fourth test error"];
    .qython.assert[0 = min count each .[candidate;;`] each {(x;`$x)}("Earth";"Earth")];
    .qython.assert[0 = min count each .[candidate;;`] each {(x;`$x)}("Mars";"Earth")];
    .qython.assert[0 = min count each .[candidate;;`] each {(x;`$x)}("Jupiter";"Makemake")]
    }