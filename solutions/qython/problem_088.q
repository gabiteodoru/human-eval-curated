sort_array:{[arr]
    if[count[arr] <= 1;
        :arr
        ];
    total:arr[0]+arr[count[arr]-1];
    $[(total mod 2) = 1;
        :asc[arr];
        :reverse[asc[arr]]
      ]
    }