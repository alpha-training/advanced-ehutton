/ qs.q
func.add:{x+y}
func.add3:{x+y+z}

sc:{if[0=type x;
    if[-11h=type f:first x;
      if[f in `$"func.",/:(1_string key func);
        if[(n:count[x]-1)>m:count(get get f) 1;'("Too many arguments provided: ",string f)]]
      ];.z.s each x]
 };

parsef:{[p] / parsef`:test1.qs
    ctx:read0 p;
    ctx@:where"="in'ctx;
    txt:{ssr[;" ",y,"(";" func.",y,"("]@/:x}/[ctx;a:1_string key func];
    txt:{ssr[;" ",y," (";" func.",y,"("]@/:x}/[txt;a];
    txt:ssr[;" ";""]@/:txt;
    txt:ssr[;"\t";""]@/:txt;
    txt:ssr[;"(";"["]@/:txt;
    txt:ssr[;")";"]"]@/:txt;
    txt:txt{@[x;y;:;":"]}'txt?'"=";
    txt:{@[x;where(x=",")&0<sums(x="[")-x="]";:;";"]}@/:txt;
    $[count[k]=sum k:{(sum"["=x)=sum"]"=x}@/:txt;
    sc each (parse each txt)[;2];
    'raze"Badly formed expression: ",(ctx where not k)];
    -1 @/:txt;
 }