$(document).ready(function() {

    $('#nav-btn').on('click', function(){
        $('#top').toggleClass('active-in');
    });

    if($('#btn-offcanvas').length) {
        var stickyNavTop = $('#btn-offcanvas').offset().top;
        var stickyNav = function () {
            var scrollTop = $(window).scrollTop();

            if (scrollTop > stickyNavTop) {
                $('#btn-offcanvas').addClass('sticky');
            } else {
                $('#btn-offcanvas').removeClass('sticky');
            }
        };

        stickyNav();

        $(window).scroll(function () {
            stickyNav();
        });
    };
   	$('[name="search"]').keypress(function(e){
   			    if(e.keyCode === 13){
           $('.btn-search').trigger('click');
        }
   	});
   	$('.filterpro-module').parent().addClass('col-sm-4').addClass('col-md-3').removeClass('col-sm-3');
    $('#btn-offcanvas, #close-offcanvas').on('click', function(){
        $('html').toggleClass('overflow-hidden');
        $('#content').toggleClass('canvas-right');
        $('#offcanvas').toggleClass('active');
    });

    $('#btn-offcanvas').click(function() {
        $('#column-left').css('left', 0);
    });

    $('#close-offcanvas').click(function() {
        $('#column-left').css('left', '-100%')
    });

    $('.ocfilter-option .option-values').each(function(i){
        if( $(this).outerHeight() < 300 ) {
            $(this).css('overflow', 'hidden');
        }
    });

    // new scripts

    $('#body-nav-btn').on('click', function(){
        $('#menu').toggleClass('red');
        $('body').toggleClass('fixed');
    });

    var navigation = 64, // this number need for sticky nav. $('#body-navigation').offset().top = 64px
        bodyNav = $('#body-navigation'),
        card = $('#cart'),
        search = $('#search');

    $(window).scroll(function() {
        var scrollTop = $(this).scrollTop();


        if(scrollTop > navigation) {
            bodyNav.addClass('fixedNav');
            card.addClass('fixedCart');
            search.addClass('fixedSearch');
        } else {
            bodyNav.removeClass('fixedNav');
            card.removeClass('fixedCart');
            search.removeClass('fixedSearch');
        }
    });
});