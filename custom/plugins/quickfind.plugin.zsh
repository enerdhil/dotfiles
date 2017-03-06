# Quick find
# By enerdhil <hezardj@gmail.com>
f() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}

