#!/bin/bash
before=null
while true
do
clipboard=$(`termux-clipboard-get`)
if [ $clipboard != $before ] ; then
// is_update true
echo $clipboard | nc $1 1300 -N
before=$clipboard
fi
sleep 2
done
