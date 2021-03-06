<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--  Plugin for the Wizard -->
<%-- <script src="<c:url value="/resources/js/gsdk-bootstrap-wizard.js"/>"></script> --%>

<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
<script src="<c:url value="/resources/js/jquery.validate.min.js"/>"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
	$("#sign_btn").click(function() {
		
		var email = $('#email').val();
		var id = $('#id').val();
		
		console.log(email);
		console.log(id);
		
		if(email.trim()==""){
			alert("이메일을 입력해주세요");
		} else if(id.trim()==""){
			alert("아이디를 입력해주세요!");
		}else{
			$.ajax({
				url : '${pageContext.request.contextPath}/user/findPW',
				type : 'post',
				data : {
					"email" : email,
					"id" : id,
				},
				async : false,
				success : function(data) {
					if (data == 1) {
						alert("임시 비밀번호가 메일로 전송되었습니다.");
						location.href = "${pageContext.request.contextPath}/";
					} else {
						alert("계정을 찾을 수 없습니다. 이메일 또는 아이디를 확인해주세요");
					}

				},error : function(request,status, error) {
					console.log("통신 실패");

				}
			});
		}

				
	});
</script>