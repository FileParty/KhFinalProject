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
		    
		    #deleteMember{
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

            <div class="col-md-10 row" style="margin-top:30px">
                    
                    <div class="col-md-2"></div>

                    <div class="col-md-8">
                        <p style="text-align:center; margin-top:150px">
							 탈퇴 후 회원정보가 모두 삭제됩니다.<br>
							  메일주소, 핸드폰 번호/기타 연락처 등 회원정보가 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>
							
							<br>
							
							 탈퇴 후에도 작성된 리뷰는 그대로 남아 있습니다.<br>
							  삭제를 원하시는 리뷰는 탈퇴 전 반드시 삭제요청하시기 바랍니다.<br>
							  (탈퇴 후에는 리뷰 임의 삭제 요청을 받지 않습니다.)
						</p>
                        <button class="btn btn-lightgray" style="margin-left: 50%; transform: translateX(-50%); background-color: lightgray;" onclick="memberDelete(${loginMember.m_No});">회원탈퇴</button>
                    </div>

                    <div class="col-md-2"></div>
                    

                </div>


            </div>

            <div class="col-md-1"></div>

        </div>
        
        <script>
        	
        	function memberDelete(m_no){
        		if(confirm("회원을 탈퇴하시겠습니까?")){
        			$.ajax({
    				    url: "${path}/mypage/memberDelete.do",
    				    type: "POST",
    				    data: {"m_no":m_no},
    				    success: function(data){
    						
    				    	alert("회원이 탈퇴되었습니다.");
    				    	location.replace("${path}");
    				    	
    				    	
    				    },
    			
    				    error: function (request, status, error){
    				    	
    				    	alert("회원탈퇴실패!");
    				    	
    				    }
    			
    				});
        		}
        	}
        
        </script>

    </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>