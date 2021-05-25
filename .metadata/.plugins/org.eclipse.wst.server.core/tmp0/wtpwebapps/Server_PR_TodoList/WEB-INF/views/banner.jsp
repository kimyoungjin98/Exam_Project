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
document.addEventListener("DOMContentLoaded", function(){
	document.querySelector("nav").addEventListener("click",function(ev){
		
		let name = ev.target.textContent
		
		if(name == "Home"){
			
			document
			.location
			.href="${rootPath}"
			
			
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

nav li:hover {

	cursor:pointer;
	
}

h1 {
	margin:auto;
	text-align: center;
	font-size:50px;
	background-image:url("https://mblogthumb-phinf.pstatic.net/20150905_10/unesco1128_1441440039203ranAH_GIF/9.gif?type=w2");
	background-size:cover;
	background-repeat:repeat-x;
 
	color:white;
	padding:40px;
	font-weight: lighter;

}

nav {

	background:black;
	
	color:white;
	
	font-size:20px;
	
	
}

nav ul{
	margin:0px;
	padding:10px;
}

nav li{
	display:inline-block;
	list-style:none;
	padding:10px;
	margin:0;
}


</style>
<body>
	<h1>TO DO LIST</h1>
	
	<nav>
	<ul>
	<li>Home</li>
	<li>날짜별 검색</li>
	<li >내용으로 검색</li>
	
	</ul>
	
	
	</nav>
</body>
</html>