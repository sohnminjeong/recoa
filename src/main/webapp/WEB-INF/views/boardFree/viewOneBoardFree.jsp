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
	margin:0 50px;
}
#content #container{
	display:flex;
	flex-direction:column;
	justify-content:center;
	align-items:center;
	width:100%;
	height:100%;
}
#containerHead{
	display:flex;
	justify-content:space-between;
	width:70%;
	border-bottom : 1px dashed black;
	padding-bottom:15px;
	
	h3{
		font-family: 'GangwonEdu_OTFBoldA';
		font-size:1.4rem;
	}
	
	#btn button{
		border-radius:3px;
		border:none;
		font-family: 'SDMiSaeng';
		font-size:1rem;
	}
	#btn button:hover{
		background-color : black;
		color : white;
	}
}

#containerContents{
	width:70%;
	font-family: 'GangwonEdu_OTFBoldA';
}
#topContents{
	width:100%;
	margin-top: 10px;
	margin-bottom:20px;
    display: flex;
    justify-content: space-between;
    color:gray;
    #writer{
    	display:flex;
    	
    	img{
    		border-radius:50%;
    		width:30px;
    		height:30px;
    		margin-right:10px;
    	}
    	#writerDetail{
    		display:flex;
    		flex-direction:column;
    	}
    }
}
#bottomContents{
	#text{
		font-size:1.3rem;
	}
	
	#img{
		margin-top:30px;
		
		img{
			width:200px;
			height:200px;
		}
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
	<div id="container">
		<div id="containerHead">
			<h3>${vo.freeTitle}</h3>
			<div id="btn">
			<c:choose>
				<c:when test="${user=='anonymousUser'||user.userCode!=vo.userCode}">	
					<button type="button" onclick="location.href='/viewAllBoardFree'">목록</button>
				</c:when>
				<c:otherwise>
					<button type="button" onclick="location.href='/updateBoardFree?freeCode=${vo.freeCode}'">수정</button>
					<button type="button" onclick="location.href='/deleteBoardFree?freeCode=${vo.freeCode}'">삭제</button>
					<button type="button" onclick="location.href='/viewAllBoardFree'">목록</button>
				</c:otherwise>
			</c:choose>	
			</div>
		</div>
		<div id="containerContents">
			<div id="topContents">
				<div id="writer">
					<c:choose>
						<c:when test="${vo.user.userImgUrl==null}">
							<img src="resources/images/user/default_profile.png" class="userImg"/>
						</c:when>
						<c:otherwise>
							<img src="/recoaImg/user/${vo.user.userImgUrl}" class="userImg"/>
						</c:otherwise>
					</c:choose>
					<div id="writerDetail">
						<span id="writerAdr">${vo.user.userAdr}동</span>
						<span id="writerNickname">${vo.user.userNickname}</span>
					</div>
				</div>	
				<fmt:formatDate value="${vo.freeWritedate}" pattern="yy-MM-dd HH:mm"/>
			</div>
			<div id="bottomContents">
				<span id="text">${vo.freeContent}</span>
				<div id="img">
					<c:forEach items="${imgList}" var="img" varStatus="status">
						<img src="/recoaImg/boardFree/${img.freeImgUrl}"/>
					</c:forEach>
					
				</div>
			</div>
			
		</div>
	</div>
</div>
</body>
</html>