# gomoku



1. Project Summary 

- The project I am working on is a game called “Gomoku”, which is an abstract strategy board game for two people playing in opposition. 

- It is traditionally played with Go pieces (black and white stones) on a go board with 19X19 intersections; however, because once placed, pieces are not moved or removed from the board. 

- Black plays first if white did not just win, and players alternate in placing a stone of their color on an empty intersection. The winner is the first player to get an unbroken row of five stones horizontally, vertically, or diagonally. 

- The picture attached below is a sample interface of this game. It’s a human-vs.-human game which runs on an iOS Simulator. 

- When the winner is determined (i.e. once one of the players made a row of five sequential chess pieces), the program prints a message like “Black wins! ^_^” or “White wins! ^_^” at the lower right corner of the screen. 
￼ 
 
 
￼2. Implementation and Realization: 

- “Middle Out! ”. 
The phrase “Middle Out” actually came out from the HBO TV Show “Silicon
Valley”, which is my second favorite American TV Show (my favorite is The Big Bang Theory).
When I started writing this program, I tried to use a “getNeighbors” algorithm to determine the winner: I declared a method called “getNeighbors” which accepts a specified chess piece (i.e. an specified element in the corresponding two-dimensional array) as a parameter and returns an array that contains all this chess piece’s neighbors. I failed to complete this algorithm because it finally became a horribly complex O(n5+) algorithm. I stuck for two weeks and heard the phrase “middle out” from this TV show, and then I got inspired: maybe I can use a “middle out” approach to determine winner!
So this is how “Middle Out” works: Visit each of the intersections that have chess pieces already been placed onto them (i.e. visit each of the elements in the two-dimensional array). Consider each intersection that has a chess piece as a center spot, it has 4 outward diffusion axis (left-right, up-down, left-up & right-down, right-up & left-down). For each axis, visit the adjacent intersections toward two opposite direction on this axis (i.e. 8 iteration directions in total), and count the number of sequential chess pieces. Once the number of sequential chess pieces is five, a winner has been determined! 

- Separate For Loops.
I used 8 separate for loops, which iterate in 8 different outward diffusion
direction from the center spot (the specified chess piece) to implement the “Middle Out” algorithm, so that the machine itself can determine who is the winner. Here is a chunk of code that iterate in the outward-to-left and outward-to-right direction.
