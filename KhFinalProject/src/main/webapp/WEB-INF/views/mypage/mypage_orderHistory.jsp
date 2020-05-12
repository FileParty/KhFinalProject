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
</style>

<section>

    <div class="row">
        <div class="col-md-1"></div>

        <div class="row col-md-10">

            <jsp:include page="/WEB-INF/views/mypage/mypageSidebar.jsp"/>
            <div class="col-md-10 row">

                    <div class="col-md-6 row">

                        <div class="col-md-2"></div>
                        <div id="order_content_1" class="col-md-8" style="border: 1px solid black; height:200px;">

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
                        <div class="col-md-8" style="border: 1px solid black; height:200px;;">

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

        </div>

        <div id="modal" style="display: none;">
   
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
        </div>
    
        <script>

            function test(){
                event.stopPropagation();
            }
    
        
            $("#order_content_1").click(function (){
                $("#modal").attr("style", "display:flex");
                $("body").attr("style","overflow-y:hidden");
            });
    
            $("#modal").click(function(){
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