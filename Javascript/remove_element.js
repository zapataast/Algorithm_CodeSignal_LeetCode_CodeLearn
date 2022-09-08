var removeElement = function(nums, val) {
    for(var i=0; i<nums.length ; i++){
        let ind = nums.indexOf(val)
        if(ind != -1){
            nums.splice(ind,1)
            i--;
        }
    }
};
