$(document).ready(function() {

    $('#nav-btn').on('click', function(){
        $('#top').toggleClass('active-in');
    });

    $('#body-nav-btn').on('click', function(){
        $('#body-navigation').toggleClass('active-in');
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
});