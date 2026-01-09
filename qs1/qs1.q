\d .qs
HEADERS:string`vars`state`indicators`enter`signal_exit`stop_loss`take_profit`time_stop`trailing_stop`exit_policy`execution
/`:strategies/mr1.qs
/ entry function


l:{[p]
	txt:read0 p;
	txt:txt where not(""~)each txt;
	txt:@[txt;i:where not(" "in)each txt;"processing ",];	
	txt:@[txt;i;-1_];
	txt where txt like "processing*"
	if[count bad:(11_'txt i)except HEADERS;
       '"invalid header(s): ", " " sv bad,\:":"];
	processSection(i)_txt
 }

processSection:{[x]
	{-1 first x;{-1"\"",x,"\""}each 1_x;}each x;
  }
