parse_music:{[music_string]
    notes:.qython.split[" "; music_string];
    note_to_beats:{[note]
        $[note~enlist["o"];
            :4;
          note~"o|";
            :2;
          note~".|";
            :1;
            :0
          ]
        };
    :note_to_beats each notes
    }