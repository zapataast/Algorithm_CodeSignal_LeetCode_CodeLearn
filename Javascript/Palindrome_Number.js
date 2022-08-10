var isPalindrome = function(x) {
    if(x < 0){
        return false;
    }
    var reversed = 0; 
    var temp;
    var original = x;
    while(x != 0){
        temp = x%10 
        reversed = reversed*10 + temp
        x = Math.floor(x/10)
        console.log(x)
    }
    if(reversed == original){
        return true;
    }else{
        return false;
    }
};
