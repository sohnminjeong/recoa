<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/reset.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://kit.fontawesome.com/cbb1359000.js" crossorigin="anonymous"></script>
<style>
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'SDMiSaeng';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SDMiSaeng.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#header{
	position:absolute;
	z-index:1;
	width:100%;
	border-bottom:1px solid black;
}
#content{
	position:relative;
	z-index:0;
	height:100vh;
	padding-top:10vh;
	display:flex;
	align-items:center;
	margin:0 50px;
}
#content>#noteViewBar{
	height:80%;
	width:15%;
	margin-left : 10%;
	margin-right:5%;
	
}
#content>#container{
	width: 75%;
	height:80%;
    display: flex;
    flex-direction: column;
    margin-right: 10%;
}
#container>h3{
	font-size : 1.7rem;
	font-weight:bold;
	margin : 15px;
	font-family: 'GangwonEdu_OTFBoldA';
}
#container>#containerContent{
	width:100%;
	border : 2px solid black;
	border-radius : 30px;
	height:100%;
	padding: 0 10px;
	
}
#userFloating{
	position: fixed;
    z-index: 1;
    bottom: 6%;
    right: 4%;
}
table{
	width:100%;
	height:90%;
	font-family: 'GangwonEdu_OTFBoldA';
	
	thead{
		height: 12%;
   		border-bottom: 1px solid black;
   		color : gray;
   		font-family: 'GangwonEdu_OTFBoldA';
   		font-size : 1rem;
	}
	tr{
		display: grid;
        grid-template-columns: 0.5fr 1fr 0.5fr;
        width: 100%;
        text-align: center;
        align-items: center;
        height: 100%;
        
       	a:hover{
       		color : gray;
       	}
        
	}
	tbody{
		height: 92%;
        display: grid;
        grid-template-rows: repeat(10, 1fr);
        margin-top: 15px;
        font-family: 'GangwonEdu_OTFBoldA';
   		font-size : 1rem;
	}
}
#paging{
	height:10%;
	display:flex;
	justify-content:center;
	.pagination{
		width:65%;
		display:flex;
		justify-content:space-evenly;
	}
}
</style>
</head>
<body>
<sec:authentication property="principal" var="user" />
<div id="header">
	<%@ include file="../main/header.jsp" %>
</div>
<div id="content">
	<div id="noteViewBar">
		<%@ include file="../note/noteViewBar.jsp" %>
	</div>
	<div id="container">
		<h3>알림 목록</h3>
		<div id="containerContent">
			<table>
				<thead>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>알림일자</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="item" varStatus="status">
						<tr>
							<td>${status.index}</td>
							<td>[${item.alarmTable}] ${item.alarmContent}</td>
							<td>
								<fmt:formatDate value="${item.alarmDate}" pattern="yy-MM-dd HH:mm" />
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div id="userFloating">
	<%@ include file="../main/floating.jsp" %>
</div>
</body>
</html>