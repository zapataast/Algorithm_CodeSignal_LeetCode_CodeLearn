static string sortString(String str) { //sort string return
    char []arr = str.ToCharArray(); 
    Array.Sort(arr); 
    return String.Join("",arr); 
}
//доорх хоёр үгэндэхь үсэгнүүд нэг нэгнийгээ давхардахгүйгээр төлөөлж болох үгүй шалга
bool isSubstitutionCipher(string string1, string string2) {
    //дараалсан хоёр ижил үсгийг нөгөө үгтэй нь шалгаж байна
    for(int i=0; i<string1.Length-1; i++){
        if(string1[i].Equals(string1[i+1]) || string2[i].Equals(string2[i+1])){
            bool b1 = string2[i].Equals(string2[i+1]);
            bool b2 = string1[i].Equals(string1[i+1]);
            if(b1==false || b2 == false){
                return false;
            }
        }
    } 
    
    //дээрх нөхцөл биелэхгүй бол үг тус бүрийн ялгаатай үсгүүдийг тоолж харьцуулж байна
    string1 = sortString(string1);
    string2 = sortString(string2); 
    
    for(int i=0; i<string1.Length-1; i++){
        if(string1[i]==string1[i+1]){
            string1=string1.Remove(i,1);
            i--;
        }
    }
    for(int i=0; i<string2.Length-1; i++){
        if(string2[i]==string2[i+1]){
            string2=string2.Remove(i,1);
            i--;
        }
    }
   
    if(string1.Length!=string2.Length){
        return false;
    }
    return true;
}
