gradeOne: {[gpa]
  rtrim $[gpa=4.0; "A+";
    gpa>3.7; "A ";
    gpa>3.3; "A-";
    gpa>3.0; "B+";
    gpa>2.7; "B ";
    gpa>2.3; "B-";
    gpa>2.0; "C+";
    gpa>1.7; "C ";
    gpa>1.3; "C-";
    gpa>1.0; "D+";
    gpa>0.7; "D ";
    gpa>0.0; "D-";
    "E "]
  };

numerical_letter_grade: {[grades] gradeOne each grades};
