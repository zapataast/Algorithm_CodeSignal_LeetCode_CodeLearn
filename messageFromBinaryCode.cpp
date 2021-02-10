int binarytodec(string n){
    int m=0;
    for(int i=n.size()-1,j=0; i >= 0; i--,j++){
        cout << n[i] << " ";
        if(n[i] == '1'){
            m += pow(2,j);
        }
    }
    return m;
}

string messageFromBinaryCode(string code) {
    int starti = 0;
    int endi = 7;
    int num =0;
    string answer = "";
    string temp ="";
    for(int i=0; i<code.size(); i++){
        temp += code[i];
        
        if(i==endi){
            num = binarytodec(temp);
            endi+=8;
            starti+=8;
            temp = "";
            cout << (char)num << endl;
            answer+= (char)num;
        }
        
    }
    
    return answer;
}
