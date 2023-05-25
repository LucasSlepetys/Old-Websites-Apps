function selecting() {
    var brand = "";
    for(var x = 0; x < 6; x += 1) {
        if (document.myForm.R[x].checked == true) {
            brand = document.myForm.R[x].value;
        }       
    }
    document.myForm.myArea.value = "The car that you have choosen is " + brand + ".";
}
