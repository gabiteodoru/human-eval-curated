triangle_area:{[a;b;c]
    $[(((a+b) > c) and (a+c) > b) and (b+c) > a;
       [
        s:((a+b)+c)%2.0;
        area:sqrt[((s*s-a)*s-b)*s-c];
        :.qython.round_digits[area;2]
       ];
        :-1
      ]
    }