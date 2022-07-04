grep -Eiw 'the|those|then|that' filename.txt # filename.txt-нд the,those,then,that үгнүүд орсон мөр байвал туxайн мөрийг бүтнээр нь хэвлэж байна 
grep -Eiw 'th(e|ose|en|at)' filename.txt # дээрхтэй ижил 
grep '\(\d\)\s*\1' filename.txt # тухайн мөрөнд давтагдсан тоо байвал үлдээнэ жишээ нь  2234 хоёрын тоо дараалан давтагдсан байна. 
grep -n 'th..' filename.txt # өгүүлбэрт this , the гэсэн үгнүүд байвал харуулна. .(dot) нь ямар нэг үг байвал 
grep -n [0-9][a-zA-Z] filename.txt # нөхцөлд 6d гэсэн үг байвал гарч ирнэ. 
grep -n '\[\]' filename.txt # гэвэл [] тэкстэнд байгаа үгүйг хайна. 


