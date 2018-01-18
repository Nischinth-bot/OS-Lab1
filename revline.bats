#!/usr/bin/env bats

#The revline function accepts as input an argument that
#is a sentence. It reverses the words in the sentence so that
#the last word in the input is the first word in the output,
#the second to last word in the input is the second word in
#the output, etc.  In addition, it reverses
#the characters in each word.
#If the number of arguments is not 1, the function returns 1. 
#Otherwise, the function returns 0.
revline() {
  #put your script here
  return 0   
}

#test on no arguments; should return 1
@test "revline" {
  #revline with no argument
  run revline
  #assertions
  [ $status -eq 1 ]
}

@test "revline hi there cs5520" {
  #revline with argument
  run revline 'hi there cs5520'
  echo $output
  [ "$output" == "0255sc ereht ih" ]
  [ $status -eq 0 ]
}

@test "revline how is it going" {
  #revline with argument
  run revline 'how is it going'
  echo $output
  [ "$output" == "gniog ti si woh" ]
  [ $status -eq 0 ]
}

