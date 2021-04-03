bool isMAC48Address(string inputString) {
    if(inputString.size()!=17){
        return false;
    }
    int temp1=0;int temp2=0;
    for(int i=0; i<inputString.size(); i++){
        if(inputString[i] == '-'){
            if(i==2 || i==5 ||i==8|| i==11|| i==14){
                //ok
            }else{
                return false;
            }
        }else if(isdigit(inputString[i])){
            temp1 = (int)inputString[i];
            if(48<= temp1 && temp1 <=57){
                //ok
            }else{
                return false;
            }
        }else if(isalpha(inputString[i])){
            temp2 = (int)inputString[i];
            if(65<= temp2 && temp2 <= 70){
                //ok
            }else{
                return false;
            }
        }else{
            return false;
        }
            
    }
    
        return true;
}
