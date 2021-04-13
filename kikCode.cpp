#include <sys/types.h>

vector<vector<vector<int>>> kikCode(string userId) {
    vector<vector<vector<int>>> ans;
    vector<string> sector;
    
    long long int x = stoll(userId, nullptr, 10); //userId -г integer bolgoj bna
    
    string str_bin = bitset<52>(x).to_string(); // userId g binary bolgoj bna
    reverse(str_bin.begin(), str_bin.end());
    
    //str_bin -г 6 sector-т хуваагаад sector vector-д хадгалж байна. 
    vector<int> splitter = {3,4,8,10,12,15};
    string temp = ""; int temp1 = 0;
    for(int i=0; i<str_bin.size(); i++){
        temp += str_bin[i];
        temp1++;
        if(find(splitter.begin(), splitter.end(), temp1) != splitter.end()){
            sector.push_back(temp);
            temp.clear();
            splitter.erase(splitter.begin()+0);
            temp1 = 0;
        }
    }
    // утга оноох хэсэг
    vector<vector<int>> an1; 
    vector<int> an2(2);

    for(int i=0; i<sector.size();i++){
        int angle = 360/sector[i].size();
        int toolyyr = 0;
        for(int j=0; j<sector[i].size(); j++){
            an2[0] = i+1; // Тойргийг дотор талаас нь 1 гэж дугаарлана.
            
            if(sector[i][j] == '1'){ // 1 гэсэн утгуудыг тоолж байна, үүнээс хамаарч өнцөгийн хэмжээ өөрчлөгдөнө.
                toolyyr++;
            }
            if(sector[i][j+1] == '0' || j==sector[i].size()-1){
                if(toolyyr==sector[i].size()){ // хэрвээ бүгд 1 бол бүтэн 360 градус гэж үзнэ.
                    an2[1] = 0;     an1.push_back(an2);
                    an2[1] = 360;   an1.push_back(an2);
                }else if(((j+1)-toolyyr)*angle==0 && sector[i][sector[i].size()-1] == '1'){  // хэрвээ эхний сигмент сүүлчийн сигмент 1 бол хоорондоо холбоотой гэж үзнэ. Тэгээд Start цэс 270 аас байлаа гэхэд, төгсгөл цэг 270+270=540 гэж хадгална.
                    int re = 0;
                    for(int u=sector[i].size()-1; u>=0 ; u--){ //Ардаас шалгаад хэдэн залгаатай 1 байгааг тоолж байна. 
                        if(sector[i][u] == '1'){
                            toolyyr++;
                            re++;
                        }else{
                            break;
                        }
                    }
                    an2[1] = (sector[i].size()-re)*angle; //first angle
                    an1.push_back(an2);
                    an2[1] = an2[1] + ((toolyyr)*angle); //second angle
                    an1.push_back(an2);
                    for(int u=0; u<re; u++){
                        sector[i].erase(prev(sector[i].end())); // төгсгөлд байсан 1 үүдийг үндсэн loopнээс хасч өгч байна.
                    }
                    toolyyr = 0;
                }else if(toolyyr!=0){ //бусад үед
                    int ang = ((j+1)-toolyyr)*angle;
                    an2[1] = ang; // эхний angle-г олж байна
                    an1.push_back(an2);
                    an2[1] = ang+(toolyyr*angle); //төгсгөлийн angle-ыг олж байна  
                    an1.push_back(an2);
                    toolyyr = 0;
                }
            }
            if(!an1.empty()){
                ans.push_back(an1); // 3d vector луу нэмж байна. 2d vectoroo
                an1.clear();
            }
        }
    }
    
    return ans;
}
