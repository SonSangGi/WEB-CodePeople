$(function() {
    
    
$(".paid-default-menu > ul > li > a").click(function() {
    $(this).parent().siblings().css('background-color', '');
    $(this).parent().css('background-color', '#ff7373');
    $(this).parent().siblings().children().css('color', 'black');
    $(this).css('color', 'white');
});
    
    
})