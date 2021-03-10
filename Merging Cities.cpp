vector<vector<bool>> mergingCities(vector<vector<bool>> roadRegister) {
    bool allfalse = false;
    int len = roadRegister.size();
    for(int i=0; i<len; i++){
        for(int j=0; j<len; j++){
            if(roadRegister[i][j] == true){
                allfalse = true;
            }
        }
    }
    if(allfalse==false){
        return roadRegister;
    }
    //connected city find
    vector<int> con;
    for(int i=0; i<len; i+=2){
        for(int j=0; j<len; j++){
            if((roadRegister[i][j] == true) && j==i+1){
                cout << i << " connectedby " << i+1 << endl;
                con.push_back(i);
            }
        }
    }
  ///------------------------
    vector<vector<bool>> answer1(len-con.size(), vector<bool> (len-con.size(),false)); // new city vector
    int len2 = answer1.size(); //new city length
    int jj=0, ii=0;
    vector<int>::iterator index,index2,index3,index4;
    
    //ystsan city row, column iig hasaj answer1 t hadgalj bna
    for(int i=0; i<len; i++){
        for(int j=0; j<len ; j++){
            index =  find(con.begin(), con.end(), j); 
            if(index == con.end()){
                //connected bish dangaaraa citynyydiig todorxoilj ogox zone
                index4 = find(con.begin(), con.end(), i); 
                if(index4 !=con.end()){
                    if(roadRegister[i+1][j] == true || roadRegister[i][j]==true){
                        answer1[ii][jj] = true;
                    }    
                }else{
                
                answer1[ii][jj] = roadRegister[i][j];
                }
                jj++;    
            }else{
                index3 = find(con.begin(), con.end(), i); 
                if(index3 !=con.end()){
                //connected city nvvdeee todorxoilj bna
                    if(roadRegister[i][j] == true || roadRegister[i][j+1] == true || roadRegister[i+1][j] == true || roadRegister[i+1][j+1] == true){
                        answer1[ii][jj] = true;
                    }else{
                        answer1[ii][jj] = false;
                    }
                }else{
                    if(roadRegister[i][j] == true || roadRegister[i][j+1] == true){
                        answer1[ii][jj] = true;
                    }else{
                        answer1[ii][jj] = false;
                    }
                }               
                jj++;
                j++;
               
            } 
            
        }
        
        index2 =  find(con.begin(), con.end(), i);
        
        if(index2 != con.end()){ //connected city oldoj baiwal 2 daxi city g ni algasaj bna
            i++;
        } 
        ii++;
        jj=0;
       
    }
    //gol diagnalyydiig bytsaagaad false bolgoj bna
    for(int i=0; i<len2 ; i++){
        for(int j=0; j<len2 ;j++){
            if(i==j){
                answer1[i][j] = false;
            }
        }
    }
    
    return answer1;
}
