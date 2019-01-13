#!/usr/bin/env bats

#The pppath function pretty prints the value of the $PATH variable,
#one path per line.
pppath() {
   #put your one line bash script here
   echo $PATH | sed -r 's/:/\n/g' | awk 'BEGIN {print "Directories searched:"} {print $1}'
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
