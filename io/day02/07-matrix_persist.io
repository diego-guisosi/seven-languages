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

Matrix println := method(
    "Matrix(" println
    write("    Rows=")
    writeln(rows)
    write("    Columns=")
    writeln(columns)

    for(row,1,rows,
        "" println
        write("    ")
        for(column,1,columns,
            write(get(column,row))
            write(",")
        )
    )
    "" println
    ")" println
)

Matrix transpose := method(
    trans := Matrix clone
    trans dim(self rows, self columns)
    for(row,1,self rows,
        for(column,1,self columns,
            trans set(row,column, self get(column,row))
        )
    )
    return trans
)

Matrix persist := method(filename,
    f := File with(filename) remove openForUpdating
    f write("#{columns},#{rows}\n" interpolate)
    for(row,1,rows,
        f write("#{row}" interpolate)
        for(column,1,columns,
            if(column == 1) then(f write(":")) else(f write(";"))
            f write("#{column}" interpolate) write("-") write(get(column,row))
        )
        f write("\n")
    )
    f close
)

Matrix load := method(filename,
    f := File with(filename) openForReading 
    columnsAndRows := f readLine split(",")
    dim(columnsAndRows first asNumber, columnsAndRows second asNumber)

    f foreachLine(row,
        rownumAndColumns := row split(":")
        rownum := rownumAndColumns first asNumber
        rownumAndColumns second split(";") foreach(column,
            colnumAndCell := column split("-")
            set(colnumAndCell first asNumber, rownum, colnumAndCell second)
        )
        
    ) 
    f close
)


mat1 := Matrix clone
mat1 dim(5,10)
mat2 := Matrix clone
mat2 dim(2,4)

mat2 set(1,1,"1A")
mat2 set(2,1,"1B")
mat2 set(1,2,"2A")
mat2 set(2,2,"2B")
mat2 set(1,3,"3A")
mat2 set(2,3,"3B")
mat2 set(1,4,"4A")
mat2 set(2,4,"4B")

"mat2" println
mat2 println
mat2 persist("matrix.txt")

"mat3" println
mat3 := Matrix clone
mat3 load("matrix.txt")
mat3 println
