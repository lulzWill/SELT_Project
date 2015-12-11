$(document).ready(function(){
    $("#search").keyup(function() {
        $("#classes tbody tr").hide();
        $("#classes tbody tr:contains("+ $("#search").val() +")").show();
    });
});