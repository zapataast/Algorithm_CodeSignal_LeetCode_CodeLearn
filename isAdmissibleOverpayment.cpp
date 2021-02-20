bool isAdmissibleOverpayment(vector<double> prices, vector<string> notes, double x) {
    vector<double> value(notes.size(),0);
    vector<double> value2(notes.size(), 0);
    for(int i=0; i<notes.size(); i++){
        size_t found = notes[i].find('%');
        string temp = "";
        if(found!=string::npos){
            for(int j=0; j<found; j++){
                temp += notes[i][j];
            }
            if(temp==""){
                value[i] = 0;
            }else{
                value[i] = stod(temp);
            }
            temp = "";
        }
        
    }
    for(int i=0; i<notes.size(); i++){
        size_t found = notes[i].find("higher");
        size_t found2 = notes[i].find("lower");
        if(found!=string::npos){
            double a1 = prices[i]*100/(value[i]+100);
            double a2 = a1*value[i]/100;
            value2[i] = a2;
            cout << a2 << endl;
        }else if(found2!=string::npos){
            double a3 = prices[i]*100/(100-value[i]);
            double a4 = a3*value[i]/100;
            value2[i] = a4*-1;
            cout << a4 << endl;
        }
        
    }
    double total=0;
    for(int i=0; i<notes.size(); i++){
        total += value2[i];
    }
    if(total <= x){
        return true;
    }else{
        return false;
    }
    


}
