var lengthOfLastWord = function(s) {
    s=s.trimEnd();
    var count = 0
    for(var i=s.length-1; i>=0; i--){
        if(s[i]!=' '){
            count++
        }else{
            break;
        }
    }
    return count
};
