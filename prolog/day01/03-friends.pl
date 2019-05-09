likes(bruce, games).
likes(willian, games).
likes(john, music).
likes(paul, music).

friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).
