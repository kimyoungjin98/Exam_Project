<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>어서오세요</title>
</head>
<script>
document.addEventListener("DOMContentLoaded",function(ev){
	
	document.querySelector("body")
	.addEventListener("click", function(ev){
		
		let tag = ev.target.tagName
		let cName = ev.target.className
		
		if(tag == "TD"){
			
			let seq = ev.target.closest("TR").dataset.seq
			
			document.location.href="${rootPath}/todo/view?td_seq=" + seq
			
		}
		
		if(cName == "update"){
			
			var checkbox = $("input[name=list]:checked");
			
			if(checkbox.length > 1){
				alert("수정하기는 1개만 선택하세요")
				
				return false;
			}
			
		} else if(cName == "delete"){
			
			
			
		}
		
	})
	
})


</script>
<style>

body {
	background:linear-gradient(to bottom, #3d7eaa, #ffe47a);
	background-repeat: repeat-x;
	padding-bottom:200%
	
}

@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&family=Roboto+Slab:wght@100;600&display=swap');
* {
		font-family: 'Nanum Myeongjo', serif;
		font-family: 'Roboto Slab', serif;
	}

table {
	width:100%;
	text-align: center;
	margin:3px auto;
	font-size:20px;
	padding:10px;
	background-color: white;
	border:1px solid white;
	
}

table td{
	cursor:pointer;
	padding:5-%;
	
	
}

table td:hover{
	background-color: #ffe47a;
	opacity: 0.5;
}

table div{
	border:1px solid #ffe47a;
	
}

table th{
	background-color:#ffe47a;
	color:white;
	
}


</style>
<body>
	
	<%@ include file="/WEB-INF/views/banner.jsp" %>
	<p>
	<%@ include file="/WEB-INF/views/write.jsp" %>
	<p>
	
	<button class="update" type="button">수정하기</button>
	<button class="delete" type="button">삭제하기</button>
	
		<table>
		<div>
		<th>선택</th>
		<th>No.</th>
		<th>할일</th>
		<th>작성일자</th>
		<th>작성시각</th>
		<th>장소</th>
		</div>

		<c:forEach items="${TDLIST}" var="TD" varStatus="index">
			<tr data-seq="${TD.td_seq}">
			
			<td><input type="checkbox" value="${TD.td_seq}" name="list">
				<td>${index.count}</td>
				<td>${TD.td_content}</td>
				<td>${TD.td_date}</td>
				<td>${TD.td_time}</td>
				<td>${TD.td_place}</td>
			</tr>

		</c:forEach>

	</table>
	
</body>
</html>