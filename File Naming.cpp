bool strshalgagch(string s1, vector<string> vec){
    for(int i=0; i<vec.size() ; i++){
        if(s1.size() == vec[i].size()){
            if(s1 == vec[i]){
                return 1; //taarch bna;
            }
        }
    }
    return 0; // false
}
vector<string> fileNaming(vector<string> names) {
    
    vector<string> names3(names.size(), "0"); // empty
    int adder = 0;
    string temp = "";

    for(int i=0; i<names3.size(); i++){
        if(i==0){
            names3[i] = names[i];
        }else{
            bool found = strshalgagch(names[i], names3);
            if(found == true){ //baiwal
                for(;found == true;){
                    //name iig omnox name bolox names3 tai dawxtsaj baigaa vgvig ni shalgana
                    adder++;
                    temp = names[i] + '(' + to_string(adder) + ')';
                    found = strshalgagch(temp, names3);
                }
                adder = 0;
                names3[i] = temp;
            }else{
                names3[i] = names[i];
            }
        }
    }
    
    return names3;
}
