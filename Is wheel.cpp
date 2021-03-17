bool isWheel(vector<vector<bool>> adj) {
    int n = adj.size();
    int c1 = 0, c2=0, c3=0;
    for(int i=0; i<n; i++){
        int c = count(adj[i].begin(), adj[i].end(), true);
        if(adj[i][i] == false)
            c3++;
        if(c==3)
            c1++;
        else if(c==n-1)
            c2++;
    }
    if(c2 != 1 || c1!=n-1 || c3 != n ){
        if(n!=4){
            return false;
        }
    }
    return true;
}
