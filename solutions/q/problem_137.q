compare_one: {[a;b]
  / Convert inputs to floats for comparison
  fa: $[(type a) in 10 -10h; "F"$ssr[$[10h=type a;a;enlist a];",";"."]; "f"$a];
  fb: $[(type b) in 10 -10h; "F"$ssr[$[10h=type b;b;enlist b];",";"."]; "f"$b];
  / Return null if equal, otherwise return the larger in original type
  $[fa=fb; ::; fa>fb; a; b]
 };
