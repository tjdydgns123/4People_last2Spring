<!DOCTYPE html>
<html>
  <head>
    <title>Bootstrap 101 Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <script src="</script'>http://code.jquery.com/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        body{
            background-color: #fff;  
        }
    </style>
    <script>
        $(document).ready(function() {
            $('#example .dropdown-menu li > a').bind('click', function (e) {
                var html = $(this).html();
                alert(html);
                $('#example button.dropdown-toggle').html(html + ' <span class="caret"></span>');
            });
        });
    </script>
  </head>
 <body>
     <div class="txc-textbox">
        <!-- Single button -->
        <div id="example" class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Action <span class="caret"></span>
            </button>
            <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="#">Separated link</a></li>
            </ul>
        </div>
    </div>

      
  </body>
</html>


