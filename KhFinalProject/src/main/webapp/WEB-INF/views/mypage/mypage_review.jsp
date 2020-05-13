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

                    <table class="table content">

                        <tr>
                            <th>날짜</th>
                            <th>상호명</th>
                            <th>별점</th>
                            <th>리뷰내용</th>
                            <th></th>
                        </tr>

                        <tr>
                            <td>2020.xx.xx</td>
                            <td>바나프레소</td>
                            <td>별표시</td>
                            <td>ㄹㅇㄴㅁ ㄴㅇㄹ ㅇㄴㄹ  dasdsa das dasd sadsadㄴㅇㅁ ㄻㄴㅇ ㄹㄴㅇ </td>
                            <td><button id="review_content_1">상세보기</button></td>
                        </tr>

                    </table>

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

                    <p style="text-align: center;"><strong>바나프레소</strong></p>
                    <table style="width: 100%;">
                        <tr>
                            <td><strong>별점표기</strong></td>
                            <td style="text-align: right;"><strong>2020.xx.xx</strong></td>
                        </tr>
                    </table>

                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel"> 
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100" src="https://cdn.crowdpic.net/list-thumb/thumb_l_533D758A1EAC9D7F82AE6568089E296C.jpg" width="100%" height="150px">
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100" src="https://colorate.azurewebsites.net/SwatchColor/808080" width="100%" height="150px">
                            </div>
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

                    <p >리뷰내용~ㅇ로어노리ㅓㅏㅇ노 리ㅏㅗ ㅇ너ㅣㅏㄹ ㅗ니아머ㅗ라ㅣㅓ오나ㅓㅣ로 ㅣㅓㅏㅇ노  ㅏㅣㅓㄹㄴ이모 리ㅏㄴ ㅁ오리ㅏㅁㄴ어ㅣㅏ노리ㅓㅏㅇ노 리ㅏㅗ ㅇ너ㅣㅏㄹ ㅗ니아머ㅗ라ㅣㅓ오나ㅓㅣ로 ㅣㅓㅏㅇ노  ㅏㅣㅓㄹㄴ이모 리ㅏㄴ ㅁ오리ㅏㅁㄴ어ㅣㅏ노리ㅓㅏㅇ노 리ㅏㅗ ㅇ너ㅣㅏㄹ ㅗ니아머ㅗ라ㅣㅓ오나ㅓㅣ로 ㅣㅓㅏㅇ노  ㅏㅣㅓㄹㄴ이모 리ㅏㄴ ㅁ오리ㅏㅁㄴ어ㅣㅏ노리ㅓㅏㅇ노 리ㅏㅗ ㅇ너ㅣㅏㄹ ㅗ니아머ㅗ라ㅣㅓ오나ㅓㅣ로 ㅣㅓㅏㅇ노  ㅏㅣㅓㄹㄴ이모 리ㅏㄴ ㅁ오리ㅏㅁㄴ어ㅣㅏ노리ㅓㅏㅇ노 리ㅏㅗ ㅇ너ㅣㅏㄹ ㅗ니아머ㅗ라ㅣㅓ오나ㅓㅣ로 ㅣㅓㅏㅇ노  ㅏㅣㅓㄹㄴ이모 리ㅏㄴ ㅁ오리ㅏㅁㄴ어ㅣㅏ노리ㅓㅏㅇ노 리ㅏㅗ ㅇ너ㅣㅏㄹ ㅗ니아머ㅗ라ㅣㅓ오나ㅓㅣ로 ㅣㅓㅏㅇ노  ㅏㅣㅓㄹㄴ이모 리ㅏㄴ ㅁ오리ㅏㅁㄴ어ㅣㅏ</p>

                </div>
                <div class="col-md-2"></div>

            </div>
        </div>
       
        <div class="modal_layer"></div>
    </div>

    <script>

        function eventStop(){
            event.stopPropagation();
        }

    
        $("#review_content_1").click(function (){
            $("#modal").attr("style", "display:flex");
            $("body").attr("style","overflow-y:hidden");
        });

        $("#modal").click(function(){
            if(event.target.className=='carousel-control-next-icon')
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
    
    .table th{
    	text-align:center;
    }
    </style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>