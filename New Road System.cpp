bool newRoadSystem(vector<vector<bool>> roadRegister) {
    int len = roadRegister.size();
    int ii=0,i2=0; // toologch

    for(int i=0; i<len; i++){
        for(int j=0; j<len; j++){
            
            if(roadRegister[j][i] == true){
                i2++;
            }
            if(roadRegister[i][j] == true){
                ii++;
            }
        }
        if(i2 != ii){
            return false;
        }
    }

    return true;
    
}
