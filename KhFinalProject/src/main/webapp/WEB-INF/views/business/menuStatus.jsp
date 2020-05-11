<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>

 	div#main{
      	margin-left:200px; 	
      	margin-top:150px;
      }
      div.menu {
      	border:1px solid black;
      	width:300px;
      	height:500px;
      	margin-left:20px;      	
      }
      div.row1 {
      	margin-left:30px;
      	margin-top:50px;
      }


 
      </style>
	<%@include file="../common/header.jsp" %>
    <section style="width:1366px;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                      <ul class="nav nav-tabs nav-justified">
                         <li class="nav-item">
                        	<a href="${path }/licensee/menuEnroll" class="list nav-link">메뉴 등록</a>
                        </li>
                         <li class="nav-item">
                        	<a href="${path }/licensee/menuStatus" class="list nav-link active">메뉴 관리</a>
                        </li>
                                        
                    </ul>
                    
                    <div class="row row1">
                    <div class="menu"></div>
                    <div class="menu"></div>
                    <div class="menu"></div>
                    <div class="menu"></div>
                    </div>
                    <div class="row row1">
                    <div class="menu"></div>
                    <div class="menu"></div>
                    <div class="menu"></div>
                    <div class="menu"></div>
                    </div>
                 </div>
                 
            </div>
   		</div>
   	</section>
   	<%@include file="../common/footer.jsp" %>