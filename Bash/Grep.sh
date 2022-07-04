grep -Eiw 'the|those|then|that' filename.txt # filename.txt-нд the,those,then,that үгнүүд орсон мөр байвал туxайн мөрийг бүтнээр нь хэвлэж байна 
grep -Eiw 'th(e|ose|en|at)' filename.txt # дээрхтэй ижил 
grep '\(\d\)\s*\1' filename.txt # тухайн мөрөнд давтагдсан тоо байвал үлдээнэ жишээ нь  2234 хоёрын тоо дараалан давтагдсан байна. 
