<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>
	<div class="container">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-7 mt-3 mb-3" style="float: none; margin: 0 auto;">
				<h3>회원 회원가입</h3>
				<hr>
				<table>
					<tr>
						<th>아이디(이메일)</th>
						<td>
							<input type="email" name="userId" id="userId_"/><br/>
							<span id="userIdSpan">이메일을 입력해주세요</span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" name="password" id="password_"/><br/>
							<span id="passwordSpan">비밀번호양식 : 영문자를 포함한 숫자 8자리 이상</span>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
							<input type="password" name="passwordChk" id="passwordChk"/><br/>
							<span id="passwordChkSpan"></span>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<input type="text" name="tel" id="tel_"/><br/>
							<span>전화번호는 - 없이 입력(ex 01012345678)</span>
						</td>
					</tr>
					<tr>
						<th>집주소</th>
						<td>
							<input type="text" name="addr" id="addr_"/><br/>
							<button>검색하기</button>
						</td>
					</tr>
					<tr>
						<td><button type="submit">회원가입</button></td>
						<td><button type="reset">초기화</button></td>
					</tr>
				</table>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>