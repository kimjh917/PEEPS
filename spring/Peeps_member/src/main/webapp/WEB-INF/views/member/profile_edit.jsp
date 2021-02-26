<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 편집</title>

<link href="<c:url value="/resources/css/edit.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/nav.css" />" rel="stylesheet">
</head>
<body>
<div id="wrap">
	<div id="nav">
		<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	</div>
	<div id="total_wrap">
		<div id="edit_menu">
			<div id="menu_btn">
				<h3 id="email">${email}</h3>
				<h3>님</h3>
				<br>
				<button id="edit">프로필 편집</button>
				<button id="pw_ch">비밀번호 변경</button>
				<button id="delete">탈퇴하기</button>
				<button id="log_out">로그아웃</button>
			</div>
		</div>
		<div id="edit_wrap">
			<form id="edit_photo" enctype="multipart/form-data">
				<input type="hidden" id="email" name="email" value="${email }">
				<table id="edit_table">
					<tr>
						<td id="table_left" rowspan="3"><c:set var="loginType"
								value="${loginType}" /> <c:choose>
								<c:when test="${loginType eq 'email' }">
									<img id="profile"
										src="<spring:url value="/fileupload/${m_photo}"/>">
									<input type="hidden" id="oldPhoto" name="oldPhoto"
										value="${m_photo}">
									<br>
								</c:when>
								<c:when test="${loginType ne 'email' }">
									<img id="profile" src="<spring:url value="${m_photo}"/>">
									<input type="hidden" id="oldPhoto" name="oldPhoto"
										value="${m_photo}">
									<br>
								</c:when>

							</c:choose> <input type="file" class="choose" id="m_photo" name="m_photo"
							accept="img/*"><br>
							<button type="button" id="choose_btn">프로필 사진 바꾸기</button></td>

						<td id="table_right">아이디 <br> <input type="text"
							class="edit_text" id="id" name="id" value="${id}">
						</td>
					</tr>
					<tr>
						<td id="table_right">이름 <br> <c:set var="loginType"
								value="${loginType}" /> <c:choose>
								<c:when test="${loginType eq 'email' }">
									<input type="text" class="edit_text" id="name" name="name"
										value="${name}">
								</c:when>
								<c:when test="${loginType ne 'email' }">
									<input type="text" class="edit_text" id="name" name="name"
										value="${name}" readonly="readonly">
								</c:when>

							</c:choose>
						</td>
					</tr>
					<tr>
						<td id="table_right">소개글 <br> <input type="text"
							class="edit_bio" id="bio" name="bio" value="${bio}">
						</td>
					</tr>
					<tr>
						<td colspan="2"></td>
					</tr>
				</table>
			</form>
			<button id="change">변경</button>
		</div>
	</div>
</div>
</body>

<!--   Core JS Files   -->
<script src="<c:url value="/resources/js/jquery-2.2.4.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/jquery.bootstrap.wizard.js"/>"
	type="text/javascript"></script>


<script>
	$(function() {

		var loginType = "${loginType}";

		if (loginType == "email") {
			//버튼 클릭시 업로드창 실행
			$('#choose_btn').click(function() {
				console.log('fileadd');
				$("input[name='m_photo']").click();

			})

			//이미지 클릭시 업로드창 실행
			$('#profile').click(function() {
				console.log('fileadd');
				$("input[name='m_photo']").click();

			})
		}

		// 이미지로 파일 선택 시 미리보기
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#profile').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$(".choose").change(function() {
			readURL(this);
		})

	});

	// 댓글 글자 수 제한
	$('#bio').keyup(function() {
		// 현재 입력 문자열의 길이
		var inputStrLen = $(this).val().length;
		if (inputStrLen > 50) {
			alert('50자 까지만 입력이 가능합니다.');
			var userInput = $(this).val().substr(0, 50);
			$(this).val(userInput);
			inputStrLen = 50;
		}
	});
</script>


<script>
	$(function() {

		var email = "${email}";

		$(document).on("click", "#edit", function(){
							location.href = "${pageContext.request.contextPath}/profile/Info";

						});
		$(document).on("click", "#pw_ch", function(){
							location.href = "${pageContext.request.contextPath}/profile/pw?email="
									+ email;

						});
		$(document).on("click", "#delete", function(){
							location.href = "${pageContext.request.contextPath}/profile/delete?email="
									+ email;

						});

		$(document).on("click", "#log_out", function(){
			
			location.href = "${pageContext.request.contextPath}/logout";

		});
	})
</script>
<script>
	$("#change").click(function() {

		var data = $('#edit_photo')[0];
		var form_data = new FormData(data);

		$.ajax({
			url : '${pageContext.request.contextPath}/profile/edit',
			type : 'post',
			data : form_data,
			dataType : 'json',
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			async : true,
			success : function(data) {
				console.log("수정 완료");
				if (data == 1) {
					alert("수정 완료");
					//$('#wrap').load(location.href + '#edit_wrap');
				} else {
					console.log("수정 실패");
				}

			},
			error : function(request, status, error) {
				console.log("통신 실패");

			}
		});
	});
</script>

<script>

var id = "${id}";

$("#MyPage_img").click(function() {

	location.href = "${pageContext.request.contextPath}/mypage/" + id;

});


$("#keyword").click(function() {
	
	var keyword = $('#search').val();

	if (keyword.trim() == "") {
		alert("한 글자 이상 입력하세요");
	} else {
		location.href = "${pageContext.request.contextPath}/user/finduser?keyword="+ keyword;
}

});
</script>

</html>