<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 검색</title>
<style type="text/css">
nav ul {
	top: 0px;
	left: 0px;
	right: 0px;
	height: 60px;
	width: 100%;
	background-color: #F5E978;
	padding: 0px;
	position: fixed;
	z-index: 2;
	list-style-type: none;
}

.icon {
	margin: 0px;
	display: inline-flex;
	justify-content: space-between;
}

nav ul li {
	margin: auto 15px;
}

.center {
	margin-top: -18px;
}

.right a {
	padding: 5px;
	margin-top: 20px;
}

input[type="search"] {
	padding-left: 10px;
	float: left;
	height: 20px;
	border-radius: 30px;
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	border: none;
}

nav ul li button {
	background-color: #EEF0ED;
	height: 20px;
	border: none;
	border-radius: 30px;
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
}

#MyPage_img {
	border-radius: 100%;
	width: 30px;
	height: 30px;
}

body {
	background-color: #fcf9f6;
}

#total_wrap {
	margin: 150px 0 0 350px;
}

#profile {
	width: 100px;
	height: 100px;
	border-radius: 100%;
}

#follow {
	height: 40px;
	width: 120px;
	background: #F5E978;
	border: 0.2px solid #CCC;
	border-radius: 5px;
	font-size: 18px;
	font-weight: bold;
}

#edit_btn {
	height: 40px;
	width: 120px;
	background: #F5E978;
	border: 0.2px solid #CCC;
	border-radius: 5px;
	font-size: 18px;
	font-weight: bold;
}

#follow:hover {
	cursor: pointer;
}

#unfollow {
	height: 40px;
	width: 120px;
	background: #CCC;
	border: 0.2px solid #CCC;
	border-radius: 5px;
	font-size: 18px;
	font-weight: bold;
}

#unfollow:hover {
	cursor: pointer;
}

#find_peeps {
	width: 900px;
	height: 100px;
	text-align: center;
	margin-top: 10px;
	border-bottom: 0.2px solid #CCC;
}

#id {
	font-size: 30px;
	font-weight: bold;
	width: 300px;
}

#name {
	font-size: 20px;
	color: #DDD;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

#user_no {
	font-size: 50px;
	font-weight: bold;
}
</style>
</head>

<body>
	<div id="nav">
		<nav>
			<ul class="icon">
				<!--아이콘 경로 바꾸기 -->
				<li class="left"><span><input type="search" id="search"
						placeholder="검색" required="required">
						<button id="keyword" type="submit">
							<img
								src="<c:url value="/resources/images/icon/navi/search.png"/>">

						</button></span></li>
				<!-- 				사진 크기 커서 주석처리 해놓음 -->
				<!-- 								<li class="center"><a id="Logo"><img -->
				<%-- 										src="<c:url value="/resources/images/plus.png"/>"></a></li> --%>

				<li class="right"><a id="Home" href="#"><img
						src="<c:url value="/resources/images/icon/navi/023-home.png"/>"></a>
					<a id="Content" href="#"><img
						src="<c:url value="/resources/images/icon/navi/Content.png"/>"></a>
					<a id="Alarm" href="#"><img
						src="<c:url value="/resources/images/icon/navi/008-notification.png"/>"></a>
					<a id="Chat" href="#"><img
						src="<c:url value="/resources/images/icon/navi/050-wechat.png"/>"></a>
					<c:set var="loginType" value="${loginType }" /> <c:choose>
						<c:when test="${loginType eq 'email' }">
							<img id="MyPage_img"
								src="<c:url value="/fileupload/${peeps.m_photo}"/>">
						</c:when>
						<c:when test="${loginType ne 'email' }">
							<img id="MyPage_img" src="<c:url value="${peeps.m_photo}"/>">

						</c:when>

					</c:choose></li>
			</ul>

		</nav>

	</div>
	<!-- 네비 바 -->
	<div id="total_wrap">
		<div>
			<c:choose>
				<c:when test="${peepsCnt == 0}">
					<div id="user_no">일치하는 유저가 없습니다</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${peepslist}" var="peep" varStatus="i">
						<table id="find_peeps">

							<tr>
								<td rowspan="2"><a href="#"> <c:set var="loginType"
											value="${peep.loginType}" /> <c:choose>
											<c:when test="${loginType eq 'email'}">
												<img id="profile"
													src="<c:url value="/fileupload/${peep.m_photo}"/>">
											</c:when>
											<c:when test="${loginType ne 'email' }">
												<img id="profile" src="<c:url value="${peep.m_photo}"/>">
											</c:when>
										</c:choose>
								</a></td>
								<td id="id"><a href="#">${peep.id}</a></td>
								<td rowspan="2"><c:choose>
										<c:when test="${peep.id eq id}">
											<div id="fix">
												<button id="edit_btn">프로필편집</button>
											</div>
										</c:when>
										<c:otherwise>
											<div id="fix">
												<c:choose>
													<c:when test="${peep.chk_result eq 1}">
														<form action="${pageContext.request.contextPath}/unfollow"
															name="form" method="post">
															<input type="hidden" value="${peep.m_idx}" id="y_idx"
																name="y_idx"> <input type="hidden"
																value="${m_idx}" name="m_idx">
															<button id="unfollow" type="submit">언팔로우</button>
														</form>
													</c:when>
													<c:otherwise>
														<form action="${pageContext.request.contextPath}/follow"
															name="form" method="post">
															<input type="hidden" value="${peep.m_idx}" id="y_idx"
																name="y_idx"> <input type="hidden"
																value="${m_idx}" name="m_idx">
															<button id="follow" type="submit">팔로우</button>
														</form>
													</c:otherwise>
												</c:choose>
											</div>
										</c:otherwise>
									</c:choose></td>
							</tr>
							<tr>
								<td id="name"><a href="#">${peep.name}</a></td>
							</tr>

						</table>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>



</body>
<!--   Core JS Files   -->
<script src="<c:url value="/resources/js/jquery-2.2.4.min.js"/>"
	type="text/javascript"></script>

<script>
	$("#keyword")
			.click(
					function() {

						var keyword = $('#search').val();

						console.log(keyword);

						$
								.ajax({
									url : '${pageContext.request.contextPath}/user/finduser?keyword='
											+ keyword,
									type : 'get',
									async : false,
									success : function(data) {
										location.href = "${pageContext.request.contextPath}/member/FindView?keyword="
												+ keyword;
									},
									error : function() {
										console.log("실패,,,,");
									}
								});

					});
</script>

<script>
	var email = "${email}";

	console.log(email);

	$('#edit_btn')
			.click(
					function() {
						location.href = "${pageContext.request.contextPath}/profile/Info?email="
								+ email;
					});

	$("#MyPage_img")
			.click(
					function() {

						location.href = "${pageContext.request.contextPath}/mypage?email="
								+ email;

					});
</script>
</html>