<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>
 
	 div#main{
		margin-top:150px;
      }
      th#h2{
      padding: 20 0 20 10;
      }
      th#h3{
      padding: 30 0 20 10;
      }
      td.d1{
      padding:20 0 0 10;
      }
      td.d2{
      padding:10 0 0 0;
      }
      th#h1{
       padding:0 0 20 10;
      }
      </style>
	<%@include file="../common/header.jsp" %>
    <section style="width:1366px;">
 	<div class="container">
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                     <ul class="nav nav-tabs nav-justified">
                        <li class="nav-item">
                        	<a href="${path }/licensee/storeInfoEnroll" class="list nav-link active">업체 정보등록</a>
                        </li>
                         <li class="nav-item">
                        	<a href="${path }/licensee/storeInfo" class="list nav-link ">업체 정보관리</a>
                        </li>
                    </ul>
                    <br>
                    <div class="col-12">
                    	<form>
                    	 <table align=center>
                    	<tr>
                    		<th id="h1">영업정보</th>      		
                    	</tr>
                    	<br>
                    	<tr>
                    		<td class="d1">운영시간</td>
                    		<td class="d1"><input type="text"></td>
                    		
                    	</tr>
                    	<tr>
                    		<td class="d1">준비시간</td>
                    		<td class="d1"><input type="text"></td>
                    	</tr>
                    	<tr>
                    		<td class="d1">휴무일</td>
                    		<td class="d1"><input type="text"></td>
                    	</tr>
                    	<tr>
                    		<td class="d1">전화번호</td>
                    		<td class="d1"><input type="tel"></td>
                    	</tr>
                    	<tr>
                    		<th id="h2">위치정보</th>
                    	</tr>
                    	<tr>
                    		<td class="d1">배달지역</td>
                    		<td class="d1"><input type="text"></td>
                    	</tr>
                    	<tr>
                    		<th id="h3">사업자 정보</th>
                    	</tr>
                    	<tr>
                    		<td class="d1">대표자명</td>
                    		<td class="d1"><input type="text"></td>
                    	</tr>
                    	<tr>
                    		<td class="d1">상호명</td>
                    		<td class="d1"><input type="text"></td>
                    	</tr>
                    	<tr>
                    		<td class="d1">사업자주소</td>
                    		<td class="d1"><input type="text">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="검색"></td>
                    	</tr>
                    </table>
                    <br>
                    <input style="margin-left:440px;"type="submit" value="등록">
                    </form>
                    </div>
                    </div>
            </div>
   		</div>
    </section>
    <%@include file="../common/footer.jsp" %>