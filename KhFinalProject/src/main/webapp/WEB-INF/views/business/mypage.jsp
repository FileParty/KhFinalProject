<%@page import="com.kh.fp.model.vo.Sales"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<%@ include file="../common/header.jsp" %> 
	<link rel="stylesheet" type="text/css" href="${path }/resources/css/mypage.css"/>
 	<section style="width:auto;height:auto;">
 	<div class="container">
 		<div class="row" >
 			<%@ include file="sideBar.jsp" %>
 		
 	<div class="col-lg-10" id="main" >
 		
 		<div>
 			<div class="first-storepage" >
 			<h2>나의 매장</h2>
 				<hr/>
 				<c:if test="${empty stores }">
 				<div style="margin-bottom: 300px;">
 					<h1>현재 등록된 매장이 없습니다.</h1>
 				</div>
 				</c:if>
 				<c:if test="${not empty stores }">
 				<table>
                    	
                    		<tr>
                    			<th>상호명</th>
                    			<th>주소</th>
                    			<th>평점</th>
                    			<th>리뷰수</th>
								<th>등록일</th>
								<th>승인상태</th>
                    		</tr>
                    		<c:forEach items="${stores }" var="s"> 
                    		<tr>
                    			<td>${s.S_NAME }</td>
                    			<td>${s.S_ADDR }</td>
                    			<td>${s.SCORE }</td>
                    			<td>${s.S_REVIEWCOUNT }</td>
                    			<td><fmt:formatDate value="${s.S_ENROLLDATE }" pattern="yyyy년 MM월 dd일"/></td>
                    			<td>${s.S_ENROLLSTATUS }</td>
                    		</tr>
                    		</c:forEach>
                </table>
 			
 				
 				</c:if>
 			</div>
 			<c:if test="${not empty stores }">
 			<div class="first-storepage">
 				<h2>매장 매출 그래프</h2><hr/>
 				<div style="margin-bottom: 40px;">
 					<div id="select_box">
 						<label for="saleselect">${stores[0].S_NAME }</label>
		 				<select  id="saleselect">
		 					<c:forEach items="${stores }" var="s">
		 						<option value="${s.S_NO }">${s.S_NAME }</option>
		 					</c:forEach>
		 				</select>
	 				</div>
	 				</div>
	 			<div class="graph">
	 				<c:if test="${not empty sales}">
	 				<div id="columnchart_material" style="width: 900px; height: 500px;"></div>
	 				</c:if>
	 				<c:if test="${empty sales}">
	 					<img src='${path}/resources/img/index/ready.jpg' width="900px" height="500px">
	 				</c:if>	
	 			</div>
 			</div>
 			
 			
 			<div class="first-storepage">
 			<h2>주문 현황</h2><hr/>
 					<div style="margin-bottom: 40px;">
 						<div id="select_box">
 						<label for="orderselect">${stores[0].S_NAME }</label>
		 				<select id="orderselect">
		 					<c:forEach items="${stores }" var="s">
		 						<option value="${s.S_NO }">${s.S_NAME }</option>
		 					</c:forEach>
		 				</select>
		 				</div>
	 				</div>
	 				<c:if test="${not empty orderinfo }">
		 				<table id="ordertable">
		                    	
		                    		<tr>
		                    			<th>주문자</th>
		                    			<th>주문자연락처</th>
		                    			<th>주소</th>
		                    			<th>가격</th>
										<th>주문시간</th>
										<th>상태</th>
		                    		</tr>
		                    		
		                    	
		                    	<c:forEach items="${orderinfo }" var="o">
		                    	
		                    		<tr>
		                    			<td><c:out value="${o.O_NAME }"/></td>
		                    			<td><c:out value="${o.O_PHONE }"/></td>
		                    			<td><c:out value="${o.O_ADDR }"/></td>
		                    			<td><c:out value="${o.O_ORIPRICE }"/></td>
		                    			<td><fmt:formatDate value="${o.O_DATE }" pattern="yy/MM/dd HH:mm:ss"/></td>
		                    			<td><c:out value="${o.O_STATUS }"/></td>
		                    		</tr>
		                    	</c:forEach>
		                    	
		                </table>
                	</c:if>
                   	<c:if test="${empty orderinfo }">
                   		<img id='ordertable' src='${path}/resources/img/index/ready.jpg'>
                   	</c:if>
 			
 			
 				</div>
 			
 			</c:if>
 			</div>
 			</div>
 		</div>
 	</div>
 	</section>
 	
 	<jsp:include page="/WEB-INF/views/business/Js/mypageJs.jsp"/>
 	<%@ include file="../common/footer.jsp" %> 