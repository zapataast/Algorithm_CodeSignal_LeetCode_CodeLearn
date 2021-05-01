int differentSquares(int[][] matrix) {
    int n = matrix.Length;
    int m = matrix[0].Length;
    if(n==1 || m == 1){return 0;}
    
    Dictionary<string, string> dicto =  new Dictionary<string, string>(); 
    
    for(int i=0; i<n-1; i++){
        for(int j=0; j<m-1; j++){
            string temp = matrix[i][j].ToString() + matrix[i][j+1].ToString() + matrix[i+1][j].ToString() + matrix[i+1][j+1].ToString();
            //Console.WriteLine(temp);
            if (dicto.ContainsKey(temp)==true){
                dicto[temp] = temp;
            }else{
                dicto.Add(temp, temp);
            }
        }
    }
    Console.WriteLine(dicto.Count);
    return dicto.Count;
}
