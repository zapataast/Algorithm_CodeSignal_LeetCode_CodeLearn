int[] incrementalBackups(int lastBackupTime, int[][] changes) {
    ArrayList v = new ArrayList();

    for(int i=0; i<changes.Length; i++){
        if(changes[i][0] > lastBackupTime){
            v.Add(changes[i][1]);
        }
    }
    int[] answer = new int[v.Count];
    
    for(int i=0;i<v.Count; i++){
        answer[i] = Convert.ToInt32(v[i]); //list object утгыг int рүү хөрвүүлж байна
    }
    int[] ans = answer.Distinct().ToArray(); // remove duplicates 
    
    Array.Sort(ans);
    
    return ans;
}
