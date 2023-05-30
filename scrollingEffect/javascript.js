
var width = $(window).width();
var widthElement = $('.sun').width();
var position = $('.sun').position();

console.log(width);

$(window).on('load', function () {
    console.log((width / 2) + 1);
    console.log($('.sun').width());
    // var pos = position.left();
    var move = 580.5 + 150;
    $('.sun').css('transform', 'translateX(' + 1400 + 'px)');

    $('.sun').click(function() {
        console.log(position.left);

        // $("html, body").animate({ scrollTop: document.body.scrollHeight }, 10000);    })

});
});


$(window).on('scroll', function () {
    var top = $(window).scrollTop() / 5;



    $('.sun').css('transform', 'rotate(' + top + 'deg)');
});

