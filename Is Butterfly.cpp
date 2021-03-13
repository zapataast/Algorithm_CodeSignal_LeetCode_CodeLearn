bool array_unique_checker(vector<vector<int>> arr, vector<int> v){
    int len = arr.size(); 
    for(int i=0; i<len; i++){
        if(arr[i][0] == v[0] && arr[i][1] == v[1]){
            return false;
        }    
    }
    return true;
}

bool isButterfly(vector<vector<bool>> adj) {
    int len = adj.size(); 
    int max = 0,index = 0;
    for(int i=0; i<len ; i++){
        int count = 0;
        for(int j=0; j<len; j++){
            if(adj[i][j] == true){
                count++;
                
            }    
        }
        if(max < count){
            index = i;
            max = count;
        }
        count = 0;
    }
    for(int i=0; i<len; i++){
        if(i!=index){
            if(adj[i][index] == false){
                return false;
            }
        }
    }
    if(max!=4){
        return false;
    }
    vector<vector<int>> arr;
    for(int i=0; i<len; i++){
        vector<int> v1(2); 
        for(int j=0; j<len; j++){
            if(i!=index){
                if(j!=index){
                    if(adj[i][j] == true){
                        if(i<j){
                            v1[0] = i ; v1[1] = j;
                            bool b = array_unique_checker(arr, v1);
                            if(b){
                                arr.push_back(v1);
                            }
                        }
                        else{
                            v1[0] = j; v1[1] = i;
                            bool b = array_unique_checker(arr, v1);
                            if(b){
                                arr.push_back(v1);
                            }
                        }   
                    }
                }
            }
        }
    }
    vector<int> v2 ; 
    for(int i=0; i<arr.size(); i++){
        v2.push_back(arr[i][0]);
        v2.push_back(arr[i][1]);
    }
    v2.push_back(index);
    sort(v2.begin(), v2.end());
    
    for(int i=0; i<v2.size(); i++){
        if(v2[i] != i){
            return false;
        }
    }
    
    return true;
}
