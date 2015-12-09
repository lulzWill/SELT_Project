
$(document).ready(function() {
  var todayDate = new Date();
  todayDate.setHours(0,0,0,0);

  $('#calendar').fullCalendar({
    events: 'assignments.json',
    allDayDefault: true,
    
  });
});

