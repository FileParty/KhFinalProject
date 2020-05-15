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

                    <div class="col-md-2"></div>

                    <div class="col-md-8">

                        <table class="table detailTable" id="memberTable">

                            <tr>
                                <th>회원아이디</th>
                                <td>${loginMember.m_id }</td>
                                <td></td>
                            </tr>

                            <tr>
                                <th>비밀번호</th>
                                <td id="password">*********</td>
                            </tr>
                            <tr id="passwordCheck" style="display: none;">
                                <th>비밀번호 확인</th>
                                <td>
                                    <input type="text" onkeyup="passwordCheck();" id="checkPassword"><br>
                                    <div id="pcCon"></div>
                                </td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td id="email">${loginMember.m_email }</td>
                            </tr>
                            <tr>
                                <th>휴대전화번호</th>
                                <td id="phone">${loginMember.m_phone }</td>
                            </tr>
                            <tr>
                                <th>닉네임</th>
                                <td id="nickname">${loginMember.m_nickname }</td>
                            </tr>

                            <tr>
                                <th>가입일</th>
                                <td>${loginMember.m_enrolldate }</td>
                                <td></td>
                            </tr>

                        </table>

                        <div style="text-align: center;"><button id="memberUpdateBtn" class="btn btn-lightgray" onclick="memberUpdate();">수정하기</button></div>

                    </div>

                    <div class="col-md-2"></div>

                </div>


            </div>



            </div>

            <div class="col-md-1"></div>

        </div>

        

    </section>

    <div id="modal" style="display: none;">
   
        <div class="modal_content">
            <h2>모달 창</h2>
           
            <p>모달 창 입니다.</p>
           
            <button type="button" id="modal_close_btn">모달 창 닫기</button>
           
        </div>
       
        <div class="modal_layer"></div>
    </div>

    <script>

        var psCheck = 0;

        function memberUpdate(){
            $("#password").html("<input type='text' id='defaultPassword'>");
            $("#passwordCheck").attr("style", "display:table-row");
            $("#email").html("<input type='text' value='" + $("#email").html() + "'>");
            $("#phone").html("<input type='text' value='" + $("#phone").html() + "'>");
            $("#nickname").html("<input type='text' value='" + $("#nickname").html() + "'>");
            $("#memberUpdateBtn").attr("onclick", "memberUpdateEndBtn();");
            $("#memberUpdateBtn").html("수정완료");
        }
        
        function memberUpdateEndBtn(){
        	
        	const input_con = $("#memberTable").find("input");
        	
        	console.log(input_con[0].value); //패스워드
        	console.log(input_con[2].value); //이메일
        	console.log(input_con[3].value); //폰번호
        	console.log(input_con[4].value); //닉네임

        	if(input_con[0].value==input_con[1].value){
	        	$.ajax({
	    			
				    url: "${path}/mypage/memberUpdate.do",
				    type: "POST",
				    data: {"m_no":${loginMember.m_no}, "m_pw":input_con[0].value, "m_email":input_con[2].value, "m_phone":input_con[3].value, "m_nickname":input_con[4].value},
				    success: function(data){
						
				    	alert("수정성공");
				    	location.replace("${path}/mypage/accountEdit.do");
				    	
				    	
				    },
			
				    error: function (request, status, error){
				    	
				    	alert("수정 실패");
				    	
				    }
			
				});
        	}else{
        		alert("패스워드가 일치하지 않습니다");
        	}
        	
        }

        function passwordCheck(){
            if($("#defaultPassword").val()==$("#checkPassword").val()){
                $("#pcCon").html("패스워드가 일치합니다.");
                psCheck = 1;
            }else{
                $("#pcCon").html("패스워드가 일치하지 않습니다.");
                psCheck = 0;
            }
        }

    


    </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>