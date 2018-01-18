#!/usr/bin/env bats

#This function outputs to standard out the number of user
#accounts that do NOT contain a number in the username.
#For example, db76662 is a username that contains a number.
#It also returns 0.
userIdNnums() {
  #The /etc/passwd file contains a line for each user account on the student 
  #machine.  Give a linux command line that begins with grep that displays 
  #the number of user accounts that do NOT contain a number in the username 
  return 0   
}

@test "userIdNnums" {
  #run ./userIdNums at the command line to see
  #what the correct answer is
  correct="$(./userIdNnums)" 
  run userIdNnums
  #assertions
  [ "$status" = "0" ]
  [ "$output" == "$correct" ]
}
