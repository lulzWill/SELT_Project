var assignId
var assignName
var assignPoints
$(document).ready(function()
{
    $('.editAssign').click(function()
    {
        assignId = $(this).get(0).id;
        assignName = $('.'+ assignId).children(0).get(0).textContent;
        assignPoints = $('.'+ assignId).children(0).get(1).textContent;
        $('#updateName').val(assignName);
        $('#updatePoints').val(parseInt(assignPoints));
        
    });
    $('#saveButton').click(function()
    {
        assignName = $('#updateName').val();
        assignPoints = $('#updatePoints').val();
        
        $.ajax({
            url: '/updateAssignment',
            data: {assignmentID: assignId ,name: assignName, points: assignPoints},
            type: 'post',
            success: function(data) 
            {
                $('.'+ assignId).children(0).get(0).textContent = assignName;
                $('.'+ assignId).children(0).get(1).textContent = assignPoints;
            //alert("Successful");
            },
            failure: function() 
            {
            //alert("Unsuccessful");
            }
        });
    });
});