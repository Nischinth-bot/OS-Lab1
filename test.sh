

revline() {
    echo "$1" | tr " " "\n" | sed -r 's/^ $//'  > words.txt
        declare -a arr
        count=0
        for ln in `cat words.txt`; do
                count=$((count + 1))
                arr[count]="$ln"
                done
                result=""
                for ((i = $count; i >= 0; i --)); do
                     result=$result" "$(revword "${arr[i]}") 
                     echo "$result" | sed -r 's/^ //g;s/ $//g'
                done
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
   


revline "hi there cs5521"
