<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<%-- <c:set var="now" value="<%=new Date()%>" />
<c:set var="o" value="<%=new Date(new GregorianCalendar(2020,4,12).getTimeInMillis())%>" />
<fmt:parseDate value="2020/05/01 00:00:00" pattern="yyyy/MM/dd HH:mm:ss" var="odate"/>
${(o.time-odate.time)/(24*60*60*1000)}
<fmt:formatDate value="${now}" pattern="yyyy/MM/dd HH:mm:ss" var="sysdate"/>  --%>

<c:set var="o" value="<%=new Date(new GregorianCalendar().getTimeInMillis())%>" />
<fmt:parseDate value="2020/05/18 00:00:00" pattern="yyyy/MM/dd HH:mm:ss" var="odate"/>
${(o.time-odate.time)}
분차${(o.time-odate.time)/(60*1000)}
시차${(o.time-odate.time)/(24*60*1000)}
일차${(o.time-odate.time)/(24*24*60*1000)}
${o.time/(24*24*60*1000) }
${odate.time/(24*24*60*1000) }
<%-- <fmt:formatDate value="${(o.time-odate.time)/(24*60*60*1000)}" pattern="yyyy/MM/dd HH:mm:ss" var="sysdate"/>
${sysdate }  --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	    /*중복아이디체크관련*/
		    div#idMsg-container{position:relative; padding:0px;}
		    div#idMsg-container span.idMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
		    div#idMsg-container span.ok{color:green;}
		    div#idMsg-container span.no{color:red;}
		    
</style>


<section>

    <div class="row">
        <div class="col-md-1"></div>

        <div class="row col-md-10">

            <jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/>
            <div class="col-md-10 row">
            
				<c:forEach items="${list }" var="m">
					<div class="col-md-6 row">

                       <div class="col-md-2"></div>
                       <div class="col-md-8 order_content" style="border: 1px solid black; height:200px;">
							<input type="hidden" value="${m['O_NO']}"/>
                           <p style="text-align: center;"><strong>${m['S_NAME'] }</strong></p>
                           <fmt:formatDate value="${m['O_DATE'] }" pattern="yyyy/MM/dd HH:mm:ss" var="ndate"/>
                           <fmt:parseDate value="${ndate }" pattern="yyyy/MM/dd HH:mm:ss" var="rdate"/>
                           <p>${(o.time-rdate.time)/(60*1000) }</p>
                           <p style="text-align: right; width:100%" class="${(o.time-rdate.time)/(60*1000)<180?'':'d-none'}"><button class="reviewInsertButton" onclick="reviewInsertModal('${m['O_NO']}', '${m['M_NO'] }');">리뷰쓰기</button></p>
                           <table style="width:100%">
                               <tr>
                                   <td><img src="${path }/resources/upload/mypage/${m['S_LOGIMG']}"/></td>
                                   <td style="text-align: right;">
                                       <p style="text-align: right;"><strong>${m['O_DATE'] }</strong></p>
                                       <p style="text-align: right;"><strong>${m['O_PAYPRICE'] }원</strong></p>
                                   </td>
                               </tr>
                           </table>

                       </div>
                       <div class="col-md-2"></div>
                   </div>
				</c:forEach>
				
                </div>
                
                


            </div>

            <div class="col-md-1"></div>
            
            <div id="page-container" class="col-md-12">
        		${pageBar }
	        </div>

        </div>
        
        <div id="modal" style="display: none;">
            <div class="modal_content">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <p style="text-align: center;"><strong></strong></p>
                        <table id="modal-tbl" style="width:100%">
                            <tr>
                                <td><img/></td>
                                <td style="text-align: right;">
                                    <p style="text-align: right;"><strong></strong></p>
                                    <p style="text-align: right;"><strong></strong></p>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <table class="table" id="menu-tbl">
                        </table>
                    </div>
                    <div class="col-md-2"></div>
            	</div>
            <div class="modal_layer"></div>
        	</div>
        </div>
        
        <div id="modal2" style="display: none;">
            <div class="modal_content">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                    	<form name="review" action="${path}/mypage/insertReview.do" method="post" onsubmit="return validate();"  enctype="multipart/form-data" >
                    		<input id="o_no" type="hidden" /><input id="m_no" type="hidden" />
	                        <p style="text-align: center;"><strong></strong></p>
	                        <table id="modal-tbl" style="width:100%">
	                            <tr>
	                                <th style="text-align:center;">${loginMember.m_nickname }</th>
	                            </tr>
	                            
	                            <tr><td><br></td></tr>
	                            
	                            <tr>  
	                                <th id="scoreTaste" style="text-align:center;">
	                                	<h3 style="display:inline; vertical-align:middle">맛: </h3>
	                                </th>
	                            </tr>
	                            <tr>  
	                                <th id="scoreAmount" style="text-align:center;">
	                                	<h3 style="display:inline; vertical-align:middle">양: </h3>
	                                </th>
	                            </tr>
	                            <tr>  
	                                <th id="scoreDelivery" style="text-align:center;">
	                                	<h3 style="display:inline; vertical-align:middle">배달: </h3>
	                                </th>
	                            </tr>
	                            
	                            <tr><td><br></td></tr>
	                            
	                            <tr>
	                            	<td><textarea cols="38" rows="10" placeholder="리뷰내용을 작성해주세요"></textarea></td>
	                            </tr>
	                        </table>
	                        
	                        <div class="border border-dark fileUp rounded row justify-content-center align-items-center" style="width:100px; height:100px">
	                        
	                        	<div>
	                        		<img src="${path }/resources/img/mypage/picture.PNG"/>
	                        	</div>
	                        
	                        </div>
	                        <input id="fileIn" type="file" name="upFile" class="rounded d-none">
	                        <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
	                        
	                        
	                    </div>
	                    <div class="col-md-2"></div>
            		</form>
            	</div>
            <div class="modal_layer"></div>
        </div>
        
        
        <!--  -->
        
        <script>
        
        	var r_score_taste;
        	var r_score_amount;
        	var r_score_delivery;
        	
        	$(".fileUp").on("click", function(){
        		$("#fileIn").click();
        	});
        	
        	$(function(){
        		$('[name=upFile]').on("change",function(){
        			const fileName=this.next().files[0].name;
        			$(this).next().next(".custom-file-label").html(fileName);
        		})
        	});
        	
        
	        function scoreTasteSet(no){
	        	
	        	console.log(this);
	        	console.log(event);
	        	
	        	$("#scoreTaste").children("svg").remove();
	        	
	        	if(no==0){
	        		
	        		for(var i=0; i<1; i++){
	        			$("#scoreTaste").append("<svg onclick='scoreTasteSet("+ i +")' id='score' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=1; i<5; i++){
	        			$("#scoreTaste").append("<svg onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		
	        	}else if(no==1){
	        		
	        		for(var i=0; i<2; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=2; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		
	        	}else if(no==2){
	        		
	        		for(var i=0; i<3; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=3; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		
	        	}else if(no==3){
	        		
	        		for(var i=0; i<4; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=4; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		
	        	}else if(no==4){
	        		
	        		for(var i=0; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        	}
	        }
	        
			function scoreAmountSet(no){
	        	
	        	console.log(this);
	        	console.log(event);
	        	
	        	$("#scoreAmount").children("svg").remove();
	        	
	        	if(no==0){
	        		
	        		for(var i=0; i<1; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=1; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		
	        	}else if(no==1){
	        		
	        		for(var i=0; i<2; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=2; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		
	        	}else if(no==2){
	        		
	        		for(var i=0; i<3; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=3; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		
	        	}else if(no==3){
	        		
	        		for(var i=0; i<4; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=4; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		
	        	}else if(no==4){
	        		
	        		for(var i=0; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        	}
	        }
	        
			function scoreDeliverySet(no){
				
				console.log(this);
				console.log(event);
				
				$("#scoreDelivery").children("svg").remove();
				
				if(no==0){
					
					for(var i=0; i<1; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					for(var i=1; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
					}
					
				}else if(no==1){
					
					for(var i=0; i<2; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					for(var i=2; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
					}
					
				}else if(no==2){
					
					for(var i=0; i<3; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					for(var i=3; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
					}
					
				}else if(no==3){
					
					for(var i=0; i<4; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					for(var i=4; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
					}
					
				}else if(no==4){
					
					for(var i=0; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
				}
			}
	        
	        
        
	        function reviewInsertModal(o_no, m_no){
	        	
	        	$("#o_no").val(o_no);
	        	$("#m_no").val(m_no);
	        	
	        	$("#scoreTaste").html();
	        	$("#scoreAmount").html();
	        	$("#scoreDelivery").html();
	        	
	        	
	        	
	        	for(var i=0; i<5; i++){
        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");	        			
        		}
	        	
	        	for(var i=0; i<5; i++){
        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");	        			
        		}
	        	
	        	for(var i=0; i<5; i++){
					$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");	        			
				}
	        	
	        	$("#modal2").attr("style", "display:flex");
	            $("body").attr("style","overflow-y:hidden");
	        }
	        
	        
    
        
            $(".order_content").on("click",function(){
            	
            	if(event.target.className=='reviewInsertButton')
                    return;
            	
            	$("#menu-tbl").html("<tr><th style='text-align: center;' colspan='2'>메뉴</th></tr>");
            	
            	
            	var o_no = ($(this).find("input"))[0].value;
            	
            	const strong = $(this).find("strong");
            	const modalStrong=$("#modal").find("strong");
            	let src = $(this).find("img").attr("src");
            	
            	
           		
           		$("#modal").find("img").attr("src", src);
            	
				$.ajax({
			
				    url: "${path}/mypage/orderMenu.do",
				    type: "POST",
				    data: {"o_no":o_no},
				    success: function(data){
						/* console.log(data[0]['1_1']); */
						
						var option = new Array();
						
						
						
						for(let i=0; i<data.length; i++){
							option = data[i]['SD_ARRAY'].split(',');
							console.log(option);
							$("#menu-tbl").append("<tr><td style='text-align: left;' class='menu_con'>" + data[i]['ME_LOGIMG'] + "</td><td style='text-align: right;' class='menu_con'>" + data[i]['ME_NAME'] + "</td></tr>");
							
							if(option.length>0){
								
							}
							
							
							for(let j=0; j<option.length; j++){
								$("#menu-tbl").append("<tr><td colspan='2' class='modalOption' style='text-align: left'>");
								$($(".modalOption")[j]).append(option[j]);									
							}
							
						}
						
						
						
						
						let sName = strong[0].innerHTML;
		            	let date = strong[1].innerHTML;
		            	let price = strong[2].innerHTML;
		           		
		           		modalStrong[0].innerHTML = sName;
		           		modalStrong[1].innerHTML = date;
		           		modalStrong[2].innerHTML = price;
		            	
		            	
		                $("#modal").attr("style", "display:flex");
		                $("body").attr("style","overflow-y:hidden");
				    },
			
				    error: function (request, status, error){
				    	
				    	alert("리뷰 조회 실패");
				    	
				    }
			
				});
            	

                
            });
    
            $("#modal").click(function(){
                $("#modal").attr("style", "display:none");
                $("body").attr("style","overflow-y:scroll");
            });
            
            function reviewInsert(o_no, m_no){
            	
				$.ajax({
					
				    url: "${path}/mypage/insertReview.do",
				    type: "POST",
				    data: {"o_no":o_no, "m_no":m_no},
				    success: function(data){
				    	
				    },
			
				    error: function (request, status, error){
				    	
				    	alert("리뷰 조회 실패");
				    	
				    }
			
				});
            }
    
        </script>
    
    <style>
        #modal {
          position:fixed;
          top: 50px;
          width:100%;
          height:100%;
          z-index:1;
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
          width:450px;
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
        
         #modal2 {
          position:fixed;
          top: 50px;
          width:100%;
          height:100%;
          z-index:1;
        }
        
        #modal2 h2 {
          margin:0;   
        }
        
        #modal2 button {
          display:inline-block;
          width:100px;
          margin-left:calc(100% - 100px - 10px);
        }
        
        #modal2 .modal_content {
          width:450px;
          height: 50%;
          margin:100px auto;
          padding:20px 10px;
          background:#fff;
          border:2px solid #666;
          overflow-y: scroll;
          overflow-x: hidden;
        }
        
        #modal2 .modal_layer {
          position:fixed;
          top:0;
          left:0;
          width:100%;
          height:100%;
          background:rgba(0, 0, 0, 0.5);
          z-index:-1;
        }   
        </style>

    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>