#!/usr/bin/env bats

#The recdirs function accepts as input an argument that
#is a directory. It outputs the name of the directory and
#the number of subdirectories in that directory. It then
#calls the function on each of the subdirectories in the
#directory. The directories and their counts will be outputted
#in a depth first order.  If the number of arguments is 
#not 1 or the argument is not a directory the function 
#returns 1. Otherwise, the function returns 0.
recdirs() {
  #put your script here
  #use this echo to produce the expected output
# echo "directory: $1, number of subdirectories: $count"
  return 0   
}

#test recdirs with no argument; it should return 1
@test "recdirs" {
  #recdirs with no argument
  run recdirs
  #assertions
  [ $status -eq 1 ]
}

#test recdirs on a directory with no subdirs
@test "recdirs $(pwd)/root (no subdirectories)" {
  path=$(pwd)
  mkdir "$path/root"
  run recdirs "$path/root"
  rm -f -r "$path/root"
  echo $output
  [ "${lines[0]}" = "directory: $path/root, number of subdirectories: 0" ] 
  [ $status -eq 0 ]
}

#test recdirs on a directory with multiple subdirs
@test "recdirs $(pwd)/root" {
  path=$(pwd)
  #first create some directories to test
  #the script on
  echo $path
  mkdir "$path/root"
  mkdir "$path/root/dir1"
  mkdir "$path/root/dir2"
  mkdir "$path/root/dir3"
  touch "$path/root/file1"
  touch "$path/root/file2"
  touch "$path/root/file3"
  mkdir "$path/root/dir1/dir1a"
  mkdir "$path/root/dir1/dir1a/dir1aa"
  mkdir "$path/root/dir1/dir1a/dir1aa/dir1aaa"
  touch "$path/root/dir1/dir1a/dir1aa/file1aaa"
  mkdir "$path/root/dir1/dir1a/dir1ab"
  touch "$path/root/dir1/dir1a/file1aa"
  mkdir "$path/root/dir2/dir2a"
  mkdir "$path/root/dir2/dir2b"
  touch "$path/root/dir2/file2a"
  touch "$path/root/dir2/file2b"
  run recdirs "$path/root"
  rm -f -r "$path/root"
  
  echo $output
  #assertions
  [ "${lines[0]}" = "directory: $path/root, number of subdirectories: 3" ] 
  [ "${lines[1]}" = "directory: $path/root/dir1, number of subdirectories: 1" ] 
  [ "${lines[2]}" = "directory: $path/root/dir1/dir1a, number of subdirectories: 2" ] 
  [ "${lines[3]}" = "directory: $path/root/dir1/dir1a/dir1aa, number of subdirectories: 1" ] 
  [ "${lines[4]}" = "directory: $path/root/dir1/dir1a/dir1aa/dir1aaa, number of subdirectories: 0" ] 
  [ "${lines[5]}" = "directory: $path/root/dir1/dir1a/dir1ab, number of subdirectories: 0" ] 
  [ "${lines[6]}" = "directory: $path/root/dir2, number of subdirectories: 2" ] 
  [ "${lines[7]}" = "directory: $path/root/dir2/dir2a, number of subdirectories: 0" ] 
  [ "${lines[8]}" = "directory: $path/root/dir2/dir2b, number of subdirectories: 0" ] 
  [ "${lines[9]}" = "directory: $path/root/dir3, number of subdirectories: 0" ]
  [ $status -eq 0 ]
}

#test on an argument that is a file, not a directory; should return 1
@test "recdirs /usr/java/default/src.zip" {
  #recdirs with file argument
  run recdirs /usr/java/default/src.zip
  #assertions
  [ $status -eq 1 ]
}
