do_algebra:{[operator;operand]
    nums:{[x] .qython.float[x]} each operand;
    ops:{[x] x} each operator;
    i:0;
    while[i < count[ops];
        $[ops[i]~"**";
           [
            nums[i]:nums[i] xexp nums[i+1];
            nums:raze[(.qython.slice[nums;0N;i+1;0N];.qython.slice[nums;i+2;0N;0N])];
            ops:raze[(.qython.slice[ops;0N;i;0N];.qython.slice[ops;i+1;0N;0N])]
           ];
            i+:1
          ]
        ];
    i:0;
    while[i < count[ops];
        $[ops[i]~enlist["*"];
           [
            nums[i]:nums[i]*nums[i+1];
            nums:raze[(.qython.slice[nums;0N;i+1;0N];.qython.slice[nums;i+2;0N;0N])];
            ops:raze[(.qython.slice[ops;0N;i;0N];.qython.slice[ops;i+1;0N;0N])]
           ];
          ops[i]~"//";
           [
            nums[i]:.qython.float[.qython.int[nums[i] div nums[i+1]]];
            nums:raze[(.qython.slice[nums;0N;i+1;0N];.qython.slice[nums;i+2;0N;0N])];
            ops:raze[(.qython.slice[ops;0N;i;0N];.qython.slice[ops;i+1;0N;0N])]
           ];
            i+:1
          ]
        ];
    i:0;
    while[i < count[ops];
        $[ops[i]~enlist["+"];
           [
            nums[i]:nums[i]+nums[i+1];
            nums:raze[(.qython.slice[nums;0N;i+1;0N];.qython.slice[nums;i+2;0N;0N])];
            ops:raze[(.qython.slice[ops;0N;i;0N];.qython.slice[ops;i+1;0N;0N])]
           ];
          ops[i]~enlist["-"];
           [
            nums[i]:nums[i]-nums[i+1];
            nums:raze[(.qython.slice[nums;0N;i+1;0N];.qython.slice[nums;i+2;0N;0N])];
            ops:raze[(.qython.slice[ops;0N;i;0N];.qython.slice[ops;i+1;0N;0N])]
           ];
            i+:1
          ]
        ];
    :.qython.int[nums[0]]
    }