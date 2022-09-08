var removeElement = function(nums, val) {
    const len = nums.length
    for(var i=0; i<len ;i++){
        let ind = nums.indexOf(val)
        if(ind != -1){
            nums.splice(ind,1)
        }
        
    }
    console.log(nums)
};
