
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

		<style>
			.table td{
			    	text-align:center;
			    }
		    
		    *{
		    	font-weight: 700;
		    }
		    
		    .table td{
		    	font-weight: 700;
		    }
		    
		    
		</style>

            <div class="col-md-2">
                
                <table id="myPage_category" class="table">


                    <tr>
                        <td>
                            <a class="menu list-group-item list-group-item-action" href="${path }/admin/adminMain.do">메인화면</a>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <a class="menuDetail list-group-item list-group-item-action " href="${path }/admin/applyStoreList">가게 신청목록</a>
                        </td>
                    </tr>
                    

                </table>

            </div>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<style>
	*{
		font-family:"jua";
	}
	div#side {
		border: 1px soild black;
		margin-top:50px;
		width:300px;
	}
    a.menu{
        border-top: none;
        border-left: none;
        border-right: none;
        border-bottom:none;
        width: auto;
        color:black;
        text-align: center;
        margin-top: 20px;
        border-bottom: 1px solid lightgray;
        font-size: 22px;
        font-family: 'Nanum Gothic';
    }
	a.menuDetail{
		border-top: none;
		border-left: none;
		border-right: none;
		font-size:16px;
		width: 150px;
		color:black;
		font-weight: 400;
		text-align: center;
		font-family: 'Nanum Gothic';
	}	

	.list-group{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
</style>
<div class="col-lg-2" id="side">   
	<ul class="list-group" >
		<li class="list-group">
			<a class="menu list-group-item list-group-item-action" href="${path }/admin/adminMain.do">메인화면</a>
		</li>
		<li class="list-group">
			<a class="menuDetail list-group-item list-group-item-action " href="${path }/admin/applyStoreList">가게 신청목록</a>
		</li>
	</ul>
</div> --%>