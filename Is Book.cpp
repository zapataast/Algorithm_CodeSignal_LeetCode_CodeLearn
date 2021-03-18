bool isBook(vector<vector<bool>> adj) {
    int n = adj.size(),c1=0,c2=0,c3=0;
    
    for(int i=0; i<n; i++){
        c1=count(adj[i].begin(), adj[i].end(), true);
        cout << c1 << endl;
        if(c1==n-1){
            c2++;}
        if(c1==2){
            c3++;
        }
        if(adj[i][i] == true){
            return false;
        }
    }
    cout << c2 << " " << c3 << endl;
    
    if(c2!=2 || c3 != n-2){
        if(c2==3)
            return true;
        else 
            return false;
    }
    return true;
}
