parse_music: {[music_string]
  s: $[10h=type music_string; music_string; enlist music_string];
  if[0=count s; :()];
  noteDict: (`$"o";`$"o|";`$".|")!4 2 1;
  noteDict `$" " vs s
 }
