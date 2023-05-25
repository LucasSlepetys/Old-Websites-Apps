window.onload = function () {
  $("#send_email").click(function () {
    swal({
      title: "Error!",
      text:
        "Unfortunately, our email servers are offline... Please try again later!",
      icon: "warning",
      buttons: true,
      dangerMode: true,
    }).then((willDelete) => {
      if (willDelete) {
        swal("Thank you for using our services!", {
          icon: "success",
        });
        $("#send_email").hide();
      } else {
        swal("Thank you for using our services!");
      }
    });
  });
};
