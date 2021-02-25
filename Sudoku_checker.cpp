bool sudoku(vector<vector<int>> grid) {
    //check all row 
    vector<int> vecrow{ 2, 2, 3, 4, 5, 6, 7, 8, 9 };
    
    vector<int> test(9,0);
    vector<int> test2(9,0);
    int n = 9;
    // Bvx row yydiig shalgaj bna
    // Bvx column yydiig shalgaj bna
    for(int i=0; i<n ; i++){
        for(int j=0; j<n; j++){
            test[j] =  grid[i][j]; 
            test2[j] = grid[j][i];
        }
        sort(test.begin(), test.end());
        sort(test2.begin(), test2.end());
        bool result = equal(test.begin(), test.end(), vecrow.begin() , vecrow.end());
        bool result1 = equal(test2.begin(), test2.end(), vecrow.begin() , vecrow.end());
        if(!result || !result1)
            return false;      
    }
    //bvx 3x3 shoonyydiig shalgaj bna
    int ii = 0, jj=0, ue=0,zd=0;
    for(int i=0; i<n ; i++){
        for(int j=0; j<n; j++){
            test[j] = grid[ii][jj];
            jj++;
            if(j==2 || j==5){
                if(ue==0){
                    jj=0;
                }else if(ue==1){
                    jj=3;
                }else if(ue==2){
                    jj=6;
                }
                ii++;
            }
        }   
        ue++;
        //ue 3 xesegt xywaaaj ogon jj ytgyydaa 3 ydaa 0 loj bna
        //zd ni 'i' iiig 0 3 6 aas exlvvlj ogj bna
        if(ue==3){
            jj=0;
            ue=0;
            zd++;
        }
        if(zd==0){
            ii=0;
        }else if (zd==1){
            ii=3;
        }else if( zd==2){
            ii=6;
        }
        sort(test.begin(), test.end());
        for(int k=0; k<n; k++){
            cout << test[k] << " ";
        }
        cout << endl;
        bool result = equal(test.begin(), test.end(), vecrow.begin() , vecrow.end());
        if(!result)
            return false;      
    }
    
    
    
    return true;
}
