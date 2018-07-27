 # create faviorate folder list 
 # provide option to navigate to real location
 
 fav () {
    # no parametr provided to print the list
    folder=~/fav/*
    count1=0
    if [[ $# -eq 0 ]]; then
        for f in $folder; do
            printf '\e[1;34m%-35s\e[0m %-2d \n' "$f" "$count1"
            ((count1++))
        done
    else
        for f in $folder; do
            if [[ $1 -eq $count1 ]]; then
                cd $f
                cd -P .
                ls .
                break
            fi
            ((count1++))
        done
    fi
 }

