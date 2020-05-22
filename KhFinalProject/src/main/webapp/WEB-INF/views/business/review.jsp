<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>
      a.list{
      	 font-weight: 700;
      	 color:black;
      }
 div#main{
      	margin-left:200px;
      	margin-top:150px;
      	
      }
      div.review {
      	border:1px solid black;
      	width:600px;
      	height:300px;
      	margin-left:20px;
      	
      }
      div.row1 {
      	margin-left:30px;
      	margin-top:50px;
      }
      div{
      	
      }

 
      </style>
	<%@ include file="../common/header.jsp" %>
    <section style="width:1366px;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                    <ul class="ss nav nav-tabs nav-justified">
                        <li class="nav-item"><a href="#" class="list nav-link active">일반 리뷰</a></li>					
                    </ul>
                    		<select id="storeInfo" name="storeNo" class="form-control" style="margin-left:400px;width:auto;display:block;">
                    		<c:forEach items="${store}" var="s">
                    			<option for="storeInfo" value="${s.s_No }"><c:out value="${s.s_Name }" /></option>
                    		</c:forEach> 
                    		</select>
                    	
                    
                 </div>
                 
            </div>
   		</div>
   		<script>
   		
   			 $(function() {
   				$.ajax({
   					url:"${path}/licensee/reviewSelect",
   					data:{s_no:$("#storeInfo").val()},
   					success:function(data) {
   						console.log('??',data);
   						if(data.length == 0) {
   							alert('등록 된 리뷰가 없습니다!');
   						}
   					}
   				})
   			}) 
   		</script>
   	</section>
   	
   	<%@ include file="../common/footer.jsp" %>