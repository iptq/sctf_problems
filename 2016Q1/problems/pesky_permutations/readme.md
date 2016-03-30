##Pesky Permutations
This problem's solution is around 1000 lines of code. I created a fully functional Rubik's Cube in Java, then ran the algorithms on the cube until it returned to its original solved state.  
  
A more efficient solution finds the permutations it takes to solve the edges and the corners (but not necessarily solved at the same time) and returns the least common multiple of those two values.  
  
An _even more efficient_ solution uses computational group theory to determine the relationship between the individual moves on the cube, and their affect on the order of the algorithm. This solution is far more complicated, but does not require emulating a Rubik's cube.
  
###Verbose explanation (you can give this to teams on IRC, in part or in whole)
Find the the number of times you must perform each specific algorithm on the cube until it goes from solved back to solved (they need to find the order of each algorithm). There is a value for all 874 algorithms in the file.  
  
The flag is the average of those 874 values, rounded to 2 decimal places. No `sctf{}`.

