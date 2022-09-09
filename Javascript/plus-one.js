var plusOne = function(d) {
    d[d.length-1] += 1
    for(var i=d.length; i >=0 ; i--){
        if(d[i] == 10){
            d[i] = 0
            if(i==0){
                d.unshift(1)
            }else{
                d[i-1] += 1
            }
            
        }
    }
    return d
};
