#!/usr/bin/env bats

#The switchLetters function outputs its argument
#with the first three and the last three characters
#switched. If the number of arguments isn't exactly
#1, it returns a status of 1. Otherwise, it returns
#a status of 1 
switchLetters() {
    if [ "$#" -ne 1 ]; then 
     return 1
   else
     echo "$1" | sed -r 's/(...)(.*)(...)/\3\2\1/'
   fi
   return 0   
}

@test "switchLetters hi there" {
  run switchLetters 'hi there' 
  [ "$output" == "erethhi " ]
  [ $status -eq 0 ]
}

@test "switchLetters: goodie" {
  run switchLetters 'goodie' 
  [ "$output" == "diegoo" ]
  [ $status -eq 0 ]
}

@test "switchLetters abc 1234f 9 cde" {
  run switchLetters 'abc 1234f 9 cde' 
  [ "$output" == "cde 1234f 9 abc" ]
  [ $status -eq 0 ]
}

@test "switchLetters efgh 1234" {
  run switchLetters 'efgh 1234' 
  [ "$output" == "234h 1efg" ]
  [ $status -eq 0 ]
}

#test on no arguments; should return 1
@test "switchLetters" {
  run switchLetters
  [ $status -eq 1 ]
}

