$(window).on("load", function () {
  swal({
    title: "Note:",
    text: "This website is not responsive to different screen sizes",
    icon: "warning",
    buttons: true,
    dangerMode: true,
  }).then((willDelete) => {
    if (willDelete) {
      swal("Some errors may occur", {
        icon: "warning",
      });
    } else {
      swal("Some errors may occur");
    }
  });
  $(".nested").each(function () {
    let $window = $(window),
      $body = $("body");
    let $nested = $(this),
      $nestedPlaceholder = $nested.parent();
    let verticalScrollRange, upperMargin, lowerMargin;
    $window.resize(function () {
      $nested.removeClass("sticky").css({ left: 0 });
      let placeholderHeight = $nestedPlaceholder.css({ height: "" }).height();
      verticalScrollRange = placeholderHeight - $window.height();
      upperMargin = $nestedPlaceholder.offset().top;
      lowerMargin = upperMargin + verticalScrollRange;
      $nestedPlaceholder.height(placeholderHeight);
    });
    $window.scroll(function () {
      let scrollTop = $window.scrollTop();
      if (scrollTop > upperMargin && scrollTop < lowerMargin) {
        $nested.addClass("sticky");
        let horizontalScrollRange = $nested.width() - $body.width();
        let verticalScrollPosition = scrollTop - upperMargin;
        let horizontalScrollPosition =
          (verticalScrollPosition / verticalScrollRange) *
          horizontalScrollRange;
        $nested.css({ left: -horizontalScrollPosition });
      } else {
        $nested.removeClass("sticky");
      }
    });
    $window.resize();
  });

  let $clicked_1 = $("#one");
  let $scroll_1 = $("#entry-three-so-what");

  let $clicked_2 = $("#two");
  let $scroll_2 = $("#entry-three-so-what");

  let $clicked_3 = $("#three");
  let $scroll_3 = $("#entry-three-so-what");

  $("#one").click(function () {
    $([document.documentElement, document.body]).animate(
      {
        scrollTop: $("#entry-one").offset().top,
      },
      2000
    );
  });

  $("#two").click(function () {
    $([document.documentElement, document.body]).animate(
      {
        scrollTop: $("#goTwo").offset().top,
      },
      2000
    );
  });

  $("#three").click(function () {
    $([document.documentElement, document.body]).animate(
      {
        scrollTop: $("#goThree").offset().top,
      },
      2000
    );
  });

  $(window).scroll(function () {
    $(".fadein").each(function (i) {
      var bottom_of_element = $(this).offset().top + $(this).outerHeight();
      var bottom_of_window = $(window).scrollTop() + $(window).height();

      if (bottom_of_window > bottom_of_element) {
        $(this).animate({ opacity: "1" }, 1000);
      }
    });
  });
});

let scrollPercentage = () => {
  let scrollProgress = document.getElementById("progress");
  let progressValue = document.getElementById("progress-value");
  let pos = document.documentElement.scrollTop;
  let calcHeight =
    document.documentElement.scrollHeight -
    document.documentElement.clientHeight;
  let scrollValue = Math.round((pos * 100) / calcHeight);

  console.log(scrollValue);
  scrollProgress.style.background =
  `conic-gradient(#008fff ${scrollValue}%, #c0c0ff ${scrollValue}%)`;
  progressValue.textContent = `${scrollValue}%`;
};



window.onscroll = scrollPercentage;
window.onload = scrollPercentage;
