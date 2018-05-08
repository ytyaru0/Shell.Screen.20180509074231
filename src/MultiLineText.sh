#screen="ABC\nDEF"
screen="ABC\nDEF"
echo -e $screen

screen=$(cat <<EOS
複数行文字列を
入力する。
EOS
)
echo "$screen"

mapfile str <<EOF
複数行文字列を
入力する。
EOF
echo "$screen"
