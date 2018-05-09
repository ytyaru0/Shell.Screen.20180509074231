trap "ScreenClear; tput cnorm; tput sgr0; exit 1;" {1,2,3,15}
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
# 装飾の初期化
tput sgr0
# カーソル非表示
tput civis 
#echo "rows=$rows rows-1=`expr $rows - 1`"
while : ; do
    read -n1 input
    [ "$input" == 'c' ] && ScreenClear
done
# カーソル表示
tput cnorm
# https://qiita.com/onokatio/items/5d282b72ac5565ae4569
# cuu, cud
