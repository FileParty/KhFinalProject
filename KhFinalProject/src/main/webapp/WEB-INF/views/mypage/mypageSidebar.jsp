
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
		    .table th{
		    	text-align:left;
		    }
		    
		    *{
		    	font-weight: 700;
		    	font-famliy:'Do Hyeon';
		    }
		    
		    
		</style>

            <div class="col-md-2">
                
                <div style="margin-bottom:10px;"></div>
                <table id="myPage_category" class="table">

                    <tr>
                        <th>공지사항</th>
                    </tr>

                    <tr>
                        <td>
                            <a id="notice" href="${path}/mypage/mypage.do" >공지사항</a>
                        </td>
                    </tr>


                    <tr>
                        <th>주문내역</th>
                    </tr>

                    <tr>
                        <td>
                            <a id="order" href="${path}/mypage/orderHistory.do">주문내역</a><br>
                        </td>
                    </tr>  
                    
                    <tr>
                        <th>내가 쓴 리뷰</th>
                    </tr>

                    <tr>
                        <td>
                            <a id="review" href="${path}/mypage/review.do">내가 쓴 리뷰
                        </td>
                    </tr>   

                    <tr>
                        <th>관심가게</th>
                    </tr>

                    <tr>
                        <td>
                            <a id="wishlist" href="${path}/mypage/watchList.do">찜목록</a><br>
                        </td>
                    </tr>   

                    <tr>
                        <th>적립</th>
                    </tr>

                    <tr>
                        <td>
                            <a id="point" href="${path}/mypage/couponAndPoint.do">쿠폰 & 포인트</a>
                        </td>
                    </tr>   

                    <tr>
                        <th>계정관리</th>
                    </tr>

                    <tr>
                        <td>
                            <a id="accountEdit" href="${path}/mypage/accountEdit.do">회원정보수정</a><br>
                            <a id="card" href="${path}/mypage/cardManagement.do">카드등록 및 삭제</a><br>
                            <a id="deleteMember" href="${path}/mypage/deleteMember.do">회원탈퇴</a>
                        </td>
                    </tr> 

                    

                </table>

            </div>