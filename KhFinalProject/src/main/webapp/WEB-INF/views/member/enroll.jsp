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
				<form action="${path}/member/enrollEnd.do" method="post">
				<table>
					<tr>
						<th>아이디</th>
						<td><input type="text" id="userId" name="m_id" class="form-control" placeholder="아이디 입력 " required></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="userPw" name="m_pw" class="form-control" placeholder="비밀번호 입력" required></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="password" id="userPwck" name="m_pwck" class="form-control" placeholder="비밀번호 확인" required></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="m_name" class="form-control" placeholder="이름 입력" required></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" id="phone" name="m_phone" class="form-control" placeholder="전화번호 입력" required></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input type="text" id="nickname" name="m_nickname" class="form-control" placeholder="닉네임 입력" required></td>
					</tr>
					<tr>
						<th>종류</th>
						<td><label><input type="radio" name="m_level" value="1">구매자</label><label><input type="radio" name="m_level" value="2">배달원</label></td>
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