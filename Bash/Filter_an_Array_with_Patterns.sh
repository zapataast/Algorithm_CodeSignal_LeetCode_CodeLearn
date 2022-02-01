arr=($(cat))
len=${#arr[@]}

for t in "${arr[@]}"
do
    if [ $t = ${arr[@]/*[aA]*} ]  # нөхцөлдэх үгнүүд дунд Том А, жижиг а байхгүй байвал нөхцөл биелэнэ.  
        then
        echo $t
    fi
done
