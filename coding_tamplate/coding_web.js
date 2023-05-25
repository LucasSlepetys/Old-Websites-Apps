$(document).ready(function(){

    $(document).ready(function(){
        $('.click').hover(
        function(){ $('.click').stop().animate({'opacity': '0'}, 'slow');},
        function(){ $('.click').stop().animate({'opacity': '1'}, 'slow');}
        );
     });

    $(window).scroll(function(){
        var sticky = $('#header-wrapper'),
            scroll = $(window).scrollTop();
      
        if (scroll >= 100) {
            sticky.addClass('fixed')
            $('#remove_links').show()
            // alert("hi");
        }
        else {
            sticky.removeClass('fixed');
            $('#remove_links').hide()
            $('#header-wrapper').show()
        }
      });

    $('#remove_links').click(function(){

        $('#header-wrapper').hide();

    })

    $('#scroll').click(function(){
         
        Swal.fire({
            title: 'Thank you for viting us!',
            text: "Would you like to take a tour at our website?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes!'
        }).then((result) => {
            if (result.isConfirmed) {
                let timerInterval
                Swal.fire({
                    title: 'Alright!',
                    html: 'Take a look at our website!',
                    timer: 2000,
                    timerProgressBar: true 
                })
                $('html, body').delay(2000).animate({ scrollTop: $(document).height() - $(window).height() }, 10000, function() {
                    $(this).animate({ scrollTop: 0 }, 1000);
                });
            }
        })

    })

    $('#move, #move2').click(function(){
        Swal.fire('Please, before going to our exercises, fill out this form to let us know more about!')
        $('html, body').animate({
            scrollTop: $('#featured').offset().top
        }, 2000)
    })

	$('#showing_form').click(function(){

        $('.main-content-area-form').fadeIn(3000);
        $(this).fadeOut('normal');
        $('html, body').animate({
            scrollTop: $('.main-content-area-form').offset().top
        }, 2000)
        $('#header-wrapper').hide()        
    });

    $('#hiding_form').click(function(){

        $('.main-content-area-form').fadeOut(1000);
        $('#showing_form').fadeIn(3000);
        $('html, body').animate({
            scrollTop: $('#featured').offset().top
        }, 2000)

    })

    $(window).resize(function() {

        if ($(this).width() < 1024) {
      
            $('.main-content-area-form').hide();
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Your screen size is too small to render the form!',
                footer: "<a>Why can't I see the form?</a>"
          })
      
        } else {
      
          pass
      
          }
      
      });

});


