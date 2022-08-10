var twoSum = function(nums, target) {
    for(var i=0; i<nums.length; i++){
        for(var j=0; j<nums.length; j++){
            if(i!=j){
                if(target == nums[i]+nums[j]){
                    return [i,j]
                }
            }
        }
    }
};
