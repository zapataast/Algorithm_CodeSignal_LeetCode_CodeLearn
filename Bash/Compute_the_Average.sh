arr=($(cat)) # input data г авч байна. 
sum=0
div=0
for t in "${arr[@]}"
do
    if [[ $div = 0 ]]
        then
        div=$t # хамгийн эхний мөрийг хадгалж авч байна, бусдыг нь sum хийнэ. 
        else
        sum=$(($sum + $t))
    fi
done
result=$(echo "$sum/$div" | bc -l) #хоёр тоог хуваахдаа бутархайтайгаар хадгалж авч байна. 
printf '%.*f\n' 3 $result          #result бутархайтай тоогоо 3 оронгоор тоймлож авч байна. 
