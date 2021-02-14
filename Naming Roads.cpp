bool namingRoads(vector<vector<int>> roads) {
    int zam1 = 0;
    int indexsaver = 0;
    int counter = 0;
    int j = 0;
    for(int i=0; i<roads.size(); i++){
        //main loop/ zam bolgonii xolboosyydiig shalgana
        indexsaver = i;
        j=0;
        //cout << "check path: " << roads[i][0] << " " << roads[i][1] << endl;
        for(j; j<roads.size()-1; j++){
            zam1 = roads[i][2]; // self path
            if(indexsaver!=j){   
                if(roads[i][0] == roads[j][1] || roads[i][0] == roads[j][0]){
                    //cout << roads[j][1] << " "<< roads[j][0] << " " << roads[j][2] << endl;
                    if(roads[j][2] > 0 ){
                        if(zam1 == roads[j][2]-1 || zam1 == roads[j][2]+1){
                            return false;
                        }
                    }
                    counter++;
                }
                if(roads[i][1] == roads[j][0] || roads[i][1] == roads[j][1]){
                    //cout << roads[j][1] << " "<< roads[j][0] << " " << roads[j][2] << endl;
                    if(roads[j][2] > 0 ){
                        if(zam1 == roads[j][2]-1 || zam1 == roads[j][2]+1){
                            return false;
                        }
                    }
                    counter++;
                }
            }
            if(counter==2){
                counter = 0;
                break;
            }
        }
    }
    
    return true;
}
