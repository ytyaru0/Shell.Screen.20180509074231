#trap "ScreenClear; tput cnorm; tput sgr0; exit 1;" {1,2,3,15}
trap "End; exit 1;" {1,2,3,15}
rows=`tput lines`
cols=`tput cols`
rows=`expr $rows - 1`
End(){ { ScreenClear; tput cnorm; tput sgr0; } }
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
    date "+%Y-%m-%d %H:%M:%S"
    tput cuu 1
    # 1秒間ごとに表示したい。readで入力されるまでwaitされると不可能。timeoutで解決
    read -n1 -t1 input
    [ "$input" == 'c' ] && ScreenClear
    [ "$input" == 'q' ] && break
done
End
# https://qiita.com/onokatio/items/5d282b72ac5565ae4569
# cuu, cud
