vector<int> citiesConquering(int n, vector<vector<int>> roads) {
    
    vector<int> answer(n,0);
    if(roads.size()==0){
        vector<int> az(n,1);
        return az;
    }
    int dawtagch=0;
    vector<int> oneroadarr(n,-1); int b=0;
    
    int oneroad = 0;
    for(int i=0; i<n; i++){
        for(int j=0; j<roads.size(); j++){
        //1 roadtai city bolon ogt zamgvi city g olii ------------------
            if(roads[j][0] == i || roads[j][1]==i){
                dawtagch++;
            }
        }
        if(dawtagch==1){
            oneroad++;
            oneroadarr[b] = i ; b++;
        }
        if(dawtagch<=1){
            answer[i] = 1; // exnii shono ezlegdex city / conquerd city 
        }
        dawtagch=0;
    }
    
    vector<vector<int>> newroad = roads;
    int jindex = roads.size();
    bool checker = true;
    vector<int> ystgagch; 
    while(checker){
    int a3 = 0;int a4 = 0;
    for(int i=0; i<jindex; i++){
        //cout << newroad[i][0] <<" "<< newroad[i][1] <<  " ";
        for(int j=0; j<jindex; j++){
            if(j!=i){
                if(newroad[i][0] == newroad[j][0] || newroad[i][0] == newroad[j][1]){//5
                    a3+=1;
                }
                if(newroad[i][1] == newroad[j][0] || newroad[i][1] == newroad[j][1]){
                    a4+=1;
                    
                }
            }
        }
        if(a4 == 0 || a3==0){
            ystgagch.push_back(i);
        }
        a4=0;a3=0;
    }
        int ystindex = 0;
        for(int i=0;i<ystgagch.size();i++) {//Now, delete them
            jindex--;
    	    if(i==0){
                newroad.erase(newroad.begin()+ystgagch[i]);
                ystindex++;
            }else{
                newroad.erase(newroad.begin()-ystindex+ystgagch[i]);
                ystindex++;
            }
        }	
        if(ystgagch.size()==0){
            checker = false;
        }
        ystgagch.clear();
    }
    // -1 ytgiig answer t ogch bna;
    for(int i=0; i<jindex ; i++){
        answer[newroad[i][0]] = -1;
        answer[newroad[i][1]] = -1;
    }
    
    cout << "toirog hemjee : " << jindex << endl;
    bool city0 = true;
    
    //if(jindex == 0){
        // ogt toiroggvi city bol 
    int cityoldots =0;
    int day = 2; // day1 vvd oldtson tyl 2ooos exlvvlew
    bool breaker = false;
    int multipath = 0;
    int mincityconut = 0;
    int tegcity = 0;
    while(city0){
        vector<int> ez;
        for(int i=0; i<n; i++){
            if(answer[i] == 0){
                cityoldots++;
                cout << "i: " << i << endl;
                for(int j=0; j< roads.size(); j++){
                    if(i == roads[j][1]){
                        cout<<"city:1 " << i << " " << roads[j][0] << endl;
                        if(answer[roads[j][0]] == day-1){
vector<int>::iterator it;                           
it = find (ez.begin(), ez.end(), i);
if (it == ez.end()){
    ez.push_back(i);}
                        }
                        multipath++;
                        if(answer[roads[j][0]] == 0 || answer[roads[j][0]] == -1){
                            tegcity++;
                            cout << "0: " << answer[roads[j][1]] << endl;
                    }
                    }
                    if(i == roads[j][0]){
                        cout<<"city:2 " << i << " " << roads[j][1] << endl;
                        if(answer[roads[j][1]] == day-1){
vector<int>::iterator it;                           
it = find (ez.begin(), ez.end(), i);
if (it == ez.end()){
    ez.push_back(i);}
                        }
                        multipath++;
                        if(answer[roads[j][1]] == 0 || answer[roads[j][1]] == -1){
                            tegcity++;
                            cout << "0: " << answer[roads[j][1]] << endl;
                    }
                    }
                    
                    if(j==roads.size()-1 && multipath>2){
                        if(tegcity>1){
                        vector<int>:: iterator it ; 
                        
                        it = find (ez.begin() , ez.end(), i);
                        if( it!=ez.end()){
                            cout << "deleted1: " << i << endl;
                            ez.pop_back();
                        }
                        }
                    }
                    
                } 
                cout << "tegcity: " << tegcity << endl;
                cout << "Multpath: " << multipath << endl;
                tegcity = 0;  
                multipath = 0;
                /// j loop outside 
                cout << "end-------------------" << endl;
                
            }
        }
        for(int q=0; q<ez.size(); q++){
                answer[ez[q]] = day;
                cout << ez[q] << endl;
        }
        day++;
        
        if(cityoldots==0){
            city0=false;
        }
        cityoldots = 0;
        ez.clear();
    }
    
    return answer;
}
