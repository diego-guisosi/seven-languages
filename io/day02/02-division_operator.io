#!/usr/bin/env io

Number div := Number getSlot("/")
Number / = method(n, 
    if(n == 0 or n == nil, return 0) 
    return self div(n)
)

OperatorTable addOperator("div", 2)

write(10 / 2)
write(10 / 0)
write(10 div(2))
write(10 div(2))
