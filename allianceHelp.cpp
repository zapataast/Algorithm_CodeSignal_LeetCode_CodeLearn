int allianceHelp(int t, int allianceSize) {
    int time=0;
    
    if(allianceSize==0){ return t;}
    if(10>t){ return 0;}
    
    if(allianceSize > 10){
        int speed = t/10; 
        time = speed*10;
    }else{
        int speed = t/10; 
        if(allianceSize==1){
            return t-60;
        }
        if(t%10>1){
            speed++;
        }
        time = speed*allianceSize;
    }
    return t-time;
}
