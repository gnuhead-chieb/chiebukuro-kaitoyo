#!/bin/bash
all=0
stayed=0
changed=0

until [ $all = 1000 ]
do

answer=$(seq 1 3 | shuf | head -1)
firstchoice=$(seq 1 3 | shuf | head -1)

open=$(seq 1 2 | shuf | head -1)
[ $firstchoice = 1 ] && open=$(( $open + 1 ))
[ $firstchoice = 2 ] && [ $open = 2 ] && open=$(( $open + 1 ))
[ $firstchoice = 3 ] && open=$(( $open - 1 ))

[ $open != $answer ] && secondchoice=$(echo 123 | sed -e "s/${firstchoice}//" -e "s/${open}//")

[[ $firstchoice = $answer ]] && stayed=$(( $stayed + 1 )) && all=$(( $all + 1 ))
[[ $secondchoice = $answer ]] && changed=$(( $changed + 1 )) && all=$(( $all + 1 ))

echo そのまま：$stayed （$(qalc -t $stayed/$all*100)％）変更した：$changed （$(qalc -t $changed/$all*100)％） 総数：$all （100％）

done
