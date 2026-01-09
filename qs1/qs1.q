\d .qs
HEADERS:string`vars`state`indicators`enter`signal_exit`stop_loss`take_profit`time_stop`trailing_stop`exit_policy`execution

/ entry function
l:{[p]
	processSection p
 }

processSection:{[x]
	txt:read0 x;
	txt:txt where not(""~)each txt;
	txt:@[txt;i:where not(" "in)each txt;"processing ",];
	txt:@[txt;i;-1_];
	{-1 first x;{-1"\"",x,"\""}each 1_x;}each(i)_txt;
  }
