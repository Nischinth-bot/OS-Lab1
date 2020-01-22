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
    echo "$1" | tr " " "\n" > words.txt
        declare -a arr
        count=0
        for ln in `cat words.txt`; do
                count=$((count + 1))
                arr[count]="$ln"
                done
                result=""
                for ((i = $count; i >= 0; i --)); do
                     result=$result" "$(revword "${arr[i]}") 
                done
                echo "$result" | sed -r 's/^ //g;s/ $//g'

        return 0
}

revword()
{
    echo "$1" | sed -r 's/./&\n/g' > temp.txt
    declare -a arr
    count=0
    for ln in `cat temp.txt`; do
        arr[count]="$ln"
        count=$((count + 1))
        done
    result=""
    for((i =  $count; i >= 0; i --)); do
        result=$result$(echo "${arr[i]}")
        done
    echo "$result"
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

