median:{[l]
    "Return median of elements in the list l.";
    sorted_l:asc[l];
    n:count[sorted_l];
    $[(n mod 2) = 1;
        :sorted_l[n div 2];
       [
        mid1:sorted_l[(n div 2)-1];
        mid2:sorted_l[n div 2];
        :(mid1+mid2)%2.0
       ]
      ]
    }