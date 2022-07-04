sed 's/\<the\>/this/1' filename.txt # зөвхөн the гэдэг 3 үсэгтэй үг таарвал this болгон replace хийж байна 1 буюу эхний case-нд
sed 's/\<thy\>/your/gi' filename.txt # <g> бүх таарах thy, <i> нь бүх case insensitive нөхцөлд replace хийнэ. 
