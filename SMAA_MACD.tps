// This source code is subject to the terms of the Mozilla Public License 2.0 at https://mozilla.org/MPL/2.0/
// © trading-beastt

//@version=4
study("MACD&SMAA indicator-Sid")

//calculate MACD first
fastLength = input(12)
slowlength = input(26)
MACDLength = input(9)
MACD = ema(close, fastLength) - ema(close, slowlength)

//calculate signal
signal = sma(MACD, 9)

//calculate rsi
RSIValue = rsi(close, 14)

// Calculate moving averages
smaDiff = sma(close, 10) - sma(close, 45)
emaDifs = ema(smaDiff, 15)

//calculate crossover signal value
isBuyUsingMACD = crossover(MACD, signal)
isBuyUsingRSI = crossover(RSIValue, 0.35)
isBuyUsingEMA = emaDifs > 0


alertcondition(isBuyUsingMACD and isBuyUsingEMA, title="MACD/SMAA Alert!", message="Something")

//plotting time
plot(series=signal, title="signal", color=color.green, linewidth=2)
plot(series=MACD, title="macd", color=color.yellow, linewidth=2)
plot(series=emaDifs, title="rsi", color=color.blue)