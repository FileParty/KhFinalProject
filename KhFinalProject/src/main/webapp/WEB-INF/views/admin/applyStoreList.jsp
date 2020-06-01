<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/applyStoreList.css"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section>

	

    <div class="row">
        <div class="col-md-1"></div>

        <div class="row col-md-10">

            <jsp:include page="adminSideBar.jsp"/>

            <div class="col-md-10 row" style="border: 1px solid black;">
                
				<hr/>
				<div id="apply-store-list">
					<table id="content" class="table" id="apply-store-tbl">
					
						<tr>
							<td colspan="7">
								<h2>가게 신청목록</h2>
							</td>
						</tr>
						
						<style>
							table th{
						    	text-align:center;
						    }
						</style>
					
						<tr>
							<th><input class="apply-store-ok-btns"  id="all" type="checkbox" name="all"></td></th>
							<th>가게명</th>
							<th>가게위치</th>
							<th>가게소개</th>
							<th>신청일</th>
							<th>카테고리</th>
							<th></th>
						</tr>
						<form action="${path}/admin/updateStoreStatus.do" method="post" onsubmit="return confirm();">
							<c:forEach items="${sList }" var="s">
								<tr class="apply-store-data">
									<td><input class="apply-store-ok-btns" type="checkbox" name="s_no" value="${s['s_No'] }"></td>
									<td><c:out value="${s['s_Name'] }"/></td>
									<td><c:out value="${s['s_Addr'] }"/></td>
									<td><c:out value="${s['s_Text'] }"/></td>
									<td><fmt:formatDate value="${s['s_EnrollDate']}" pattern="yy/MM/dd"/></td>
									<td>
										<c:forEach items="${s['s_category'] }" var="cate">
											<c:out value="${cate}"/>
										</c:forEach>
									</td>
									<td>
										<button type="button" class="apply-store-info-btn" onclick="applyStoreInfo(${s['s_No']})">상세</button>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="7">
									<input type="submit" value="승인"/>
								</td>
							</tr>
						</form>
					</table>
				</div>

            </div>


        </div>

        <div class="col-md-1"></div>

    </div>

</section>

	    <div id="modal" style="display: none;">
   
	        <div class="modal_content">
	            <div class="row">
	
	                <div class="col-md-1"></div>
	                <div class="col-md-10">
	
	                   <table id="table_con" class="table" style="table-layout:fixed">
           					<tr>
           						<th class="store-enroll-info-title">사업자번호</th>
           						<th class="store-enroll-info" id="b_businesscode"><c:out value="${s.S_NAME }" /></th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">사업자명</th>
           						<th class="store-enroll-info" id="b_name"><c:out value="${s.S_NAME }" /></th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">사업자이메일</th>
           						<th class="store-enroll-info" id="b_email"><c:out value="${s.S_NAME }" /></th>
           					</tr>
           					
           					<tr>
           						<th class="store-enroll-info-title">상호명</th>
           						<th class="store-enroll-info" id="s_name"><c:out value="${s.S_NAME }" /></th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">주소</th>
           						<th class="store-enroll-info" id="s_addr"><c:out value="${s.S_ADDR }" /></th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">연락처</th>
           						<th class="store-enroll-info" id="s_phone"><c:out value="${s.S_PHONE }" /></th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">종목명</th>
           						<th class="store-enroll-info" id="s_category">
           						</th>
           					</tr>
           					
           					<tr>
           						<th class="store-enroll-info-title">쿠폰사용여부</th>
           						<th class="store-enroll-info" id="s_coupon">
           						</th>
           					</tr>
           					
           					<tr>
           						<th class="store-enroll-info-title">최소금액</th>
           						<th class="store-enroll-info" id="s_limitprice"><fmt:formatNumber maxFractionDigits="3" value="${s.S_LIMITPRICE }" /> 원</th>
           					</tr> 
           					<tr>
           						<th class="store-enroll-info-title">결제방법</th>
           						<th class="store-enroll-info" id="s_payopt"><c:out value="${s.S_PAYOPT }" /></th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">소개글</th>
           						<th class="store-enroll-info"><pre id="s_text"></pre></th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">원산지</th>
           						<th class="store-enroll-info"><pre id="s_orifoodinfo"><c:out value="${s.S_ORIFOODINFO }" /></pre></th>	
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">메인이미지</th>
           						<th class="store-enroll-info">
           							<div class="img_wrap">
							            <img id="s_logimg" src="${path }/resources/upload/store/${s.S_LOGIMG}" width="180px" height="100px"/>	            
							        </div>
           						</th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">소요시간</th>
           						<th class="store-enroll-info" id="s_time"><c:out value="${s.S_TIME }" />분</th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">휴무일</th>
           						<th class="store-enroll-info" id="s_holiday">
           						<c:out value="${s.S_HOLIDAY }" /></th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">오픈시간/마감시간</th>
           						<th class="store-enroll-info">
           						 <p id="s_starttime"></p> ~
           						 <p id="s_endtime"></p>
           						</th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">등록일</th>
           						<th class="store-enroll-info" id="s_enrolldate">
           						</th>
           					</tr>
           					<tr>
           						<th colspan="2">
           							<div id="store-enroll-close-btn">
           								<button id="modal-close" onclick="modalClose()">닫기</button>
           							</div>
           						</th>
           					</tr>
           				</table>
	
	                </div>
	                <div class="col-md-1"></div>
	            </div>
	            <div class="modal_layer"></div>
	        </div>
       
    	</div>
    	
    	<script>
    	
    		$("#all").click(function(){
    			if($("#all").is(":checked")==true){
    				for(let i=0; i<$("input[name=s_no]").length; i++){
    					$($("input[name=s_no]")[i]).prop("checked", true);
    				}
    			}else{
    				for(let i=0; i<$("input[name=s_no]").length; i++){
    					$($("input[name=s_no]")[i]).prop("checked", false);
    				}
    			}
    		});
    		
    		function applyStoreInfo(s_no){
    			$.ajax({
    				url:"${path}/admin/applyStoreInfo",
    				data:{"s_no":s_no},
    				success:function(data){
    					console.log(data);
    					
    					$("#b_businesscode").html(data.b_businesscode);
    					$("#b_name").html(data.b_name);
    					$("#b_email").html(data.b_email);
    					$("#s_name").html(data.s_name);
    					$("#s_addr").html(data.s_addr);
    					$("#s_phone").html(data.s_phone);
    					
    					for(let i=0; i<data.s_category.length; i++){
    						if(i!=0)
    							$("#s_category").append(" / " + data.s_category[i]);
    						else
    							$("#s_category").append(data.s_category[i]);
    					}
    					$("#s_coupon").html(data.s_coupon);
    					$("#s_limitprice").html(data.s_limitprice);
    					$("#s_payopt").html(data.s_payopt);
    					$("#s_text").html(data.s_text);
    					
    					$("#s_logimg").attr("src", "${path }/resources/upload/store/" + data.s_logimg);
    					
    					$("#s_time").html(data.s_time);
    					$("#s_orifoodinfo").html(data.s_orifoodinfo);
    					$("#s_holiday").html(data.s_holiday);
    					console.log(new Date(data['s_startTime']),new Date(data['s_endTime']));
    					let start = new Date(data['s_startTime']);
    					$("#s_starttime").text(start.getHours()+"시");
    					start = new Date(data['s_endTime']);
    					$("#s_endtime").text(start.getHours()+"시");
    					start = new Date(data['s_enrollDate']);
    					$("#s_enrolldate").html(start.getFullYear()+"/"+start.getMonth()+"/"+start.getDate());
    					
    					$("#modal").show();
    				},
    				error:function(){
    					alert("에러발생");
    				}
    			})
    			
    		}
    		
    		$(".modal_layer").click(function(){
    			$("#modal").attr("style", "display:none");
    		});
    		
    		function confirm(){
    			
    			var flag = false;
    			
    			for(let i=0; i<$("input[name=s_no]").length; i++){
	    			if($($("input[name=s_no]")[i]).is(":checked")==true){
	    				flag = true;
	    			}
    			}
    			
    			if(flag==false){
    				alert("가게를 선택하세요");
    			}
    			
    			return flag;
    		}
    		
    		$(function(){
    			if("${msg}"!="없음")
    				alert("${msg}");
    		});
    		
    		function modalClose(){
    			$("#modal").modal("hide");
    		}
    		
    	
    	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

