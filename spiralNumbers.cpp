vector<vector<int>> spiralNumbers(int n) {
    vector<vector<int>> ar1(n, vector<int> (n,0));
    int i=0,j=0;
    int len = n*n;
    int to = 1;
    string pos = "";
    int count = 0;
    cout << len << endl;
    int zorvv = 0;
    for(; count<len;){

        if(i==0 || pos == "right"){
            //cout << pos << endl;
            if(ar1[i][j]!=0){
                pos = "down";
                i++;
                j--;
            }else{
                ar1[i][j] = to; to++;
                j++;
                if(j==n-zorvv){
                    pos = "down";
                    i++;
                    j--;
                }
            }
        }else if(pos == "down"){
            //cout << pos << endl;
            if(ar1[i][j]!=0){
                pos = "left";
                //count--;
                i--;j--;
            }else{
                ar1[i][j] = to; to++;
                i++;
                if(i==n-zorvv){
                    pos = "left";
                    i--;
                    j--;
                }
            }
        }else if(pos == "left"){
            //cout << pos << endl;
                ar1[i][j] = to; to++;
                j--;
                if(j-zorvv==-1){
                    pos = "up";
                    i--;
                    j++;
                }

        }else if(pos=="up"){//ok
            //cout << pos << endl;
                ar1[i][j] = to; to++;
                i--;
                if(i==j){
                    zorvv++;
                    pos = "right";
                    i++;
                    j++;
                }

        }
        //cout << "i: "<<i <<" j:" << j << endl;

        count++;
       

    }

    return ar1;
}
