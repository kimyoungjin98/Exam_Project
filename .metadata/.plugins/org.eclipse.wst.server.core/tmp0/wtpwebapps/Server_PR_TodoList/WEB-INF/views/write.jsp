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
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function(ev){
	document.querySelector("button")
	.addEventListener("click",function(ev){

		let name = ev.target.className
		
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
.jm-font {
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
	
	
	
	

</style>
<body>

	

	<form method="POST" class="1">
	
	<input name="td_date" placeholder="작성일자" type="date" value="${TD.td_date}">
	<input name="td_time" placeholder="작성시각" type="time" value="${TD.td_time}"><p>
	<input name="td_content" placeholder="할일" value="${TD.td_content}"></input>
	<input name="td_place" placeholder="장소" value="${TD.td_place}">
	
		<button type="button">저장하기</button>
	</form>

</body>
</html>