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

## このスクリプトは、回答用ではなく、
## https://detail.chiebukuro.yahoo.co.jp/qa/question_detail/q14233233929?fr=and_other
## 上記の私の質問で使用しました。
## このスクリプトの出力については、私用、商用問わず制限なく利用できます。
## 但しこのスクリプトの改変物を頒布する場合、バイナリ化、或いは難読化された状態のもの＜のみで＞頒布することを禁止します。
## 再頒布を行う際は、必ずソースコードが容易に解釈できる状態で同じライセンスを継承する必要があります。
