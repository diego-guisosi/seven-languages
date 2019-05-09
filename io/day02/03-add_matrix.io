#!/usr/bin/env io

sum_matrix := method(matrix,
    total := 0
    rows := matrix size - 1

    for(row,0,rows,
        rowTotal := matrix at(row) sum
        total = total + rowTotal
    )
    return total
)

matrix := list(
    list(1,1,1,1,1),
    list(1,1,1,1,1),
    list(1,1,1,1,1),
    list(1,1,1,1,1),
    list(1,1,1,1,1)    
)

sum_matrix(matrix) println

