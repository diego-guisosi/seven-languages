#!/usr/bin/env io

fiboRec := method(n,
    if(n <= 0, return nil)
    if(n <= 2, return 1)
    return fiboRec(n-1) + fiboRec(n-2)
)

fiboRec(0) println
fiboRec(-1) println

for(n,1,5,
    fiboRec(n) println
)


fiboLoop := method(n,
    if(n <= 0, return nil)
    if(n <= 2, return 1)
    n1 := 1
    n2 := 1
    fibo := 0
    for(i,3,n,
        fibo = n2 + n1
        n1 = n2
        n2 = fibo
    )
    return fibo
)

for(n,1,5,
    fiboLoop(n) println
)
