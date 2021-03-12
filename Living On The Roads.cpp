
bool array_unique_checker(vector<vector<int>> arr, vector<int> v){
    int len = arr.size(); 
    for(int i=0; i<len; i++){
        if(arr[i][0] == v[0] && arr[i][1] == v[1]){
            cout << "bnaa" << endl;
            return false;
        }    
    }
    cout << "alga" << endl;
    return true;
}
vector<vector<bool>> livingOnTheRoads(vector<vector<bool>> roadRegister) {
    int len = roadRegister.size();
    vector<vector<int>> arr1;
    //shineer vvsex city length olox zone 
    for(int i=0; i<len; i++){
        vector<int> v1(2); 
        for(int j=0; j<len ; j++){
            if(roadRegister[i][j] == true){
                //shineer vvsex city nii array yydiig awch bna>> arr1
                if(i<j){
                    v1[0] = i; v1[1]= j;
                    bool b = array_unique_checker(arr1, v1);
                    if(b){
                        arr1.push_back(v1);
                    }
                }else{
                    v1[0] = j; v1[1] = i;
                    bool b = array_unique_checker(arr1, v1);
                    if(b){
                        arr1.push_back(v1);
                    }
                }
            }
        }
    }
    //------------------------------
    vector<vector<bool>> answer(arr1.size(), vector<bool> (arr1.size(),false));
    for(int i=0; i<arr1.size(); i++){
        cout << arr1[i][0] << " " << arr1[i][1] << endl;
        for(int j=0; j<arr1.size(); j++){
            if(i!=j){
                if(arr1[i][0] == arr1[j][0] || arr1[i][0] == arr1[j][1] || arr1[i][1] == arr1[j][0] || arr1[i][1] == arr1[j][1])
                answer[i][j] = true;
            }
        }
    }
    
    
    
    
    return answer;
}
