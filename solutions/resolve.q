resolve:{
    l:(0,where x in"$/ ")_x;
    k:@[l;d:where{"."=last x}each l;-1_];
    a:@[k;where"$" in' l;{$[""~getenv`$1_x;"MISSING";getenv`$1_x]}];
    if[not count f:where 1<sum each "."='a;:raze a];
    a:@[a;f;{@[{" ",string get x};x;x]}];
    if[count f:where 1<sum each "."='a;a:@[a;f;:;enlist" MISSING"]];
    raze @[a;d;,;"."]
 }