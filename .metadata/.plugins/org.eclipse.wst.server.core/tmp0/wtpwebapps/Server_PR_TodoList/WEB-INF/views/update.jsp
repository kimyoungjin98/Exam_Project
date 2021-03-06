<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
document.addEventListener("DOMContentLoaded", function(){
	document.querySelector("button.up_save")
	.addEventListener("click",function(ev){
		
		let td_date = document.querySelector("input[name='td_date']")
		let td_time = document.querySelector("input[name='td_time']")
		let td_content = document.querySelector("input[name='td_content']")
		let td_place = document.querySelector("input[name='td_place']")
		
		if(td_content.value == ""){
			alert("할일을 입력하세요 !")
			return false;
		} 
				
		document.querySelector("form").submit();
		 
		
	})
	
})

</script>
<style>

@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Roboto+Slab:wght@100;600&display=swap');
* {
		font-family: 'Nanum Myeongjo', serif;
		font-family: 'Roboto Slab', serif;
	}

	label{
		font-size:20px;
	}
	
	input{
		font-size:20px;
	}
	
	button{
		background-color: black;
		color:white;
		font-size:20px;
		cursor:pointer;
	}
	
	body {
	background:linear-gradient(to bottom, #3d7eaa, #ffe47a);
	background-repeat: repeat-x;
	background-size:cover;
	background-image: url("https://mblogthumb-phinf.pstatic.net/20150905_278/unesco1128_1441440037443oRg50_GIF/6_%281%29.gif?type=w2");
	
}

</style>
<body>

	<%@ include file="/WEB-INF/views/banner.jsp" %>
	<p>

	<form method="POST">
	
	<input name="td_date" placeholder="작성일자" type="date" value="${TD.td_date}">
	<input name="td_time" placeholder="작성시각" type="time" value="${TD.td_time}"><p>
	<input name="td_content" placeholder="할일" value="${TD.td_content}"></input>
	<input name="td_place" placeholder="장소" value="${TD.td_place}">
	<p>
		<button class="up_home">처음으로</button>
		<button class="up_save" type="button">저장하기</button>
			</form>

</body>
</html>