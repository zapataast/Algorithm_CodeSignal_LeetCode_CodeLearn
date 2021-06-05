double perfectCity(double[] departure, double[] destination) {
    var pval = new List<double>();
    int ch = 0; //хөндлөн утга
    double buxel_ytga; 
    
    if(Math.Abs(departure[1]-destination[1]) > Math.Abs(departure[0] - destination[0])){ //хоёр цэгийн урт бүхэл хэсгийг олж, мөн нөгөө үлдсэн 2 цэгийг ялгаж ch утганд хадгалж байна
        buxel_ytga = Math.Abs(departure[1]-destination[1]);
        ch = 0;
    }else{
        buxel_ytga = Math.Abs(departure[0]-destination[0]);
        ch = 1;
    }
    
    double b1 = Math.Truncate(departure[ch])+1;   // бутархайн бүхэл хэсэг
    double b2 = Math.Truncate(destination[ch])+1;  // ---------------------

    if(b1==b2){
        pval.Add(departure[ch] + destination[ch]);
        pval.Add(2*b1-pval[0]);
        return buxel_ytga + pval.Min();
    }else{
        if(destination[ch]>departure[ch]){
            buxel_ytga += destination[ch] - departure[ch];
        }else{
            buxel_ytga += departure[ch] - destination[ch];
        }
    }

    return buxel_ytga;
}
