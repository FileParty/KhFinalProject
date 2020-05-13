<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
  <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<style>



.page-wrapper {
  position:fixed;
  margin-left : 50%;
  height: 100%;
 
}

.blur-it {
  filter: blur(4px);
}

a.btn {
 font-size:20px;
  width: 200px;
  padding: 18px 0;
  position: absolute;
  top: 50%; 
  left: 50%;
  transform: translate(-50%, -50%);
  font-family: 'Montserrat', Arial, Helvetica, sans-serif;
  font-weight: 700;
  text-align: center;
  text-decoration: none;
  text-transform: uppercase;
  color: #fff;
  border-radius: 0;
  background: #e2525c;
}

.modal-wrapper {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0; 
  left: 0;
  background: rgba(41, 171, 164, 0.8);
  visibility: hidden;
  opacity: 0;
  transition: all 0.25s ease-in-out;
}

.modal-wrapper.open {
  opacity: 1;
  visibility: visible;
}

.modal {
  width: 500px;
  height: auto;
  display: block;
  margin: 50% 0 0 -300px;
  position: relative;
  top: 37%; 
  left: 50%;
  background: #fff;
  opacity: 0;
  transition: all 0.5s ease-in-out;
}

.modal-wrapper.open .modal {
  margin-top: -200px;
  opacity: 1;
}

.head { 
  width: 100%;
  height: 48px;
  padding: 12px 30px;
  overflow: hidden;
  background: #e2525c;
}

.btn-close {
  font-size: 28px;
  display: block;
  float: right;
  color: #fff;
}

.content {
  padding: 10%;
}

.good-job {
  text-align: center;
  font-family: 'Montserrat', Arial,       Helvetica, sans-serif;
  color: #e2525c;
  margin-top: -15px;
}
.good-job .fa-thumbs-o-up {
  font-size: 60px;
}
.good-job h1 {
  font-size: 45px;
}
.sectionModal{
  /* border:1px solid rgb(131, 124, 124);   */
  margin-top: 10px;
  padding-left: 14px;
  text-align: center;
}
.modal-bottom{
  width: 100%;
  background-color: #e2525c;
  color:white;
  padding: 14px;
  margin-top: 13px;
}
</style>

</head>
<body>
 <!-- Button -->
<div class="page-wrapper">
  <a class="btn trigger" href="#">결제 완료</a>
</div>

<!-- Modal -->
<div class="modal-wrapper">
  <div class="modal">
    
    <div class="head"><h3 style="margin-top: -2px;color:#fff;">Mr.Pizza</h3>
    
      <a class="btn-close trigger" href="#">
        <i class="fa fa-times" aria-hidden="true"></i>
      </a>
    </div>
    
    <div class="content">
      
        <div class="good-job">
          <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
          <h1>주문 완료</h1>
        </div>
        <div class="sectionModal">
          <br> ༼๑◕◞◟◕๑༽ <b style="font-size:large">김상학 고객님</b> 주문해 주셔서 감사합니다.<br><br>
          고객님의 소중한 주문이 정상 접수되어,<br>
          50분 내외로 도착할 예정입니다.<br><br>
          <div style="border:3px solid rgb(228, 227, 227);
                   text-align:left;padding-left: 20%;"><br>
          ■ 주문 일시  :  2020/05/13<br>
          ■ 주문 번호 :  9502151<br>
          ■ 매장명  :  Mr.Pizza<br>
          ■ 메뉴  :  <b style="font-size:large;"><br>클래식 치즈판타지L 세트</b><br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;┕ 고르곤졸라치즈볼+펩시1.25L<br>
          ■ 요청사항  :  도착하시면 전화주세요.<br>
            ■ 배달 주소  :  경기도 부천시 송내동<br><br>
        </div>
         <div >
          <button class="modal-bottom" onclick="location.replace('${path }')">홈페이지로 돌아가기</button>
        </div>
            
          </div>

          
        </div>
    </div>
  </div>
</div>
<br><br>
<script>
  $( document ).ready(function() {
  $('.trigger').on('click', function() {
     $('.modal-wrapper').toggleClass('open');
    $('.page-wrapper').toggleClass('blur-it');
     return false;
  });
});
</script>
</body>
</html>