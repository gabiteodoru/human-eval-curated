triangle_area: {[a;b;c]
  $[((a+b)>c) and ((a+c)>b) and ((b+c)>a);
    [s: (a+b+c)%2;
     area: sqrt s*(s-a)*(s-b)*(s-c);
     0.01*floor 0.5+area*100];
    -1f]
  }
