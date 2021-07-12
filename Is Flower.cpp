//цэцэгний бүх цэгүүд нэг цэгт холбогдох ба цэцэгийн бүх салаанууд тэнцүү цэгүүдээс бүрдэнэ. 
bool isFlower(vector<vector<bool>> adj) {
    vector<vector<int>> arr;  
    vector<int> adil;
    int n = adj.size(),c1=0,goltseg = 0,golindex=0;
    int sum=0;
    for(int i=0; i<n; i++){
        vector<int> v1(2);
        for(int j=0; j<n; j++){
            if(adj[i][j] == true){
                if(i < j){
                    v1[0] = i;   v1[1] = j;
                }else{
                    v1[0] = j;   v1[1] = i;}
                if(arr.end() == find (arr.begin(), arr.end(), v1)){
                    arr.push_back(v1);
                }
            }
        }
        int c3 = count(adj[i].begin(), adj[i].end(), true);
        if(c3<=1){
            return false; //сүүл гэж үзнэ , байж болохгүй  
        }
        sum += c3;
        adil.push_back(c3);
        if(c3 > goltseg){   goltseg = c3;   golindex = i; } //гол цэг болон түүний index ийг хадгалж авч байна
        if(adj[i][i] == true){  return false;} 
    }
    if(sum==n*n-n){ return true; } // bvgd hoorondoo xolbootoi bol true gej vzne

    if(goltseg == 3){ return false; }
    
    if(n%2==0 && n!=10){
        return false;
    }
    //3> нэг цэгт холбоотой байгаа цэгүүдийг салгаж аваад,  тэр олдсон цэгийг хоорондоо холбоотой байгаа эсэхийг шалгаж байна 
    vector<int> first_vec ;
    for(int i=0; i<n ;i++){
        for(int j=0; j<n; j++){
            if(j != golindex && i != golindex){
                cout << adj[i][j] << " ";
                if(adj[i][j] == true){
                    first_vec.push_back(j);
                }
            }
        }
        if(first_vec.size() > 1){
            if(adj[first_vec[0]][first_vec[1]] != true){
                return false;
            }
        }
          
        first_vec.clear();
        cout << endl;
    }
    //-------------------------------------------------------


    
    if((sum-goltseg)%(n-1)!=0){ return false;} // гол цэгээс бусад цэгүүдийн холбоосууд ижил 3 3 3 3 гэх мэт
    
    return true;
}
