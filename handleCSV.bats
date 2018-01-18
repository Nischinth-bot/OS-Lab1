#!/usr/bin/env bats

#The handleCSV function parses the CSV input in the file
#named by its argument. Each line of the CSV input file consists of three fields 
#separated by commas. The function removes leading and trailing whitespace 
#around each field, and #outputs each field on its own line preceding the 
#field by either 1), 2), or 3). Each ) should be followed by exactly one space.
#For example, if the input is:
#
#a, b, c
#e,f,g
#aaa,bbb,ccc
#hi, there, howdy
#
#then the output of the function is: 
#
#1) a
#2) b
#3) c
#1) e
#2) f
#3) g
#1) aaa
#2) bbb
#3) ccc
#1) hi
#2) there
#3) howdy
handleCSV() {
  #put your script code here
  return 0   
}

@test "handleCSV CSVinput" {
  run handleCSV CSVinput 
  #$lines is an array of the output of the run
  [ "${lines[0]}" = "1) a" ] 
  [ "${lines[1]}" = "2) b" ] 
  [ "${lines[2]}" = "3) c" ] 
  [ "${lines[3]}" = "1) e" ] 
  [ "${lines[4]}" = "2) f" ] 
  [ "${lines[5]}" = "3) g" ] 
  [ "${lines[6]}" = "1) aaa" ] 
  [ "${lines[7]}" = "2) bbb" ] 
  [ "${lines[8]}" = "3) ccc" ] 
  [ "${lines[9]}" = "1) hi" ] 
  [ "${lines[10]}" = "2) there" ] 
  [ "${lines[11]}" = "3) howdy" ] 
  [ "$status" = "0" ]
}

#test without no arguments; should return 1
@test "handleCSV" {
  run handleCSV 
  [ "$status" = "1" ]
}

#test without bad argument; should return 1
@test "handleCSV nofile" {
  run handleCSV nofile
  [ "$status" = "1" ]
}
