int numbersGrouping(int[] a) {
    Array.Sort(a);
    Dictionary<int, int> dicto =  new Dictionary<int, int>(); 
    int total = 0;
    for(int i=0; i<a.Length; i++){
        if(a[i] <= 10000){
            if (dicto.ContainsKey(1)==true){
                int b1 = dicto[1]+1;
                dicto[1] = b1;
            }else{
                dicto.Add(1 , 1);
            }
        }else{
            int base1 = a[i]/10000; 
            int base2 = a[i]%10000;
            if(base1 == 1){
                if (dicto.ContainsKey(2)==true){
                    int b1 = dicto[2]+1;
                    dicto[2] = b1;
                }else{
                    dicto.Add(2 , 1);
                }
            }else if(base2 == 0){
                if (dicto.ContainsKey(base1)==true){
                    int b1 = dicto[base1]+1;
                    dicto[base1] = b1;
                }else{
                    dicto.Add(base1 , 1);
                }
            }else{
                int base3 = base1+1;
                if (dicto.ContainsKey(base3)==true){
                    int b1 = dicto[base3]+1;
                    dicto[base3] = b1;
                }else{
                    dicto.Add(base3 , 1);
                }
            }
        }
        
    }
    foreach (KeyValuePair<int, int> kvp in dicto){
        total += kvp.Value;
    }
    
    return total+dicto.Count;
}
