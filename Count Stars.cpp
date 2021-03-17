int olox_2darry_uneque(vector<vector<int>> arr){
    int len = arr.size();
    vector<int> v;
    for(int i=0; i<3; i++){
        v.push_back(arr[i][0]);
        v.push_back(arr[i][1]);
    }
    sort(v.begin(),v.end());
    for(int i=0; i<v.size(); i++){
        if((v[i] == v[i+1]) && (v[i+1] == v[i+2])){
            return v[i];
        }
    }
    for(int i=0; i<v.size(); i++){
        if(v[i]==v[i+1]){
            return v[i];
        }
    }
}
int countStars(vector<vector<bool>> adj) {
    int len = adj.size();
    vector<vector<int>> arr;
    for(int i=0; i<len; i++){
        vector<int> v(2);
        for(int j=0; j<len ;j++){
            if(adj[i][j] == true){
                v[0] = j; v[1] = i;
                arr.push_back(v);
            }
        }
    }
    sort(arr.begin(), arr.end());
    int count = 0;
    bool loop = false;
    vector<int>::iterator it; 
    vector<vector<int>> temparr; vector<int> indarr; vector<int> passarr;
    for(int i=0; i<arr.size(); i++){
        it = std::find (passarr.begin(), passarr.end(), arr[i][1]);
        if (it == passarr.end()){
            for(int j=0; j<arr.size(); j++){ //0 7
            vector<int> v(2);
            if(i!=j){
                if(arr[i][0] == arr[j][0] || arr[i][0] == arr[j][1] ){
                    //cout << arr[j][0] << " " << arr[j][1] << endl;
                    passarr.push_back(arr[j][0]);
                    passarr.push_back(arr[j][1]);
                    if(arr[j][0] == arr[j][1]){
                        loop = true;
                        break;
                    }
                    v[0] = arr[j][0]; v[1] = arr[j][1];
                    temparr.push_back(v);
                    }
                }
            } 
            if(loop == true){
                loop = false;
                temparr.clear();
            }
            if(temparr.size()==1){ // herwee point to point baiwal
                int count2 = 0;
                for(int h=0; h<2 ; h++){
                    for(int h1=0; h1<len ; h1++){
                        if(adj[temparr[0][h]][h1] == false){
                            count2++;
                        }
                    }
                    if(count2 == adj.size()-1){
                        count++;
                    }
                }
            }else if(temparr.size() >= 2){
                //gol od iig olox 
                int gol = 0;
                gol = olox_2darry_uneque(temparr);
                // zone 
                vector<int> checkarr;
                for(int k=0; k<temparr.size(); k++){
                    if(temparr[k][0] != gol){
                        checkarr.push_back(temparr[k][0]);
                    }else if(temparr[k][1] != gol){
                        checkarr.push_back(temparr[k][1]);
                    }
                    cout <<"temp: "<< temparr[k][0] << temparr[k][1] << endl;
                }
                sort( checkarr.begin(), checkarr.end() );
                checkarr.erase( unique( checkarr.begin(), checkarr.end() ), checkarr.end() );
                int count2 = 0;
                int count3 = 0;
                for(int t=0; t<checkarr.size(); t++){
                    for(int y=0; y<len; y++){
                        if(adj[checkarr[t]][y] == false){
                            count2++;
                        }
                    }
                    if(count2 == len-1){
                        count3++;
                    }
                    count2=0;
                }
                if(count3 == checkarr.size()){
                    count++;
                }
                checkarr.clear();
            }
        }
        cout <<" -----" << endl;
        temparr.clear();
        
    }
    
    return count;
}
