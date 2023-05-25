function getChoice(){
    var choices = [];
    document.myform.myArea.value = "You have chosen ";
    if(document.myform.checkbox_1.checked == true) {
        choices += document.myform.checkbox_1.value + ", ";
    }

    if(document.myform.checkbox_2.checked == true) {
        choices += document.myform.checkbox_2.value + ", ";
    }
    if(document.myform.checkbox_3.checked == true) {
        choices += document.myform.checkbox_3.value + ", ";
    }
    if(document.myform.checkbox_4.checked == true) {
        choices += document.myform.checkbox_4.value + ", ";
    }
    if(document.myform.checkbox_5.checked == true) {
        choices += document.myform.checkbox_5.value + ", ";
    }


    var string = document.myform.myArea.value += choices;
    var new_string = string.slice(0, -2);
    document.myform.myArea.value = new_string + ".";
}


