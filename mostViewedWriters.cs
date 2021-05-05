int[][][] mostViewedWriters(int[][] topicIds, int[][] answerIds, int[][] views) {
    var ids = new List<int>(); //topic IDs
   
    for(int i=0; i<topicIds.Length; i++){ //IDs утгуудаа олж байна
        for(int j=0; j<topicIds[i].Length ; j++){
            int index = ids.IndexOf(topicIds[i][j]);
            if(index == -1){
                ids.Add(topicIds[i][j]);
            }
        }
    }
    ids.Sort((a, b) => a.CompareTo(b));
    
    List<KeyValuePair<int, int>> questions = new List<KeyValuePair<int, int>>();
    
    for(int i=0; i<ids.Count; i++){ //question дугааруудаа questions listend хадгалж авч байна. 
        for(int j=0; j<topicIds.Length; j++){
            for(int l=0; l<topicIds[j].Length; l++){
                if(ids[i] == topicIds[j][l]){
                    questions.Add(new KeyValuePair<int, int>(ids[i], j)); 
                }
            }
        }
    }
    
    List<KeyValuePair<int, int>> topics = new List<KeyValuePair<int, int>>();

    foreach (KeyValuePair<int, int> item in questions){// questions ашиглан topics утгуудыг хадгалж авч байна. 
        for(int i=0; i<answerIds.Length; i++){
            if(i == item.Value){
                for(int j=0; j<answerIds[i].Length; j++){
                    topics.Add(new KeyValuePair<int, int>(item.Key, answerIds[i][j]));
                }
                if(answerIds[i].Length == 0){   // answerIds empty байвал -1 гэж хадлгаж өгнө
                    topics.Add(new KeyValuePair<int, int>(item.Key, -1));
                }
            }
        }

    }

    Dictionary<int, int> dupli = new Dictionary<int, int>(); //topicid болон topic -ыдг тоолж авна
    
    foreach(KeyValuePair<int,int> item in topics){ //topicid болон topic дугааруудын комбэйнэшнийг тоолж байна
        if(item.Value == -1){          //-1 буюу хоосон утгануудын key -ыг 0 гэж хадгалж өгч байна
            dupli.Add(item.Key, 0);
        }else if(dupli.ContainsKey(item.Key) == true){
            int b1 = dupli[item.Key]+1;
            dupli[item.Key] = b1;
        }else{
            dupli.Add(item.Key, 1);
        }

    }

    int[][][] ans = new int[ids.Count][][];

    Dictionary<int, int> userid =  new Dictionary<int, int>(); 
    
    int ii=0; int key = 0; int jj=0;
    foreach(KeyValuePair<int,int> item in topics){
        for(int i=0; i<views.Length;i++){
            if(views[i][0] == item.Value){
                if (userid.ContainsKey(views[i][1])==true){
                    int b1 = userid[views[i][1]]+views[i][2];
                    userid[views[i][1]] = b1;
                }else{
                    userid.Add(views[i][1], views[i][2]);
                }
                key++;
            }
        }
        
        int value;
        dupli.TryGetValue(ids[ii], out value); // хэдэн 1 хэмжээст хүснэгт байх утгыг авч байна
        
        if(value == key || value == 0){ //ans array -т утгуудаа хадгалж байна
            if(value==0){
                ans[ii] = new int[][] {};       //   [] empty array declared

            }else{
                ans[ii] = new int[userid.Count][];
                //Доод мөрөнд Value утгаар нь Descend sort-лоод , ижил value-тай байвал Key-ээр нь ascend sort-лож байна. 
                foreach(KeyValuePair<int,int> it in userid.OrderByDescending(key => key.Value).ThenBy(key => key.Key)){
                    ans[ii][jj] = new int[2]; 
                    ans[ii][jj][0] = it.Key; ans[ii][jj][1] = it.Value;
                    jj++;
                }
                jj=0;    
                
            }
            
            key = 0;
            ii++;
            userid.Clear();

        }  
    }
    return ans;
}
