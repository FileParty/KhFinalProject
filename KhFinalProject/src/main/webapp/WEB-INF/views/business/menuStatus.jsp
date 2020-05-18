<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>

 	div#main{
      	margin-left:200px; 	
      	margin-top:150px;
      }
      div.menu {
      	border:1px solid black;
      	width:200px;
      	height:230px;
      	margin-left:20px;
      	
      }
      div.row1 {
      	margin-left:30px;
      	margin-top:50px;
      }


 
      </style>
	<%@include file="../common/header.jsp" %>
    <section style="width:1366px;height:768px;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                      <ul class="nav nav-tabs nav-justified">
                         <li class="nav-item">
                        	<a href="${path }/licensee/menuEnroll" class="list nav-link" onclick="storeNo();">메뉴 등록</a>
                        </li>
                         <li class="nav-item">
                        	<a href="${path }/licensee/menuStatus" class="list nav-link active">메뉴 관리</a>
                        </li>
                                        
                    </ul>
                    <br>
                    <br>
                    	<select id="store" class="form-control" style="width:auto;margin-left:400px;">
                    	<c:forEach items="${store }" var="s">
                    		<option for="store" value="${s.s_No }"><c:out value="${s.s_Name }" /></option>
                    	</c:forEach>
                    	</select>
                    <div class="row row1">
                    
                    	<div class="row">
                    		<div class="col-lg-6">ㅎㅎ</div>
                    		<div class="col-lg-6">ㅎㅎ</div>
                    	</div>
                    
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
   		<script>
   			$("#store").change(function () {
   				$.ajax({
   					url:"${path}/licensee/selectCategory",
   					data:{s_no:$("#store").val()},
   					success:function(data) {
   						console.log("카테고리성공",data);
   					}
   				})
   				$.ajax({
   					url:"${path}/licensee/selectOption",
   					data:{s_no:$("#store").val()},
   					success:function(data) {
   						console.log("옵션성공",data);
   					}
   				})
   				
   				$.ajax({
   					url:"${path}/licensee/menuSelect",
   					data:{s_no:$("#store").val()},
   					success:function(data) {
   						console.log("메뉴성공",data);
   					}
   				})
   			})
		
   		</script>
   	</section>
   	<%@include file="../common/footer.jsp" %>