do_algebra: {[operator; operand]
  ops: operator;
  vals: operand;

  / Helper to apply operation
  apply: {[op;x;y]
    $[op~"+"; x+y;
      op~"-"; x-y;
      op~"*"; x*y;
      op~"//"; floor x%y;
      op~"**"; x xexp y;
      0N]
   };

  / Process each precedence level
  / Level 1: ** (exponentiation)
  idx: where ops ~\: "**";
  while[count idx;
    i: first idx;
    vals: (i#vals), (enlist apply[ops[i]; vals[i]; vals[i+1]]), (i+2)_vals;
    ops: (i#ops), (i+1)_ops;
    idx: where ops ~\: "**"
  ];

  / Level 2: *, // (multiplication, floor division)
  idx: where (ops ~\: "*") or ops ~\: "//";
  while[count idx;
    i: first idx;
    vals: (i#vals), (enlist apply[ops[i]; vals[i]; vals[i+1]]), (i+2)_vals;
    ops: (i#ops), (i+1)_ops;
    idx: where (ops ~\: "*") or ops ~\: "//"
  ];

  / Level 3: +, - (addition, subtraction)
  idx: where (ops ~\: "+") or ops ~\: "-";
  while[count idx;
    i: first idx;
    vals: (i#vals), (enlist apply[ops[i]; vals[i]; vals[i+1]]), (i+2)_vals;
    ops: (i#ops), (i+1)_ops;
    idx: where (ops ~\: "+") or ops ~\: "-"
  ];

  first vals
 };
