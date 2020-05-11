<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--============================================================결제하기버튼css======================================================================-->
  <style>
    @import url("https://fonts.googleapis.com/css?family=Mukta:700");


button {
position: relative;
display: inline-block;
cursor: pointer;
outline: none;
border: 0;
vertical-align: middle;
text-decoration: none;
background: transparent;
padding: 0;
font-size: inherit;
font-family: inherit;
}
button.learn-more {
width: 12rem;
height: auto;
}
button.learn-more .circle {
-webkit-transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
position: relative;
display: block;
margin: 0;
width: 3rem;
height: 3rem;
background: #282936;
border-radius: 1.625rem;
}
button.learn-more .circle .icon {
-webkit-transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
position: absolute;
top: 0;
bottom: 0;
margin: auto;
background: #fff;
}
button.learn-more .circle .icon.arrow {
-webkit-transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
left: 0.625rem;
width: 1.125rem;
height: 0.125rem;
background: none;
}
button.learn-more .circle .icon.arrow::before {
position: absolute;
content: '';
top: -0.25rem;
right: 0.0625rem;
width: 0.625rem;
height: 0.625rem;
border-top: 0.125rem solid #fff;
border-right: 0.125rem solid #fff;
-webkit-transform: rotate(45deg);
        transform: rotate(45deg);
}
button.learn-more .button-text {
-webkit-transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
transition: all 0.45s cubic-bezier(0.65, 0, 0.076, 1);
position: absolute;
top: 0;
left: 0;
right: 0;
bottom: 0;
padding: 0.75rem 0;
margin: 0 0 0 1.85rem;
color: #282936;
font-weight: 700;
line-height: 1.6;
text-align: center;
text-transform: uppercase;
}
button:hover .circle {
width: 100%;
}
button:hover .circle .icon.arrow {
background: #fff;
-webkit-transform: translate(1rem, 0);
        transform: translate(1rem, 0);
}
button:hover .button-text {
color: #fff;
}

@supports (display: grid) {

#container {
  grid-area: main;
  display: flex;
  align-self: center;
  justify-content:center;
}
}
  </style>

  <!--============================================================결제하기버튼css======================================================================-->

<style>
* {
   /* border:1px solid red; */
    box-sizing: border-box;
}
body {
    font-family: Arial;
    padding: 10px;
    height: auto;
    width: 1305px;
}
main {
                width: 1305px;
                height:100px;
                 display:block; 
                 justify-content:center;
            }
            main p{
                padding-left: 50px;

            }
.table1{
  display: flexbox;
  width: 1285px;
  text-align: center;
  justify-content:center;
}

/* Header/Blog Title */
.header {
    padding: 30px;
    text-align: center;
    background: white;
}
.header h1 {
    font-size: 50px;
}
/* Style the top navigation bar */
.topnav {
    overflow: hidden;
    background-color: rgb(253, 68, 68);
}
/* Style the topnav links */
.topnav a {
    float: left;
    display: block;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}
/* Change color on hover */
.topnav a:hover {
    background-color: rgb(161, 247, 122);
    color: black;
}
/* Create two unequal columns that floats next to each other */
/* Left column */
.leftcolumn {   
    float: left;
    width: 69%;
}
/* Right column */
.rightcolumn {
    float: left;
    width: 31%;
    padding-left: 20px;
    border:4px solid rgb(252, 197, 60);
}
/* Fake image */
.fakeimg { 
    width: 100%;
    position: flex;
    padding-left: 10px;
}
/* Add a card effect for articles */
.card {
    background-color: white;
    padding: 20px;
    margin-top: 20px;
}
/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}
/* Footer */
.footer {
    padding: 20px;
    text-align: center;
    background: #ddd;
    margin-top: 20px;
}
/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 800px) {
    .leftcolumn, .rightcolumn {   
        width: 100%;
        padding: 0;
    }
}
/* Responsive layout - when the screen is less than 400px wide, make the navigation links stack on top of each other instead of next to each other */
@media screen and (max-width: 400px) {
    .topnav a {
        float: none;
        width: 100%;
    }
}

</style>
</head>
<body>
 
<div class="header">
  <h1>요기요</h1>
  <p>배달의 민족을 앞서가는 요기요</p>
</div>
 
<div class="topnav">
  <a href="#">메뉴1</a>
  <a href="#">메뉴2</a>
  <a href="#">메뉴3</a>
 
</div>
 
<main>
  <h2 style="text-align: center; ">주문/결제</h2>
  <p><b style="font-size: 17px;">주문내역</b></p>
 
  <table class="table1">
    <thead style="background-color: rgb(228, 227, 227);">
      <tr>
        <th >주문상품 사진 </th><th>주문상품정보</th><th>수량</th><th>상품금액</th><th>할인금액</th><th>구매예정가</th>
      </tr>
    </thead>
    <tbody >
      <tr style="height: 140px;">
        <td style="width: 120px;padding: 15px;">
          <img src="https://img.insight.co.kr/static/2018/08/07/700/ffs6yoo8it332vpwp549.jpg"
          style="top:0; left: 0;
          width: 120px;
          height: 100px;">
        </td>
        <td width="400px" ><b style="padding:10px;font-size: 24px;">클래식 치즈판타지L 세트</b><br><br>
                클래식 치즈판타지L+고르곤졸라 치즈볼+펩시 1.25L 세트</td>
        <td>1</td>
        <td>43,700원</td>
        <td style="color:red;">-2000원</td>
        <td>41,700원</td>
      </tr>
  
      
      
    </tbody>
    
  </table>
  <hr style="width:1275px">
</main>












<div class="row" style="margin-top: 190px;">
  <div class="leftcolumn">
    <div class="card" style="padding-left: 25px;">
      <h2>배송정보</h2>
      
      
      <div class="fakeimg" style="height:200px;"><h4>주문자</h4>
        주문자 이름&nbsp;<b style="color:red">*</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;height:30px;"><br><br>
        주문자 연락처&nbsp;<b style="color:red">*</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:90px;height:30px;"> -
                                                                          <input type="text" style="width:90px;height:30px;"> -
                                                                          <input type="text" style="width:90px;height:30px;"><br> <br>
        주문자 Email&nbsp;<b style="color:red">*</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;height:30px;"><br> <br>
      </div>
      <div align="center">
      <button onsubmit="" style="border:2px solid lightgray;padding: 5px;background-color: #ddd;">주문자 정보와 동일</button>
    <br><br>

      
    </div>
    <hr>
 
    <h4>배송지 정보</h4>
    받으시는 분&nbsp;<b style="color:red">*</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;height:30px;"><br><br>
    연락처&nbsp;<b style="color:red">*</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          <input type="text" style="width:90px;height:30px;"> -
                                          <input type="text" style="width:90px;height:30px;"> -
                                          <input type="text" style="width:90px;height:30px;"><br> <br>
     주소 &nbsp;&nbsp;&nbsp;<b style="color:red">*</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                           <input type="text" style="width:160px;height:30px;"> &nbsp;&nbsp; <button onsubmit="" style="border:2px solid lightgray;padding: 5px;background-color: #ddd;">우편번호 조회</button><br><br>
                                        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                           <input type="text" style="width:300px;height:30px;"><br> <br>
                                         &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                          <input type="text" style="width:300px;height:30px;"><br> <br>
                                          배송시 요청사항&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" style="width:300px;height:30px;"><br> <br>
                                     
                                          <div align="center">
                                            <button onsubmit="" style="width:70px;height:30px;background-color: black;color:white;">다음</button>
                                          </div>
  </div>
 
  </div>












  <div>
    <h3>최종 결제 금액 확인</h3>
  <div class="rightcolumn" >
    <h3>합계</h3><h1 align="center" style="color:red">44,200원</h1>
    <hr width="90%">

    <div class="card"width="90%">
      <p align="center">상품금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    43,700원</p>
                    <p align="center">할인금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      -2,000원</p>
                      <p align="center">쿠폰금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        -0원</p>
                        <p align="center">포인트금액&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          -0원</p>
                          <p align="center">배송비&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            25,000원</p><hr>
                            <div style="display:flex;background-color: #ddd;text-align: center;">
                            <p>주문할 상품의 상품명, 상품가격,배송정보<br>&nbsp;&nbsp;&nbsp;를 확인하였으며, 구매를 동의 하십니까?   <a href="#">약관보기</a> </p>
                            </div><br>
                            <div id="container">
                              <button class="learn-more">
                                <span class="circle" aria-hidden="true">
                                  <span class="icon arrow"></span>
                                </span>
                                <span class="button-text" style="font-size: 20px;padding-top: 11px;">결제하기</span>
                              </button>
                            </div>
  

    </div>
  </div>
  </div>
</div>
 









<div class="footer">
  <h2>Footer</h2>
</div>
 
</body>
</html>