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
								<h2>등록된 가게현황</h2>
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
							<th>신고자</th>
							<th>대상</th>
							<td></td>
						</tr>
						<form action="${path}/admin/updateReport.do" method="post" onsubmit="return confirm();">
							<c:forEach items="${list }" var="r">
								<tr class="apply-store-data">
									<td><input type="checkbox" name="re_no" value="${r['RE_NO'] }"></td>
									<td><c:out value="${r['RE_NO'] }"/></td>
									<td><c:out value="${r['R_NO'] }"/></td>
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

<script>

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

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>