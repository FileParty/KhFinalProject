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
<%-- <fmt:formatDate value="${(o.time-odate.time)/(24*60*60*1000)}" pattern="yyyy/MM/dd HH:mm:ss" var="sysdate"/>
${sysdate }  --%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	    /*중복아이디체크관련*/
		    div#idMsg-container{position:relative; padding:0px;}
		    div#idMsg-container span.idMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
		    div#idMsg-container span.ok{color:green;}
		    div#idMsg-conta  iner span.no{color:red;}
		    
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
                           <fmt:formatDate value="${m['O_DATE'] }" pattern="yyyy/MM/dd HH:mm" var="zdate"/>
                           <fmt:formatDate value="${m['O_DATE'] }" pattern="yyyy/MM/dd HH:mm:ss" var="ndate"/>
                           <fmt:parseDate value="${ndate }" pattern="yyyy/MM/dd HH:mm:ss" var="rdate"/>
                           <p style="text-align: right; width:100%" class="${(o.time-rdate.time)/(60*1000)<180?'':'d-none'}"><button class="reviewInsertButton" onclick="reviewInsertModal('${m['S_NO']}', '${m['M_NO'] }', '${m['O_NO'] }');">리뷰쓰기</button></p>
                           <table style="width:100%">
                               <tr>
                                   <td><img width="80" height="80" src="${path }/resources/upload/store/${m['S_LOGIMG']}"/></td>
                                   <td style="text-align: right;">
                                       <p style="text-align: right;"><strong>${zdate}</strong></p>
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
                    	<form name="review" action="${path}/mypage/insertReview.do" method="post" onsubmit="return confirm();"  enctype="multipart/form-data" >
                    		<input id="s_no" name="s_no" type="hidden" /><input id="m_no" name="m_no" type="hidden" /><input id="o_no" name="o_no" type="hidden" />
	                        <p style="text-align: center;"><strong></strong></p>
	                        <table id="modal-tbl" style="width:100%">
	                            <tr>
	                                <th style="text-align:center;"><h3>${loginMember.m_Nickname }</h3></th>
	                            </tr>
	                            
	                            <tr><td><br></td></tr>
	                            
	                            <tr>  
	                                <th id="scoreTaste" style="text-align:center;">
	                                	<h3 style="display:inline; vertical-align:middle">맛: </h3>
	                                	<input type="hidden" id="taste" name="taste" value="0">
	                                </th>
	                            </tr>
	                            <tr>  
	                                <th id="scoreAmount" style="text-align:center;">
	                                	<h3 style="display:inline; vertical-align:middle">양: </h3>
	                                	<input type="hidden" id="amount" name="amount" value="0">
	                                </th>
	                            </tr>
	                            <tr>  
	                                <th id="scoreDelivery" style="text-align:center;">
	                                	<h3 style="display:inline; vertical-align:middle">배달: </h3>
	                                	<input type="hidden" id="delivery" name="delivery" value="0">
	                                </th>
	                            </tr>
	                            
	                            <tr><td><br></td></tr>
	                            
	                            <tr>
	                            	<td><textarea cols="38" rows="10" id="reviewCon" name="reviewCon" placeholder="솔직한 리뷰 작성해주세요~~"></textarea></td>
	                            </tr>
	                        </table>
	                        
	                        <div id="preview" style="width:130%; height:100%; text-align:center; margin-left:50%; transform:translateX(-50%);" >
	                        	
	                        </div>
	                        
	                        <div id="fileUp" class="border border-dark rounded row justify-content-center align-items-center" style="width:100px; height:100px; margin-left:50%; transform:translateX(-50%); margin-top:10px;">
	                        
	                        	<div style="margin-top:20px">
	                        		<img src="${path }/resources/img/mypage/picture.PNG" />
	                        	</div>
	                        	<p>사진추가</p>
	                        </div>
	                        <div style="text-align:center; margin-top:10px;">
	                        	<input type="hidden" value="">
	                        	<input type="submit" value="작성완료">
							</div>
	                        <!-- <input id='upload0' type='file' name='upload' class='rounded d-none'>
	                        <input id='upload1' type='file' name='upload' class='rounded d-none'>
	                        <input id='upload2' type='file' name='upload' class='rounded d-none'> -->
	                        
	                        
	                        
	                        
	                        
	                    </div>
	                    <div class="col-md-2"></div>
            		</form>
            	</div>
            <div class="modal_layer"></div>
        </div>
        
        
        <!--  -->
        
        
        <div id="modal3" style="display: none;">
            <div class="modal_content">
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <p style="text-align: center;"><strong></strong></p>
                        <table id="modal-tbl" style="width:100%">
                            <tr>
                                <td><img width="100px" height="100px"/></td>
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
        
        
        <!--  -->
        
        <script>
        
        	
        	var img_count = 0;
        	
        	var preview = $("#preview");
        	
        	 function chk_file_type(obj) {
        		 var file_kind = obj.value.lastIndexOf('.');
        		 var file_name = obj.value.substring(file_kind+1,obj.length);
        		 var file_type = file_name.toLowerCase();



        		 var check_file_type = check_file_type=['jpg','gif','png','jpeg','bmp'];

        		 



       			if(check_file_type.indexOf(file_type)==-1){
        		  alert('이미지 파일만 선택할 수 있습니다.');
        		  var parent_Obj=obj.parentNode
        		  var node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
        		  return false;
       			}
       			
       			return true;
       		} 
        	
        	function confirm(){
        		if($("#taste").val()==0 || $("#amount").val()==0 || $("#delivery").val()==0){
        			alert("별점을 입력해주세요!");
        			return false;
        		}
        		
        		if($("#reviewCon").val()==""){
        			alert("리뉴 내용을 작성해주세요");
        			return false;
        		}
        	}
        	
        	
        	$("#fileUp").on("click", function(){
        		$("#upload"+img_count).remove();
        		$("#fileUp").after("<input id='upload"+ img_count +"' type='file' name='upload' class='rounded d-none' accept='image/jpeg,image/gif,image/png' onchange='img_preview(this);'/>");
        		$("#upload" + img_count).click();
        		
        		console.log($("#upload" + img_count));
        		console.log(img_count);
        		
        		
        		if(document.getElementById("upload"+img_count).files.length==0){
					        			
        		}
        		
        	});
        	
        	
        	function img_preview(obj){
        		
        		var flag = chk_file_type(obj);
        		if(!flag){
        			return;
        		}
        		
        		var upload = $("#upload"+img_count);
        		
        		var getFile = event.target.files;
        		
        		var image = document.createElement('img');
        		
        		var reader = new FileReader();
        		
        		 /* reader 시작시 함수 구현 */
                reader.onload = (function (aImg) {
                    console.log(1);
         
                    return function (e) {
                        console.log(3);
                        /* base64 인코딩 된 스트링 데이터 */
                        aImg.src = e.target.result;
                        aImg.width = 100;
                        aImg.height = 100;
                        aImg.style.marginTop = 10;
                    }
                })(image)
         
                if(getFile){
                    /* 
                        get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
                        onload 에 설정했던 return 으로 넘어간다.
                                                        이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
                    */
                    reader.readAsDataURL(getFile[0]);
                    console.log(2);
                }
        		
        		if(img_count%3==0){
        			$("#preview").append("<div id='img_"+ img_count +"' style='width:100%; height:100%; display:inline;'></div>");
        			$("#img_"+img_count).append(image);
        		}
        		else if(img_count%3==1){
        			image.style.marginLeft = 10;
        			$("#img_"+(img_count-1)).append(image);
        		}else{
        			image.style.marginLeft = 10;
        			$("#img_"+(img_count-2)).append(image);
        		}
        		
        		
        		if(event.target.files.length == 0){
        			
        			
        		}else{
        			img_count++;
        		}
        	}
        	
        	
        	
        
	        function scoreTasteSet(no){
	        	
	        	$("#scoreTaste").children("svg").remove();
	        	
	        	if(no==0){
	        		
	        		for(var i=0; i<1; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=1; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#taste").val(1);
	        		
	        	}else if(no==1){
	        		
	        		for(var i=0; i<2; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=2; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#taste").val(2);
	        	}else if(no==2){
	        		
	        		for(var i=0; i<3; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=3; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#taste").val(3);
	        	}else if(no==3){
	        		
	        		for(var i=0; i<4; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=4; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#taste").val(4);
	        	}else if(no==4){
	        		
	        		for(var i=0; i<5; i++){
	        			$("#scoreTaste").append("<svg style='margin-right:3px;' onclick='scoreTasteSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		$("#taste").val(5);
	        	}
	        }
	        
			function scoreAmountSet(no){
	        	
	        	$("#scoreAmount").children("svg").remove();
	        	
	        	if(no==0){
	        		
	        		for(var i=0; i<1; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=1; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#amount").val(1);
	        	}else if(no==1){
	        		
	        		for(var i=0; i<2; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=2; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#amount").val(2);
	        	}else if(no==2){
	        		
	        		for(var i=0; i<3; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=3; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#amount").val(3);
	        	}else if(no==3){
	        		
	        		for(var i=0; i<4; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		for(var i=4; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
	        		}
	        		$("#amount").val(4);
	        	}else if(no==4){
	        		
	        		for(var i=0; i<5; i++){
	        			$("#scoreAmount").append("<svg style='margin-right:3px;' onclick='scoreAmountSet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
	        		}
	        		$("#amount").val(5);
	        	}
	        }
	        
			function scoreDeliverySet(no){
				
				$("#scoreDelivery").children("svg").remove();
				
				if(no==0){
					
					for(var i=0; i<1; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					for(var i=1; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
					}
					$("#delivery").val(1);
				}else if(no==1){
					
					for(var i=0; i<2; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					for(var i=2; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
					}
					$("#delivery").val(2);
				}else if(no==2){
					
					for(var i=0; i<3; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					for(var i=3; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
					}
					$("#delivery").val(3);
				}else if(no==3){
					
					for(var i=0; i<4; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					for(var i=4; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path fill-rule='evenodd' d='M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 00-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 00-.163-.505L1.71 6.745l4.052-.576a.525.525 0 00.393-.288l1.847-3.658 1.846 3.658a.525.525 0 00.393.288l4.052.575-2.906 2.77a.564.564 0 00-.163.506l.694 3.957-3.686-1.894a.503.503 0 00-.461 0z' clip-rule='evenodd'/></svg>");
					}
					$("#delivery").val(4);
				}else if(no==4){
					
					for(var i=0; i<5; i++){
						$("#scoreDelivery").append("<svg style='margin-right:3px;' onclick='scoreDeliverySet("+ i +")' id='score"+ i +"' class='bi bi-star-fill' width='30px' height='30px' viewBox='0 0 16 16' fill='currentColor' xmlns='http://www.w3.org/2000/svg'><path d='M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z'/></svg>");	        			
					}
					$("#delivery").val(5);
				}
			}
	        
	        
        
	        function reviewInsertModal(s_no, m_no, o_no){
	        	
	        	$("#scoreTaste").children("svg").remove();
	        	$("#scoreAmount").children("svg").remove();
	        	$("#scoreDelivery").children("svg").remove();
	        	
	        	$("#s_no").val(s_no);
	        	$("#m_no").val(m_no);
	        	$("#o_no").val(o_no);	        	
	        	
	        	
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
            	
            	console.log("실행");
            	
            	if(event.target.className=='reviewInsertButton')
                    return;
            	
            	$("#menu-tbl").html("<tr><th style='text-align: center;' colspan='2'>메뉴</th></tr>");
            	
            	
            	var o_no = ($(this).find("input"))[0].value;
            	
            	const strong = $(this).find("strong");
            	const modalStrong=$("#modal").find("strong");
            	let src = $(this).find("img").attr("src");
            	
            	
           		
           		$("#modal").find("img").attr("src", src);
           		$("#modal").find("img").attr("width", "100");
           		$("#modal").find("img").attr("height", "100");
            	
				$.ajax({
			
				    url: "${path}/mypage/orderMenu.do",
				    type: "POST",
				    data: {"o_no":o_no},
				    success: function(data){
						/* console.log(data[0]['1_1']); */
						
						var option = new Array();
						
						
						
						for(let i=0; i<data.length; i++){
							option = data[i]['SD_ARRAY'].split(',');
							$("#menu-tbl").append("<tr><td style='text-align: left;' class='menu_con'><img width='100' height='100' src='${path}/resources/upload/business/" + data[i]['ME_LOGIMG'] + "'></td><td style='text-align: right; vertical-align:middle;' class='menu_con'>" + data[i]['ME_NAME'] + "</td></tr>");
							
							if(option.length>0){
								
							}
							
							
							for(let j=0; j<option.length; j++){
								if(j==0)
									$("#menu-tbl").append("<tr><th colspan='2' style='text-align:center;'>추가옵션");	
								$("#menu-tbl").append("<tr><td colspan='2' style='text-align:right;' class='modalOption' style='text-align: left'>");
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
            
            $("#modal2").click(function(){
            	
            	if(event.target.className!="modal_layer")
            		return;
            		
            	
            	
            	 $("#modal2").attr("style", "display:none");
                 $("body").attr("style","overflow-y:scroll");
            })
    
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
        
         #modal3 {
          position:fixed;
          top: 50px;
          width:100%;
          height:100%;
          z-index:1;
        }
        
        #modal3 h2 {
          margin:0;   
        }
        
        #modal3 button {
          display:inline-block;
          width:100px;
          margin-left:calc(100% - 100px - 10px);
        }
        
        #modal3 .modal_content {
          width:450px;
          height: 50%;
          margin:100px auto;
          padding:20px 10px;
          background:#fff;
          border:2px solid #666;
          overflow-y: scroll;
          overflow-x: hidden;
        }
        
        #modal3 .modal_layer {
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