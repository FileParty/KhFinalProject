<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/applyStoreList.css"/>
<section>
	<div class="container">
		<div class="row">
			<%@ include file="adminSideBar.jsp" %>
			<div class="col-lg-10" id="main">
				<h2>가게 신청목록</h2>
				<hr/>
				<div id="apply-store-list">
					<table class="table-striped" id="apply-store-tbl">
						<tr>
							<th>가게명</th>
							<th>가게위치</th>
							<th>가게소개</th>
							<th>신청일</th>
							<th>카테고리</th>
							<th>상세보기</th>
						</tr>
						<c:forEach items="${sList }" var="s">
							<tr class="apply-store-data">
								<td><c:out value="${s['s_Name'] }"/></td>
								<td><c:out value="${s['s_Addr'] }"/></td>
								<td><c:out value="${s['s_Text'] }"/></td>
								<td><fmt:formatDate value="${s['s_EnrollDate']}" pattern="yy/MM/dd"/></td>
								<td>
									<c:forEach items="${s['s_category'] }" var="cate">
										<c:out value="${cate}"/>
									</c:forEach>
								</td>
								<td>
									<button class="apply-store-info-btn" onclick="applyStoreInfo(${s['s_No']})">상세</button>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
<div id="apply-store-modal" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<p class="apply-store-header-text">가게 상세화면</p>
			</div>
			<div class="modal-content">
				<p class="report-login-modal-content">로그인이 필요한 서비스입니다. 로그인 페이지로 이동하시겠어요?</p>
			</div>
			<div class="modal-footer">
				<button class="report-login-modal-btn" data-dismiss="modal">
					아니오
				</button>
				<button class="report-login-modal-btn report-login-modal-btn-bg" onclick="goToLoginPage()">
					예
				</button>
			</div>
		</div>
	</div>
</div>
<script>
	function applyStoreInfo(s_no){
		$.ajax({
			url:"${path}/admin/applyStoreInfo",
			data:{"s_no":s_no},
			success:function(data){
				console.log(data);
			}
		})
		$("#apply-store-modal").modal("show");
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>