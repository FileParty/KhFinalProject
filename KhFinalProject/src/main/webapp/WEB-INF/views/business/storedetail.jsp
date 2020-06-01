<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<%@include file="../common/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="${path }/resources/css/storeEnroll.css"/>
    <section style="width:auto;height:auto;">
 	<div class="container">
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                     
                    <h2>매장 정보 관리</h2>
                     
                     <c:if test="${empty stores }">
	                  					<div class="empty-store"><h1>현재 등록된 가게는 없습니다.</h1></div>
	                  					<div style="margin-bottom: 500px;"></div>
	                  				</c:if>
                     
                     
                     <c:if test="${not empty stores }">
                     <c:forEach items="${stores }" var="s" varStatus="vs">
                    <div class="store-enroll-box">
                  		
                  		<div class="store-enroll">
                  			
                  			<div class="store-enroll-title">
								<i class='fas fa-pen' style='font-size:24px'></i>&nbsp;<span>정보</span>         			
                  			</div>
                  			
                  			<div class="store-enroll-content">
	                  			<form action="#" method="post" enctype="multipart/form-data"  onsubmit="return check();">
	                  				
	                  					
			                  				<table>
			                  					<tr>
			                  						<th class="store-enroll-info-title">상호명</th>
			                  						<th class="store-enroll-info"><c:out value="${s.S_NAME }" /></th>
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">주소</th>
			                  						<th class="store-enroll-info"><c:out value="${s.S_ADDR }" /></th>
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">연락처</th>
			                  						<th class="store-enroll-info"><c:out value="${s.S_PHONE }" /></th>
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">종목선택</th>
			                  						<th class="store-enroll-info">
			                  							<c:forEach items="${s.category }" var="ca">
			                  									<c:out value="${ca.CT_NAME }"/>
			                  							</c:forEach>
			                  						</th>
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">최소금액</th>
			                  						<th class="store-enroll-info"><fmt:formatNumber maxFractionDigits="3" value="${s.S_LIMITPRICE }" /> 원</th>
			                  					</tr> 
			                  					<tr>
			                  						<th class="store-enroll-info-title">결제방법</th>
			                  						<th class="store-enroll-info"><c:out value="${s.S_PAYOPT }" /></th>
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">소개글</th>
			                  						<th class="store-enroll-info"><pre><c:out value="${s.S_TEXT }" /></pre></th>
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">원산지</th>
			                  						<th class="store-enroll-info"><pre><c:out value="${s.S_ORIFOODINFO }" /></pre></th>	
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">메인이미지</th>
			                  						<th class="store-enroll-info">
			                  							<div class="img_wrap">
												            <img id="img" src="${path }/resources/upload/store/${s.S_LOGIMG}" width="100%" height="100%"/>	            
												        </div>
			                  						</th>
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">소요시간</th>
			                  						<th class="store-enroll-info"><c:out value="${s.S_TIME }" />분</th>
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">휴무일</th>
			                  						<th class="store-enroll-info"><c:out value="${s.S_HOLIDAY }" /></th>
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">쿠폰허용</th>
			                  						<th class="store-enroll-info"><c:out value="${s.S_COUPON }" /></th>
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">오픈시간/마감시간</th>
			                  						<th class="store-enroll-info">
			                  						 <c:out value="${s.S_STARTTIME }" /> ~
			                  						 <c:out value="${s.S_ENDTIME   }" />
			                  					</th>
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">소개글 이미지</th>
			                  						<th class="store-enroll-info">
			                  							 <div class="imgs_wrap flex-wrap d-flex">
				                  							<c:forEach items="${s.files }" var="f">
				                  							<div class="img_wrap">
													            <img id="img" src="${path }/resources/upload/store/${f.S_IMG}" width="100%" height="100%"/>
													        </div>
													    	</c:forEach>
												    	</div>
			                  						</th>
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">승인 상태</th>
			                  						<th class="store-enroll-info">
			                  							<c:out value="${s.S_ENROLLSTATUS }"/>
			                  						</th>
			                  					</tr>
			                  					<tr>
			                  						<th class="store-enroll-info-title">등록일</th>
			                  						<th class="store-enroll-info">
			                  							<c:out value="${s.S_ENROLLDATE }"/>
			                  						</th>
			                  					</tr>
			                  					<tr>
			                  						<th colspan="2" style="text-align: center;">
			                  						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#checkPw" onclick="saveNo(${s.S_NO});" >수정하기</button>
			                  						</th>
			                  					</tr>
			                  				</table>
		                  				
	                  				
	                  				
	                  			</form>
							</div>
                  		</div>                  		
					
                    </div>
                    </c:forEach>
                    </c:if>
            </div>	
   		</div>
   	</div>
   	
   	
   	

	
	<div class="modal" id="checkPw">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      
	      <div class="modal-header">
	        <h4 class="modal-title">비밀번호 입력</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      
	      <div class="modal-body">
	        	비밀번호 입력 : <input type="password" name="pw" id="pw">
 	      </div>
	
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-success" data-dismiss="modal" onclick="checkpw();">수정하기</button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	   	
   	
   	
    </section>
    
    
    
     <jsp:include page="/WEB-INF/views/business/Js/storedetailJs.jsp"/>
    <%@include file="../common/footer.jsp" %>