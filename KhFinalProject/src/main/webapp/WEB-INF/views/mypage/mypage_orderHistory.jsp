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
<fmt:parseDate value="2020/05/01 00:00:00" pattern="yyyy/MM/dd HH:mm:ss" var="odate"/>
${(o.time-odate.time)/(60*1000)}
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
                       <div id="order_content_"+${m['o_no']} class="col-md-8 order_content" style="border: 1px solid black; height:200px;">
							<input type="hidden" value="${m['o_no']}"/>
                           <p style="text-align: center;"><strong>${m['S_NAME'] }</strong></p>
                           <%-- <fmt:parseDate value="${2020-05-01 }" pattern="yyyy/MM/dd HH:mm:ss" var="odate"/> --%>
                           <p style="text-align: right; width:100%" class="${(o.time-odate.time)/(60*1000)<180?'':'d-none'}"><button onclick="reviewInsert('${m['o_no']}');">리뷰쓰기</button></p>
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
					
                    <div class="col-md-6 row">
				
                        <div class="col-md-2"></div>
                        <div id="order_content_1" class="col-md-8 order_content" style="border: 1px solid black; height:200px;">
							<input type="hidden" value="1"/>
                            <p style="text-align: center;"><strong>바나프레소</strong></p>
                            <p style="text-align: right; width:100%" <%-- class="${상태=='n' && 주문 시간이 1시간이네 ?'':'d-none'}" --%>><button onclick="test();">리뷰쓰기</button></p>
                            <table style="width:100%">
                                <tr>
                                    <td><img src="${path }/resources/upload/mypage/menu.PNG"/></td>
                                    <td style="text-align: right;">
                                        <p style="text-align: right;"><strong>2020.05.11</strong></p>
                                        <p style="text-align: right;"><strong>30,000원</strong></p>
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <div class="col-md-2"></div>

                    </div>
                    
                    <div class="col-md-6 row">

                        <div class="col-md-2"></div>
                        <div id="order_content_2" class="col-md-8" style="border: 1px solid black; height:200px;;">

                            <p style="text-align: center;"><strong>바나프레소</strong></p>
                            <table style="width:100%">
                                <tr>
                                    <td><img src="${path }/resources/upload/mypage/menu.PNG"/></td>
                                    <td style="text-align: right;">
                                        <p style="text-align: right;"><strong>2020.05.11</strong></p>
                                        <p style="text-align: right;"><strong>30,000원</strong></p>
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <div class="col-md-2"></div>

                    </div>

                    <div class="col-md-12" style="height: 50px;"></div>
                    
                    <div class="col-md-6 row">

                        <div class="col-md-2"></div>
                        <div class="col-md-8" style="border: 1px solid black; height:200px;">

                            <p style="text-align: center;"><strong>바나프레소</strong></p>
                            <p style="text-align: right; width:100%"></p>
                            <table style="width:100%">
                                <tr>
                                    <td><img src="${path }/resources/upload/mypage/menu.PNG"/></td>
                                    <td style="text-align: right;">
                                        <p style="text-align: right;"><strong>2020.05.11</strong></p>
                                        <p style="text-align: right;"><strong>30,000원</strong></p>
                                    </td>
                                </tr>
                            </table>

                        </div>
                        <div class="col-md-2"></div>

                    </div>
                    
                </div>
                
                


            </div>

            <div class="col-md-1"></div>
            
            <div id="page-container" class="col-md-12">
        		${pageBar }
	        </div>

        </div>
        

        <%-- <div id="modal" style="display: none;">
   
            <div class="modal_content">
                <div class="row">

                    <div class="col-md-2"></div>
                    <div class="col-md-8">

                        <p style="text-align: center;"><strong>바나프레소</strong></p>
                        <table style="width:100%">
                            <tr>
                                <td><img src="${path }/resources/upload/mypage/menu.PNG"/></td>
                                <td style="text-align: right;">
                                    <p style="text-align: right;"><strong>2020.05.11</strong></p>
                                    <p style="text-align: right;"><strong>30,000원</strong></p>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <table class="table">
                            <tr>
                                <th style="text-align: left;">메뉴</th>
                            </tr>
                            <tr>
                                <td style="text-align: center;">메뉴 1</td>
                            </tr>
                            <tr>
                                <td style="text-align: center;">메뉴 2</td>
                            </tr>
                            <tr>
                                <td style="text-align: center;">메뉴 3</td>
                            </tr>
                            <tr>
                                <td style="text-align: center;">메뉴 4</td>
                            </tr>

                        </table>

                    </div>
                    <div class="col-md-2"></div>

                </div>
               
            </div>
           
            <div class="modal_layer"></div>
        </div> --%>
        
        
        
        <!--  -->
        
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
                            <tr>
                                <th style="text-align: left;"></th>
                            </tr>
                            <tr>
                                <td style="text-align: center;"></td>
                            </tr>
                            <tr>
                                <td style="text-align: center;"></td>
                            </tr>
                            <tr>
                                <td style="text-align: center;"></td>
                            </tr>
                            <tr>
                                <td style="text-align: center;"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-2"></div>
            </div>
            <div class="modal_layer"></div>
        </div>
        
        
        <!--  -->
        
        
        
        
    
        <script>

            function test(){
                event.stopPropagation();
            }
    
        
            $(".order_content").on("click",function(){
            	
            	var o_no = $(this).find("input").val();
            	
				$.ajax({
			
				    url: "${path}/mypage/orderMenu.do",
				    type: "POST",
				    data: {"o_no":o_no},
				    success: function(data){
						console.log(data);
				    },
			
				    error: function (request, status, error){     
				    }
			
				});
            	
            	/* const table=$(this).children("table"); */
            	const strong = $(this).find("strong");
            	const modalStrong=$("#modal").find("strong");
            	
            	let sName = strong[0].innerHTML;
            	let date = strong[1].innerHTML;
            	let price = strong[2].innerHTML;
            	
            	let src = $(this).find("img").attr("src");
           		
           		modalStrong[0].innerHTML = sName;
           		modalStrong[1].innerHTML = date;
           		modalStrong[2].innerHTML = price;
           		
           		$("#modal").find("img").attr("src", src);
           		
           		           		
           		
            	//console.log($(table).find("strong")[1].html());
            	
            	
                $("#modal").attr("style", "display:flex");
                $("body").attr("style","overflow-y:hidden");
            });
    
            $("#modal").click(function(){
                $("#modal").attr("style", "display:none");
                $("body").attr("style","overflow-y:scroll");
            });
            
            
            function reviewInsert(o_no){
            	
            	$.ajax({
            		url:""
            	})
            	
            	
            	var div = "<div id='modal'>";
            	div += "<div class='modal_content'>";
                div += "<div class='row'>";
                div += "<div class='col-md-2'></div>";
                div += "<div class='col-md-8'>";
                div += "<p style='text-align: center;'><strong>"+  +"</strong></p>";
                div += "<table style='width:100%'>";
                div += "<tr>";
                div += "<td><img src='${path }/resources/upload/mypage/menu.PNG'/></td>";
                div += "<td style='text-align: right;'>";
                div += "<p style='text-align: right;'><strong>2020.05.11</strong></p>";
                div += "<p style='text-align: right;'><strong>30,000원</strong></p>";
                div += "</td>";
                div += "</tr>";
                div += "</table>";
                div += "<br>";
                div += "<table class='table'>";
                div += "<tr><th style='text-align: left;'>메뉴</th></tr>";
                div += "<tr><td style='text-align: center;'>메뉴 1</td></tr>";
                div += "<tr><td style='text-align: center;'>메뉴 2</td></tr>";
                div += "<tr><td style='text-align: center;'>메뉴 3</td></tr>";
                div += "<tr><td style='text-align: center;'>메뉴 4</td></tr>";
                div += "</table>";
                div += "</div>";
                div += "<div class='col-md-2'></div>";
                div += "</div>";
                div += "<div class='modal_layer'></div>";
                div += "</div>";
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
        </style>

    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>