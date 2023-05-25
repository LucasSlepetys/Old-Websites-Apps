function message(){
    txt_first = document.myform.myText.value;
    txt_last = document.myform.myText_last.value;
    txt_grade = document.myform.myText_grade.value;
    txt_write = ("Hello " + txt_first + " " + txt_last + ". You are in " + txt_grade + " grade!");

    document.myform.myText_write.value = txt_write
}
