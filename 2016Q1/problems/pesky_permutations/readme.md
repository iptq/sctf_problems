##Pesky Permutations
This problem's solution is around 1000 lines of code. I created a fully functional Rubik's Cube in Java, then ran the algorithms on the cube until it returned to its original solved state.  
  
###Verbose explanation (you can give this to teams on IRC, in part or in whole)
Find the the number of times you must perform each specific algorithm on the cube until it goes from solved back to solved. There is a value for all 874 algorithms in the file.  
  
The flag is the average of those 874 values, rounded to 2 decimal places. No `sctf{}`.
