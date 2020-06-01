<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script>
    	var sno; 
    		
    	function checkpw(){
    		var pw = $("#pw").val();
    		
    		$.ajax({
    			url : "${path}/store/checkPw",
    			data : {userpw:pw},
    			success : function(data){
    				console.log(data);
    				if(data){
    					location.replace('${path}/store/storeupdate?no='+sno);
    				}else{
    					alert("비밀번호가 틀렸습니다");
    				}
    				
    			}
    		})
    		
    		
    	}
    	
    	function saveNo(data){
    		sno=data;
    	}
    
    
    </script>