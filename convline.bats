#!/usr/bin/env bats

#The convline function accepts as input an argument that
#is a string. If the string matches a pattern like
#aaa ... bb (1 or more a's followed by 0 or more of
#anything followed by 1 or more b's) it outputs the b's followed
#by a space followed by an X followed by a space followed by
#the a's.  For example, for the input aajbxabbb, the function
#would output bbb X aa. In addition, it returns 0.
#If the number of arguments is not 1 or the string
#doesn't match the pattern, the function returns 1. 
convline() {
  #put your script here
  return 1
}

#test with no arguments; should return 1
@test "convline" {
  #convline with no argument
  run convline
  #assertions
  [ $status -eq 1 ]
}

@test "convline aaabbb" {
  #convline with matching argument
  run convline 'aaabbb'
  echo $output
  [ "$output" == "bbb X aaa" ]
  [ $status -eq 0 ]
}

@test "convline aabbb" {
  #convline with matching argument
  run convline 'aabbb'
  echo $output
  [ "$output" == "bbb X aa" ]
  [ $status -eq 0 ]
}

@test "convline aaabjbbbb" {
  #convline with matching argument
  run convline 'aaabjbbbb'
  echo $output
  [ "$output" == "bbbb X aaa" ]
  [ $status -eq 0 ]
}

@test "convline aaabjbkabbbb" {
  #convline with matching argument
  run convline 'aaabjbkabbbb'
  echo $output
  [ "$output" == "bbbb X aaa" ]
  [ $status -eq 0 ]
}

@test "convline abababbabbbb" {
  #convline with matching argument
  run convline 'abababbabbbb'
  echo $output
  [ "$output" == "bbbb X a" ]
  [ $status -eq 0 ]
}

#test with an argument that doesn't match
@test "convline jabababbabbbb" {
  #convline with argument that doesn't match
  run convline 'jabababbabbbb'
  [ $status -eq 1 ]
}

#test with an argument that doesn't match
@test "convline abababbabbbba" {
  #convline with argument that doesn't match
  run convline 'abababbabbbba'
  [ $status -eq 1 ]
}
