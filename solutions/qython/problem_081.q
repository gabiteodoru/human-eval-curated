get_letter_grade:{[gpa]
    if[gpa = 4.0;
        :"A+"
        ];
    if[gpa > 3.7;
        :enlist["A"]
        ];
    if[gpa > 3.3;
        :"A-"
        ];
    if[gpa > 3.0;
        :"B+"
        ];
    if[gpa > 2.7;
        :enlist["B"]
        ];
    if[gpa > 2.3;
        :"B-"
        ];
    if[gpa > 2.0;
        :"C+"
        ];
    if[gpa > 1.7;
        :enlist["C"]
        ];
    if[gpa > 1.3;
        :"C-"
        ];
    if[gpa > 1.0;
        :"D+"
        ];
    if[gpa > 0.7;
        :enlist["D"]
        ];
    if[gpa > 0.0;
        :"D-"
        ];
    :enlist["E"]
    };
numerical_letter_grade:{[grades]
    :get_letter_grade each grades
    }