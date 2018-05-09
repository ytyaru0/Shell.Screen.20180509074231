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
# カーソル非表示
tput civis 
#echo "rows=$rows rows-1=`expr $rows - 1`"
while : ; do
    read -n1 input
    [ "$input" == 'c' ] && ScreenClear
    #if [ "$input" == 'c' ]; then
    #    tput cup 0 0
    #    for row in `seq 0 $rows`; do
    #        printf %${cols}s | tr ' ' ' '
    #    done
    #    tput cup 0 0
    #fi
done
# カーソル表示
tput cnorm
# https://qiita.com/onokatio/items/5d282b72ac5565ae4569
# cuu, cud
