static string sortString(String str) { 
        char []arr = str.ToCharArray(); 
        Array.Sort(arr); 
        return String.Join("",arr); 
} 
int stringsConstruction(string a, string b) {
    int n = a.Length, min =100;
    string a1 = sortString(a); // sort a string
    
    string newa = ""; 
    int[] array = new int[99];
    
    int ii=0, rs1=0;
    for(int i=0; i<a.Length; i++){
        if(newa.IndexOf(a1[i]) == -1){   // String Search
            newa += a1[i];
            rs1 = a1.Length - a1.Replace(a1[i].ToString(), "").Length; // String Count
            array[ii] = rs1;
            ii++;
            i += rs1-1;
        }
    }
        
    for(int i=0; i<newa.Length; i++){
        int result1 = b.Length - b.Replace(newa[i].ToString(), "").Length;
        if((result1/array[i])<min){
            min = result1/array[i];
        }
    }            
    
    return min;
}
