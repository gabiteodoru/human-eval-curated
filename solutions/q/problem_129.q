minPath: {[grid;k]
  n: count grid;
  flatGrid: raze grid;
  minVal: min flatGrid;
  minIdx: flatGrid?minVal;
  minRow: minIdx div n;
  minCol: minIdx mod n;

  / Get neighbors of min cell using vectorized operations
  dirs: (-1 0; 1 0; 0 -1; 0 1);
  neighborPos: dirs +\: (minRow;minCol);
  / Filter valid positions
  validMask: {[n;pos] (pos[0] within (0;n-1)) and pos[1] within (0;n-1)}[n] each neighborPos;
  validPos: neighborPos where validMask;
  / Get neighbor values
  neighborVals: {[grid;pos] grid[pos[0]][pos[1]]}[grid] each validPos;
  minNeighbor: min neighborVals;

  / Build result by alternating between minVal and minNeighbor
  (k#minVal,minNeighbor)til k
 }
