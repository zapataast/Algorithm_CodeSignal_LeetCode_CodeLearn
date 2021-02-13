bool efficientRoadNetwork(int n, vector<vector<int>> roads) {
    //find total loop
    int nn = n; int j=1; int jj=1;
    int index_saver = 0, path1 = 0, bool2 = false;
    
    for(int i=0; i<n-1; i++){
        for(j; j<nn; j++){
            for(int k=0; k<roads.size(); k++){
                if(i == roads[k][1] || i == roads[k][0]){
                    if(roads[k][1] == i){
                        path1 = roads[k][0];
                    }else{
                        path1 = roads[k][1];
                    }
                    if(path1 == j){
                        cout << i << ">>" << j << " taarch bna1" << endl;
                        k = roads.size();
                        bool2=true;
                        
                        break;
                    } 
                    
                    index_saver = k;
                    for(int q=0; q<roads.size(); q++){
                        if(q!=index_saver){
                            if((path1 == roads[q][0] || path1 == roads[q][1]) && (j==roads[q][1] || j==roads[q][0])){
                                cout << i << ">>" << j << " taarch bna2" << endl;
                                q=roads.size();
                                k=roads.size();
                                bool2=true;
                                break;
                            }
                        }
                       
                    }
                }
            }
            // gadaad heseg//
            cout << "bool: " << bool2<< endl;
            if(bool2==true){
                bool2=false;
            }else{
                return false;
            }
        }
        
        j=jj;
        j++;
        jj++;
        
    }

    
    return true;
}
