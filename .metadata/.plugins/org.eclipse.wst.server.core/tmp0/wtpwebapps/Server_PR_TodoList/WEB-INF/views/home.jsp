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
	
	document.querySelector("table")
	.addEventListener("click", function(ev){
		
		let tag = ev.target.tagName
		
		if(tag == "TD"){
			
			let seq = ev.target.closest("TR").dataset.seq
			
			document.location.href="${rootPath}/todo/view?td_seq=" + seq
			
		}
		
	})
	
})


</script>
<style>


@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
.jm-font {
		font-family: 'Noto Sans KR', sans-serif;
	}


table {
	width:100%;
	text-align: center;
	margin:3px auto;
	font-size:20px;
	padding:10px;
	
}

table td{
	cursor:pointer;
	padding:5-%;
	
	
}

table tr:hover{
	background-color: #1c92d2;
}

table tr{
	border:1px solid #1c92d2;
	outline:1px solid #1c92d2;
}

table th{
	background-color: #1c92d2;
	color:white;
	
}


</style>
<body>
	
	<%@ include file="/WEB-INF/views/banner.jsp" %>
	<p>
	<%@ include file="/WEB-INF/views/write.jsp" %>
	<p>
		<table>
		<th>No.</th>
		<th>할일</th>
		<th>작성일자</th>
		<th>작성시각</th>
		<th>장소</th>

		<c:forEach items="${TDLIST}" var="TD" varStatus="index">
			<tr data-seq="${TD.td_seq}">
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