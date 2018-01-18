#!/usr/bin/env bats

#The lsdirs function outputs a reverse sorted list of the 
#directories within the directory that is the
#argument to the function. The list of subdirectories
#is one per line. If the number of
#arguments is not 1 or the argument is not 
#a directory the function returns 1. Otherwise,
#the function returns 0.
lsdirs() {
  #put your code here
  return 0   
}

#test without an argument; should return 1
@test "lsdirs" {
  #lsdirs with no argument
  run lsdirs
  #assertions
  [ $status -eq 1 ]
}

#should return list of directories in /usr/java/default
#one per line
@test "lsdirs /usr/java/default" {
  #lsdirs with directory argument
  run lsdirs /usr/java/default
  #assertions
  [ "${lines[0]}" = "man" ]
  [ "${lines[1]}" = "lib" ]
  [ "${lines[2]}" = "jre" ]
  [ "${lines[3]}" = "include" ]
  [ "${lines[4]}" = "db" ]
  [ "${lines[5]}" = "bin" ]
  [ $status -eq 0 ]
}

#argument isn't a directory; should return 1
@test "lsdirs /usr/java/default/src.zip" {
  #lsdirs with file argument
  run lsdirs /usr/java/default/src.zip
  #assertions
  [ $status -eq 1 ]
}
