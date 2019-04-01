
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />


  <title>
    Debug Json Feed - Demos | FullCalendar
  </title>


<link href='/assets/demo-topbar.css' rel='stylesheet' />


  <style>

    html, body {
      margin: 0;
      padding: 0;
      font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
      font-size: 14px;
    }

    #calendar {
      max-width: 900px;
      margin: 40px auto;
    }

  </style>


<link href='/releases/core/4.0.1/main.min.css' rel='stylesheet' />


  

  <link href='/releases/daygrid/4.0.1/main.min.css' rel='stylesheet' />

  <link href='/releases/timegrid/4.0.1/main.min.css' rel='stylesheet' />


<script src='/assets/demo-to-codepen.js'></script>

<script src='/releases/core/4.0.1/main.min.js'></script>




  <script src='/releases/interaction/4.0.1/main.min.js'></script>

  <script src='/releases/daygrid/4.0.1/main.min.js'></script>

  <script src='/releases/timegrid/4.0.1/main.min.js'></script>



  <script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      timeZone: 'UTC',
      defaultView: 'dayGridMonth',
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      editable: true,

      // JSON FEED INSTRUCTIONS
      //
      // 1. Open a new browser tab. Go to codepen.io
      //
      // 2. Create a new pen (Create > New Pen)
      //
      // 3. Paste your JSON into the JS pane
      //
      // 4. Hit the "Save" button
      //
      // 5. The page's URL will change. It will look like this:
      //    https://codepen.io/anon/pen/eWPBOx
      //
      // 6. Append ".js" to it. Will become like this:
      //    https://codepen.io/anon/pen/eWPBOx.js
      //
      // 7. Paste this URL below.
      //
      events: 'https://fullcalendar.io/demo-events.json'

      // 8. Then, enter a date for defaultDate that best displays your events.
      //
      // defaultDate: 'XXXX-XX-XX'
    });

    calendar.render();
  });

</script>

</head>
<body>
  <div class='demo-topbar'>
  <button data-codepen class='codepen-button'>Edit in CodePen</button>

  

  
    json events with standard calendar
  
</div>

  <div id='calendar'></div>
</body>

</html>
