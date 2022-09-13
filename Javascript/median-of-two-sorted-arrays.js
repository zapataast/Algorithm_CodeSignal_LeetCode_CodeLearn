/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number}
 */
var findMedianSortedArrays = function(nums1, nums2) {
    var newar = nums1.concat(nums2)
    newar.sort(function(a, b) {
    if( a === Infinity ) 
        return 1; 
    else if( isNaN(a)) 
        return -1;
      else 
        return a - b;
    });
    if(newar.length%2 == 0){
        return (newar[newar.length/2-1]+newar[newar.length/2])/2
    }else{
        return (newar[Math.floor(newar.length/2)])
    }
    
};
