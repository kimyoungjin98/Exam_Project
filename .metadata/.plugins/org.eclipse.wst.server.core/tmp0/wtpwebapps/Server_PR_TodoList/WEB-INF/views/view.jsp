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
document.addEventListener("DOMContentLoaded",function(ev){
	document.querySelector("fieldset")
	.addEventListener("click", function(ev){
		
		let cName = ev.target.className
		
		if(cName == "home"){
			
			document.location.href="${rootPath}"
			
		} else if (cName == "update"){
						
			document.location.href="${rootPath}/todo/update?td_seq=" + ${TD.td_seq}
			
		} else if (cName == "delete"){
			
			if(confirm("삭제 하시겠습니까?")){
				
				document.location.href="${rootPath}/todo/delete?td_seq=" + ${TD.td_seq}
				
			}
			
			
		} 
		
	})
})
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Roboto+Slab:wght@100;600&display=swap');
* {
		font-family: 'Nanum Myeongjo', serif;
		font-family: 'Roboto Slab', serif;
	}
	
	body {
	background:linear-gradient(to bottom, #3d7eaa, #ffe47a);
	background-repeat: repeat-x;
	background-size:cover;
	background-image: url("https://mblogthumb-phinf.pstatic.net/20150905_278/unesco1128_1441440037443oRg50_GIF/6_%281%29.gif?type=w2");
	
}
    
    tbody{
    	background-color: white;
    }

	table {
		border:2px solid black;
		width:100%;
		margin:10px auto;
		text-align: center;
		font-size:30px;
		background-color: white;
	}
	
	table th {
	
		background-color:black;
		color:white;
	}
	
	button {
		background-color: black;
		color:white;
		font-size:20px;
		cursor:pointer;
	}
	
	
</style>
<body>
<%@ include file="/WEB-INF/views/banner.jsp" %>

<fieldset>
	<table>
		<th>할일</th>
		<th>작성일자</th>
		<th>작성시각</th>
		<th>장소</th>
		<tr data-set="${TD.td_seq}">
			<td>${TD.td_content}</td>
			<td>${TD.td_date}</td>
			<td>${TD.td_time}</td>
			<td>${TD.td_place}</td>
		</tr>
	</table>
	
	<button class="home">처음으로</button>
	<button class="update">수정하기</button>
	<button class="delete">삭제하기</button>
	
</fieldset>

</form>
</body>
</html>