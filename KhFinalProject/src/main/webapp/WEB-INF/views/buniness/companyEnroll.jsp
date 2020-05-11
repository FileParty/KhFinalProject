<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>

	 div#main{
      	margin-left:200px;
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
                        	<a href="${path }/licensee/companyEnroll" class="list nav-link active">매장 정보등록</a>
                        </li>
                         <li class="nav-item">
                        	<a href="${path }/licensee/companyStatus" class="list nav-link">매장 정보관리</a>
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
                    		<td class="d1">최소주문금액</td>
                    		<td class="d1"><input type="text"></td>
                    		
                    	</tr>
                    	<tr>
                    		<td class="d1">결제방법</td>
                    		<td class="d1"><input type="text"></td>
                    	</tr>
                    	<tr>
                    		<td class="d1">배달소요시간</td>
                    		<td class="d1"><input type="text"></td>
                    	</tr>
                    	<tr>
                    		<td class="d1">가게소개글</td>
                    		<td class="d1"><input type="tel"></td>
                    	</tr>
                    	<tr>
                    		<td class="d1">가게번호</td>
                    		<td class="d1"><input type="text"></td>
                    	</tr>
                    	<tr>
                    		<td class="d1">가게로고</td>
                    		<td class="d1"><input type="text"></td>
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
    
    <%@ include file="../common/footer.jsp" %>