string questionCorrectionBot(string question){
    //remove spaces 
    string n = question;
    int countspace = 0;
    for(int i=0; i<n.size(); i++){
        if(isspace(n[i])){
            countspace++;
        }else{
            if(i - countspace == 0){
                n.erase (0,countspace); 
                i = i-countspace;
            }else if(countspace!=0){
                n.erase(i-countspace, countspace-1);    
                i = i-countspace;
            }
            //cout << countspace << endl;
            countspace = 0;
        }
    }n.erase(n.size()-countspace, countspace);
    //check first letter 
    if(islower(n[0])){
        n[0] = toupper(n[0]);
    }
    //last ? check
    while(n[n.size()-1] == '?'){
        n.erase(n.size()-1,1);
    }
    n += "?";
    //check taslal 
    for(int i=0; i<n.size(); i++){
        if(n[i] == ','){
            //cout << i << endl;
            if(isspace(n[i-1])){
                cout << " b " << endl;
                n.erase(i-1,1);
            }
            i--;
            if(!isspace(n[i+1])){
                n.insert(i+1," ");
                i++;
            }
        }
    }
    return n;
