<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <style>
      a.list{
      	 font-weight: 700;
      	 color:black;
      }
      div#main{
      	margin-left:200px;
      	border:1px solid black;
      	height:700px;
      }
      table tr th,td{
      	text-align:center;
      }
      table tr td {
      	padding:20 0 0 10;
      }
      

      </style>

    <section style="width:1366px;height:968px;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                    <ul class="ss nav nav-tabs nav-justified">
                        <li class="nav-item"><a href="${path }/licensee/order" class="list nav-link">주문 요청</a></li>					
                		<li class="nav-item"><a href="${path }/licensee/orderEnd" class="list nav-link active">주문 완료(결제 완료)</a></li>
                    </ul>
                    <div class="col-12" style="border:1px solid black;height:650px;">
                    <br><br>
                    	<input style="margin-left:300px;"type="text"><input type="button" value='검색'>
                    <br><br>
                    	<table align=center>
                    		<tr style="font-size:20px;">
                    			<th>주문번호</th>
                    			<th>주문일시</th>
                    			<th>메뉴명</th>
                    			<th>주문금액</th>
                    			<th>결제금액</th>
                    			<th>배달주소</th>
                    			<th>전화번호</th>
                    			<th>요청사항</th>
                    		</tr>
                    		<tr>
                    			<td>123abc123</td>
                    			<td>20-04-12</td>
                    			<td>후라이드 치킨</td>
                    			<td>18,000원</td>
                    			<td>16,000원</td>
                    			<td>서울시 강남구 남도빌딩</td>
                    			<td>010-1234-1234</td>
                    			<td>잘 부탁드립니다.</td>
                    			<td><input type="button" value="상세보기"></td>
                    			<td><input type="button" value="배달요청"></td>
                    			
                    		</tr>
                    	</table>                    	
                    </div>
                 </div>   
            </div>
   		</div>
   	</section>