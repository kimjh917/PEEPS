
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="">

<head>

<title>방명록</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<%@ include file="/WEB-INF/views/include/basicset.jsp"%>



</head>
<style>
.ginsert_wrap {
	border: 1px solid red;
	background-color: #eef0ed;
	height: 270px;
	width: 850px;
	margin: auto;
}

.ginsert_wrap2 {
	border: 1px solid red;
	background-color: #eef0ed;
	height: auto;
	width: 850px;
	margin: auto;
}

.ginsert_wrap>ul>li {
	list-style-type: none;
	float: left;
	margin: 5px;
	margin-top: 30px;
}

.gimg {
	background-color: white;
	width: 70px;
	height: 70px;
	margin: 10px;
	border-radius: 50px;
}

.upgphoto, .upgid {
	float: left;
}

.gdate {
	float: right;
	margin: 15px
}

.upgtable {
	/* background-color: aqua; */
	margin: 100px;
}

.upmsg {
	border: 1px solid black;
	width: 600px;
	margin: 30px auto;
	height: auto;
	font-size: 1.5em;
}

table.upmsg_table {
	/* background-color: aqua; */
	margin: 30px;
	font-size: 20px;
}

.nowpage {
	font-size: 1.5em;
	font-weight: bold;
}

.paging {
	text-align: center;
}

.upgbinfo {
	border: 1px solid red;
	width: 830px;
	height: 100px;
	margin: 10px auto 10px auto;
}

.gbutton {
	border: 1px solid red;
	float: right;
}

.paging {
	text-align: center;
	margin-bottom: 100px;
}

.paging>span {
	padding: 5px 10px;
	border-radius: 4px;
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	font-size: 1.2em;
}

.postidx {
	color: black;
}

.col-sm-4 {
	width: 383px;
}

.row {
	/* margin: auto;
	width: 1150px; */
}

.container {
	/* max-width: 100%; 
	height: auto; */
	width: 1150px;
}

.pageBtn:link {
	text-decoration: none;
	color: gray;
}
.pageBtn:visited {
	text-decoration: none;
	color: gray;
}
.pageBtn:active {
	text-decoration: none;
	color: gray;
}
.pageBtn:hover {
	text-decoration: none;
	color: gray;
}
.bnt3{
   background-color: aqua;
   color: black;
   border: 1px solid black;
   font-size: 10px;
   padding: 5px;
   
}
</style>


<body>

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<!----------------------------------------------------------------------------------------->
	<div id="main_wrap">
		<%@ include file="/WEB-INF/views/include/user.jsp"%>
		<%@ include file="/WEB-INF/views/include/menu.jsp"%>
	</div>
	<!--=====================context======================-->
	<div class="changing">


		<form id="insertGForm" enctype="multipart/form-data">
			<div class="ginsert_wrap">
				<!-- 방명록 입력 div -->
				<ul>
					<li><img
						src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAxMDVfNiAg%2FMDAxNjA5ODUyMjAyODkx.SGiMYE0GV5JhjH_FVZUCfOREl7yH6ipmytqZ6ynDP9gg.81AO4sM4kRPOR8_50gibNZ3YmoIsHIaAgbpTNkGCKGYg.JPEG.nbsupporter%2F%25B0%25AD%25BE%25C6%25C1%25F6_2.jpg&type=a340"
						class="gimg"></li>
					<li><textarea rows="9" cols="80" id="gmessage" name="gmessage"></textarea><br>
					<input type="file" id="gphoto" name="gphoto"></li>
					<li></li>
				</ul>
			</div>
			`
		</form>
		<button id="sbmtbtn">등록</button>

		<div class="ginsert_wrap2" id="ginsert_wrap2">
           <!-- 방명록 시작 -->
				
			<!-- 방명록 끝 -->	
			
			</div>
			
			
			
	</div>
	<!-- 목록 끝 -->
	<!-- 페이징 -->
	<div class="paging">
	</div>
			
			<script>
			// 뷰컨트롤러 통해 페이지 번호 받기
			function getParameterByName(name) {name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
			var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);
			return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
		  }

			
			var p = getParameterByName('p');
			var gidx =getParameterByName('gidx');
			console.log("방명록인덱스 : ",gidx);
		    console.log(p);
			
		$(document).ready(function(){
			
		   /*  방명록 데이터 등록 */
			
			$('#sbmtbtn').click(function() {

				var photoFile =$('#gphoto');
				
				var file1 =photoFile[0].files[0];
				
				var message = $('#gmessage').val();
				console.log(message);
			
				
				//console.log(file1);
				
			var formData = new FormData();
				formData.append("gmessage",$('#gmessage').val());
				formData.append("gphoto",file1);
				
				//console.log(formData);
				
				
// 				$.ajax({
// 					url : 'http://localhost:8080/peeps/rest/guestbook/upload',
// 					type : 'post',
// 					data : formData,
// 					async : false,
// 					enctype : 'multipart/form-data',
// 					processData : false,
// 					contentType : false,
// 					cache : false ,
// 					success : function(data){
// 						console.log("ajax data",data);
// 						console.log("작성완료");
// 						alert("방명록이 작성 되었습니다");
						
// 					}
// 				});
				
				
				
			
			}); //-------방명록 작성 ajax끝 
			
			
			
			
		

				/*게스트북 리스트 출력*/
				$.ajax({
					url : 'http://localhost:8080/peeps/rest/guestbook?p='+p,
					type : 'GET',
					success : function(data){
						console.log(data);
						//alert(data);
						//alert(JSON.stringify(data));
						console.log("ajax로 받아온 데이터 : ", data);
						var list = $(data.gbList);
						console.log(list);
						$.each(list, function(index, item){
						
							var date = item.gdate-540*60*1000;
							
							date = new Date(date).toLocaleDateString();
						
							console.log("날짜: ", date);
						 
							
							var html  =' <div class="upgbinfo">';
								html +=' <span class="upgphoto"><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAxMDVfNiAg%2FMDAxNjA5ODUyMjAyODkx.SGiMYE0GV5JhjH_FVZUCfOREl7yH6ipmytqZ6ynDP9gg.81AO4sM4kRPOR8_50gibNZ3YmoIsHIaAgbpTNkGCKGYg.JPEG.nbsupporter%2F%25B0%25AD%25BE%25C6%25C1%25F6_2.jpg&type=a340"class="gimg" > </span>';
								html +=' <span class="upgid"><h4>'+item.gwriter+'</h4></span>';
								html +=' <div class="gbutton">';
								
								
								html +=' <span class="bnt3"><a href="<c:url value="/guestbook/edit?gidx='+item.gidx+'"/>">수정</a></span>';
								html +=' <span class="bnt3"><a href="javascript:deleteMsg('+item.gidx+');">삭제</a></span></div>';
								html +=' <span class="gdate">'+date+'<fmt:formatDate value="${guestbook.gdate}" pattern="yyyy.MM.dd." /></span>';
							    html +=' </div>';
							    html +=' <div class="upmsg" border="1px">';
							    html +=' <div>'+item.gmessage+'</div>';
							    html +=' <span><img src="<c:url value="/fileupload/guestbook/'+item.gphoto+'"/>"></span>';
							    html +='  </div>';
							    html +='  <a href="javascript:deleteMsg('+item.gidx+');">삭제</a>';
								   
							    	html +=' <a href="<c:url value="/guestbook/edit?gidx='+item.gidx+'"/>">수정</a>';
									
							   $('#ginsert_wrap2').append(html); 
						 
						});
					
						// 페이징 처리
						 if (data.totalGbCount>0){
							 console.log('totalPageCount :' + data.totalPageCount);
							for(var i=1; i <= data.totalPageCount; i++){	/* test 계정아이디 들어가야 함 */			
								 var html2 =' <span><a class="pageBtn" href="<c:url value="/guestbook"/>?p='+i+'">'+i+'</a></span> ';																		
								 $('.paging').append(html2);
							}										 
						 };	
						
						
					},
					error:function(e){
					console.log("에러발생!! :",e);	
					}
				
					
				}); //----리스트 ajax end
					
			});
				
		function deleteMsg(gidx){

			if (confirm('방명록을 삭제하시겠습니까? from ajax')) {
				
				
				$.ajax({
					url : 'http://localhost:8080/peeps/rest/guestbook/delete?gidx=' + gidx,
					type : 'post',
					success : function(data){
						console.log("ajax data",data);
						window.location.href="http://localhost:8080/peeps/guestbook";
						alert("방명록이 삭제 되었습니다");
						
					}
				});
			}
		


		}
			
				

			
		
			
	
		</script>
</body>

</html>