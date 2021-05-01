bool launchSequenceChecker(string[] systemNames, int[] stepNumbers) {

    Dictionary<string, int> dicto =  new Dictionary<string, int>(); 
    
    for(int i=0; i<systemNames.Length; i++){
        if (dicto.ContainsKey(systemNames[i].ToString())==true){
            int b1 = dicto[systemNames[i].ToString()];
            if(stepNumbers[i] <= b1){
                return false;
            }else{
                dicto[systemNames[i].ToString()] = stepNumbers[i];
            }
            
        }else{
            dicto.Add(systemNames[i].ToString(), stepNumbers[i]);
        }
    }
    
    
    return true;
}
