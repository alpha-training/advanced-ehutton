formatj:{ /formatj`:qi.flat.json
    s:(raze/)string read0 x;
    c:where(s="}")|prev s in"{,";
    d:0,-1_ sums ({sum x="{"}each l)-{sum x="}"} each l:(distinct 0,c)_s
    indent:d-l like "}*";
    ssr[;":";": "]each ((4*indent)#'" "),'l
 };