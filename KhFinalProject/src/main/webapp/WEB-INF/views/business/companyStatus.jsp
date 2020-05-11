<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>


	 div#main{

      	margin-top:150px;
      }
      td{
      padding:10 0 0 10;
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
                        	<a href="${path }/licensee/companyEnroll" class="list nav-link">매장 정보등록</a>
                        </li>
                         <li class="nav-item">
                        	<a href="${path }/licensee/companyStatus" class="list nav-link active">매장 정보관리</a>
                        </li>
                    </ul>
                    <br>
                    <div class="col-12">
                    	 <table align=center>
                    	<tr>
                    		<th id="h1"><h4>영업정보</h4></th>      		
                    	</tr>
                    	<br>
                    	<tr>
                    		<td>최소주문금액</td>
                    		<td class="d1">8,000원</td>
                    		
                    	</tr>
                    	<tr>
                    		<td>결제방법</td>
                    		<td class="d1">현금,카드</td>
                    	</tr>
                    	<tr>
                    		<td>배달소요시간</td>
                    		<td class="d1">47분~50분</td>
                    	</tr>
                    	<tr>
                    		<td>가게소개글</td>
                    		<td class="d1">집밥같은 음식으로 안겨드리겠습니다.</td>
                    	</tr>
                    	<tr>
                    		<td>가게번호</td>
                    		<td class="d1">02-123-4567</td>
                    	</tr>
                    	<tr>
                    		<td>가게로고</td>
                    		<td class="d1"> 
                    		<img src="http://blogfiles.naver.net/20160309_167/jugiya3_1457484081373SoXNf_JPEG/attachImage_62923672.jpeg" style="width:40px;height:40px;">
                    		</td>
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