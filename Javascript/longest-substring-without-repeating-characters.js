var lengthOfLongestSubstring = function(s) {
    if(s.length == 1){
        return 1
    }
    var ans=[]
    var k=0
    var max = 0
    for(var i=0; i<s.length; i++){
        for(var j=i+0; j<s.length; j++){
            if(ans.indexOf(s[j])==-1){
                ans[k] = s[j]
                if(ans.length > max){
                    max = ans.length;
                } 
                k++;
            }else{
                if(ans.length > max){
                    max = ans.length;
                } 
                ans = []
                k=0;
                break;
            }
        }
    }
    return max
};
