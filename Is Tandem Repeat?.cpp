bool isTandemRepeat(string inputString) {
    int firstval = int(inputString[0]); //exniii ytga 
    if(inputString.size()%2!=0){
        return false;
    }
    for(int i=1; i<inputString.size() ; i++){
        cout << int(inputString[i]) << endl;
        if(firstval == int(inputString[i])){
            cout << "bnadaa" << endl;
            if(int(inputString[i-1] == int(inputString[inputString.size()-1]))){
                if((inputString.size())/(i)==2){
                    return true;
                }
            }
        }
    }
    
    return false;
}
