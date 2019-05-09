#!/usr/bin/env io

named := list()

Person := Object clone
Person name ::= "James"
named append(Person)

Animal := Object clone
Animal name ::= "Beethoven"
named append(Animal)

named foreach(index, item, writeln(index, ":", item name))
