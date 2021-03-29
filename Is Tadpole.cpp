vector<vector<int>> toirogcityolox(vector<vector<int>> arr){
    int i=0,a=0,zoruu=0,check=0;
    while(i<arr.size()){
        int n = arr.size();
        int m1=0,m2=0;
        vector<int> v(2);
        v[0] = arr[i][0] ; v[1] = arr[i][1];
        for(int j=0; j<arr.size(); j++){
            if(j!=i){
                if(v[0] == arr[j][0] || v[0] == arr[j][1]){
                    m1++;
                }
                if(v[1] == arr[j][0] || v[1] == arr[j][1]){
                    m2++;
                }
            }
        }
        if(m1 == 0 || m2 == 0){
            arr.erase(arr.begin()+i);
            check++;
            zoruu++;
        }
        m1=0; m2=0; i++;
        if(check>=1 && i>=arr.size()){
            i=0; 
            check=0;
            zoruu=0;
        }
    }

    return arr;
}
int tysdaa_toirog_citybol(vector<vector<int>> arr){////эхний хотын уртыг буцаана
    //эхний хотын уртыг буцаана
    int anx = arr[0][0];
    int next = arr[0][1];
    int index = 0;
    int counter = 1;
    for(int i=0; i<arr.size(); i++){
        {for(int j=0; j<arr.size(); j++){
            if(i!=j){
                if(next == anx){
                    i=arr.size();
                    break;
                }
                if(index!=j){
                    if(next == arr[j][0]){
                        next = arr[j][1];
                        index = j;
                        counter++;
                    }else if(next == arr[j][1]){
                        next = arr[j][0];
                        index = j;
                        counter++;
                    }
                }
            }
        }}
    }
    return counter;
}

bool isTadpole(vector<vector<bool>> adj) {
    vector<vector<int>> arr,arr2,svvl;
    int n = adj.size(),c1=0,c2=0;
    for(int i=0; i<n; i++){
        vector<int> v1(2);
        for(int j=0; j<n; j++){
            if(adj[i][j] == true){
                if(i < j){
                    v1[0] = i;   v1[1] = j;
                }else{
                    v1[0] = j;   v1[1] = i;}
                if(arr.end() == find (arr.begin(), arr.end(), v1)){
                    arr.push_back(v1);
                }else{
                    svvl.push_back(v1);
                } 
            }
        }
        int c3 = count(adj[i].begin(), adj[i].end(), true);
        if(c3 == 1){
            c1++; // svvl
        }
        if(adj[i][i] == true){
            return false;
        }
    }
    vector<int> check_arr ;
    
    arr2 = toirogcityolox(arr); //arr2 toirog bolson city 
    for(int i=0; i<arr2.size() ;i++){
        check_arr.push_back(arr2[i][0]);
        check_arr.push_back(arr2[i][1]);
    } 
    
    sort(check_arr.begin(), check_arr.end());
    
    int k1=1;
    for(int i=0; i<check_arr.size();i+=2){
        cout << check_arr[i] << " " << check_arr[k1] << " ";
        if(check_arr[i] != check_arr[k1]){ // toirog bolson city-gee 1D vector-d oryylj, shalgaj bna
                                                        //0 0 , 1 1 2 2 3 3 5 5 8 8 gex meteer shalgaj bna 
            return false;
        }
        k1+=2;
    }
    if(arr2.size() < 3){
        cout << "return 3" << endl;
        return false;
    }
    int tys = tysdaa_toirog_citybol(arr2);
    if(tys != arr2.size()){
        cout << "return 4" << endl;cout << tys << endl;
        return false;
    }
    if(c1!=1){
        return false;
    }
    
    return true;
}
