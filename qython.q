// Qython runtime utilities for Python-to-Q translation
// Array creation functions inspired by the FinnAPL idiom library tradition
// (https://aplwiki.com/wiki/FinnAPL_idiom_library, CC BY-SA 4.0)
// and the Q Phrasebook (https://github.com/kxcontrib/phrases)

.qython.depth:{$[type[x]<0; 
  0; 
  "j"$sum(and)scan 1b,-1_{1=count distinct count each x}each raze scan x]};

.qython.shape:{$[type[x]=98h;(count x;count cols x);0=d:.qython.depth x; 
  0#0j; 
  d#{first raze over x}each(d{each[x;]}\count)@\:x]};

.qython.arange:({$[count[x]=1;til x[0];count[x]=2;x[0]+{$[x<0;`long$();til x]} x[1]-x[0];count[x]=3;x[0]+x[2]*{$[x<0;`long$();til x]} ceiling (x[1]-x[0])%x[2];'nyi]} enlist ::);
.qython.diff:{1_deltas x};
.qython.zeros:{x#0f};
.qython.ones:{x#1f};
.qython.eye:{(2#x)#1f,x#0f};

.qython.values:{flip value flip x};
.qython.valuesT:{value flip x};

// DataFrame merge function (pandas-style left join)
// Usage: .qython.merge[left_df; right_df; join_cols; how]
// join_cols: symbol list of column names to join on
// how: symbol (`left, `inner, `outer, `right) - currently only `left supported
.qython.merge:{[left;right;columns;how]
  if[not how in `left; '"only left join supported"];
  left lj columns xkey right
  };

// DataFrame merge function with fill-from-left behavior (like q's ljf)
// Usage: .qython.mergef[left_df; right_df; join_cols; how]
// Same as .qython.merge but uses ljf to fill nulls from left table when right is null
.qython.mergef:{[left;right;columns;how]
  if[not how in `left; '"only left join supported"];
  left ljf columns xkey right
  };

// Backward fill function (equivalent to pandas bfill)
// Usage: .qython.bfills[x]
// Fills nulls with following non-null values by reversing, forward filling, then reversing back
.qython.bfills:{reverse fills reverse x};

/ .qython.print:{(h:hopen `:qython_stdout.txt) " " sv {$[y;x;-2_x]}'[.Q.s each x;(til count x)=-1+count x]; hclose h}enlist::;
/ .qython.get_and_delete_logs:{[] x:read0 `:qython_stdout.txt; hdel `:qython_stdout.txt;x};
/ .qython.delete_logs:{[] hdel `:qython_stdout.txt};

.qython.percentile:{[x;p] asc[x][floor p*count x]};
.qython.run_safe: {
    v:$[`trp in key .Q; / check my q version handles errors
        .Q.trp[ / .Q.trp[f;x;g] trap f[x] except return g[error; backtrace]
            {( (1b;`) ;value x)}; / return ( (1b;`) ;value x) if succeeds
            x; / input string as argument
            {((0b;`);x;$[9<count y; .Q.sbt -9 _ y; ""])}
            ];
        ((1b;`);value x) / run without trapping, ignore ... 
        ]; / v now contains ((success_bool;`);result/error) 
        a:20480>@[-22!;v;{0}]; / is uncompressed length smaller than 20480?
        (a;$[a;v;0b];.Q.s v 1) / return (small_enough; value if small_enough else nothing; console view)
        };
.qython.int:{t:.Q.ty x; $[
	t = "S"; "J"$string x;
	t = "s"; ("J"$string::) each x;
	t in "cC"; "J"$x;
	"j"$x]}; /otherwise
.qython.float:{t:.Q.ty x; $[
	t = "S"; "F"$string x;
	t = "s"; ("F"$string::) each x;
	t in "cC"; "F"$x;
	"f"$x]}; /otherwise
.qython.String:{t:.Q.ty x; $[
	t = "C"; x;
	string x]};
.qython.Char:{t:.Q.ty x; $[
	t = "S"; first string x;
	t = "s"; (first string ::) each x;
	t = "C"; first x;
	t = "c"; first each x;
	'"Invalid conversion to char"]};
.qython.str:{t:.Q.ty x; $[ / cast to symbol
	t in"cC"; `$x;
	`$string x]};
.qython.ord:{t:.Q.ty x; $[
	t in "cC"; "j"$x;
	"j"$string x]};
.qython.chr:{t:.Q.ty x; $[
	t in "cC"; first x;
	t in "sS"; first string x;
	"c"$x]};
.qython.string:{$[type[x]=10h; x; string x]};
.qython.join:{.qython.string[x] sv .qython.string each y};
.qython.split:{$[0=count y: .qython.string y; (); .qython.string[x] vs .qython.string y]};
.qython.replace:{ssr[.qython.string[x]; .qython.string[y]; .qython.string[z]]};
.qython.dot:{mmu[`float$x;`float$y]};
.q.xor: {(x|y)& not x&y};
.qython.md5: (raze string md5::);
.q.qin: {$[
    type[y]=99h; .q.qin[x; key y];
	(type[x]=10h) and (type[y]=10h);  `boolean$count y ss x;
	x in y]};
.qython.rall:{t:type x; if[t=99h; x:value x; t: type x]; $[-1h=t;x;t=1h;all x;t=0h;all .qython.rall each x;0b]};
.qython.assert: {if[not .qython.rall x; '"Assert failed"];};
.qython.assert2: {if[not .qython.rall x; '"Assert failed: ", .qython.string[y]];};
.qython.print:{(neg .z.w) each .qython.run_safe each x,enlist"enlist\"\\n\"";}enlist::;
/ .qython.print2:{show each .qython.run_safe each x,enlist"enlist\"\\n\"";}enlist::;
.qython.type:{d: til[20]!(`UntypedList`bool`guid``Int8`Int16`Int32`Int64`Float32`Float64`Char`str`DateTimeNS`Month`Date`DateTimeMS_Float`TimeNS`TimeMinute`TimeSecond`TimeMS);
    d[98 99]: `Table`dict;
    d "j"$abs type x};
{[x;y] .qython[x]: {t:.Q.ty x; $[ / define all temporal casts in one loop
	t = "S"; upper[y]$string x;
	t = "s"; (upper[y]$string::) each x;
	t in "cC"; upper[y]$x;
	y$x]}[;y]}'[`DateTimeNS`Month`Date`DateTimeMS_Float`TimeNS`TimeMinute`TimeSecond`TimeMS;"pmdznuvt"];

.qython.isinstance:{[x;i] at: abs t: type x;
    $[i~.qython.int; at within 4 7h;
      i~.qython.float; at in 8 9h;
      i~.qython.str; at = 11h;
      i~.qython.Char; t = -10h;
      i~.qython.String; $[t = 0h; type[first x]=10h;t=10h];
      not null k:12+first where (i~)each .qython[`DateTimeNS`Month`Date`DateTimeMS_Float`TimeNS`TimeMinute`TimeSecond`TimeMS];
        at=k;
      0b
      ]};

.qython.enumerate: {(til count x),'x};
.qython.randint:{$[count[x]=1;rand x[0];count[x]=2;x[0]+rand x[1]-x[0]; x[0]+x[2]?x[1]-x[0]]}enlist::;
.qython.slice:{[x;i;j;k] k:$[null k;1;k]; $[k>0;
    [x: $[null i; $[null j; x; j>=0; j sublist x; j _ x]; 
        i>=0; $[null j; i _ x; j>=0; i _ j sublist x; i _ j _ x]; 
        $[null j; i sublist x; j>=0; (0|count[x]+i) _ j sublist x; j _ i sublist x]];
        $[k=1;x; first each k cut x]];
        $[(k=-1) and null[i] and null[j]; reverse x; 
        x .qython.arange[-1|(c-1)^$[i<0;i+c;i]&c-1;-1|$[j<0;j+c;j]&(-1+c:count[x]);k]]]};
.qython.dict_items:{key[x],'value x};
.qython.dict_get:{[d;k;default] $[k in key d; d[k]; default]};
.qython.round:{n:floor x+.5; n-((x+0.5-n)=0) & (n mod 2)=1}; 
.qython.round_digits:{[x;n] .qython.round[x*k]%k:10 xexp n};
.qython.pi: 2*acos 0;
.qython.index:{[arr;val] $[count[arr]=idx:arr?val; '"ValueError: value not in list"; idx]};
.qython.filter:{[func;arr] arr where func each arr};
.qython.setxor1d:{(x union y) except x inter y};


