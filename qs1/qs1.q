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
	{-1 first x;{-1"\"", x, "\""} each 1_x;}each (i)_txt;

  }

/
Such that when you run the .qs.l function with the sample file, it prints out the following records by calling the processSection function for each section:

q).qs.l`:strategies/mr1.qs
processing vars
"  lookback"
"  atr_lookback"
"  vol_lookback"
"  z_enter"
"  z_exit"
"  max_hold_bars"
"  min_volume_ratio"
"  atr_mult"
processing state
"  peak_close     = max(close since entry)"
"  bars_in_trade  = bars since entry"
processing indicators
"  mid     = sma(close, lookback)"
"  sigma   = stdev(close, lookback)"
"  zscore  = (close - mid) % sigma"
"  atr     = atr(atr_lookback)"
"  vol_ok  = volume > sma(volume, vol_lookback) * min_volume_ratio"
processing enter
"  zscore < -z_enter"
"  vol_ok"
processing signal_exit
"  zscore > -z_exit"
processing trailing_stop
"  close < peak_close - atr * atr_mult"
processing stop_loss
"  close < mid - atr * atr_mult"
processing time_stop
"  bars_in_trade > max_hold_bars"
processing take_profit
"  rr: 2.5"
"  ref: stop_loss"
processing exit_policy
"  mode: first_hit"
processing execution
"  defaults:"
"    urgency: passive"
"    tif: day"
"  take_profit:"
"    urgency: 0.5"
"  trailing_stop:"
"    urgency: 0.7"
"  stop_loss:"
"    urgency: 1.0"
"    tif: ioc"


vars:
  lookback
  atr_lookback
  vol_lookback
  z_enter
  z_exit
  max_hold_bars
  min_volume_ratio
  atr_mult

state:
  peak_close     = max(close since entry)
  bars_in_trade  = bars since entry

indicators:
  mid     = sma(close, lookback)
  sigma   = stdev(close, lookback)
  zscore  = (close - mid) % sigma
  atr     = atr(atr_lookback)
  vol_ok  = volume > sma(volume, vol_lookback) * min_volume_ratio

enter:
  zscore < -z_enter
  vol_ok

signal_exit:
  zscore > -z_exit

trailing_stop:
  close < peak_close - atr * atr_mult

stop_loss:
  close < mid - atr * atr_mult

time_stop:
  bars_in_trade > max_hold_bars

take_profit:
  rr: 2.5
  ref: stop_loss

exit_policy:
  mode: first_hit

execution:
  defaults:
    urgency: passive
    tif: day

  take_profit:
    urgency: 0.5

  trailing_stop:
    urgency: 0.7

  stop_loss:
    urgency: 1.0
    tif: ioc