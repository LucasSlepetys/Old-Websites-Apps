function array() {
    var list = [];
    var x = 0;
    var value;
    var even = [];
    var odd = [];

    while(x < 50) {
        value = Math.floor(Math.random() * 99 + 1);
        list.push(value);
        x += 1;
    }
    x = 0;
    while(x < 50) {
        if(list[x] % 2 == 0) {
            even.push(list[x]);
        }
        else {
            odd.push(list[x]);
        }
        x += 1;
    }
    document.form.area.value = "List: " + list + "\n" + "\n" + "Quantity of even numbers: " + even.length + "\n" + "Quantity of odd numbers: " + odd.length;
}
