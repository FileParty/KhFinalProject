
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

            <div class="col-md-2">
                
                <table id="myPage_category" class="table">

                    <tr>
                        <th>공지사항</th>
                    </tr>

                    <tr>
                        <td>
                            <a href="${path}/mypage/mypage.do"  style="color:rgb(34, 190, 241);" >공지사항</a>
                        </td>
                    </tr>


                    <tr>
                        <th>주문내역</th>
                    </tr>

                    <tr>
                        <td>
                            <a href="${path}/mypage/orderHistory.do">주문내역</a><br>
                        </td>
                    </tr>  
                    
                    <tr>
                        <th>내가 쓴 리뷰</th>
                    </tr>

                    <tr>
                        <td>
                            <a href="${path}/mypage/review.do">내가 쓴 리뷰
                        </td>
                    </tr>   

                    <tr>
                        <th>관심가게</th>
                    </tr>

                    <tr>
                        <td>
                            <a href="${path}/mypage/watchList.do">찜목록</a><br>
                        </td>
                    </tr>   

                    <tr>
                        <th>적립</th>
                    </tr>

                    <tr>
                        <td>
                            <a href="${path}/mypage/couponAndPoint.do">쿠폰 & 포인트</a>
                        </td>
                    </tr>   

                    <tr>
                        <th>계정관리</th>
                    </tr>

                    <tr>
                        <td>
                            <a href="${path}/mypage/accountEdit.do">회원정보수정</a><br>
                            <a href="${path}/mypage/cardManagement.do">카드등록 및 삭제</a><br>
                            <a href="${path}/mypage/deleteMember.do">회원탈퇴</a>
                        </td>
                    </tr> 

                    

                </table>

            </div>