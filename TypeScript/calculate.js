function main(workbook: ExcelScript.Workbook) {
    var matrix: number[][] = new Array();
    var v1 = 0; var no1 = 0;
    var v2 = 0; var no2 = 0;
    var v3 = 0; var no3 = 0;
    var v4 = 0; var no4 = 0;
  let selectedSheet = workbook.getWorksheet("Form1");
    let table = selectedSheet.getTables()[0];
    let body = table.getRangeBetweenHeaderAndTotal().getValues();
    let headers = table.getHeaderRowRange().getValues();
    var startvalue = table.getRowCount()+4
    var user_name = table.getRowCount() + 3
    let startingcell = selectedSheet.getRange("A" + startvalue)
    let startingcell0 = selectedSheet.getRange("A" + user_name)

  for (let row = 0; row < table.getRowCount(); row++) { //table.getRowCount()
      v1=0 ; v2 = 0; v3=0; v4= 0;
      no1= 0; no2=0; no3=0; no4=0;
          for (let column = 5; column <= table.getColumns().length-1; column++) {
            //console.log(row + "--" + column);
            if (column%2==1 || column ==5) {
              console.log(column);
              if(body[row][column].toString().substring(0,1) == '1'){
                v1++;
              } else if (body[row][column].toString().substring(0, 1) == '2'){
                v2++;
              } else if (body[row][column].toString().substring(0, 1) == '3'){
                v3++;
              } else{
                v4++;
              }
            }
            if (column % 2 == 0) {
              if (body[row][column].toString().substring(0, 1) == '1') {
                no1++;
              } else if (body[row][column].toString().substring(0, 1) == '2') {
                no2++;
              } else if (body[row][column].toString().substring(0, 1) == '3') {
                no3++;
              } else{
                no4++;
              }
            }
        }
        matrix.push([v1,v2,v3,v4,no1,no2,no3,no4]);
    } 
  var row_adder = 0
  const base = [34,24,18,24];
  const multyes = [0.8,0.821428571428571, 0.8,0.75]
  const multno = [0.8,0.7857142857, 0.8,0.785714]

  const basename = ["Dominance","Steadiness","Influence","Compliance"]
  for (let i = 0; i < table.getRowCount(); i++) {
    startingcell0.getOffsetRange(0 + row_adder,0).setValue(body[i][3]); 
    startingcell0.getOffsetRange(0 + row_adder,1).setValue("Yes"); 
    startingcell0.getOffsetRange(0 + row_adder,2).setValue("No"); 
    startingcell0.getOffsetRange(0 + row_adder,3).setValue("Хувь"); 
  for (let j = 0; j < 4; j++) { // niit мөрний хэмжээ
    startingcell.getOffsetRange(j + row_adder, 0).setValue(basename[j]);
    startingcell.getOffsetRange(j+row_adder, 1).setValue(matrix[i][j])
    startingcell.getOffsetRange(j+row_adder, 2).setValue(matrix[i][j+4])  //mor moroor nemj baigaashvv
    startingcell.getOffsetRange(j+row_adder, 3).setValue(matrix[i][j]*multyes[j]-matrix[i][j+4]*multno[j]+base[j]+"%")
    startingcell.getOffsetRange(j+row_adder, 3).getFormat().getFont().setBold(true);
  }
    row_adder+=6;
}

  
    
}
