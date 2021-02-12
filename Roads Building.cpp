vector<vector<int > > roadsBuilding(int cities, vector<vector< int > > roads) {
    
    
    int temp= 1; int sum = 0;
    for(int i=0; i < cities-1 ; i++){
        sum += temp; //sum >> total road
        temp++;
    }
    temp = cities;
    
    vector<vector<int>> arr(sum, vector<int> (2,0)); // bolomjiin xvsnegtiin length vvsgej bna
    vector<vector<int>> ans(sum-roads.size(), vector<int> (2,0)); // bytsaax ytgiin length vvsgej bna
    for(int i=0; i<ans.size(); i++){
        cout << ans[i][0] <<" " <<ans[i][1] << endl;
    }
    
    //bolomjit xvsnegtiin ytgiig vvsgej bna
    int ii = 0, l=1, ll= 1; 
    for(int i=0; i<arr.size(); i++){
        arr[i][0] = ii;
        arr[i][1] = l;
        l++;
        if(l == cities){
            l=ll+1;
            ii++;
            ll++;
        }
    }
    ii = 0;
    for(int i=0; i<arr.size(); i++){
        for(int k=0; k<roads.size(); k++){
            if((arr[i][0] == roads[k][0] && arr[i][1] == roads[k][1]) || (arr[i][0] == roads[k][1] && arr[i][1] == roads[k][0])){
                break;
            }else if(k==roads.size()-1){
                cout << arr[i][0] << " "<< arr[i][1] << endl;
                ans[ii][0] = arr[i][0];
                ans[ii][1] = arr[i][1]; 
                ii++;
            }
        }
    }
    return ans;
}
