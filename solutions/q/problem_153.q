Strongest_Extension: {[class_name; extensions]
  strengths: (sum each extensions within\: "AZ") - sum each extensions within\: "az";
  strongest_idx: strengths?max strengths;
  class_name, ".", extensions[strongest_idx]
 }
