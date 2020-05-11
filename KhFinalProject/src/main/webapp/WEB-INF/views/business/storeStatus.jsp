<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <style>
      @font-face{
      src:url("../font/BMJUA_ttf.ttf");
      font-family:"jua";
      }
      *{
      	font-family:"jua";
      }
      p{
      	display:inline;
      }
      a.list{
      	 font-weight: 700;
      	 color:black;
      }
      div#main{

      	margin-top:150px;
      }

      div#map{
      	width:400px;
      	height:200px;
      	border:1px solid black;
      	margin-left:300px;
      }
      div.content{
      	margin-top:30px;
      }
  
      </style>
	<%@include file="../common/header.jsp" %>
    <section style="width:1366px;height:768px;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                    <ul class="ss nav nav-tabs nav-justified">
						<li class="nav-item"><a href="${path }/licensee/storeEnroll" class="list nav-link">가맹점 등록</a></li>
						<li class="nav-item"><a href="${path }/licensee/storeStatus" class="list nav-link active">가맹점 등록 관리</a></li>
                    </ul>
                    <div class="content">
                    <form action="#" align=center>
                    	<p>사업자 번호 &nbsp;</p>
                    	<input type="text" value="123-123-1234" disabled>
                    	<br><br>
                    	<p>사업자 명 &nbsp;&nbsp;&nbsp;&nbsp;</p>
                    	<input type="text" value="김배민" disabled>
                    	<br><br>
                    	<p>업체 명 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                    	<input type="text" value="배달의 민족" disabled>
                    	<br><br>
                    	<p>업체 주소 &nbsp;&nbsp;&nbsp;&nbsp;</p>
                    	<input type="text" value="서울시 강남구" disabled>
                    	<br><br>
                    	<div id="map"><p>지도api</p></div>
                    	<br>
                    	<p>종목 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                    	<select id="food1" disabled>
                    		<option for="food1">한식점</option>
                    		<option for="food1">후식점</option>
                    		<option for="food1">양식집집집</option>
                    	</select>
                    	<br><br>
                    	<p>승인 상태&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                    		<select id="food1" disabled>
                    		<option for="food1">승인</option>
                    	</select>
                    </form>
                    </div>
                    
            </div>
   		</div>
   	</div>
    </section>
    <%@include file="../common/footer.jsp" %>