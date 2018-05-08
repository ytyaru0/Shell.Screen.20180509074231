PRE_PS1="$PS1"
echo "PS1=$PS1"
echo "PRE_PS1=$PRE_PS1"
PS1=""
trap "echo END.; break; PS1="$PRE_PS1"; exit 1;" {1,2,3,15}
IsLoop=1
while [ 1 -eq $IsLoop ]; do
    read -n1 input
    if [ "$input" == $'\x1b' ]; then
    #if [[ $input == $'\x1b' ]]; then
        read -s -n2 -s input2
        input+="$input2"
        [ "$input" = $'\x1b\x5b\x41' ] && echo '矢印 上'
    else
        break
    fi
    #case $input in
    #    $'\x1b\x5b\x41') echo '矢印' ;;
    #    'q') break;;
    #esac
    #sleep 1
done
# https://tanishiking24.hatenablog.com/entry/readascii
