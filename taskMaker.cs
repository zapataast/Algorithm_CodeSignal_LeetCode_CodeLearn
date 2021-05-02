string[] taskMaker(string[] source, int challengeId) {
    Dictionary<int, string> dicto =  new Dictionary<int, string>();   
    int key = -1; // Comment биш мөрүүдийг хадгалж байнаа
    int del = 0; // challengeid ны дээд талын мөрийг устгах , key - ийг нь хадгалж авч байна
    
    for(int i=0; i<source.Length; i++){
        int sym = source[i].IndexOf("//");
        if(sym == -1){ // comment биш мөрүүдийг шууд хадгалж авч байна
            string temp = source[i];
            dicto.Add(key, temp);
            key--;
        }else{
            string temp = "";
            int key2 = 0;
            int ind = 0;
            int index = source[i].IndexOf("//");
            
            for(int j=index+5; j<source[i].Length; j++){ //comment id-г temp-нд хадгалж авч байна
                if(source[i][j]=='/'){
                    break;
                }
                ind = j; //
                temp += source[i][j].ToString();
            } ind += 3;
            key2 = Int32.Parse(temp); // temp-ыг int-д хадгалж аваад доор дахин temp-д өөр үг хадгалж байна 
            temp = "";
            for(int k=ind; k<source[i].Length; k++){ // comment-ын арын үгийг салгаж авч temp-д хадгалж байна
                temp += source[i][k];
            }
            if(key2==challengeId){  // challengeId-тай үгийг л хадгалж аван , бусдыг нь pass-лаж байна
                string t = "";
                for(int h=0; h<index; h++){
                    t += " ";
                }
                temp = t + temp;
                del = key+1;
                dicto.Add(key2, temp); 
            }
        }
    }
    
    dicto.Remove(del); //challengeid -ны дээд талын мөрийг устгаж байна
    
    string[] answer = new string[dicto.Count]; 
    int ii=0;
    foreach (KeyValuePair<int,string> kvp in dicto){
        Console.WriteLine("Key = {0}, Value = {1}", kvp.Key, kvp.Value);
        answer[ii] = kvp.Value;
        ii++;
    }
    return answer;
}
