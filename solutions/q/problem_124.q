valid_date: {[dt]
  / Check if empty
  if[0=count dt; :0b];

  / Split by hyphen
  parts: "-" vs dt;

  / Check format: should have exactly 3 parts
  if[3<>count parts; :0b];

  / Extract parts
  mm: parts 0;
  dd: parts 1;
  yyyy: parts 2;

  / Check each part is all digits
  if[not all mm in .Q.n; :0b];
  if[not all dd in .Q.n; :0b];
  if[not all yyyy in .Q.n; :0b];

  / Convert to integers
  month: "J"$mm;
  day: "J"$dd;
  year: "J"$yyyy;

  / Validate month (1-12)
  if[(month<1) or month>12; :0b];

  / Days per month
  days_in_month: (1 2 3 4 5 6 7 8 9 10 11 12)!(31 29 31 30 31 30 31 31 30 31 30 31);
  max_days: days_in_month[month];

  / Validate day
  if[(day<1) or day>max_days; :0b];

  / If all checks pass
  1b
 };
