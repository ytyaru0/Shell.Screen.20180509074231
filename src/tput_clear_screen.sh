echo ABC
rows=`tput lines`
cols=`tput cols`
rows=`expr $rows - 1`
ScreenClear(){
    tput cup 0 0
    for row in `seq 0 $rows`; do
        printf %${cols}s | tr ' ' ' '
    done
    tput cup 0 0
}
ScreenClear
# `tput clear`はただ改行するだけっぽい
# 一瞬で終了してしまい分かりづらい
