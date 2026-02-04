 formatj:{ /formatj`:qi.flat.json   s:((raze/)read0`:qi.copy.json) except " "
    s:(raze/)string read0 x;
    c:where(s in"}]")|prev s in"{,[";
    d:0,-1_ sums({sum x in"{["}each l)-{sum x in"}]"}each l:(distinct 0,c)_s;
    indent:d-(l like"]*")|l like"}*";
    ssr[;":";": "]each((4*indent)#'" "),'l
 };