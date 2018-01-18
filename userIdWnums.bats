#!/usr/bin/env bats

#The userIdNums function outputs the number of user accounts that
#contain a number in the username.
#For example, db76662 is a username that contains a number. The
#function also returns 0.
userIdWnums() {
  #put your one line bash script here
  #The /etc/passwd file contains a line for each user account on the student 
  #machine.  
  return 0   
}

@test "userIdWnums" {
  #You can run the C program ./userIdWnums to see what the answer should be.
  correct="$(./userIdWnums)" 
  run userIdWnums
  #assertions
  [ "$status" = "0" ]
  [ "$output" == "$correct" ]
}
