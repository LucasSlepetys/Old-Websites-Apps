function list_fruits() {
    var choice = "";
    for(var x = 0;x < 6; x += 1) {
        if(document.myForm.myList[x].selected==true) {
            choice += document.myForm.myList[x].value + " ";
        }
    }
    document.myForm.myArea.value = "You have choosen " + choice;
}