function greeting(){
    var name = prompt("Enter your name: ");
    var grade = prompt("Enter your grade: ");
    alert("Good morning " + name + "! You are in " + grade + " grade!");
}

function even(){
    for(var x = 0; x <= 10; x += 1){
        if(x%2 == 0){
            console.log(x + " ");
        }
    }
}

function calling() {
    var call = document.myform.myText.value;
    alert(call);
}
