<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <c:set var="path" value="${pageContext.request.contextPath}" />
    
   <style>
      a.list{
      	 font-weight: 700;
      	 color:black;
      }
 div#main{
      	margin-left:200px;
      	margin-top:150px;
      	height:600px;
      	width:500px;
      	border : 1px solid black;
      }

      </style>
	<%@include file="../common/header.jsp" %>
    <section style="width:1366px;height:768px;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                    <ul class="ss nav nav-tabs nav-justified">
                        <li class="nav-item"><a href="#" class="list nav-link active">정산 내역 조회</a></li>					
                    </ul>
                 </div>   
            </div>
   		</div>
   	</section>
   	<%@include file="../common/footer.jsp" %>