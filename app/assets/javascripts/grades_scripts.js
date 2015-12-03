$(document).ready(function(){
    $("#show_form").hide();
    $("#show_grades").hide();
    $("#show_stats").hide();
    
    $("#show_form").click(function() {
      $('#form_contents').show();
      $('#hide_form').show();
      $('#show_form').hide();
    });
    
    $("#hide_form").click(function() {
      $('#form_contents').hide();
      $('#hide_form').hide();
      $('#show_form').show();
    });
    
    $("#show_grades").click(function() {
      $('#grade_contents').show();
      $('#hide_grades').show();
      $('#show_grades').hide();
    });
    
    $("#hide_grades").click(function() {
      $('#grade_contents').hide();
      $('#hide_grades').hide();
      $('#show_grades').show();
    });
    
    $("#show_stats").click(function() {
      $('#stats_contents').show();
      $('#hide_stats').show();
      $('#show_stats').hide();
    });
    
    $("#hide_stats").click(function() {
      $('#stats_contents').hide();
      $('#hide_stats').hide();
      $('#show_stats').show();
    });
});