#!/usr/bin/env bats

#The countDateNums function outputs to standard output
#the number of digits in the output of the date command. 
#It also returns 0.
countDateNums() {
  date | awk '/[0-9]/ {print $3, $4, $6}' | tr -d [":"] | tr -d [:blank:] | wc -c | awk '{printf("%d\n", $1 - 1)}'
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
