var isValid = function(s) {
    for(var i=0; i<s.length;i++){
        let ind = s.indexOf('[]')
        if(ind != -1){
            s=s.substring(0, ind)+s.substring(ind+2,s.length); i--;
        }
        ind = s.indexOf('()')
        if(ind != -1){
            s=s.substring(0, ind)+s.substring(ind+2,s.length); i--;
        }
        ind = s.indexOf('{}')
        if(ind != -1){
            s=s.substring(0, ind)+s.substring(ind+2,s.length); i--;
        }
    }
    
    if(s.length > 0 ){
        return false
    }
    return true;
};
