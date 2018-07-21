$(function(){
    $('.carousel.carousel-slider').carousel({
        indicators: true,
        noWrap: true
    });
});

function LastSlide(){
    $('.carousel.carousel-slider').carousel('prev')
}
function NextSlide(){
    $('.carousel.carousel-slider').carousel('next')
}