int constructSquare(string s) {
    int maxvalue = 10;
    Dictionary<string, int> My_dict1 =  new Dictionary<string, int>(); 
    for(int i=0; i<s.Length-1;i++){ // гарч болох хамгийн дээд тоог тодорхойлж байна.99 , 999 гэх мэт
        maxvalue *= 10;
    } maxvalue--;
    int startvalue = Convert.ToInt32(Math.Sqrt(maxvalue)); // эхлэх хамгийн бага утгыг тодорхойлж байна
    
    Console.WriteLine("maxvalue: "+ maxvalue);
    Console.WriteLine("startvalue:" +startvalue);
    
    for(int i=0; i<s.Length; i++){ // S үгийн үсгүүдийг тоолж Dictionary-д оруулж байна
        if (My_dict1.ContainsKey(s[i].ToString())==true){
            int b1 = My_dict1[s[i].ToString()]+1;
            My_dict1[s[i].ToString()] = b1;
        }else{
            My_dict1.Add(s[i].ToString(), 1);
        }
    }
    
    for(; 0<startvalue; startvalue--){
        Dictionary<string, int> dict_num =  new Dictionary<string, int>();
        string temp = Convert.ToInt32(Math.Pow(startvalue,2)).ToString(); //тестийн тоогоо шууд string -д хадгалж байна
        
        for(int i=0; i<temp.Length; i++){ // квадрат тоо болгоныг Dictionary-д түр хадгалж байна
            if(dict_num.ContainsKey(temp[i].ToString()) == true){
                int b1 = dict_num[temp[i].ToString()]+1;
                dict_num[temp[i].ToString()] = b1;
            }else{
                dict_num.Add(temp[i].ToString(), 1);
            }
        } 
        int taaralt = 0;
        
        for(int j=0; j<My_dict1.Count; j++){
            
            if (dict_num.ContainsValue(My_dict1[My_dict1.ElementAt(j).Key])){ //My_dict1- утга dict_num-д байгаа үгүйг шалгаж байна
                taaralt++;  
                int catched = My_dict1[My_dict1.ElementAt(j).Key]; // My_dict1 value-ыг хадгалж байна
                
                var key1 = dict_num.FirstOrDefault(x => x.Value == catched).Key; //дээрх утгыг ашиглан dict_num-ын key -ыг олж авч байна
                
                dict_num.Remove(key1); // key ашиглан устгаж байна, давхардлыг арилгах зорилготой.
            }
           
        }
        if(taaralt==My_dict1.Count && dict_num.Count==0){
            return Int32.Parse(temp);
        }
    }
    return -1;
}
