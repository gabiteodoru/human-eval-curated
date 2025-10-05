has_close_elements: {[numbers; threshold] diffs: raze abs numbers {x - y}'/: numbers; any (diffs > 0) & diffs < threshold}
