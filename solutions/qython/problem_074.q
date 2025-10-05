total_match:{[lst1;lst2]
    total1:$[count[lst1] > 0;(sum[{[s] count[s]} each lst1]);0];
    total2:$[count[lst2] > 0;(sum[{[s] count[s]} each lst2]);0];
    :$[total1 <= total2;lst1;lst2]
    }