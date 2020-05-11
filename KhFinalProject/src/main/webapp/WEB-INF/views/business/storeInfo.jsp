<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>


	 div#main{

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
<%@include file="../common/header.jsp" %>
    <section style="width:1366px;height:768px;">
 	<div class="container">
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                     <ul class="nav nav-tabs nav-justified">
                        <li class="nav-item">
                        	<a href="${path }/licensee/storeInfoEnroll" class="list nav-link">업체 정보등록</a>
                        </li>
                         <li class="nav-item">
                        	<a href="${path }/licensee/storeInfo" class="list nav-link active">업체 정보관리</a>
                        </li>
                    </ul>
                    <br>
                    <div class="col-12">
                    	 <table align=center>
                    	<tr>
                    		<th id="h1">영업정보</th>      		
                    	</tr>
                    	<br>
                    	<tr>
                    		<td>운영시간</td>
                    		<td class="d1">평일- 오전 8:00~오후 5:00</td>
                    		
                    	</tr>
                    	<tr>
                    		<td>휴무일</td>
                    		<td class="d1">연중무휴</td>
                    	</tr>
                    	<tr>
                    		<td>전화번호</td>
                    		<td class="d1">02-123-4567</td>
                    	</tr>
                    	<tr>
                    		<th id="h2">위치정보</th>
                    	</tr>
                    	<tr>
                    		<td>배달지역</td>
                    		<td class="d1">배민 1동,배민 2동,배민 3동</td>
                    	</tr>
                    	<tr>
                    		<th id="h3">사업자 정보</th>
                    	</tr>
                    	<tr>
                    		<td>대표자명</td>
                    		<td class="d1">김배민</td>
                    	</tr>
                    	<tr>
                    		<td>상호명</td>
                    		<td class="d1">배민식당</td>
                    	</tr>
                    	<tr>
                    		<td>사업자주소</td>
                    		<td class="d1">서울시 배민구 배민동 8282번지</td>
                    	</tr>
                    </table>
                    <br>
                    <input style="margin-left:440px;"type="button" value="수정">
                    </div>
                    </div>
            </div>
   		</div>
    </section>
    
    <%@include file="../common/footer.jsp" %>