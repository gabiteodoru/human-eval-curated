string_to_md5: {[text]
  if[0=count text; :()];
  escaped: ssr[text;"'";"'\\''"];
  cmd: "printf '%s' '", escaped, "' | md5sum";
  result: first system cmd;
  first " " vs result
  };
