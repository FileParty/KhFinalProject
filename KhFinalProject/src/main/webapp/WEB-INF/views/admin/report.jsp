<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%
	/* session.setAttribute("userId", "user01"); */
%>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	    /*중복아이디체크관련*/
		    div#idMsg-container{position:relative; padding:0px;}
		    div#idMsg-container span.idMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
		    div#idMsg-container span.ok{color:green;}
		    div#idMsg-container span.no{color:red;}
		    
		    #notice{
		    	color:rgb(34, 190, 241);
		    }
		    
		    #content{
		    	width:100%;
		    	text-align:center;
		    	table-layout: fixed;
		    }
		    
		    #content td{
		    	overflow:hidden;
		    	text-overflow: ellipsis;
		    	white-space: nowrap;
		    }
		    
		    
		    
		    
</style>

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
								<h2>신고된 리뷰 현황</h2>
							</td>
						</tr>
						
						<style>
							table th{
						    	text-align:center;
						    }
						</style>
					
						<tr>
							<th><input id="all" type="checkbox" name="all"></td></th>
							<th>신고번호</th>
							<th>리뷰코드</th>
							<th>리뷰종류</th>
							<th>신고자코드</th>
							<th>대상코드</th>
							<td></td>
						</tr>
						<form action="${path}/admin/updateReport.do" method="post" onsubmit="return confirm();">
							<c:forEach items="${list }" var="r">
								<tr class="apply-store-data">
									<td><input type="checkbox" name="re_no" value="${r['RE_NO'] }" onclick="checkbox();"></td>
									<td><c:out value="${r['RE_NO'] }"/></td>
									<td><c:out value="${r['R_NO'] }"/></td>
									<td style="display:none"><input type="checkbox" name="r_no" value="${r['R_NO'] }"></td>
									<td><c:out value="${r['RE_CONTENT'] }"/></td>
									<td><c:out value="${r['M_SEND'] }"/></td>
									<td><c:out value="${r['M_RECEIVER'] }"/></td>
									<td>
										<button type="button" class="apply-store-info-btn" onclick="reportDetail(${r['R_NO']})">상세</button>
									</td>
								</tr>
							</c:forEach>
							
							<input type="hidden" name="flag">
							
							<tr>
								<td colspan="7">
									<input type="submit" name="action" value="리뷰비활성화"/> <input type="submit" name="action" value="신고해제"/>
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
	
	                <div class="col-md-2"></div>
	                <div class="col-md-8">
	
	                   <table id="table_con" class="table" style="table-layout:fixed">
           					<tr>
           						<th class="store-enroll-info-title">리뷰코드</th>
           						<th class="store-enroll-info" id="reviewNo"></th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">작성시기</th>
           						<th class="store-enroll-info" id="reviewDate"></th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">작성자 코드</th>
           						<th class="store-enroll-info" id="reviewC"></th>
           					</tr>
           					
           					<tr>
           						<th class="store-enroll-info-title">리뷰 대상 코드</th>
           						<th class="store-enroll-info" id="reviewObject"></th>
           					</tr>
           					
           					<tr>
           						<th class="store-enroll-info-title">별점</th>
           						<th class="store-enroll-info" id="Score"></th>
           					</tr>
           					
           					<tr>
           						<th class="store-enroll-info-title">리뷰내용</th>
           						<th class="store-enroll-info" id="reviewContent"></th>
           					</tr>
           					<tr>
           						<th class="store-enroll-info-title">답글내용</th>
           						<th class="store-enroll-info" id="reviewReply"></th>
           					</tr>
           				</table>
	
	                </div>
	                <div class="col-md-2"></div>
	            </div>
	            <div class="modal_layer"></div>
	        </div>
       
    	</div>

<script>

	function reportDetail(r_no){
		$.ajax({
			url:"${path}/admin/reviewDetail.do",
			data:{"r_no":r_no},
			success:function(data){
				console.log(data);
				
				$("#reviewNo").html(data.r_NO);
				$("#reviewDate").html(data.r_DATE);
				$("#reviewC").html(data.m_NO);
				$("#reviewObject").html(data.s_NO);
				$("#Score").html("맛: " + data.r_SCORE_TASETE + " 양: " +  data.r_SCORE_AMOUNT + " 배달: " + data.r_SCORE_DELIVERY);
				$("#reviewContent").html(data.r_TEXT);
				$("#reviewReply").html(data.r_REPLY);
				
				$("#modal").show();
				
			},
			error:function(a,b,c){
				console.log(a);
				console.log(b);
				console.log(c);
				
			}
		})
		
	}
	
	$(".modal_layer").click(function(){
		$("#modal").attr("style", "display:none");
	});

	function confirm(){
		
		var flag = false;
		
		for(let i=0; i<$("input[name=re_no]").length; i++){
			if($($("input[name=re_no]")[i]).is(":checked")==true){
				flag = true;
			}
		}
		
		if(flag==false){
			alert("가게를 선택하세요");
		}
		
		return flag;
	}
	
	function checkbox(){
		if(event.target.checked==true){
			event.target.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.checked=true;
		}else{
			event.target.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.firstChild.checked=false;
		}
	}
	
	$("#all").click(function(){
		if($("#all").is(":checked")==true){
			for(let i=0; i<$("input[name=re_no]").length; i++){
				$($("input[name=re_no]")[i]).prop("checked", true);
			}
		}else{
			for(let i=0; i<$("input[name=re_no]").length; i++){
				$($("input[name=re_no]")[i]).prop("checked", false);
			}
		}
	});
	
	
	
	$(function(){
		if("${msg}"!="없음")
			alert("${msg}");
	});

</script>

<style>
    	
    		 #modal {
		      position:fixed;
		      top: 50px;
		      width:100%;
		      height:100%;
		      z-index:10;
		    }
    
		    #modal h2 {
		      margin:0;   
		    }
		    
		    #modal button {
		      display:inline-block;
		      width:100px;
		      margin-left:calc(100% - 100px - 10px);
		    }
		    
		    #modal .modal_content {
		      width:600px;
		      height: 50%;
		      margin:100px auto;
		      padding:20px 10px;
		      background:#fff;
		      border:2px solid #666;
		      overflow-y: scroll;
		      overflow-x: hidden;
		    }
		    
		    #modal .modal_layer {
		      position:fixed;
		      top:0;
		      left:0;
		      width:100%;
		      height:100%;
		      background:rgba(0, 0, 0, 0.5);
		      z-index:-1;
		    }   
		    
		    #modal th{
		    	text-align:center;
		    }
		    
		    table td{
		    	text-align:center;
		    }
		    
		    #table_con th,tr{
		    	vertical-align:middle;
		    }
    	
    	</style>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>