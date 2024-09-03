<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<script src="https://kit.fontawesome.com/cbb1359000.js" crossorigin="anonymous"></script>
<style>
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#sideBar{
	border-radius : 30px;
	width:100%;
	height:100%;
	background-color : #e1f1fa;
}
#sideBar>ul{
	display: flex;
    flex-direction: column;
    align-items: center;
    height: 100%;
    padding : 30px 10px;
}
#sideBar a{
	font-family: 'GangwonEdu_OTFBoldA';
}
#sideBar>ul>li:nth-child(1){
	height:40%;
}
#sideBar>ul>li:nth-child(2){
	height:30%;
}
#sideBar>ul>li:nth-child(3){
	height:30%;
}
#sideBar ul li a:hover{
	color : gray;
}
</style>
</head>
<body>
<sec:authentication property="principal" var="user" />
<div id="sideBar">
	<ul>
		<li><i class="fa-solid fa-envelope"></i>
			<ul>
				<li>-------------------</li>
				<li><a href="/viewAllNote?userCode=${user.userCode}">전체 쪽지함</a></li>
				<li><a href="/viewReceiverNote?userCode=${user.userCode}">받은 쪽지함</a></li>
				<li><a href="/viewSenderNote?userCode=${user.userCode}">보낸 쪽지함</a></li>
			</ul>
		</li>
		<li><i class="fa-solid fa-comments"></i>
			<ul>
				<li>-------------------</li>
				<li><a href="/">채팅방</a></li>
			</ul>
		</li>
		<li><i class="fa-solid fa-bell"></i>
			<ul>
				<li>-------------------</li>
				<li><a href="">알림</a></li>
			</ul>
		</li>
	</ul>
</div>
</body>
</html>