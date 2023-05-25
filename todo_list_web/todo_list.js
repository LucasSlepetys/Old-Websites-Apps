window.onload = function () {
  function alerting() {
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to go back to this step!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, move to next step!",
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire("success!");
        return true;
      } else {
        return false;
      }
    });
  }

  var today = new Date();
  var date =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
  $(".date").attr("placeholder", date);

  var today = new Date();
  var time =
    today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
  $(".time").attr("placeholder", time);

  //! Change color of steps depending on step it is:

  var steps = 0;

  function makeTable(container, data) {
    var table = $("<table/>").addClass("CSSTableGenerator");
    $.each(data, function (rowIndex, r) {
      var row = $("<tr/>");
      $.each(r, function (colIndex, c) {
        row.append($("<t" + (rowIndex == 0 ? "h" : "d") + "/>").text(c));
      });
      table.append(row);
    });
    return container.append(table);
  }

  function changing() {
    if (steps == 0) {
      $(".step0").addClass("highlight");
    } else if (steps == 1) {
      $(".new-item").hide();
      $(".list-items").remove();
      var cityTable = makeTable($(document.body), data);
      $("#button-hiding").show();
      $(".question").show();
      $(".step1").addClass("highlight");
    } else if (steps == 2) {
      $(".CSSTableGenerator").remove();
      $(".step2").addClass("highlight");
      $("#button-hiding").remove();
      $(".question").remove();
      $(".formating").show();
    } else if (steps == 3) {
      $(".CSSTableGenerator").remove();
      $(".step3").addClass("highlight");
      $(".formating").remove();
      $(".send-email").show();
    }
  }

  //* function that triggers "changing" -->
  $(".step0").click(function () {
    alert(
      'This is a button for debugging, which automatically transfers you to the next page, to test if everything is working. If you accidentally clicked on that button, please press "cmd" + "R" to re-load the page.'
    );
    steps += 1;
    changing();
  });

  changing();

  //*   triggers function when button is clicked

  $("#button-send").click(function () {
    if (check_input_1() == true) {
      additem(list);
      list += 1;
    } else {
      swal({
        title: "Error!",
        text: "Please fill out all the required input fields!",
        icon: "warning",
        dangerMode: true,
      });
    }
  });

  var item = [];
  var date = [];
  var topic = [];
  var priority = [];
  var time = [];
  var color = [];
  var text = [];

  var data = [
    ["Item:", "Text:", "Topic:", "Date:", "Time:", "Priority:"], //headers
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ];
  var list = 1;
  function additem(getlist) {
    var list = getlist;
    var x = 0;
    includes = item.includes($(".text-input").val());
    if (includes == false) {
      $(".list-items").remove();
      if ($(".text-input").val() != "") {
        $("#button-hide").show();
        item.push($(".text-input").val());
        date.push($(".date").val());
        topic.push($(".select").val());
        priority.push($(".select2").val());
        time.push($(".time").val());
        color.push($(".color").val());
        text.push($(".areatext").val());
        data[list].push($(".text-input").val());
        data[list].push($(".areatext").val());
        data[list].push($(".select").val());
        data[list].push($(".date").val());
        data[list].push($(".time").val());
        data[list].push($(".select2").val());

        $(
          ".text-input, .date, .select, .select2, .time, .color, .areatext"
        ).val("");
      }
    }
    if (includes != true) {
      while (x < item.length) {
        var obj = $("<p />").text(
          " Task: " +
            item[x] +
            " / Reminder: " +
            text[x] +
            " / Topic: " +
            topic[x] +
            " / Due at: " +
            date[x] +
            " / Time: " +
            time[x] +
            " / Priority(1 - 4): " +
            priority[x]
        );
        obj.addClass("list-items");

        $(obj).css("color", color[x]);

        $("body").append(obj);
        x += 1;
      }
    }
    if (includes == true) {
      Swal.fire({
        icon: "error",
        title: "Oops...",
        text: "You already have this task!",
      });
    }
  }

  $("#button-hide, #button-hiding").click(function () {
    $(".todo_container").hide();
    $(".show-button").show();
  });

  $(".next-step").click(function () {
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to go back to this step!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, move to next step!",
    }).then((result) => {
      if (result.isConfirmed) {
        Swal.fire("success!");
        steps += 1;
        changing();
      }
    });
  });

  $(".show-button").click(function () {
    $(".todo_container").show();
    $(".show-button").hide();
  });

  //! submit button for questions:

  $("#button_question").click(function () {
    if (check_input_2() == true) {
      $(".CSSTableGenerator").remove();
      var first_name = $(".first_name").val();
      var last_name = $(".second_name").val();
      var email = $(".email").val();

      var radio = $("input[name='radio']:checked").val();
      formating(first_name, last_name, email);
    } else {
      swal({
        title: "Error!",
        text: "Please fill out all the required input fields!",
        icon: "warning",
        dangerMode: true,
      });
    }
  });

  function formating(first_name, last_name, _email) {
    steps += 1;
    $(".step2").addClass("highlight");
    $("#button-hiding").remove();
    $(".question").remove();
    $(".formating").show();
    email = _email;
    $("#paragraph_1").text("Hello " + first_name + " " + last_name + "!");
    $("#email_1").text(email);
  }

  $(".emailing").keypress(function (e) {
    if (e.which == 13) {
      email = $(".emailing").val();
      $("#email_1").text(email);
    }
  });

  $("#next_step").click(function () {
    steps += 1;
    changing();
  });

  $("#sending").click(function () {
    send_email();
  });
};

window.setInterval(function () {
  var today = new Date();
  var time =
    today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
  $(".time").attr("placeholder", time);
}, 1000);

function send_email() {
  swal({
    title: "Error!",
    text:
      "Unfortunately, our email servers are offline... Please try again later!" +
      " Would you like to see how the email would look like?",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  }).then((willDelete) => {
    if (willDelete) {
      swal('Okay showing "email"!', {
        icon: "success",
      });
      $("#sending").hide();
      $(".showing-email").show();
    } else {
      swal("Alright! Try again later!");
    }
  });
}

function check_input_1() {
  var value = $(".input1").filter(function () {
    return this.value === "";
  });
  if (value.length == 0) {
    return true;
  } else if (value.length > 0) {
    return false;
  }
}

function check_input_2() {
  var value = $(".input2").filter(function () {
    return this.value === "";
  });
  if (value.length == 0) {
    return true;
  } else if (value.length > 0) {
    return false;
  }
}
