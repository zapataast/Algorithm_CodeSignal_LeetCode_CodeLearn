string htmlEndTagByStartTag(string startTag) {
    int n = startTag.size();
    if(startTag[0] == '!' && startTag[1] == 'D'){
        return "/html";
    }
    string answer = "";
    for(int i=1 ; i<n; i++){
        if(isspace(startTag[i]) || ispunct(startTag[i])){
            break;
        }
        if(isalpha(startTag[i]) || isdigit(startTag[i])){
            answer += startTag[i];
        }
    }
    cout << answer << endl;
    return "</" + answer + ">"; 
