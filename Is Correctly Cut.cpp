bool isCorrectlyCut(vector<vector<bool>> adj) {
    int n = adj.size();
    int x = (n/2)-1;
    int sum = 0;
    for(int i=0; i<n; i++){
        int c3 = count(adj[i].begin(), adj[i].end(), true);
        if(x!=c3){
            return false;
        }
        if(adj[i][i]==true){
            return false;
        }
        sum += c3;
    }
    if(sum==0){
        return false;
    }
    vector<int> arr; 
    
    for(int i=0; i<n; i++){
        if(adj[0][i] == true){
            arr.push_back(i);
        }
    }
    for(int i=0; i<n; i++){
        if(adj[arr[0]][arr[1]] == true){
            return false;
        }
    }
    return true;
}
