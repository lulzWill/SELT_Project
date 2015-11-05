$(document).ready(function(){
    $('#optionalfields').hide();
        
    $('#signup_form').on('submit', function(e){
        e.preventDefault();
        
        var flag = 0;
        var pass = $('#signup_pass').val();
        var pass_conf = $('#signup_pass_conf').val();
        if (pass != pass_conf) {
            document.getElementById("errors").innerHTML = "ERROR: Passwords do not match </br>"
            flag = 1;
        }
        if($('#user_role').val() == "Teacher" && $('#signup_validate').val() != "teach me please") {
            document.getElementById("errors").innerHTML = "ERROR: Incorrect Validation Code </br>"
            flag = 1;
        }
        if($('#user_role').val() == "Admin" && $('#signup_validate').val() != "pimpin aint easy") {
            document.getElementById("errors").innerHTML = "ERROR: Incorrect Validation Code </br>"
            flag = 1;
        }

        var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        if(!re.test($('#signup_email').val())) {
            document.getElementById("errors").innerHTML = "ERROR: Invalid Email Address </br>"
            flag = 1;
        }

        if(flag == 0) {
            this.submit();
        }
    });
    
    $('#user_role').on('change', function(){
        if($('#user_role').val() == "Teacher" || $('#user_role').val() == "Admin") {
            $('#optionalfields').show();
        } else {
            $('#optionalfields').hide();
        }
    });
});