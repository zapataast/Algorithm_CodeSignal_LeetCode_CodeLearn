vector<vector<bool>> greatRenaming(vector<vector<bool>> roadRegister) {
    int n = roadRegister.size(); 
    vector<vector<bool>> road2 (n, vector<bool> (n,false));
    for(int i=0; i<n; i++){
        for(int j=0; j<n; j++){
            //
            if(i==0){
                if(roadRegister[n-1][j] == true){
                    road2[i][j+1] = true;
                }
            }else{
                cout << "i: " << i << endl;
                if(roadRegister[i-1][j] == true){
                    if(j+1 == n){
                        road2[i][0] = true;
                    }else{
                        road2[i][j+1] = true;
                    }
                    
                }
            }
        }
    }
    
    return road2;
}
