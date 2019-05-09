#!/usr/bin/env io

List myAverage := method(
    if(self isEmpty, return 0)
    
    nonNumericTypes := self select(element, element hasProto(Number) not)
    nonNumericTypes println
    if(nonNumericTypes isEmpty not, Exception raise("List must contain only numeric elements"))
    
    return (self sum) / (self size)
)

my_list := list(1,2,3,4,5,"six")
my_list myAverage println
