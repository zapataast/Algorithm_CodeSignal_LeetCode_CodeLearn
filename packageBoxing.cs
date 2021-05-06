int packageBoxing(int[] pkg, int[][] boxes) {
    int min=0;  int index =0;
    
    int pkg_total = pkg[0]*pkg[1]*pkg[2]; 
    Array.Sort(pkg);
    
    for(int i=0; i<boxes.Length; i++){
        int total = 1;
        Array.Sort(boxes[i]);
        
        for(int j=0; j<3; j++){
            total *= boxes[i][j];
        }
        
        if(boxes[i][0] >= pkg[0] && boxes[i][1] >= pkg[1] && boxes[i][2] >= pkg[2]){
            if(min==0 || total < min){
                min = total;
                index = i;
            }
        }
    }
    
    if(min!=0){
        return index;
    }
    
    return -1;
}
