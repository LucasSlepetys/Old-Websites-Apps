function submiting() {
    var name = "";
    var final_text = "";
    var e = "";
    var value = "";
    var text = "";
    var choices = "";

    // Getting names:
    name = document.myform_name.first_name.value
    name += " " + document.myform_name.last_name.value;

    // Getting grade:
    e = document.getElementById("grades");
    value = e.options[e.selectedIndex].value;
    text = e.options[e.selectedIndex].text;

    // Getting subject:
    if (document.myform_subjects.English.checked == true) {
        choices += "* " + document.myform_subjects.English.value + "\n";
    }
    if (document.myform_subjects.Physics.checked == true) {
        choices += "* " + document.myform_subjects.Physics.value + "\n";
    }
    if (document.myform_subjects.Math.checked == true) {
        choices += "* " + document.myform_subjects.Math.value + "\n";
    }
    if (document.myform_subjects.History.checked == true) {
        choices += "* " + document.myform_subjects.History.value + "\n";
    }
    if (document.myform_subjects.PE.checked == true) {
        choices += "* " + document.myform_subjects.PE.value + "\n";
    }
    if (document.myform_subjects.Geography.checked == true) {
        choices += "* " + document.myform_subjects.Geography.value + "\n";
    }
    if (document.myform_subjects.Art.checked == true) {
        choices += "* " + document.myform_subjects.Art.value + "\n";
    }

    if (document.myform_subjects.Chemistry.checked == true) {
        choices += "* " + document.myform_subjects.Chemistry.value + "\n";
    }

    final_text += "Student's name: " + name;
    final_text += "\n" + "Grade: " + text;
    final_text += "\n" + "Subjects selected:" + "\n" + choices;
    document.area.myarea.value = final_text;
}


