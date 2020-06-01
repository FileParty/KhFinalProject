<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <c:set var="path" value="${pageContext.request.contextPath}" />
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<%@include file="../common/header.jsp" %>
	  <link rel="stylesheet" type="text/css" href="${path }/resources/css/calculate.css"/>
    <section style="width:auto;height:auto;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
            		<h1>월별 매출</h1>
            		<br>
	            	<div>
	            		<div id="select_box">
 						<label for="saleselect">${stores[0].S_NAME }</label>
	                    <select  id="saleselect">
			 					<c:forEach items="${stores }" var="s">
			 						<option value="${s.S_NO }">${s.S_NAME }</option>
			 					</c:forEach>
			 			</select>
		 			</div>
		 				<p>* 최근 31일 매출 그래프입니다.(매출이 없는 일은 계산하지 않습니다)</p>
		 			
		 			</div>
		 			
		 			<div class="graph">
		 				<c:if test="${not empty sales}">
		 				<div id="columnchart_material" style="width: 800px; height: 500px;"></div>
		 				</c:if>
		 				<c:if test="${empty sales}">
		 					<img id='ready' src='${path}/resources/img/index/ready.jpg'>
		 				</c:if>
		 			</div>
		 			
		 			<div id="salesMonth">
		 			<c:if test="${not empty salesmonth }">
						<div>
		 					<table>
		 						
		 						<tr>
		 							<th>년/월</th><th>매출</th>
		 						</tr>
		 						
		 						<c:forEach items="${salesmonth}" var="s">
		 							<tr>
		 								<td><c:out value="${s.O_DATE}"/></td>
		 								<td><fmt:formatNumber maxFractionDigits="3" type="number"  value="${s.PRICE}"/></td>
		 							</tr>
		 						</c:forEach>
		 						
		 					</table>
		 				</div>	
		 			</c:if>
		 			</div>
		 			
                 </div>   
            </div>
   		</div>
   	</section>
   	
   	
   	 <jsp:include page="/WEB-INF/views/business/Js/calculateJs.jsp"/>
   	<%@include file="../common/footer.jsp" %>