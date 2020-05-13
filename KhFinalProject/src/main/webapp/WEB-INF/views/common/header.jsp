<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<header class="container-fluid">
		<div class="row" style="padding:5px;background-color:#CFEC70;">
			<div class="col-2"></div>
			<div class="col-2">
				<a href="${path }"><img class="rounded-circle" style="margin:3px;width:85px;height:85px;"
					alt="rogo" src="https://cdn.pixabay.com/photo/2016/02/23/00/06/pizza-1216738_960_720.png">
				</a>
			</div>
			<div class="col-3"></div>
			<c:if test="${loginMember==null}">
			<div class="col-2" style="padding-top:30px;">
				<button class="btn btn-outline-dark my-3 my-sm-0" type="button" 
					onclick="location.replace('${path}/member/login.do')">로그인 / 회원가입</button>&nbsp;&nbsp;
			</div>
			</c:if>
			<c:if test="${loginMember!=null}">
				<button class="btn btn-outline-dark my-3 my-sm-0" type="button" 
					onclick="location.replace('${path}/member/logout.do')">로그아웃</button>
			</c:if>
			<div class="col-3"></div>
		</div>
	</header>
