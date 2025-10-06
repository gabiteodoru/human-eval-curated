check_if_last_char_is_a_letter:{[txt]
  / Return False if empty string
  if[0=count txt; :0b];
  / Get last character
  lastChar:last txt;
  / Check if last char is alphabetical
  if[not lastChar in .Q.A,.Q.a; :0b];
  / If string has only 1 char, it's standalone (True)
  if[1=count txt; :1b];
  / Check if second-to-last char is a space
  txt[count[txt]-2]=" "
 };
