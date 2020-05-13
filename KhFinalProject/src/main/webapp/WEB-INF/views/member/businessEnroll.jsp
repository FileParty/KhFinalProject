<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section>
	<div class="container d-flex justify-content-center">
		<div class="enroll-container">
			<div class="enroll-title text-center">
				<h2>회원가입</h2>
			</div>
			<div class="enroll-form">
				<form action="${path}/member/businessEnrollEnd.do" method="post">
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" id="userId" name="b_id" class="form-control" placeholder="아이디 입력 " required></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="userPw" name="b_pw" class="form-control" placeholder="비밀번호 입력" required></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="password" id="userPwck" name="b_pwck" class="form-control" placeholder="비밀번호 확인" required></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="b_name" class="form-control" placeholder="이름 입력" required></td>
					</tr>
					<tr>
						<th>사업자 번호</th>
						<td><input type="text" id="name" name="b_businesscode" class="form-control" placeholder="사업자 번호 입력" required></td>
					</tr>
					<tr>
						<th><input type="submit" value="회원가입"></th>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>