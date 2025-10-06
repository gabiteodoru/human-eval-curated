reverse_delete: {[s;c]
  result: s where not s in c;
  (result; result~reverse result)
  }
