sed 's/\<the\>/this/1' filename.txt # зөвхөн the гэдэг 3 үсэгтэй үг таарвал this болгон replace хийж байна 1 буюу эхний case-нд
sed 's/\<thy\>/your/gi' filename.txt # <g> бүх таарах thy, <i> нь бүх case insensitive нөхцөлд replace хийнэ. 
sed -e 's/[tT]hy/{&}/g' filename.txt # thy, Thy гэсэн үг таарвал хоёр талд нь { } тэмдэгт replace-даж байна.
sed -E "s/^[0-9]{4} [0-9]{4} [0-9]{4} ([0-9]{4})\b/**** **** **** \1/g" #эxний 12 цифрийг * од болгож байна. 
