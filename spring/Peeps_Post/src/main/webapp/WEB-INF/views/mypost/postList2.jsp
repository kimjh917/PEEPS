<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
</style>

<body>
	<div id="top_wrap">
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Brand</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="#">Link</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
								<span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
								<li class="divider"></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Link</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
								<span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#">Separated link</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->

		</nav>
	</div>
	<!---------------------------------------->
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
				<button onclick="location.href='list'">게시물</button>
				<button onclick="javascript:menulist(1);">지도</button>
				<button onclick="javascript:menulist(2);">방명록</button>

			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="panel panel-primary">
						<div class="panel-heading">BLACK FRIDAY DEAL</div>
						<div class="panel-body">
							<img src="https://placehold.it/150x80?text=IMAGE"
								class="img-responsive" style="width: 100%" alt="Image">
						</div>
						<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="panel panel-danger">
						<div class="panel-heading">BLACK FRIDAY DEAL</div>
						<div class="panel-body">
							<img src="https://placehold.it/150x80?text=IMAGE"
								class="img-responsive" style="width: 100%" alt="Image">
						</div>
						<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="panel panel-success">
						<div class="panel-heading">BLACK FRIDAY DEAL</div>
						<div class="panel-body">
							<img src="https://placehold.it/150x80?text=IMAGE"
								class="img-responsive" style="width: 100%" alt="Image">
						</div>
						<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
					</div>
				</div>
			</div>
		</div>
		<br>

		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="panel panel-primary">
						<div class="panel-heading">BLACK FRIDAY DEAL</div>
						<div class="panel-body">
							<img src="https://placehold.it/150x80?text=IMAGE"
								class="img-responsive" style="width: 100%" alt="Image">
						</div>
						<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="panel panel-primary">
						<div class="panel-heading">BLACK FRIDAY DEAL</div>
						<div class="panel-body">
							<img src="https://placehold.it/150x80?text=IMAGE"
								class="img-responsive" style="width: 100%" alt="Image">
						</div>
						<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="panel panel-primary">
						<div class="panel-heading">BLACK FRIDAY DEAL</div>
						<div class="panel-body">
							<img src="https://placehold.it/150x80?text=IMAGE"
								class="img-responsive" style="width: 100%" alt="Image">
						</div>
						<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="panel panel-primary">
						<div class="panel-heading">BLACK FRIDAY DEAL</div>
						<div class="panel-body">
							<img src="https://placehold.it/150x80?text=IMAGE"
								class="img-responsive" style="width: 100%" alt="Image">
						</div>
						<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="panel panel-primary">
						<div class="panel-heading">BLACK FRIDAY DEAL</div>
						<div class="panel-body">
							<img src="https://placehold.it/150x80?text=IMAGE"
								class="img-responsive" style="width: 100%" alt="Image">
						</div>
						<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="panel panel-primary">
						<div class="panel-heading">BLACK FRIDAY DEAL</div>
						<div class="panel-body">
							<img src="https://placehold.it/150x80?text=IMAGE"
								class="img-responsive" style="width: 100%" alt="Image">
						</div>
						<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
					</div>
				</div>
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