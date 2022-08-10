var romanToInt = function(s) {
    var dict = {
        'M' : 1000,
        'CM' : 900,
         'D' : 500,
        'CD' : 400,
         'C' : 100,
        'XC' : 90,
        'L' : 50,
        'XL' : 40,
         'X' : 10,
        'IX' : 9,
        'V': 5,
        'IV' : 4,
        'I': 1
            
    };
    var sum=0;
    for(var i=0; i<s.length; i++){
        var c = 0;
        for (const [key, value] of Object.entries(dict)) {
            if(key == s[i]+s[i+1]){
                sum += value
                i = i+1;
                c = 1;
                break;
            }
        }
        if(c == 0){
            for (const [key, value] of Object.entries(dict)){
                if(key == s[i]){
                sum += value
                break;
                }
            }
        }
        
    }

    return sum;
};
