function main(workbook: ExcelScript.Workbook) {
  let selectedSheet = workbook.getActiveWorksheet();
  let table = selectedSheet.getTables()[0];
  let rowlength = table.getRowCount()
  let collength = table.getColumns().length 
  let body = table.getRangeBetweenHeaderAndTotal().getValues();
  let headers = table.getHeaderRowRange().getValues();
  for (let column = collength - 1; column >= 0; column--) {
    var entireColumnIsEmpty = true;
    for (let row = 0; row < rowlength; row++) {
      if (body[row][column] != "") {
        entireColumnIsEmpty = false;
        break;
      }

    }
    if (entireColumnIsEmpty) {
      table.getColumnByName("" + headers[0][column]).delete();
    }
  }
}
