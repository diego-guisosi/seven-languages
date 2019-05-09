adjacent(1,2).   adjacent(2,1).
adjacent(2,3).   adjacent(3,2).

coloring(a,red,1).     coloring(a,blue,2).   coloring(a,green,3).
coloring(b,red,1).     coloring(b,red,2).    coloring(b,green,3).
coloring(c,green,1).   coloring(c,blue,2).   coloring(c,green,3).

conflict(Layout) :- 
    adjacent(X,Y),
    coloring(Layout,Color,X),
    coloring(Layout,Color,Y).
