#!/usr/bin/env bats

#The lsdirs function outputs a reverse sorted list of the 
#directories within the directory that is the
#argument to the function. The list of subdirectories
#is one per line. If the number of
#arguments is not 1 or the argument is not 
#a directory the function returns 1. Otherwise,
#the function returns 0.
lsdirs() {
  return 0   
}

@test "lsdirs" {
  #lsdirs with no argument
  run lsdirs
  #assertions
  [ $status -eq 1 ]
}

@test "lsdirs /etc/security" {
  #lsdirs with directory argument
  run lsdirs /etc/security
  echo "$output"
  #assertions
  [ "${lines[0]}" = "namespace.d" ]
  [ "${lines[1]}" = "limits.d" ]
  [ "${lines[2]}" = "console.perms.d" ]
  [ "${lines[3]}" = "console.apps" ]
  [ $status -eq 0 ]
}

@test "lsdirs /etc/default/grub" {
  #lsdirs with file argument
  run lsdirs /usr/java/default/src.zip
  #assertions
  [ $status -eq 1 ]
}
