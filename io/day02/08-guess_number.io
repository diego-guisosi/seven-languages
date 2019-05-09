#!/usr/bin/env io

in  := File standardInput
out := File standardOutput
number := Random value(1,100) asString(3,0) asNumber

out write("Guess a number between 1 and 100\n")
for(attempt,1,10,
    guess := in readLine asNumber
    if(guess == number, break)
    if(guess asNumber < number asNumber, out write("Too low\n"), out write("Too high\n"))
)
if(guess == number, out write("\nCongratulations \\O/ \n\n"), out write("\nGame Over :( \n\n"))

in close
out close
