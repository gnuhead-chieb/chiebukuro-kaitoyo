#!/bin/bash
before=Nul
while true
do
clipboard=(`termux-clipboard-get`)
if [ "$clipboard" != "$before" ] ; then
## is_update true
echo $clipboard | nc $1 1300 --send-only
before=$clipboard
fi
sleep 2
done

## このスクリプトは
## https://detail.chiebukuro.yahoo.co.jp/qa/question_detail/q13232389303
## 上記の質問用に作成されました。
## このスクリプトの出力については、私用、商用問わず制限なく利用できます。
## 但しこのスクリプトの改変物を頒布する場合、バイナリ化、或いは難読化された状態のもの＜のみで＞頒布することを禁止します。
## 再頒布を行う際は、必ずソースコードが容易に解釈できる状態で同じライセンスを継承する必要があります。
