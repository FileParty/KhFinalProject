<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/adminMain.css"/>
<style>
	* {
		font-family:'Do Hyeon';
	}
</style>
<section>
	<div class="container">
		<div class="row">
			<%@ include file="adminSideBar.jsp" %>
			<div class="col-lg-10" id="main">
				<h2>관리자 화면</h2>
				<hr/>
				<div id="main-statistics-type-btns">
					<button id="stat-sales-btn" onclick="stat_sales()">매출 통계</button>
				</div>
				<div id="main-statistics-div">
					<table id="stat-tbl">
						<thead style="width:100%;">
							<tr id="stat-tbl-header" style="width:100%;">
								<th>유형</th>
								<th>일 평균</th>
								<th>일 종합</th>
								<th>월 평균</th>
								<th>월 종합</th>
								<th>년 평균</th>
								<th>년 종합</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th><p>전체</p></th>
								<td><p>${AB[0]['DAY_1']}</p></td>
								<td><p>${AB[0]['DAY_2']}</p></td>
								<td><p>${AB[0]['MONTH_1']}</p></td>
								<td><p>${AB[0]['MONTH_2']}</p></td>
								<td><p>${AB[0]['YEAR_1']}</p></td>
								<td><p>${AB[0]['YEAR_2']}</p></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	$(function(){
		stat_sales();
	});
	
	function stat_sales(){
		$("#stat-sales-btn").css("background-color","#A9F5A9");
		$("#stat-apply-btn").css("background-color","white");
	}
	
	function stat_apply(){
		$("#stat-sales-btn").css("background-color","white");
		$("#stat-apply-btn").css("background-color","#A9F5A9");
	}
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>