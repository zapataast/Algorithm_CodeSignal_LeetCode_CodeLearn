var addBinary = function(a, b) {
    if(a.length > b.length){
        var max = (a.length-b.length)
        for(var i=0; i<max; i++){
            b ="0" + b
        }
    }else{
        max = (b.length-a.length)
        for(var i=0 ; i<max; i++){
            a ="0" + a
        }
    }
    var ca = a.split("");
    var cb = b.split("")

    var newarr = []
    var add = 0
    var ans =""
    for(i=1 ; i<= ca.length ; i++){
        if(parseInt(ca[ca.length-i]) + parseInt(cb[cb.length-i])+add==2){
            newarr.unshift(0)
            add=1
        }else if(parseInt(ca[ca.length-i]) + parseInt(cb[cb.length-i])+add==3){
            newarr.unshift(1)
            add=1
        }else{
            newarr.unshift(parseInt(ca[ca.length-i]) + parseInt(cb[cb.length-i])+add)
            add=0
        }
        if(i==ca.length && add == 1){
            newarr.unshift(1)
        }
    }
    for(i=0; i<newarr.length; i++){
        ans = ans + newarr[i]
    }
    return ans
};
