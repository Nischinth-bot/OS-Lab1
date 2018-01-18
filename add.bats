#!/usr/bin/env bats

#This function returns the sum of its command line
#arguments
add()
{
  result=0
  #go through the function arguments
  for arg 
  do
     #if the argument is a number then 
     #add it to the total
     if [[ $arg =~ ^[[:digit:]+]$ ]]
     then
        result=$[$result+$arg]
     fi
  done
  echo $result
  return 0 
}
  
#each of these are tests of the function

@test "add 1 2 3" {
  #call the add function
  #1 2 3 are the command line arguments
  run add 1 2 3
  #whatever output is produced by the function is
  #in the variable $output
  echo "output: $output"
  [ "$output" = "5" ]
  #whatever is returned by the function is
  #in the variable $status
  [ "$status" = "0" ]
}

@test "add 1 2 ab 3" {
  run add 1 2 ab 3
  [ "$output" = "6" ]
  [ "$status" = "0" ]
}


@test "add a1 2 ab 3" {
  run add a1 2 ab 3
  echo $output 
  [ "$output" = "5" ]
  [ "$status" = "0" ]
}

