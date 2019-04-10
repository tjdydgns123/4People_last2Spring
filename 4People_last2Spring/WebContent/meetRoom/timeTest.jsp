<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../common/common.jsp" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap TimePicker</title>
<!-- 한글화 및 한국식 날짜표기를 적용한 datepicker 구성요소-->
 
<link rel="stylesheet" type="text/css" href="./datepickercss/daterangepicker.css">
<script type="text/javascript" src="./datepickercss/moment.js"></script>
<script type="text/javascript" src="./datepickercss/daterangepicker.js"></script>
<style type="text/css">
.date-range {
    padding: 6px 12px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1;
    color: #555;
    text-align: center;
    background-color: #eee;
    border: 1px solid #ccc;
    border-radius: 4px;
    border-left: 0;
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
    cursor: pointer;
    width: auto;
    white-space: nowrap;
    vertical-align: middle;
    display: table-cell;
}
</style>
</head>
<body>
   <div class="container">
    <div id="reportrange" class="pull-right"
        style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
        <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>  <span></span>
        <b class="caret"></b>
    </div>
</div>
    <script>
//         $('#timepicker').timepicker({
//             uiLibrary: 'bootstrap'
//         });
     // 선언한 TextBox에 DateTimePicker 위젯을 적용한다.
    $(function() {
        // 시작 날짜와 끝나는 날짜를 지정한다. 여기에서는 30일로 설정하엿다
        var start_date = moment().subtract(29, 'days');
        var end_date = moment();
        function cb(start, end) {
            $('#reportrange span').html(start.format('YYYY-MM-DD') + ' - ' + end.format('YYYY-MM-DD'));
        }
        cb(start_date, end_date);
        $('#reportrange').daterangepicker({
            ranges : {
                '오늘' : [ moment(), moment() ],
                '어제' : [ moment().subtract(1, 'days'), moment().subtract(1, 'days') ],
                '지난 7일' : [ moment().subtract(6, 'days'), moment() ],
                '지난 30일' : [ moment().subtract(29, 'days'), moment() ],
                '이번 달' : [ moment().startOf('month'), moment().endOf('month') ],
                '지난 달' : [ moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month') ]
            },
            'startDate' :  start_date,
        }, cb);
    });
    </script>
</body>
</html>