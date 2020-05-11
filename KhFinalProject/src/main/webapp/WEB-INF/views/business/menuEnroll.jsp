<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>


	 div#main{
      	margin-left:200px;
      	margin-top:150px;
      }
      th#h2{
      padding: 20 0 20 0;
      }
      th#h3{
      padding: 20 0 20 0;
      }
      td.d1{
      padding:0 0 0 10;
      }
      td.d2{
      padding:10 0 0 0;
      }
      th#h1{
       padding:0 0 20 0;
      }
      </style>
	<%@ include file="../common/header.jsp" %>
    <section style="width:1366px;">
 	<div class="container">
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                     <ul class="nav nav-tabs nav-justified">
                        <li class="nav-item">
                        	<a href="${path }/licensee/menuEnroll" class="list nav-link active">메뉴 등록</a>
                        </li>
                         <li class="nav-item">
                        	<a href="${path }/licensee/menuStatus" class="list nav-link">메뉴 관리</a>
                        </li>
                    </ul>
                    <br>                 
                    	<div class="row">
                    	<div class="col-6">
                    	<img src="../img/메뉴예시1.png" style="height:600px;width:500px;">
                    	</div>
                    	<div class="col-6">
                    	  <form action="#" align=center id="form">
                    	<p>메뉴명 &nbsp;</p>
                    	<input type="text">
                    	<br><br>
                    	<p>메뉴 간단 설명 &nbsp;&nbsp;&nbsp;&nbsp;</p>
                    	<input type="text" style="width:300px;">
                    	<br><br>
                    	<p>메뉴 카테고리 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                    	<select id="food">
                    		<option for="food">인기</option>
                    		<option for="food">기본</option>
                    		<option for="food">사이드</option>
                    	</select>
                    	<br><br>
                    	<p>메뉴가격 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                    	<input type="number">
                    	<br><br>
                    	<p>메뉴이미지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                    	<input type="file">
                    	<br><br>
                    	<input type="button" value="추가 항목 메뉴">
                    	<br><br>
                    	<input type="submit" value="메뉴등록" class="btn btn-danger" style="margin-left:70px;"> 
                    </form>
                    	</div>
                    </div>
            </div>
   		</div>
	</div>
    </section>
    
    <%@ include file="../common/footer.jsp" %>