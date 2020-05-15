<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
	<%@include file="../common/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="${path }/resources/css/storeEnroll.css"/>
    <section style="width:auto;height:auto;">
 	<div class="container">
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                     
                    <h2>매장 정보 관리</h2>
                     
                    <div class="store-enroll-box">
                  		
                  		<div class="store-enroll">
                  			
                  			<div class="store-enroll-title">
								<i class='fas fa-pen' style='font-size:24px'></i>&nbsp;<span>정보입력</span>         			
                  			</div>
                  			
                  			<div class="store-enroll-content">
	                  			<form action="#" method="post" enctype="multipart/form-data"  onsubmit="return check();">
	                  			
	                  				<table>
	                  					<tr>
	                  						<th class="store-enroll-info-title">상호명</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">주소</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">연락처</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">종목선택</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">최소금액</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">결제방법</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">소개글</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">원산지</th>
	                  						<th class="store-enroll-info"></th>	
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">메인이미지</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">소요시간</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">휴무일</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">쿠폰허용</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">오픈시간/마감시간</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th colspan="2" style="text-align: center;">
	                  						<button type="button" class="btn btn-success" onclick="location.replace('${path}/store/storeupdate')">수정하기</button>
	                  						</th>
	                  					</tr>
	                  				</table>
	                  				
	                  			</form>
							</div>
                  		</div>                  		

                    </div>
                    
            </div>	
   		</div>
   	</div>
    </section>
    <%@include file="../common/footer.jsp" %>