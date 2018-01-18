#!/usr/bin/env bats

#The loggedon function displays the number of users that are 
#currently logged on. This output is sent to standard output.
#It also returns 0.
loggedon() {
   #put your one line bash script here
   #Be careful that some of the users may 
   #be logged on more than once but only should be counted once.
   #To see what the the output of your script should be type: ./loggedon
   return 0   
}

@test "loggedon" {
  #run the C program to get the correct output
  correct="$(./loggedon)" 
  run loggedon
  #assertions
  [ $status -eq 0 ]
  [ "$output" == "$correct" ]
}
