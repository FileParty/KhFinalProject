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
                    
                    <div class="row row1">
                    <div class="review">
                    	<p style="margin:0;">baemin123**</p>
                    	<p style="margin:0;">★★★★☆  오늘</p>
                    	<img  style="border:1px solid black;width:170px;height:100px;">
                    	<p style="margin:0;">음식이 따뜻하고 포장이 깔끔해서 좋습니다.</p>
                    	<p style="display:inline;margin:0;">★한우 육회비빔밥★</p>
                    	<input style="margin:0;"type="button" value="답글">
                    </div>
                    <div class="review"></div>
                    <div class="review"></div>
                    <div class="review"></div>
                    </div>
                    <div class="row row1">
                    <div class="review"></div>
                    <div class="review"></div>
                    <div class="review"></div>
                    <div class="review"></div>
                    </div>
                 </div>
                 
            </div>
   		</div>
   	</section>
   	
   	<%@ include file="../common/footer.jsp" %>