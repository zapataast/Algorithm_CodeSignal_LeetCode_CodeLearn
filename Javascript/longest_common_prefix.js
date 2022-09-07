var longestCommonPrefix = function(strs) {
    var ans="";
    let result = 0
   for(var j=0; j<strs[0].length; j++){
      for(var i=1; i<strs.length; i++){
          if(strs[0][j] == strs[i][j]){
              result++;
          }
      }
      if(result == strs.length-1){
          ans+=strs[0][j]
      }else if(j=1){
          return ans;
      }
       result = 0
   }
    
    return ans;
};
