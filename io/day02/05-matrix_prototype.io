#!/usr/bin/env io

Matrix := List clone

Matrix dim := method(x,y,
    self rows := y
    self columns := x
    self m := list()

    for(row,0,self rows - 1,
        self m atInsert(row, list())
        for(column,0,self columns - 1,
            self m at(row) atInsert(column,nil)
        )
    )
)

Matrix set := method(x,y,value,
    row := y - 1
    column := x - 1
    m at(row) atPut(column,value)
)

Matrix get := method(x,y,
    row := y - 1
    column := x - 1
    return m at(row) at(column)
)


printMatrix := method(matrix,
    "----Matrix----" println
    matrix rows println
    matrix columns println
    "--------------" println
)


mat1 := Matrix clone
mat1 dim(5,10)
mat2 := Matrix clone
mat2 dim(2,4)

printMatrix(mat1)
printMatrix(mat2)

mat1 get(1,1) println

mat1 get(2,1) println
mat1 set(2,1,"1B")
mat1 get(2,1) println

mat1 slotNames println
