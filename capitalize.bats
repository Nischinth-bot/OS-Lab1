#!/usr/bin/env bats
#
#The capitalize function capitalizes every vowel character of 
#its single argument and sends that output to
#standard output. If the number of arguments
#is not 1, it returns a status of 1. Otherwise, it returns a status
#of 0.
capitalize() {
   if [ "$#" -ne 1 ]; then 
     return 1
   else
     echo "$1" | tr "[a,e,i,o,u]" "[A,E,I,O,U]"
   fi
   return 0   
}


@test "capitalize hi there" {
  run capitalize 'hi there' 
  [ "$output" == "hI thErE" ]
  [ "$status" = "0" ]
}

@test "capitalize goodbye" {
  run capitalize 'goodbye' 
  [ "$output" == "gOOdbyE" ]
  [ "$status" = "0" ]
}

#test with no arguments. should return 1
@test "capitalize" {
  run capitalize 
  [ "$status" = "1" ]
}
