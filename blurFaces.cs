double[][] blurFaces(int[][] img) {
    double[][] ans = new double[img.Length][];
		for(int i=0; i<img.Length; i++){
			List<double> templist = new List<double>();
			double temp = 0;
			float count = 0;
			ans[i] = new double[img[i].Length];
			
			for(int j=0; j<img[i].Length; j++){
				//Дээд 3 хөрш
				if(j-1>-1 && i-1>=0){ 				temp += img[i-1][j-1]; count++;}
				if(i-1>=0){							temp += img[i-1][j];		count++;}
				if(j+1<img[i].Length && i-1>=0){ 	temp+= img[i-1][j+1];  count++;}
				//хоёр талын хөрш
				if(j-1>=0){ 						temp+=img[i][j-1]; count++;}
				if(j+1<img[i].Length){ 				temp+= img[i][j+1]; count++;}
				//Доод 3 хөрш
				if(j-1>=0 && i+1 <img.Length) {		temp+= img[i+1][j-1]; count++;}
				if(i+1<img.Length){ 				temp+= img[i+1][j] ;  count++;}
				if(i+1<img.Length && j+1<img[i].Length){ temp+=img[i+1][j+1];count++;}
				temp = temp/count;
                
				Console.WriteLine("temp: " + temp + " count: " + count);
				count = 0;
				templist.Add(temp);
				temp = 0;
				
			}

			double[] tempdouble = templist.ToArray();
			ans[i] = tempdouble;
			templist.Clear();
		}
		return ans;
}
