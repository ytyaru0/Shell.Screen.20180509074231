trap "echo END.; break; exit 1;" {1,2,3,15}
IsLoop=1
while [ 1 -eq $IsLoop ]; do
    read -n1 input
    if [ "$input" == $'\x1b' ]; then
    #if [[ $input == $'\x1b' ]]; then
        read -s -n2 -s input2
        input+="$input2"
        [ "$input" = $'\x1b\x5b\x41' ] && echo '矢印 上'
        [ "$input" = $'\x1b\x5b\x42' ] && echo '矢印 下'
        [ "$input" = $'\x1b\x5b\x43' ] && echo '矢印 右'
        [ "$input" = $'\x1b\x5b\x44' ] && echo '矢印 左'
    else
        break
    fi
done
# https://tanishiking24.hatenablog.com/entry/readascii
