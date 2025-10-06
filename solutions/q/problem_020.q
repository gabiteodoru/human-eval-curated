find_closest_elements: {[numbers]
    sorted: asc numbers;
    diffs: 1_ deltas sorted;
    minIdx: diffs?min diffs;
    sorted[minIdx + 0 1]
    };
