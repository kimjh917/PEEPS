<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 리스트</title>
</head>
<!--jquery 라이브러리 로드-->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js" 
		integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" 
		crossorigin="anonymous">
</script> -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 
자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.container-fluid {
	height: 50px;
	text-align: center;
	width: 1100px;
	color: black;
	max-width: 100%;
}

#top_wrap {
	margin: 0px auto;
	position: fixed;
	z-index: 999;
	top: 0px;
	left: 0px;
	right: 0px;
}

#nav_wrap {
	width: 1150px;
	margin: 30px auto;
	text-align: center;
}

#my_nav {
	margin: auto;
}

.menuselect>button {
	width: 370px;
	height: 95px;
	font-size: 30px;
	border: none;
	outline: none;
}

.jumbotron {
	height: 400px;
	width: 1150px;
	margin: 100px auto 0px auto;
	text-align: center;
	background-color: #F5E978;
}

#profile_wrap>img {
	width: 200px;
	border-radius: 100%;
	margin-left: -750px;
	margin-top: 50px;
	border: 1px solid #CCC;
}

#pro_btn>ul>li {
	list-style: none;
	font-size: 30px;
	display: inline-block;
	text-align: center;
	margin-right: 40px;
}

#pro_btn {
	margin: -180px -300px 0px 0px;
}

#foll_btn {
	border: 0;
	background-color: #F5E978;
}

#pro_edit {
	border: solid 0.2px #CCC;
	background-color: #DDD;
	border-radius: 5px;
	width: 300px;
	height: 35px;
	font-size: 20px;
}

#pro_name {
	font-size: 20px;
	margin: 10px auto;
}

#pro_bio {
	font-size: 20px;
	margin: 10px auto;
}

.pagediv {
	background-color: aqua;
	text-align: center;
	margin: auto;
}

.postidx {
	color: black;
}
</style>


<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div id="main_wrap">
		<div class="jumbotron">
			<div id="profile_wrap">
				<img src="<spring:url value='/resources/img/chick.jpg'/>">
				<div id="pro_btn">
					<ul>
						<li>아이디</li>
						<li><button id="pro_edit">
								<a href="#">프로필 편집</a>
							</button></li>
					</ul>

					<ul>
						<li>게시물</li>
						<li>NN</li>
						<li>팔로워</li>
						<li><button id="foll_btn">NN</button></li>
						<li>팔로잉</li>
						<li>
							<button id="foll_btn">NN</button>
						</li>
					</ul>
					<div id="pro_name">사용자 이름</div>
					<div id="pro_bio">사용자 소개글</div>
				</div>
			</div>
		</div>
		<div id="nav_wrap">
			<div class="menuselect">
				<button onclick="location.href='jhS2'">게시물</button> <!-- test 회원 아이디 들어가야 함 -->
				<button onclick="javascript:menulist(1);">지도</button>
				<button onclick="javascript:menulist(2);">방명록</button>

			</div>
		</div>

		<div class="container">
			<div class="row">
			<!-- 게시글 목록 시작 -->
				<c:forEach items="${listView.postList}" var="post">
				<div class="col-sm-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<a id="ptitle" class="postidx" href="postNO=${post.p_idx}">
								<!-- 제목 20자 이상 초과시 자르기 -->
								<c:choose>
									<c:when test="${fn:length(post.p_title) > 20}">
									<c:out value="${fn:substring(post.p_title,0,20)}"/>...
									</c:when>
									<c:otherwise>
									<c:out value="${post.p_title}"></c:out>
									</c:otherwise>
								</c:choose>
							</a>
						</div>
						<div class="panel-body">
							<a class="postidx" href="postNO=${post.p_idx}"><img src="<c:url value="/resources/fileupload/postfile/${post.p_thumbnail}"/>"
								class="img-responsive" style="width: 325px; height: 325px;" alt="Image"></a>
						</div>
						<div class="panel-footer"><fmt:formatDate value="${post.p_date}"
									pattern="yyyy.MM.dd." />
						</div>
					</div>
				</div>
				</c:forEach>
			<!-- 게시글 목록 끝 -->	
			</div>
		</div>
		<br>

	</div>
	<!-- 목록 끝 -->
	<div class="pagediv">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
</body>
</html>