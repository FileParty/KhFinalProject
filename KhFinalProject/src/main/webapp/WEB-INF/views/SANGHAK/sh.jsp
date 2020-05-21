<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />



  <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link href='https://cdn.rawgit.com/openhiun/hangul/14c0f6faa2941116bb53001d6a7dcd5e82300c3f/nanumbarungothic.css' rel='stylesheet' type='text/css'>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&display=swap" rel="stylesheet">

</head>
<body>
 
<div class="header">
<div style="display:flex;">
				<a href="${path }"><img class="rounded-circle" style="margin:3px;width:85px;height:85px;"
					alt="rogo" src="https://cdn.pixabay.com/photo/2016/02/23/00/06/pizza-1216738_960_720.png">
				</a>
				  <h1 style="padding-left:34%;">성탄소년단</h1>
				
			</div>

  <p>배달의 민족을 앞서가는 이성연외 6아이들</p>
</div>
 
<!-- <div class="topnav">
  <a href="#">메뉴1</a>
  <a href="#">메뉴2</a>
  <a href="#">메뉴3</a>
 
</div> -->
 
<main>
  <h2 style="text-align: center; ">주문/결제</h2>
  <p><b style="font-size: 17px;">주문내역</b></p>
 
  <table class="table1" style="width:1340px">
    <thead style="background-color: rgb(228, 227, 227);" >
      <tr class="topnava">
        <th>주문상품 사진 </th>
        <th>주문상품정보</th>
        <th>옵션</th>
        <th>수량</th>
        <th>상품금액</th>
      
      </tr>
    </thead>
    <tbody >
                      
     <c:forEach items="${orderList }" var="a" varStatus="status">
   <c:set var="priceSum" value="${a['finalPrice']}"/>

     	 <c:if test="${!status.last}"> 


    		<tr style="height: 140px;border-bottom:1px solid rgb(228, 225, 225);">
     	
			        <td style="width: 120px;padding: 15px;">
			          <img src="${path}/resources/upload/business/${a['src']}" style="top:0; left: 0;width: 120px; height: 100px;">
			        </td>
			      
			        <td width="400px" style="" ><b style="font-size: 35px;height:50px;font-family: 'Stylish', sans-serif;">${a['name']}</b><br><br>
			               
			       	</td>
			        <td style="text-align:left;">
			        <b style="color:rgb(95, 95, 95);font-size: 17px;">* 필수옵션</b> : <b style="font-size: 17px;">${a['reqOp']['reqOpName']}</b> <br>
			   			   <b style="color:rgb(95, 95, 95);font-size: 17px;">* 추가옵션</b> :
			   <c:forEach items="${a['unReqOp']}" var="b"> 
			                <b style="font-size: 17px;font-family: 'Stylish', sans-serif;">[${b['unReqOpName']}]</b>
		   		</c:forEach>
			        </td>
			        <td style="font-size: 21px;">
			        	${a['count']}   <!--${orderList[0]['count']}  -->
			        		${a['menuCount']}
			        </td>
			        <td style="font-size: 21px;">
			        	${a['price']} ${a['finalPrice']}원	<br>

			        </td><!-- ${newOrder[0]['price']} -->

     		</tr>
     		
     	</c:if>  
     	
      </c:forEach>
      
 			<tr style="height: 40px;border-bottom:1px solid rgb(228, 225, 225);background-color:#fff8eb;">
	     		<td colspan="5"> <b><marquee width="640px">  ★ 주문하신 정보가 맞는지 다시한번 확인해주시고 결제해주시기바랍니다 (ღゝ◡╹)ノ♡  </marquee></b></td>
     		</tr>
      
      
    </tbody>
<!--          	this.src = src; // 메뉴이미지이름
        	this.name = name; // 메뉴이름
        	this.reqOp = reqOp; // 메뉴 필수옵션(no,필수옵션명)
        	this.unReqOp = unReqOp; // 메뉴 추가옵션(no,추가옵션명)
        	this.count = count; // 메뉴 갯수
        	this.price = price; // 메뉴 가격
 -->  </table>
  
</main>











 <form  action="${path}/" method="post" onsubmit="return checkedNull();" >
<div class="row">
  <div class="leftcolumn">
    <div class="card" style="padding-left: 25px;height: auto;">
      <h2>배송정보</h2>
      <hr>
      
      <div class="fakeimg" style="height:auto;">
        <h4>주문자</h4>
       
       
        <table style="margin-left: 10px;"> 
          <tr>
            <td style="padding-right:30px;">주문자 이름 <b style="color:red">*</b></td>
            <td>
            	<input type="text"  id="name_1" style="padding-left: 10;width:300px;height:45px;background-color:rgb(243, 243, 243);" value="${loginMember['m_name']}" readonly><br>
		           <span id="result"></span> 
            </td>
          </tr>
          <tr>
            <td>주문자 연락처  <b style="color:red">*</b></td>
            <td><br><input type="text" id="phone_1"style="padding-left: 10;width:300px;height:45px;background-color:rgb(243, 243, 243);"value="${loginMember['m_phone']}"readonly>
              <br> <br></td>
          </tr>
        
          </table>
          <br>
          <div style="display:flex; justify-content:center;padding-left: 490px;">
         
        </div>	
        
        <br>
      </div>
     
      <h2>결제정보</h2>
    <hr>
 
    <h4>배송지 정보</h4> 
    <div style="display:flex; justify-content:center;padding-left: 490px;">
          <label for="cbx" class="label-cbx">
      <input id="cbx" type="checkbox" class="invisible" onchange="check1(this)" required >
      <div class="checkbox">
        <svg width="20px" height="20px" viewBox="0 0 20 20">
          <path d="M3,1 L17,1 L17,1 C18.1045695,1 19,1.8954305 19,3 L19,17 L19,17 C19,18.1045695 18.1045695,19 17,19 L3,19 L3,19 C1.8954305,19 1,18.1045695 1,17 L1,3 L1,3 C1,1.8954305 1.8954305,1 3,1 Z"></path>
          <polyline points="4 11 8 15 16 6"></polyline>
        </svg>
      </div>
   <div style="width:400px;margin-top:12px;">주문자 정보와 동일하면 체크해주세요</div>
    </label>
    </div>
  
  
    <style>
    
    .label-cbx {
  user-select: none;
  cursor: pointer;
  margin-bottom: 0;
}
.label-cbx input:checked + .checkbox {
  border-color: #20C2E0;
}
.label-cbx input:checked + .checkbox svg path {
  fill: #20C2E0;
}
.label-cbx input:checked + .checkbox svg polyline {
  stroke-dashoffset: 0;
}
.label-cbx:hover .checkbox svg path {
  stroke-dashoffset: 0;
}
.label-cbx .checkbox {
  position: relative;
  top: 2px;
  float: left;
  margin-right: 8px;
  width: 20px;
  height: 20px;
  border: 2px solid #C8CCD4;
  border-radius: 3px;
}
.label-cbx .checkbox svg {
  position: absolute;
  top: -2px;
  left: -2px;
}
.label-cbx .checkbox svg path {
  fill: none;
  stroke: #20C2E0;
  stroke-width: 2;
  stroke-linecap: round;
  stroke-linejoin: round;
  stroke-dasharray: 71px;
  stroke-dashoffset: 71px;
  transition: all 0.6s ease;
}
.label-cbx .checkbox svg polyline {
  fill: none;
  stroke: #FFF;
  stroke-width: 2;
  stroke-linecap: round;
  stroke-linejoin: round;
  stroke-dasharray: 18px;
  stroke-dashoffset: 18px;
  transition: all 0.3s ease;
}
.label-cbx > span {
  pointer-events: none;
  vertical-align: middle;
}

.cntr {
  position: absolute;
  top: 45%;
  left: 0;
  width: 100%;
  text-align: center;
}

.invisible {
  position: absolute;
  z-index: -1;
  width: 0;
  height: 0;
  opacity: 0;
}
    #checkbox{
     	width:15px;
     	height:15px;

    }
    </style>
    <table style="margin-left: 10px;"> 
<tr>
  <td style="padding-right:40px;">받으시는 분  <b style="color:red">*</b></td>
  <td><input type="text"  id="name_2" style="width:300px;height:45px; padding-left: 10;"required><br> </td>
</tr>
<tr>
  <td>연락처  <b style="color:red">*</b></td>
  <td><br><input type="text"  id="phone_2" style="width:300px;height:45px; padding-left: 10;"required><br></td>
</tr>
<tr>
  <td>주소  <b style="color:red">*</b></td>
 
  <td><br><input type="text" style="width:300px;height:45px;background-color:rgb(243, 243, 243);padding-left: 10;" 
			value="${addr } "  readonly><br> <br></td>
</tr>
<tr>
  <td></td>
  <td><input type="text" style="width:300px;height:45px;padding-left: 10;" placeholder=" (필수) 상세정보 입력" required><br></td>
</tr>
<tr>
  <td><div style="margin-top: -55px;">배송시 요청사항</div></td>
  <td><br>
  <textarea name="ta2" rows="5" cols="80"  placeholder=" 코로나19예방을 위해 비대면 배달 권장드립니다. 주문시 '문 앞 배달'을 요청사항에 남겨주세요."></textarea>
  <!-- <input type="text" style="width:300px;height:100px;" placeholder="코로나19예방을 위해 비대면 배달 권장드립니다. 주문시 '문 앞 배달'을 요청사항에 남겨주세요.">  --><br><br></td>
</tr>

    </table>            
     <hr>


      <h4>할인/배송비</h4>

    <table> 
    <tr>
    <td style="padding-right:40px;">쿠폰 사용</td>
    
         <td width="680px">  
    
		<div class="col-lg-12" id="ex2_Result2"></div> 
        <!-- ================================쿠폰적용========================================== -->
       <button class="button" style="width:90px;height:45px;color:gray;border:1px solid lightgray;padding: 5px;background-color: rgb(253, 252, 252);">
        	쿠폰적용
        </button>

         <!-- ================================클릭했을떄 모달========================================== -->
            <dialog>
                <div class="dialog__inner">
                
                    <div class="dialog__content">
                        <h3>쿠폰적용</h3>  <hr>
                       	
                          <table id="example-table-2" border="1" style="width:1150px;">
                              <tr>
                              <th id="th1">쿠폰코드</th>
                                <th id="th1">쿠폰이름</th>
                                <th id="th1">쿠폰정보(원)</th>
                                <th id="th1">유효기간</th>
                                <th id="th1">Pick</th>
                            </tr>
                   
						
					
                          <c:forEach items="${list}" var="c">
                         	
                                <c:if test="${c['m_no']== loginMember['m_no'] }">
	                              <tr>
	                               <td id="td1"><large style="font-weight: bold;font-size: 18px;">${c['cn_no'] }</large>
	                                <td id="td1"><large><b style="color:rgba(235, 129, 30, 0.788);font-size: 18px;">${c['cn_name'] }</b></large> <br><small style="color:gray;  font-style: italic;">[최소주문] ${c['cn_limitprice'] }이상 구매</small></td>
	                                <td id="td1"><large style="font-weight: bold;font-size: 18px;">${c['cn_price'] }</large>
	                               
	                                </td>
	               
	                                <td id="td1"><small>발행일자: <fmt:formatDate value="${c['cn_enrolldate'] }" pattern="yyy/MM/dd HH:mm:ss" /></small> <br>
	                                			 <small style="color:red;">만료일자: <fmt:formatDate value="${c['cn_expire'] }" pattern="yyy/MM/dd HH:mm:ss" /></small>
	                                </td>
	                                <td id="td1">

								  <input type="button" id="clickevent" class="checkBtn" value="쿠폰적용" /> 
								  <input type="button" style="display:none;" id="alloffHidden" class="alloff" value="적용취소" />
	                                	<input type="hidden" name="cn_no" id="cn_no" value="c['cn_no']">
	                                </td>
	                              </tr>
	                               	 </c:if>
	                               	 
                          	 </c:forEach> 
                          <c:if test="${empty c['cn_no']}">  
								<tr>
									<td id="td1" colspan="5">등록된 쿠폰이 없습니다.</td>
							    </tr>
							</c:if> 
       					 
       				
						
					

                                </table><hr>
                              
         <!-- =================================모달 css===================================================== -->            
                                <style>
                                  #th1{
                                    text-align: center;
                                    padding: 12px;
                                    width: 120px;
                                   background: #81F7BE;
                                  }
                                  #td1{
                                    text-align: center;
                                    padding: 12px;
                                    width: 120px;
                                   
                                  }
                                 
                                  
                                  </style>

                        <footer class="dialog__footer" style="margin-top:-40px;">
                            <button class="button close">close</button>
                        </footer>   
                    </div>  
                </div>
            </dialog>
             <!-- ===================================================================================== -->
             
        <div style="display: inline;padding-left: 7px;">(사용가능 쿠폰<p style="display:inline;color: red;">  ${total } 장  </p>)</div>
        <br> 
      </td>
    </tr>

<tr>
  <td style="padding-right:40px;">포인트 사용</td>
    <td width="680px">
    <input style="padding-right:20px;border : 1px solid lightgray;width:200px;height:45px;text-align:right;" type="text" class="abc" id="allpay3"  >  
     <!--  <button id="allpay" style="margin-left:-4px;margin-top:-4px;width:90px;height:45px;color:gray;border:1px solid lightgray;padding: 5px;background-color: rgb(253, 252, 252);">전액사용</button>  -->
  
     <input type="checkbox"   onchange="check2(this)" > 
     <div style="display: inline;width:400px;margin-top:12px;">모두사용</div>
      <div style="display: inline;padding-left: 7px;">(보유 포인트
      			<input style="width:80px;text-align: center;border: 1px solid white;color:red;font-weight: bold;"type="text" id="allpay2" value="${loginMember['m_point']}" readonly>point)
      </div>
      <br>
    </td>
  </tr>
  
  <tr>
    <td style="padding-right:40px;">배송비</td>
      <td width="680px"><input type="text" style="background-color: rgb(243, 243, 243);width:200px;height:45px;text-align:right;" value="2500&nbsp;원&nbsp;&nbsp;&nbsp;"readonly>
    <br> 
      </td>
    </tr>
 
    <tr><td colspan="2"  ><p style="margin-top: 20px;">기본 배송비는 2,500원이며, <em style="color: red;">총결제 금액이 80,000원 이상일 경우 무료배송입니다.</em></p></td></tr>
</table>
<!-- <div style="display:flex; justify-content:center;padding-left: 550px;">
           <button onsubmit="" style="width:70px;height:30px;background-color: black;color:white;">다음</button>
      </div> -->
      <br>
      <h2>결제 방법</h2>
<hr>
	<div id="btn-container"style="border: 1px solid black;text-align: center;width: 200px;margin: auto; width: 50%;padding: 15px;">
 	  <button id="btn-button" value="1">신용카드</button>
 	</div>

  </div>
  



  </div>


  <div style="margin-top:75px;" >
    <h3 style="font-weight:bold;font-size:30px">최종 결제 금액 확인</h3>
  <div class="rightcolumn" style="padding-right:10px;" >
    <h3 style="font-weight:bold;color:black;">총 합계</h3>
    <div>
    <h1 style="font-weight: bold;color:red">
    <input style="text-align:center;width:100%;border:1px solid white;"type="text" value="${priceSum+2500}원" id="sum" name="sum" />
    </h1>
    </div>
    
    
    <hr width="90%" >

    <div class="card"width="90%">

      <table style="width: 340px; height: auto;font-weight: bold;font-size: 20px;">
        <tr style="height:40px">
            <td>총 상품금액</td>
               <c:forEach items="${orderList }" var="a" varStatus="status">
               	<c:if test="${status.count==1}">
            		<td id="td1234"style="width: 155px;text-align: right;font-size: 21px;"> 
            			<c:out value="${priceSum}"/> 원 
            			<!--******************************hidden***********************************************  -->
            			<input type="hidden" value="${priceSum}"/>      	
            		</td>
            		</c:if>
            </c:forEach>
        </tr>
        <tr style="height:40px">
          <td>쿠폰 사용금액</td>
          <td style="color: red;text-align: right;"><div class="" id="ex2_Result3" style="font-size: 21px;">0원</div></td>
         </tr>
         <tr style="height:40px">
           <td>포인트 사용금액</td>
            <td style="text-align: right;">
            	<div class="def" id="def123" style="color:red;font-weight:bold;height: 20px;text-align: right;font-size: 21px;margin-top: -11px;margin-right:-1">0원</div>
            	<!--******************************hidden***********************************************  -->
            	
            	<input style="text-align:right;color:red;font-weight:bold;width: 150px;border:1px solid white;margin-top: -6px;margin-right: -3px;font-size: 21px;" 
            		type="text"id="allpay4" class="invisible" name="" readonly>
            	<!--******************************hidden***********************************************  -->
            	
            </td>
         </tr>
         <tr style="height:40px">
      <td>배송비</td>
      <td style="text-align: right;font-size: 21px;">2500 원</td>
      <!--******************************hidden***********************************************  -->
      <input type="hidden" value="2500"/>    
  </tr>
          </table><br><hr>
                            <div id="agree5"style="width: 426px;margin-left: -41px;margin-top: -23px;height: 81px;background-color: rgb(243, 243, 243);text-align: center;padding:13px;border: 1px solid lightgray;">
                            <p style="margin-top:10px;color:rgb(95, 95, 95);">주문할 상품의 상품명, 상품가격,배송정보<br>를 확인하였으며, 구매를 동의 하십니까?   
                              <a id="agree1" onclick="" data-toggle="modal" data-target="#myModal" href="#modal">약관보기</a> </p>
                              <!-- 약관보기 클릭하면 input 태그 보이게 --> 
                              <div id="agree2" style="display:none;text-align:center;">
                             	 <input id="check123" type="checkbox"  style="width: 15px; height: 15px;" required>&nbsp;동의합니다.
                              </div>
                            </div>
                          <button id="dopay"type="submit" style="border: 1px solid lightgray;width: 426px;margin-left: -41px;margin-top: -2px;height: 105px;background-color: rgb(243, 243, 243);text-align: center;padding:13px;font-weight: bold;color: rgb(190, 190, 190);font-size: 25px;/* background-color: white; */">
                        	  결제하기
                          </button>
  

    </div>
  </div>
  </div>
</div>
  
  </form>
  
  
 <!-- Modal -->
 <div class="modal fade" id="myModal" role="dialog">
  <div class="modal-dialog">
  
    <!-- Modal content-->
    <div class="modal-content" style="top: 165px;left: 511px;">
      <div class="modal-header">
       <h3 style="margin-bottom: -15px;">&nbsp;&nbsp;&nbsp;약관보기</h3><br>
        
        <h4 class="modal-title"></h4>
      </div>
      <div class="modal-body">
       <table width=810>
          <tr>
            <td>
              <div>
               <font color="#f67001" size=4>01</font> <font size=3>이용약관</font>
              </div>
           </td>
         </tr>
         <tr>
           <td>
             <textarea name="tos" rows=15 cols=100 style="width:566px;height: 288px;">
제1조(목적)
이 약관은 oooo 회사(전자상거래 사업자)가 운영하는 oooo 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리ㆍ의무 및 책임사항을 규정함을 목적으로 합니다.
※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」

제2조(정의)
①“몰” 이란 oooo 회사가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를
이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 
사용합니다.

②“이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

③ ‘회원’이라 함은 “몰”에 개인정보를 제공하여 회원등록을 한 자로서, “몰”의 정보를 지속적으로 제공받으며, “몰”이 제공하는
서비스를 계속적으로 이용할 수 있는 자를 말합니다.

④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관등의 명시와 설명 및 개정) 
① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 모사전송번호, 전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 카페홀릭 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.

② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회, 배송책임, 환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.

③ “몰”은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.
다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 몰“은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. 

⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 ‘몰“에 송신하여 ”몰“의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.

⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다.

제4조(서비스의 제공 및 변경) 
① “몰”은 다음과 같은 업무를 수행합니다.
1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
2. 구매계약이 체결된 재화 또는 용역의 배송
3. 기타 “몰”이 정하는 업무

②“몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.

③“몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.

④전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

제5조(서비스의 중단) 
① “몰”은 컴퓨터 등 정보통신설비의 보수점검ㆍ교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.

②“몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

③사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.

제6조(회원가입) 
① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.

② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.
1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
2. 등록 내용에 허위, 기재누락, 오기가 있는 경우  
3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우

③ 회원가입계약의 성립시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.

④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 “몰”에 대하여 그 변경사항을 알려야 합니다.

제7조(회원 탈퇴 및 자격 상실 등) 
① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.

② 회원이 다음 각호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
1. 가입 신청시에 허위 내용을 등록한 경우  
2. “몰”을 이용하여 구입한 재화등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우  
3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우  
4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

③ “몰”이 회원 자격을 제한ㆍ정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.

④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.

제8조(회원에 대한 통지)
① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.

② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.

제9조(구매신청)
“몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.  단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.
1. 재화등의 검색 및 선택
2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력  
3. 약관내용, 청약철회권이 제한되는 서비스, 배송료ㆍ설치비 등의 비용부담과 관련한 내용에 대한 확인
4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의
6. 결제방법의 선택

제10조 (계약의 성립)
① “몰”은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
1. 신청 내용에 허위, 기재누락, 오기가 있는 경우  
2. 미성년자가 담배, 주류등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우  
3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우

② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.

③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소등에 관한 정보등을 포함하여야 합니다.

제11조(지급방법)
“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도  추가하여 징수할 수 없습니다.
1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 
2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제  
3. 온라인무통장입금
4. 전자화폐에 의한 결제  
5. 수령시 대금지급  
6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제  
7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제  
8. 기타 전자적 지급 방법에 의한 대금 지급 등

제12조(수신확인통지-구매신청 변경 및 취소)
① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.

② 수신확인통지를 받은 이용자는 의사표시의 불일치등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송전에 이용자의 요청이 있는 경우에는 지체없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.

제13조(재화등의 공급)
① “몰”은 이용자와 재화등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다.  이때 “몰”은 이용자가 재화등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.

②“몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의ㆍ과실이 없음을 입증한 경우에는 그러하지 아니합니다.


제14조(환급)
“몰”은 이용자가 구매신청한 재화등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.

제15조(청약철회 등)
①“몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다.

② 이용자는 재화등을 배송받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우  
3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우  
4. 같은 성능을 지닌 재화등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우

③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회등이 제한되지 않습니다.

④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화등을 공급받은 날부터 3월이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.

제16조(청약철회 등의 효과)
① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.

② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화등의 대금을 지급한 때에는 지체없이 당해 결제수단을 제공한 사업자로 하여금 재화등의 대금의 청구를 정지 또는 취소하도록 요청합니다.

③ 청약철회등의 경우 공급받은 재화등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회등을 하는 경우 재화등의 반환에 필요한 비용은 “몰”이 부담합니다.

④ 이용자가 재화등을 제공받을때 발송비를 부담한 경우에 “몰”은 청약철회시 그 비용을  누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.

제17조(개인정보보호)
①“몰”은 이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다. 
1. 성명
2. 주소
3. 전화번호
4. 희망ID(회원의 경우)
5. 비밀번호(회원의 경우)
6. 전자우편주소(또는 이동전화번호)

② “몰”이 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.

③제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 　몰　이 집니다. 다만, 다음의 경우에는 예외로 합니다.
1. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우 
2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우 
3. 재화등의 거래에 따른 대금정산을 위하여 필요한 경우 
4. 도용방지를 위하여 본인확인에 필요한 경우 
5. 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우

④“몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 정보통신망이용촉진등에관한법률 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.

⑤이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.

⑥ “몰”은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을  집니다.

⑦ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체없이 파기합니다.

제18조(“몰“의 의무)
① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화ㆍ용역을 제공하는데 최선을 다하여야 합니다.

② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.

③ “몰”이 상품이나 용역에 대하여 「표시ㆍ광고의공정화에관한법률」 제3조 소정의 부당한 표시ㆍ광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.

④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.

제19조(회원의 ID 및 비밀번호에 대한 의무)
① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.

② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.

③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.

제20조(이용자의 의무)
이용자는 다음 행위를 하여서는 안됩니다.
1. 신청 또는 변경시 허위 내용의 등록
2. 타인의 정보 도용
3. “몰”에 게시된 정보의 변경
4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해  
6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위

제21조(연결“몰”과 피연결“몰” 간의 관계)
① 상위 “몰”과 하위 “몰”이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.

②연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.

제22조(저작권의 귀속 및 이용제한)
① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.

② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.

③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.

제23조(분쟁해결)
① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치ㆍ운영합니다.

② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.

③“몰”과 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.

제24조(재판권 및 준거법)
①“몰”과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.

②“몰”과 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.
              </textarea>
            </td>
          </tr>
          <tr>
            <td>
             <!--  <input type="checkbox" >이용약관에 동의합니다.<br><br><br><br> --><br><br>
            </td>
          </tr>
          <tr>
            <td>
              <div>
               <font color="#f67001" size=4>02</font> <font size=3>개인정보 수집 및 이용에 대한 안내</font>
              </div>
           </td>
         </tr>
         <tr>
           <td>
             <textarea name="tos" rows=15 cols=100 style="width:566px;">
수집하는 개인정보의 항목
회사는 회원가입, 상담, 서비스 신청 및 제공 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
- 이름, 이메일, 주소, 연락처, 핸드폰 번호, 아이디, 비밀번호, 닉네임, 팩스번호, 홈페이지 주소 또한 서비스 이용과정이나 사업
처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.
- 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보, 방문일시, 브라우저종류 및 os, 검색어, 결제기록, 이용정지 기록, 상담기록

개인정보의 수집 및 이용목적

회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
콘텐츠 제공, 물품배송 또는 청구서 등 발송, 금융거래 본인 인증 및 금융 서비스, 구매 및 요금 결재, 요금추심

나. 회원 관리
회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 
가입횟수 제한, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한
기록보존, 불만처리 등 민원처리, 고지사항 전달

개인정보의 보유/이용기간

이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.
단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.
가. 회사 내부 방침에 의한 정보보유 사유
- 부정이용기록
보존 이유 : 부정 이용 방지
보존 기간 : 1년

나. 관련법령에 의한 정보보유 사유
상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.

- 계약 또는 청약철회 등에 관한 기록
보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
보존 기간 : 5년
- 대금결제 및 재화 등의 공급에 관한 기록
보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
보존 기간 : 5년
- 소비자의 불만 또는 분쟁처리에 관한 기록
보존 이유 : 전자상거래 등에서의 소비자보호에 관한 법률
보존 기간 : 3년
- 본인확인에 관한 기록
보존 이유 : 정보통신 이용촉진 및 정보보호 등에 관한 법률
보존 기간 : 6개월
- 방문에 관한 기록
보존 이유 : 통신비밀보호법
보존 기간 : 3개월


개인정보취급 위탁관련 / 개인정보제공 거부

가. 개인정보취급 위탁관련

- 개인정보취급위탁을 받는 자 : (주)oooo
- 개인정보취급위탁을 하는 업무의 내용 : 회원관리 회원제 서비스 이용에 따른 회원정보 관리 및 웹사이트 시스템 관리

나. 개인정보제공 거부에 관한 사항
- 귀하께서는 본 동의 안내 문구를 숙지하였으며, 안내문구에 대해 거절하실 수 있습니다. 단, 거절하신 경우에는 서비스 이용에 제한을 받을 수 있습니다.


고유식별정보 처리에 관한 사항 / 본인확인서비스 이용을 위한 고유식별 정보 제공 동의

NICE신용평가정보㈜(이하 “대행사”)가 “대행사”에서 제휴한 업체[자세한 업체 목록은 “대행사”에서 제공하는 본인인증서비스 이용 시, 명시]를 통해 제공하는 휴대폰 본인인증 서비스와 관련하여 고객으로부터 수집한 고유식별정보를 이용하거나 타인에게 제공할 때에는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’(이하 “정보통신망법”)에 따라 고객의 동의를 얻어야 합니다.

제1조 [고유식별정보의 처리]

“본인확인기관”은 휴대폰 본인인증 서비스 제공 시, 아래 두 가지 목적을 위해 고객의 고유식별정보를 처리할 수 있습니다.

1. 정보통신망법 제23조의 2 제2항에 따라 인터넷상에서 주민등록번호를 입력하지 않고도 본인임을 확인할 수 있는 휴대폰 본인인증서비스를 제공하기 위해 고유식별정보를 이용

2. ‘본인확인기관 지정 등에 관한 기준(방송통신위원회 고시)’에 따라 “대행사”와 계약한 정보통신서비스 제공자의 연계서비스 및 중복 가입확인을 위해 필요한 경우, “대행사”에서 제휴한 업체가 아래의 고유식별정보를 제공받아 처리할 수 있습니다.

(1) 이름, 휴대폰번호, 통신사, 성별, 생년월일, 국적

제2조 [본인확인서비스 이용을 위한 고유식별 정보 제3자 제공 동의]

이용자는 “대행사”가 제공하는 본인확인서비스(이하 “서비스”라 합니다)를 이용하기 위해 같이 이용자의 고유식별정보를 본인확인기관이 아래 기재된 제 3자에게 제공하는 것에 동의 합니다.

1. 고유식별정보를 제공받는 자

“대행사” 와 “대행사”에서 제휴한 업체(SKT, Kt, LG U+, ㈜케이지모빌리언스)

2. 고유식별정보를 제공받는 자의 이용목적

- 서비스(회원가입, ID/PW찾기 등) 이용을 위한 본인인증
- 본인인증을 위한 휴대폰 정보의 일치 여부 확인
- 휴대폰 사용자 확인을 위한 SMS 인증번호 전송
- 부정 이용 방지

3. 제공하는 고유식별정보 항목

- 성명, 성별, 생년월일, 내/외국인, 휴대폰번호, 이동통신사


4. 고유식별정보를 제공받는 자의 보유 및 이용 기간

- 이용자의 개인정보는 이용목적이 달성되거나 보유 및 보존기간이 종료한 경우 해당 정보를 지체 없이 파기.
단, 관련 법령 및 회사방침에 의해 보존하는 정보의 경우 아래 목적으로만 이용하며 보존기간은
다음과 같습니다.
'정보통신망 이용촉진 및 정보보호 등에 관한 법률'의 거래기록 보존 의무에 따른 보존: 1년

              </textarea>
            </td>
          </tr>
          <tr>
            <td>
            <!--   <input type="checkbox">개인정보 수집 및 이용에 대한 안내에 동의합니다. -->
            </td>
          </tr>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
    
  </div>
</div>


<!--=====================쿠폰체크 픽 스크립트=========================================== -->
<script>  // 선택버튼 (id="pick")을 누르면 왼쪽 옆옆 의 값( cn_price)이 input태그(id="pickresult")에 나오게.
//버튼 클릭시 Row 값 가져오기
$(".checkBtn").click(function(){ 
	 $('.alloff').css("display","inline");
	var str = ""
	var tdArr = new Array();	// 배열 선언
	var checkBtn = $(this);
	
	// checkBtn.parent() : checkBtn의 부모는 <td>이다.
	// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
	var tr = checkBtn.parent().parent();
	var td = tr.children();
	
	console.log("클릭한 Row의 모든 데이터 : "+tr.text());
	
	var no = td.eq(0).text();
	var userid = td.eq(1).text();
	var name = td.eq(2).text();
	var email = td.eq(3).text();
	
	
	// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
	td.each(function(i){	
		tdArr.push(td.eq(i).text());
	});
	
	
	str +=
			"<font color='red'>-" + name +"원</font>"	
	sum1 += name
		
			
	$("#ex2_Result2").html(str);
	$("#ex2_Result3").html(str);
	
	$(event.target).parent().parent().parent().children("td").css("border","solid 1px black").css("border-collapse","collapse");  //체크한거 말고는 다 테두리 검정색으로
	$(event.target).parent().parent().css("border","solid 5px red");  
});
<!--=====================쿠폰체크 취소=========================================== -->


/* 
$("#clickevent").click(function(){
	 $('#alloffHidden').css("display","inline");
	
});
$("#alloffHidden").click(function(){
	 $('.alloff').css("display","none");
	
}); */


	$(".alloff").click(function(){
		 $('.alloff').css("display","none");
	var str = ""
		var tdArr = new Array();	// 배열 선언
		var checkBtn = $(this);
		
		// checkBtn.parent() : checkBtn의 부모는 <td>이다.
		// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
		var tr = checkBtn.parent().parent();
		var td = tr.children();
		
		console.log("클릭한 Row의 모든 데이터 : "+tr.text());
		
		var no = td.eq(0).text();
		var userid = td.eq(1).text();
		var name = td.eq(2).text();
		var email = td.eq(3).text();
		
		
		// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
		td.each(function(i){	
			tdArr.push(td.eq(i).text());
		});
		
		
		str +=
				"<font color='red'>-" + name +"원</font>"	
				
		$("#ex2_Result2").html('');
		$("#ex2_Result3").html('0원');
		

		$(event.target).parent().parent().parent().children("tr").css("border","solid 1px black").css("border-collapse","collapse");  //체크한거 말고는 다 테두리 검정색으로
		 $(event.target).parent().parent().parent().css("border","solid 1px black").css("border-collapse","collapse");
});

</script>





 
</body>
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
  
  display: flex;
  align-self: center;
  justify-content:center;
  height: 54px;
}
}
  </style>

  <!--============================================================결제하기버튼css======================================================================-->

<style>
* {
     /*  border:1px solid red;  */  
    box-sizing: border-box;
}
body {
    font-family: Arial;
    padding: 10px;
    height: auto;
    width: 1365px;
    margin: 0 auto;
}
main {
                width: 1305px;
                height:auto;
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
    background-color: rgb(161, 247, 122);
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
.topnava {
    
    background-color: rgb(253, 68, 68);

}
.topnava th {
   
    width:190px;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    
 
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
    height:369px;
    padding-left: 20px;
    border:1px solid lightgray;
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
    height: 215px;
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
<script>
<!--========================결제선택 스크립트======================================== -->

  $("#btn-container").click(function(){
	 if($("#btn-container").val()=="1"){
	    $('#btn-container').css("border","solid 3px red");
	    $('#btn-button').css("color","red").css("font-weight","bold").html("신용카드 (선택완료)");
	    $(this).val("2");
	 }else{
		   $(this).val("1");
		   $('#btn-container').css("border","solid 1px black");
		    $('#btn-button').css("color","black").css("font-weight","normal").html("신용카드");
	 }
	 });
  
  
 
</script>


<script type="text/javascript">
<!--======================주문자정보 동일 체크 스크립트========================================== -->
  function check1(f){

    if (f.checked) {

      $('#name_2').val($('#name_1').val());

      $('#phone_2').val($('#phone_1').val());
     

    } else{

    $('#name_2').val('');

    $('#phone_2').val('');

      }

    }
  <!--======================포인트 모두사용 스크립트=============allpay2======allpay3=====allpay4================== -->
  
  function check2(f){

    if (f.checked) {
      $('#allpay3').val($('#allpay2').val());  //모든포인트를 왼쪽 input에 
      $("#allpay3").attr("readonly",true).css("background-color","rgb(243, 243, 243)"); //모두사용 체크하면 input 란 readonly처리
      
      
     /*  $('.def').html(''); */
      $('#allpay4').removeClass('invisible'); //오른쪽사이드바 최종결제금액확인란에서 input(모두체크)안보이게
     $('.def').addClass('invisible');
      let a=$('#allpay2').val()
      $('#allpay4').val(-a+' 원');	//모든포인트를 오른쪽사이드바 최종결제금액확인란에
      $(".abc").off("keyup");  //왼쪽 input에서 글쳐도 오른쪽바에 자동입력되는거 off

    } else{

    $('#allpay3').val('').attr("readonly",false).css("background-color","white");
    $('#allpay4').val('0원');
    $('#def123').html('0원');  //체크선택 후 다시헤제하면 div공간 비워지게하기
    $('#allpay4').addClass('invisible');
    $('.def').removeClass('invisible');
   

    $(document).ready(function(){

    	$(".abc").click(function(){
    		
    	})
    	 $(".abc").keyup(function(){

    		 if($("#allpay3").val()<=${loginMember['m_point']}){
			let a=$(".abc").val();
    	   $(".def").text(-a+" 원");
    		 }else{
    			  alert("최대로 사용할 수 있는 point를 초과하였습니다.");
    			  $("#allpay3").val('');
    			  $(".def").text($(".abc").val());
    		 }

    	 });

    	 });

      }

    }
  <!--=====================약관보기 체크 스크립트=============agree1 === agree2=======agree5======= -->
 
  $("#agree1").click(function(){
	  $('#agree2').css("display","inline");
	  $('#agree5').css("height","116px");
  });
  
  <!--=====================모두 동의합니다 체크시 결제하기 버튼 바꾸기=============check123 === dopay============= -->
  
  $(document).ready(function(){
	    $("#check123").change(function(){
	        if($("#check123").is(":checked")){
	        	$('#dopay').css("color","white").css("background-color","black");
	        	$('#agree5').css("color","white").css("border","1px solid black");
	        	$('.rightcolumn').css("color","white").css("border","1px solid black");
	        	$('#agree2').css("color","black");
	        }else{
	        	$('#dopay').css("color","rgb(190, 190, 190").css("background-color","rgb(243, 243, 243)");
	        	$('#agree5').css("color","white").css("border","1px solid lightgray");
	        	$('.rightcolumn').css("color","white").css("border","1px solid lightgray");
	        	
	        }
	    });
	});
	
  
  <!--======================포인트 자동 주문표에 입력스크립트============================== -->
  $(document).ready(function(){

	$(".abc").click(function(){
	
})
 $(".abc").keyup(function(){

  if($("#allpay3").val()<=${loginMember['m_point']}){
	  
	  let a=$(".abc").val()
	  $(".def").text(-a+" 원");
	  
  }else{
	  alert("최대로 사용할 수 있는 point를 초과하였습니다.");
	  $("#allpay3").val('');
	  $(".def").text($(".abc").val());
	
  }
 



 });

 });


  </script>
   <!--=====================쿠폰사용 스크립트=========================================== -->
  <script>

const modal = document.querySelector('dialog');
const btn = document.querySelector('button');
const btnClose = document.querySelectorAll('.close');

btn.addEventListener('click', () => openModal());
btnClose.forEach((elm) => elm.addEventListener('click', () => closeModal()));
modal.addEventListener('click', (e) => detectBackdropClick(e));

openModal = () => {
    modal.showModal();
}

closeModal = () => {
    modal.classList.add("dialog__animate-out");
    modal.addEventListener('animationend', handleClose, false);
}

handleClose = () => {
    modal.classList.remove("dialog__animate-out");
    modal.removeEventListener('animationend', handleClose, false);
    modal.close();
}

detectBackdropClick = (event) => {
    if(event.target === modal) {
        closeModal();
    }
}


<!--=============================form 태그 스트립트 널값인거 예외처리하기 =========checkedNull()========================== -->

</script>

<style>


.button-close {
  padding: 10px;
  align-self: flex-end;
  background-color: transparent;
  box-shadow: none;
  color: #838282;
}

dialog {
  padding: 0;
  border: none;
  border-radius: 6px;
  -webkit-animation: appear 0.8s cubic-bezier(0.77, 0, 0.175, 1) forwards;
          animation: appear 0.8s cubic-bezier(0.77, 0, 0.175, 1) forwards;
  box-shadow: 0 25px 40px -20px #3c4a56;
}

.dialog__animate-out {
  -webkit-animation: dissappear 0.8s cubic-bezier(0.77, 0, 0.175, 1) forwards;
          animation: dissappear 0.8s cubic-bezier(0.77, 0, 0.175, 1) forwards;
}

.dialog__inner {
  display: -webkit-box;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
          flex-direction: column;
  color: #838282;
}

.dialog__close-btn {
  align-self: flex-end;
}

.dialog__content {
  padding: 0 55px 55px 55px;
}

.dialog__footer {
  padding: 55px 55px 0 55px;
  display: -webkit-box;
  display: flex;
  -webkit-box-pack: center;
          justify-content: center;
  -webkit-box-align: center;
          align-items: center;
}

@-webkit-keyframes appear {
  from {
    opacity: 0;
    -webkit-transform: translateY(20px);
            transform: translateY(20px);
  }
  to {
    opacity: 1;
    -webkit-transform: translateY(0);
            transform: translateY(0);
  }
}

@keyframes appear {
  from {
    opacity: 0;
    -webkit-transform: translateY(20px);
            transform: translateY(20px);
  }
  to {
    opacity: 1;
    -webkit-transform: translateY(0);
            transform: translateY(0);
  }
}
@-webkit-keyframes dissappear {
  from {
    opacity: 1;
    -webkit-transform: translateY(0);
            transform: translateY(0);
  }
  to {
    opacity: 0;
    -webkit-transform: translateY(20px);
            transform: translateY(20px);
  }
}
@keyframes dissappear {
  from {
    opacity: 1;
    -webkit-transform: translateY(0);
            transform: translateY(0);
  }
  to {
    opacity: 0;
    -webkit-transform: translateY(20px);
            transform: translateY(20px);
  }
}
.table123{
 margin-top: 15px;
}
.col-lg-12{
border : 1px solid lightgray;
width:200px;
height:45px;
background-color: rgb(243, 243, 243);
text-align:right;
padding-top:11px;
}


</style>
 <!--================================================================ -->
<br><br>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>