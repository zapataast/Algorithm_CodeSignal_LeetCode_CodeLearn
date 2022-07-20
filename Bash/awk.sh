awk '$1 >200' employee.txt # эхний баганын id 200 гаас дээш байвал ялгаж харуулна. 
awk '$4 ~/Technology/' employee.txt # 4 дэхь багананд Technology нэртэй ажилчид байвал ялгаж харуулна.
awk '/Manager/ { print }' employee.txt # гэвэл Manager гэсэн үг орсон мөрнүүдийг ялгаж xаруулна. 
awk '/[0-9]/ { print }' employee.txt # гэвэл тоо орсон Мөрүүдийг ялгаж xаруулна. 
awk '/^[0-9]/ { print }' employee.txt # гэвэл эхний багананд тоо орсон Мөрүүдийг ялгаж xаруулна. /[0-9]$/ гэвэл сүүлийн мөрөнд тоо орсон байвал ялгаж харуулна.
awk '{ if ($2 =="" || $3 == "" || $4 == "") print "Not all scores are available for",$1;}' # баганан дахь мэдээллүүд байхгүй байвал хэвлэж харуулна. 
awk '{ if ($2 < 51 || $3 < 51 || $4 < 51) 
    print $1,": Fail";
else 
    print $1,": Pass";
}' # дээрх 3 баганан дахь оноонууд 50 ба түүнээс доош байвал гаралтанд Fail , 50 аас дээш оноотой сурагчид Pass гэж гаралтанд харагдаж байна. 
awk '{ if ( ($2+$3+$4)/3 < 51 )
    print $1,$2,$3,$4" : FAIL";
else if ( ($2+$3+$4)/3 > 79 )
    print $1,$2,$3,$4,": A";
else if ( ($2+$3+$4)/3 > 59 && ($2+$3+$4)/3 < 81 )
    print $1,$2,$3,$4,": B";
else 
    print $1,$2,$3,$4,": C";
}' 
awk 'NR%2{printf "%s;",$0;next;}1' # тэгж тоотой мөрний ард, сондгой тоотой мөрнүүдийг залгаж xаруулаx 
    #Sample Input
    #A 25 27 50
    #B 35 37 75
    #C 75 78 80
    #D 99 88 76 
    #Sample Output
    #A 25 27 50;B 35 37 75
    #C 75 78 80;D 99 88 76 
