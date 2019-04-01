<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="page-header" style="background-color:#FFF; margin-top:20px; height:60px; border-bottom: 1px solid #BDBDBD;'">
<div class='es_font'>
<h2>프로젝트 대화방 목록</h2>
<div class="text-right" style='color:#D9418C; font-size:13px;'>
</div>
</div>
</div>
<div class="container" style='width:100%; height:85%; border-right: 1px solid #BDBDBD; border-left: 1px solid #BDBDBD;  overflow-y: scroll; '>
	<div style='border-bottom: 1px solid #BDBDBD; margin-bottom:5px;'>
	<div class='row' style='margin-bottom:8px;'>
		<div class='col-sm-3'>
		<img src="../images/teamwork.png" class="rounded" alt="Cinque Terre">
		</div>
		<div class='col-sm-9'>
		<div class='col-sm-8'>
		<span style='font-weight:bold; font-size:15px;'>파워레인저 프로젝트</span>
		</div>
		<div class='col-sm-4 text-right'>
		<span style='color:#8C8C8C;'>2분전</span>
		</div>
		<div class='col-sm-12' style='margin-top:5px;'>
			<span style='color:#5D5D5D; word-wrap:break-word;'>What?! No way, how did I miss that. I never forgot that part before.</span>
		</div>
		</div>
	</div>	
	</div>
</div>
<div class='footer'>
    	<button class='btn btn-primary' style='width:49.5%;' onclick='changePrivate()'>개인대화</button>
    	<button class='btn btn-primary' style='width:49.5%;' onclick='changeTeam()'>프로젝트대화</button>
	</div>