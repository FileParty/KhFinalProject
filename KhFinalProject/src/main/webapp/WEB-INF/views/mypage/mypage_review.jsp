<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
	    /*중복아이디체크관련*/
		    div#idMsg-container{position:relative; padding:0px;}
		    div#idMsg-container span.idMsg{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
		    div#idMsg-container span.ok{color:green;}
		    div#idMsg-container span.no{color:red;}
		    
		    #review{
		    	color:rgb(34, 190, 241);
		    }
		    * {
		    font-family:'Do Hyeon';
		    }
</style>

<section>

    <div class="row">
        <div class="col-md-1"></div>

        <div class="row col-md-10">

            <jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/>

            <div class="col-md-10 row">

				<div class="col-md-12">
                    <table class="table content table-striped" style="margin-top:10px;">
                    
                    	<tr></tr>

						<c:if test="${fn:length(list)!=0 }">
	                        <tr style="background-color:cornflowerblue;">
	                            <th style="text-align:center">날짜</th>
	                            <th style="text-align:center">상호명</th>
	                            <th style="text-align:center">별점</th>
	                            <th style="text-align:center">리뷰내용</th>
	                            <th style="text-align:center">상세보기</th>
	                        </tr>
                        </c:if>
                        
                        <c:forEach items="${list }" var="rev">
                        	<tr>
                        		<fmt:formatDate value="${rev['R_DATE'] }" pattern="yyyy/MM/dd HH:mm" var="zdate"/>
	                            <td>${zdate }</td>
	                            <td>${rev['S_NAME'] }</td>
	                            <td>맛: ${rev['R_SCORE_TASTE'] } 양: ${rev['R_SCORE_AMOUNT'] } 배달: ${rev['R_SCORE_DELIVERY'] } </td>
	                            <td>${rev['R_TEXT'] } </td>
	                            <td><button onclick="reviewDetail('${rev['R_NO']}');">상세보기</button></td>
	                        </tr>
                        	
                        </c:forEach>

                    </table>
                    <c:if test="${fn:length(list)>1 }">
	                    <div id="page-container" class="col-md-12">
				       		${pageBar }
					    </div>
				    </c:if>

                    <style>
                        .table{
                            table-layout: fixed;
                        }
                        .content td{
                            width:20%;
                            text-align: center;
                            overflow:hidden; text-overflow: ellipsis; white-space: nowrap;
                        }
                    </style>
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

                    <p style="text-align: center;"><strong></strong></p>
                    <table style="width: 100%;">
                        <tr>
                            <td><strong></strong></td>
                            <td style="text-align: right;"><strong></strong></td>
                        </tr>
                    </table>

                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel"> 
                        <div class="carousel-inner" id="reviewImg" style='margin-top:10px; margin-bottom:10px;'>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                          </a>
                          <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                          </a>
                    </div>

                    <strong style="font-weight:400"></strong>

                </div>
                <div class="col-md-2"></div>
            </div>
            <div class="modal_layer"></div>
        </div>
       
    </div>

    <script>

        function eventStop(){
            event.stopPropagation();
        }

    
        function reviewDetail(r_no){
        	
        	var content = $(event.target).parent().siblings("td");
        	const modalStrong=$("#modal").find("strong");
        	
        	for(let i=0; i<content.length; i++){
        		modalStrong[i].innerHTML = $(content[i]).html();
        	}
        	
        	$("#reviewImg").html("");
        	
        	$.ajax({
    			
			    url: "${path}/mypage/reviewImg.do",
			    type: "POST",
			    data: {"r_no":r_no},
			    success: function(data){
					
					for(let i=0; i<data.length; i++){
						if(i==0){
							$("#reviewImg").append("<div class='carousel-item active'><img class='d-block w-100' src='${path}/resources/img/mypage/review/"+ data[i] +"' width='100%' height='150px'></div>");
						}
						else{
							$("#reviewImg").append("<div class='carousel-item'><img class='d-block w-100' src='${path}/resources/img/mypage/review/"+ data[i] +"' width='100%' height='150px'></div>");
						}
						
					}
	           		$("#modal").attr("style", "display:flex");
	                $("body").attr("style","overflow-y:hidden");
			    },
		
			    error: function (request, status, error){
			    	
			    	console.log(request, status, error)
			    	alert("리뷰 조회 실패");
			    	
			    }
		
			});
            
        };

        $("#modal").click(function(){
            if(event.target.className!='modal_layer')
                return;
            $("#modal").attr("style", "display:none");
            $("body").attr("style","overflow-y:scroll");
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
    
    #modal th{
    	text-align:center;
    }
    
    table td{
    	text-align:center;
    }
    </style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>