string[][] catalogUpdate(string[][] catalog, string[][] updates) {
    List<string> updates_Upper = new List<string>();   //updates-аас толгой утгуудыг салгаж авч байна
    List<string> updates_lower = new List<string>();
    
    for(int i=0; i<updates.Length; i++){
        if(updates_Upper.IndexOf(updates[i][0])==-1 && Char.IsUpper(updates[i][0],0)){
            updates_Upper.Add(updates[i][0]);
        }else if(updates_lower.IndexOf(updates[i][0])==-1 && Char.IsLower(updates[i][0],0)){
            updates_lower.Add(updates[i][0]);
        }
    }
    
    for(int i=0; i<catalog.Length; i++){
        if(updates_Upper.IndexOf(catalog[i][0])==-1 && Char.IsUpper(catalog[i][0], 0)){
            updates_Upper.Add(catalog[i][0]);
        }else if(updates_lower.IndexOf(catalog[i][0])==-1 && Char.IsLower(catalog[i][0],0)){
            updates_lower.Add(catalog[i][0]);
        }
    }
    
    List<string> branch = new List<string>();
    List<string> branch_lower = new List<string>();
    
    updates_Upper.Sort((a, b) => a.CompareTo(b));
    updates_lower.Sort((a,b)=> a.CompareTo(b));
    
    foreach(var it in updates_lower){ // 2 updates аа нийлүүлж байна
        updates_Upper.Add(it);
    }
    string[][] ans = new string[updates_Upper.Count][];
    int index = 0;
    foreach(var it in updates_Upper){
        Console.WriteLine("var: " + it);
        for(int i=0; i<catalog.Length; i++){
            if(it == catalog[i][0]){
                for(int j=1; j<catalog[i].Length; j++){
                    if(char.IsUpper(catalog[i][j][0])){
                        branch.Add(catalog[i][j]);
                    }else{
                        branch_lower.Add(catalog[i][j]);
                    }     
                }
            }
        }
        for(int i=0; i<updates.Length; i++){
            if(it == updates[i][0]){
                for(int j=1; j<updates[i].Length; j++){
                    if(char.IsUpper(updates[i][j][0])){
                        branch.Add(updates[i][j]);
                    }else{
                        branch_lower.Add(updates[i][j]);
                    }  
                }
            }
        }
        branch.Sort((a,b)=> a.CompareTo(b));
        branch_lower.Sort((a,b)=> a.CompareTo(b));
        
        foreach(var im in branch_lower){
            branch.Add(im);
        }
        branch.Insert(0, it);  // list -ын эхэнд толгой утгуудыг хадлгаж өгч байна
        
        string[] bra_array = branch.ToArray(); //бүх branch-ыг array-д хадгалаад ans[index]-д хадгалж өгч байна. 
        
        ans[index] = bra_array;

        index++;
        branch.Clear();
        branch_lower.Clear();
    }
    
    return ans;
}
