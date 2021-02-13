vector<vector<vector<bool>>> financialCrisis(vector<vector<bool>> roadRegister) {
    int a = roadRegister.size()-1;
    vector<vector<vector<bool>>> answer(a+1, vector< vector<bool> >(a , vector<bool>(a, false)));
    
    int khasagch = 0, jj=0,kk=0;
    for(int i=0; i<a+1; i++){
        for(int j=0; j<a+1; j++){
            for(int k=0; k < a+1; k++){
                if( khasagch != j ){
                    if(khasagch != k){
                        //cout << j << " " <<  k <<endl;
                        //cout <<"index: " << jj << " " << kk << endl;
                        answer[i][jj][kk] = roadRegister[j][k];
                        kk++;
                    }
                }
            }
            if(kk==a){
                jj++;
            }
            kk=0;
        }
        jj=0;
        khasagch++;
    }
     
    
    return answer;
}
