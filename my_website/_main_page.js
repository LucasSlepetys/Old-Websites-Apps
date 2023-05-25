$(document).ready(function(){
    
    $(document).ready(function(){
        var header = $('header');
        var backgrounds = [
            'img_1', 
            'img_2',
            'img_3',
            'img_4',
            'img_5',];

        var timer_function = 0

        function nextBackground() {
            if(timer_function == 0) {
                header.removeClass(backgrounds[0]);
                header.addClass(backgrounds[1]);
                timer_function += 1;
            }

            else if (timer_function == 1) {
                header.removeClass(backgrounds[1]);
                header.addClass(backgrounds[2]);
                timer_function += 1;
            }

            else if (timer_function == 2) {
                header.removeClass(backgrounds[2]);
                header.addClass(backgrounds[3]);
                timer_function += 1;
            }

            else if (timer_function == 3) {
                header.removeClass(backgrounds[3]);
                header.addClass(backgrounds[4]);
                timer_function += 1;
            }


            else if (timer_function == 4) {
                header.removeClass(backgrounds[4]);
                header.addClass(backgrounds[0]);
                timer_function = 0;
            }
        }
        
        
        // window.setInterval(function(){
        //     nextBackground()
        //   }, 5000);
      
    });

    function fading(){
        $('.fade').hide();
    }

    $('.linking').mouseover(function(){
        $('.linking').removeClass('bouncy')
        $('.linking').addClass('not_bouncy')
    })

    $('.linking').mouseout(function(){
        $('.linking').removeClass('not_bouncy')
        $('.linking').addClass('bouncy')
    })

    $(document).ready(function(){
        $('#main_page').click(function(){
            fading();
            $('#main_page_h1').show();
            $('#main_page_a').show();
        })

        $('#about_us').click(function(){
            fading();
            $('#about_h1').show();
            $('#about_a').show();
            $('#about_paragraph').show();
        })

    })

})
