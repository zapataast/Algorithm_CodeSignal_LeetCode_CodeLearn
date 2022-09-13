var isPalindrome = function(s) {
    s = s.replace(/[^a-zA-Z0-9 ]/g, "") // removing all non-alphebets 
    s = s.replace(/\s/g, '')       // removing all spaces
    s = s.toLowerCase();           // all string to lowercase letter
    for(var i =0; i<s.length/2; i++){
        if(s[i] == s[s.length-i-1]){
        }else{
            return false;
        }
    }
    return true;
    console.log(s)
};
