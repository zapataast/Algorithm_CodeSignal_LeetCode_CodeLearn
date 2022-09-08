var searchInsert = function(nums, target) {
    if(nums.indexOf(target) != -1){
        return nums.indexOf(target)
    }else{
        for(var i=nums.length-1; i>=0; i--){
            if(nums[i] < target){
                return i+1
            }
        }
        return 0
    }
};
