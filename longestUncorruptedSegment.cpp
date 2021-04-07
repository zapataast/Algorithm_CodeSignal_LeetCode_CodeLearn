vector<int> longestUncorruptedSegment(vector<int> sourceArray, vector<int> destinationArray) {
    int len = sourceArray.size();
    int counter = 0;
    int max = 0;
    int index = 0;
    cout << "len: " << len<< endl;
    vector<int> arr1(2,0);    
    for(int i=0; i < sourceArray.size(); i++){
        if(sourceArray[i]!=destinationArray[i]){
              counter = 0;
        }else{
            counter++;
        }
        if(counter > max){
            max = counter;
            index = i;
        }
    }

    if(max==0){
        arr1[0] = 0; arr1[1] = 0;
        return arr1;
    }
    arr1[0] = max;
    arr1[1] = index-(max-1);
    return arr1;
}
