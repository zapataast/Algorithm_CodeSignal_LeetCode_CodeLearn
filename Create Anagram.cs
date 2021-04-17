static string sortString(String str) { //sort string return
    char []arr = str.ToCharArray(); 
    Array.Sort(arr); 
    return String.Join("",arr); 
}
int createAnagram(string s, string t) {
    int ans=0; int counter = 0;
    s = sortString(s);
    t = sortString(t);
    for(int i=0; i<s.Length; i++){
        int index1 = t.IndexOf(s[i]);
        if(index1!=-1){
            Console.WriteLine(index1);
            t = t.Remove(index1,1);
        }
    }
    
    return t.Length;
}
