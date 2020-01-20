#!/usr/bin/env bats

#The revline function accepts as input an argument that
#is a sentence. It reverses the words in the sentence so that
#the last word in the input is the first word in the output,
#the second to last word in the input is the second word in
#the output, etc.  In addition, it reverses
#the characters in each word.
#If the number of arguments is not 1, the function returns 1. 
#Otherwise, the function returns 0.
revline() {
    if [ "$#" -ne 1 ]; then return 1
        fi
    rm *.txt
    echo "$1" | tr " " "\n" | sed '1!G;h;$!d' > words.txt
    for ln in `cat words.txt`; do
        revword "$ln"  >> final.txt
        done
    result=$(cat final.txt | tr "\n" " " | sed -r 's/^(.*)\s$/\1/')
    echo "$result"
    return 0
}

revword() {
    echo "$1" | sed -r 's/./&\n/g' > revword.txt
    result=$(sed '1!G;h;$!d' revword.txt | tr -d "\n")  
    echo "$result"
    return 0
    }

#test on no arguments; should return 1
@test "revline" {
  #revline with no argument
  run revline
  #assertions
  [ $status -eq 1 ]
}

@test "revline hi there cs5521" {
  #revline with argument
  run revline 'hi there cs5521'
  echo $output
  [ "$output" == "1255sc ereht ih" ]
  [ $status -eq 0 ]
}

@test "revline how is it going" {
  #revline with argument
  run revline 'how is it going'
  echo $output
  [ "$output" == "gniog ti si woh" ]
  [ $status -eq 0 ]
}

