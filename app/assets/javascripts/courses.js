/**jQuery(".pointer").hover(
    function(){
        var thisdiv = jQuery(this).attr("data-target");
        jQuery(thisdiv).collapse("show");
    }
);
jQuery(".pointer").mouseout(
    function(){
        var thisdiv = jQuery(this).attr("data-target");
        jQuery(thisdiv).collapse("hide");
    }
);**/
/**
$(function() {
    $('#accordion').on('mouseenter.collapse.data-api', '[data-toggle=collapse]', function(e) {
        var $this = $(this),
            href, target = $this.attr('data-target') || e.preventDefault() || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '') //strip for ie7
            ,
            option = $(target).data('collapse') ? 'show' : $this.data()
            $(target).collapse(option)
    })
})**/
/**
$('.pointer').mouseover(function(){
    $(this).click();
});

$('.pointer').mouseout(function(){
    $(this).click();
});
**/