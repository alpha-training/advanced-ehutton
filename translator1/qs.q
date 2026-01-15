/ qs.q
func.add:{x+y}
func.add3:{x+y+z}


brack1change:{
  l:1_k:"func." vs x;
  l:{@[x;y;:;"["]}'[l;l?'"("];
  l:{@[x;y;:;"]"]}'[l;l?'")"];
  k[0],raze "func.",/:l
 } 

sc:{if[0=type x;
    if[-11h=type f:first x;
      if[f in` sv'`func,/:1_key func;
        if[(n:count[x]-1)>m:count(get get f) 1;'("Too many arguments provided: ",string f)]]
      ];.z.s each x]
 };

parsef:{[p] / parsef`:test1.qs parsef`:test2.qs parsef`:test3.qs parsef`:test4.qs
    ctx:read0 p;
    ctx@:where"="in'ctx;
    txt:{ssr[;" ",y,"(";" func.",y,"("]@/:x}/[ctx;a:1_string key func];
    txt:{ssr[;" ",y," (";" func.",y,"("]@/:x}/[txt;a];
    if[not count[k]=sum k:{(sum"("=x)=sum")"=x}@/:txt;'raze"Badly formed expression: ",(ctx where not k)];
    txt:brack1change each txt;
    txt:ssr/[;(" ";"\t");("";"")]@/:txt;
    txt:txt{@[x;y;:;":"]}'txt?'"=";
    txt:{@[x;where(x=",")&0<sums(x="[")-x="]";:;";"]}@/:txt;
    sc@/:(parse@/:txt)[;2];
    -1@/:txt;
 }

