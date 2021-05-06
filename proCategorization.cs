string[][][] proCategorization(string[] pros, string[][] preferences) {
    var preferences_s = new List<string>();
    
    for(int i=0; i<preferences.Length; i++){ //давхардсан prefer утгуудыг салгаж авч байна
        for(int j=0; j<preferences[i].Length; j++){
            if(preferences_s.IndexOf(preferences[i][j])==-1){
                preferences_s.Add(preferences[i][j]);
            }
        }
    }
    string[][][] ans = new string[preferences_s.Count][][];
    
    List<string> pro1d = new List<string>();
    
    preferences_s.Sort((a, b) => a.CompareTo(b)); // lexicographically sorting 
    
    int index = 0; 
    
    foreach(var it in preferences_s){  //давхардсан pros утгуудыг салгаж авч байна
        ans[index] = new string[2][];
        
        for(int i=0; i<preferences.Length; i++){ 
            for(int j=0; j<preferences[i].Length; j++){
                if(it == preferences[i][j]){
                    pro1d.Add(pros[i]);
                }
            }
        }
        
        string[] arr2df = new string[1]; arr2df[0] = it; //шинээр array зарлаад шуудans ans[][] хадгалж байна
        ans[index][0]  = arr2df;
        
        string[] arr2d = pro1d.ToArray();    //pros name list -ыг array -т хадгалж авч байна.
        ans[index][1] = arr2d;
        
        index++;
        pro1d.Clear();
        
    }
    
    return ans;
}
