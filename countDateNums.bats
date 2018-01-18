#!/usr/bin/env bats

#The countDateNums function outputs to standard output
#the number of digits in the output of the date command. 
#It also returns 0.
countDateNums() {
   #put your one line bash script here
   return 0   
}

@test "countDateNums" {
  #you can see what output it should produce by
  #running ./countDateNums
  correct="$(./countDateNums)" 
  run countDateNums
  #assertions
  [ $status -eq 0 ]
  [ "$output" == "$correct" ]
}
