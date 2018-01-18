#!/usr/bin/env bats

#The pppath function pretty prints the value of the $PATH variable.
pppath() {
   #put your one line bash script here
   return 0   
}

@test "pppath" {
  #To see what the pppath function should output,
  #run: ./pppath
  correct="$(./pppath)" 
  run pppath
  #assertions
  [ $status -eq 0 ]
  [ "$output" == "$correct" ]
}
