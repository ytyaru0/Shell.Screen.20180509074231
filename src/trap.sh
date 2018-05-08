PRE_PS1="$PS1"
echo "PS1=$PS1"
echo "PRE_PS1=$PRE_PS1"
PS1=""
trap "echo END.; break; PS1="$PRE_PS1"; exit 1;" {1,2,3,15}
while : ; do
    echo "無限ループ。Ctrl+C で終了せよ。"
    sleep 1
done

