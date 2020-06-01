<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	.login-form{
	
		width:500px; 
		border:5px solid red; 
		
		margin:100px;	
			
	}
</style>
<script>
//This is called with the results from from FB.getLoginStatus(). 
function statusChangeCallback(response) {
	console.log('statusChangeCallback'); 
	console.log(response); 
	// response 객체는 현재 로그인 상태를 나타내는 정보를 보여준다. 
	// 앱에서 현재의 로그인 상태에 따라 동작하면 된다. 
	// FB.getLoginStatus().의 레퍼런스에서 더 자세한 내용이 참조 가능하다. 
	if (response.status === 'connected') { 
		// 페이스북을 통해서 로그인이 되어있다. 
		testAPI(); 
	} else if (response.status === 'not_authorized') { 
		// 페이스북에는 로그인 했으나, 앱에는 로그인이 되어있지 않다. 
		document.getElementById('status').innerHTML = 'Please log ' + 'into this app.'; 
	} else { 
		// 페이스북에 로그인이 되어있지 않다. 따라서, 앱에 로그인이 되어있는지 여부가 불확실하다.
		document.getElementById('status').innerHTML = 'Please log ' + 'into Facebook.'; 
	}  
}

//이 함수는 누군가가 로그인 버튼에 대한 처리가 끝났을 때 호출된다. 
// onlogin 핸들러를 아래와 같이 첨부하면 된다. 
function checkLoginState() { 
	FB.getLoginStatus(function(response) { 
		statusChangeCallback(response); 
	}); 
}

window.fbAsyncInit = function() {
	FB.init({
		appId : '{앱 ID}',
		cookie : true, // 쿠키가 세션을 참조할 수 있도록 허용 
		xfbml : true, // 소셜 플러그인이 있으면 처리 
		version : 'v2.1' // 버전 2.1 사용 });
}

// 자바스크립트 SDK를 초기화 했으니, FB.getLoginStatus()를 호출한다.
//.이 함수는 이 페이지의 사용자가 현재 로그인 되어있는 상태 3가지 중 하나를 콜백에 리턴한다.
// 그 3가지 상태는 아래와 같다. 
// 1. 앱과 페이스북에 로그인 되어있다. ('connected') 
// 2. 페이스북에 로그인되어있으나, 앱에는 로그인이 되어있지 않다. ('not_authorized') 
// 3. 페이스북에 로그인이 되어있지 않아서 앱에 로그인이 되었는지 불확실하다. 
// 
// 위에서 구현한 콜백 함수는 이 3가지를 다루도록 되어있다. 
FB.getLoginStatus(function(response) {
	statusChangeCallback(response); 
	}); 
}; 

// SDK를 비동기적으로 호출 
(function(d, s, id) { 
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return; 
	js = d.createElement(s); 
	js.id = id; 
	js.src = "//connect.facebook.net/en_US/sdk.js"; 
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk')); 

// 로그인이 성공한 다음에는 간단한 그래프API를 호출한다. 
// 이 호출은 statusChangeCallback()에서 이루어진다. 
function testAPI() { 
	console.log('Welcome! Fetching your information.... '); 
	FB.api('/me', function(response) { 
		console.log('Successful login for: ' + response.name); 
		document.getElementById('status').innerHTML = 
			'Thanks for logging in, ' + response.name + '!';
		}); 
	}

</script>

<section>
	<div class="container d-flex justify-content-center">
		<div class="login-container">
			<div class="login-form">
				<div class="login-category d-flex">
					<div class="text-center member-login" style="width:250px; 	border-bottom:5px solid red; border-right:5px solid red;">일반인</div>
					<div class="text-center business-login" style="width:250px;  border-bottom:5px solid red;">사업자</div>
				</div>
				<div class="member-login-container">
				<div class="d-flex justify-content-center flex-wrap text-center">
					<form action="${path}/member/memberLogin.do" method="post">
						<div class="login-title" style="margin-top:30px;">
							<img class="rounded-circle" style="margin:5px;width:100px;height:100px;cursor: pointer;"
							alt="rogo" src="${pageContext.request.contextPath }/resources/img/king.png">
						</div>
						<table>
							<tr>
								<td><input style="margin-top:30px; width:400px;" type="text" class="form-control" name="userId" id="m_Id" placeholder="아이디 입력" required></td>
							</tr>
							<tr>
								<td><input style="margin-top:30px;" type="password" class="form-control" name="userPw" placeholder="비밀번호 입력" required></td>
							</tr>	
						</table>
						<div class="d-flex justify-content-between" style="margin-top:30px;">
							<div class="">
								<label><input type="checkbox" id="idSaveCheck">아이디 저장</label>
							</div>
							<div class="d-flex">
								<span><a href="${path }/member/findIdPwM.do">아이디 / 비밀번호 찾기</a></span>
							</div>
						</div>
						<input type="submit" class="btn btn-outline-dark" value="로그인" style="width:400px; margin-top:30px;">
					</form>
					<div class="d-flex flex-wrap" style="margin-top:30px; margin-left:10px; margin-right:10px; width:400px;">
						<button class="btn btn-outline-dark" onclick="location.replace('${url }')" style="width:200px;">Naver 로그인</button>
						<button class="btn btn-outline-dark" onclick="location.replace('${kakao_url}')" style="width:200px;">Kakao 로그인</button>
						<button class="btn btn-outline-dark" onclick="location.replace('${google_url}')" style="width:200px;">Google 로그인</button>	
						<button class="btn btn-outline-dark" onclick="location.replace('${facebook_url}')" style="width:200px;">Facebook 로그인</button>
					</div>
					<div class="" style="margin:30px;">
						<span>배달킹이 처음이신가요? <a href="${path }/member/memberEnroll1.do">회원가입</a>을 해보세요!</span>
					</div>
				</div>
				</div>
				<div class="business-login-container " style="display: none!important;">
				<div class="d-flex justify-content-center flex-wrap text-center">
					<form action="${path}/member/businessLogin.do" method="post">
						<div class="login-title" style="margin-top:30px;">
							<img class="rounded-circle" style="margin:5px;width:100px;height:100px;cursor: pointer;"
					alt="rogo" src="${pageContext.request.contextPath }/resources/img/king.png">
						</div>
						<table>
							<tr>
								<td><input style="margin-top:30px; width:400px;" type="text" class="form-control" name="userId" id="b_Id" placeholder="아이디 입력" required></td>
							</tr>
							<tr>
								<td><input style="margin-top:30px;" type="password" class="form-control" name="userPw" placeholder="비밀번호 입력" required></td>
							</tr>	
						</table>
						<div class="d-flex justify-content-between" style="margin-top:30px;">
							<div class="">
								<label><input type="checkbox" id="idSaveCheckB">아이디 저장</label>
							</div>
							<div class="d-flex">
								<span><a href="${path }/member/findIdPwB.do">아이디 / 비밀번호 찾기</a></span>
							</div>
						</div>
						<input type="submit" class="btn btn-outline-dark" value="로그인" style="width:400px; margin-top:30px;">
					</form>
				
					<div class="" style="margin:30px;">
						<span>배달킹이 처음이신가요? <a href="${path}/member/businessEnroll1.do">회원가입</a>을 해보세요!</span>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		//사업자 로그인 div를 숨기고 일반인 로그인 div를 보여주는 기능
		$(".member-login").click(()=>{	
			$(".member-login-container").attr("style","display:block !important");
			$(".member-login").attr("style","background-color:red; width:250px; border-bottom:5px solid red; border-right:5px solid red;");
			$(".business-login-container").attr("style","display:none !important");
			$(".business-login").attr("style","background-color:white; width:250px; border-bottom:5px solid red;");
			
		});
		
		
		//일반인 로그인 div를 숨기고 사업자 로그인 div를 보여주는 기능	
		$(".business-login").click(()=>{
			$(".member-login-container").attr("style","display:none !important");
			$(".business-login").attr("style","background-color:red; width:250px; border-bottom:5px solid red; ");
			$(".business-login-container").attr("style","display:block !important");
			$(".member-login").attr("style","background-color:white; width:250px; border-bottom:5px solid red; border-right:5px solid red;");
		});
		//아이디 저장
		$(document).ready(function(){
			 
		    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
		    var key = getCookie("key");
		    var key2 = getCookie("key2");
		    
		    $("#m_Id").val(key);
		    $("#b_Id").val(key2);
		     
		    if($("#m_Id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		    }
		    
		    if($("#b_Id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
		        $("#idSaveCheckB").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		    }
		    
		     
		    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
		        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
		            setCookie("key", $("#m_Id").val(), 7); // 7일 동안 쿠키 보관
		        }else{ // ID 저장하기 체크 해제 시,
		            deleteCookie("key");
		        }
		    });
		    
		    $("#idSaveCheckB").change(function(){ // 체크박스에 변화가 있다면,
		        if($("#idSaveCheckB").is(":checked")){ // ID 저장하기 체크했을 때,
		            setCookie("key2", $("#b_Id").val(), 7); // 7일 동안 쿠키 보관
		        }else{ // ID 저장하기 체크 해제 시,
		            deleteCookie("key2");
		        }
		    });
		    
		     
		    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		    $("#m_Id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		            setCookie("key", $("#m_Id").val(), 7); // 7일 동안 쿠키 보관
		        }
		    });
		    
		    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		    $("#b_Id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		        if($("#idSaveCheckB").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		            setCookie("key2", $("#b_Id").val(), 7); // 7일 동안 쿠키 보관
		        }
		    });
		    
		});
		 
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
		
		//구글 로그인
		function init(){
			console.log('init');
			gapi.load('auth2',function(){
				console.log("auth2");
				window.gauth = gapi.auth2.init({
					client_id:'635179609727-2qr13q2e76t3e7hdt53nm91eaeo81oc1.apps.googleusercontent.com'
				})
				gauth.then(function(){
					console.log('googleAuth success');
					checkLoginStatus();
				}, function(){
					console.log('googleAuth fail');
				})
			});
		}
		
		function checkLoginStatus(){
			var loginBtn = document.querySelector("#loginBtn");
			if(gauth.isSignedIn.get()){
				console.log('logined');
				loginBtn.value = '로그아웃';
			}else{
				console.log('logout');
				loginBtn.value = 'Google 로그인';
			}
		}

	</script>
	
</section>


<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>