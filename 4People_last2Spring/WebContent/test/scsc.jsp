<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!--1. clipboard.js 파일 cdn을 통해서 로드-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/1.7.1/clipboard.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
    <!--2. 스크림트 파일 작성-->
       <script>

        // 3. 웹 문서가 로드되면 클립보드 객체 생성
        $(document).ready(function(){
		   
            var clipboard = new Clipboard('.btn');
            clipboard.on('success', function(e) {
                console.log("Success");

                /*
                아래 함수를 통해서 블록지정을 없앨 수 있습니다.
                */
                var selection = window.getSelection();
                selection.removeAllRanges();
            });
            clipboard.on('error', function(e) {
                console.log("Fail");
            });

            // 아래와 같이 button 태그만 가져오는 방법도 가능하다.
            /*
            var btns = document.querySelectorAll('button');
            var clipboard = new Clipboard(btns);
            */


        });


    </script>
</head>
<body>
<div id="example" style="width: 500px;">
        안녕하세요 이미지 캡쳐 예제입니다.<br />
        안녕하세요 이미지 캡쳐 예제입니다.<br />
        안녕하세요 이미지 캡쳐 예제입니다.<br />
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4nsgRjLZntKqK6j0kKjHsYJtQQGsLo27TeDJhy3p85qp9m9WB">
        <!-- 구글 상업정 수정 이미지 검색 활용 -->
        <!-- 외부 링크는 Access-Control-Allow-Origin 가 해당 서버에서 허용이 되지 않으면 캡쳐 대상제외 -->
    </div>
   
    <input id="foo" value="This is Value">
    <button class="btn" data-clipboard-target="#gh"  id="gngnl" onClick="sample2()">d</button>
    <input id="clip_target" type="text" value="" style="position:absolute;top:-9999em;"/>
 <button onclick='sample2();'>캡처</button>
 <div id="sample">
</div>
    <script type="text/javascript">

    function sample2() {


    	 html2canvas(document.getElementById('example'), {
             onrendered: function (canvas) {
                 
//             	 var img = document.createElement('img');
//             	 img.src = canvas.toDataURL();
//             	 var div = document.createElement('div');
//             	 new Clipboard('img');
//             	 div.contentEditable = true;
//             	 div.appendChild(img);
//             	 document.body.appendChild(div);
//             	 // do copy
            	 
            	 
            	 
            	 
//             	  var range = document.createRange();
//             range.selectNode(div);
//            window.getSelection().addRange(range);
//             	 SelectText(div);
//             	 document.execCommand('Copy');
// 			         alert(SelectText(div));
//             	 document.body.removeChild(div);


         var thumbnailImage = new Image();

          thumbnailImage.onload = function() {
            var thumbnailCanvas = canvas;
          var ctx = thumbnailCanvas.getContext("2d");

           ctx.drawImage(thumbnailImage, 0, 0);



                
             }
          thumbnailImage.src = canvas.toDataURL();
      	 SelectText(thumbnailImage);
	        document.execCommand('Copy');
    	 }
         });
		        html2canvas(document.getElementById('example'), {
            useCORS: true, // 다른사이트의리소스가있을때활성화(그러나...Access-Control-Allow-Origin 필요)
            onrendered: function(canvas) {
            	 $('#sample').append(canvas);
            	 alert(canvas);

				
            	 
                canvas.toBlob(function(blob) {
                	var newImg = document.createElement('img'),
                    url = URL.createObjectURL(blob);
//             	  var clipboard = new Clipboard(newImg);
                 
//                     saveAs(blob, 'download.png');
                });
                
                // $("#test").html('<img src=' + canvas.toDataURL("image/png") + '>');
            }
        });
		         function SelectText(element) {
			         alert("탓나용");
		        	    var doc = document;
		        	    if (doc.body.createTextRange) {
			         alert("탓나용2");
		        	        var range = document.body.createTextRange();
		        	        range.moveToElementText(element);
		        	        range.select();
		        	    } else if (window.getSelection) {
		        	        var selection = window.getSelection();
		        	        var range = document.createRange();
		        	        range.selectNodeContents(element);
		        	        selection.removeAllRanges();
		        	        window.getSelection().addRange(range);
		        	    }
		        	}
//         gh.createTextRange().execCommand("Copy");
//         var btn =document.getElementById("btn");
//         var clipboard = new Clipboard(btn);
//         clipboard.on('success',function(e){
// alert(e);
//             });
//         clipboard.on('error',function(e){
// alert(e);
//             });
//     	 var text = $(this).html();
//         $('#clip_target').val(text);
//         $('#clip_target').select();
     // Use try & catch for unsupported browser 
//      try { // The important part (copy selected text)
//           var successful = document.execCommand('copy'); 
//           // if(successful) answer.innerHTML = 'Copied!'; 
//           alert('dd');
//           // else answer.innerHTML = 'Unable to copy!'; 
//           } catch (err) { alert('이 브라우저는 지원하지 않습니다.') }

//         var obj = document.getElementById("gh");
//         obj.contentEditable = 'true'; 
//         obj.select();
//         var controlRange;
// //         if (document.body.createControlRange) {
// //         controlRange =  document.body.createControlRange();
// //              controlRange.addElement(obj);
//              obj.execCommand("copy");
// //         }
//         obj.contentEditable = 'false'; 

 
                
    }
    </script>
</body>
</html>