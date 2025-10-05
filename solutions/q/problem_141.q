file_name_check: {[file_name]
  / Check if exactly one dot
  dotCount: sum "." = file_name;
  if[dotCount <> 1; :"No"];

  / Split by dot
  parts: "." vs file_name;
  name: parts 0;
  ext: parts 1;

  / Check if name is not empty
  if[0 = count name; :"No"];

  / Check if first character is a letter
  first_char: first name;
  if[not (first_char within "az") | (first_char within "AZ"); :"No"];

  / Check digit count (max 3)
  digitCount: sum file_name in "0123456789";
  if[digitCount > 3; :"No"];

  / Check extension
  if[not ext in ("txt"; "exe"; "dll"); :"No"];

  "Yes"
 };
