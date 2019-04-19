<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://github.com/niklasvh/html2canvas/releases/download/0.4.1/html2canvas.js"></script>
</head>
<body>    
    <script type="text/javascript">
        function copy() {
            var c = document.getElementsByClassName('myclass')[0];
            html2canvas(c, {
                onrendered: function (canvas) {
                    theCanvas = canvas;
                    var image = new Image();
                    image.id = "pic"
                    image.src = theCanvas.toDataURL();
                    image.height = c.clientHeight
                    image.width = c.clientWidth
                    window.open(image.src, 'Chart')
                }
            })
        }
    </script>
    <button onclick='copy()'>Copy</button>
    <div class="myclass">
        <div class="personal_info_form_group">
            <label>First Name*</label>
            <input type="text" class="form-control" name="first_name" id="first_name" value="" placeholder="first name"/>
        </div>
        <div class="personal_info_form_group">
            <label>Last Name*</label>
            <input type="text" class="form-control" name="last_name" id="last_name" value="" placeholder="first name"/>
        </div>
        Hi There!!!!!!!!
        <div>
            <div>
                some text here
                <svg>
                <g>asndalsnd</g>
                <g>sadmlkasd</g>
                </svg>
                <svg>
                <g>sadnkasndkj</g>
                <g>asdnasndjsd</g>
                </svg>
                <div>
                    some text here
                </div>
            </div>
        </div>
    </div>
</body>
</html>