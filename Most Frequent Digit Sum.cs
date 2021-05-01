int sumofdigit(int n){
    int sum = 0;
    while (n != 0) {
        sum += n % 10;
        n /= 10;
    }
    return sum;
}
int mostFrequentDigitSum(int n) {
    Dictionary<int, int> dicto =  new Dictionary<int, int>(); 
    dicto.Add(sumofdigit(n), 1);
    
    while(n!=0){
        n = n - sumofdigit(n);
        int m;
        m = sumofdigit(n);
        if (dicto.ContainsKey(m)==true){
            int b1 = dicto[m]+1;
            dicto[m] = b1;
        }else{
            dicto.Add(m, 1);
        }
    }  

    foreach (KeyValuePair<int,int> kvp in dicto){
        Console.WriteLine("Key = {0}, Value = {1}", kvp.Key, kvp.Value);
    }
    
    int ans = dicto.Aggregate((x, y) => x.Value > y.Value ? x : y).Key; // хамгийн их утгын түлхүүрийг авч байна. 
    if(ans == 0){
        return dicto.Keys.Max(); // хамгийн их түлхүүрийг авч байна
    }
    return ans;
}
