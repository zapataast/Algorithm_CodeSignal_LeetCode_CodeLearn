vector<vector<int>> toirogcityolox(vector<vector<int>> arr){
    int i=0,a=0,zoruu=0;
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
        if(m1 ==0 || m2==0){
            arr.erase(arr.begin()+i);
            zoruu++;
        }
        m1=0; m2=0; i++;
        if(a<=2 && i>=arr.size()){
            i=0; a++;
            zoruu=0;
        }
    }

    return arr;
}
bool isBull(vector<vector<bool>> adj) {
    int n = adj.size();
    std::vector<int>::iterator it; 
    vector<vector<int>> arr;
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
                } 
            }
        }
        int c3 = count(adj[i].begin(), adj[i].end(), true);
        cout << c3 << endl;
        if(c3==0){
            return false;
        }
    }
    vector<vector<int>> arr1 = toirogcityolox(arr);
    
    for(int i=0; i<arr1.size(); i++){
        cout << arr1[i][0] << " " << arr1[i][1] << endl;
    }
    if(arr1.size()!=3){
        return false;
    }
    
    return true;
}
