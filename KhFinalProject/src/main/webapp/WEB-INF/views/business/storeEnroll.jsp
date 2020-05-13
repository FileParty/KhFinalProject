<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${path }/resources/css/storeEnroll.css"/>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <section style="width:auto;height:auto;">
 	<div class="container" >
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                    <ul class="ss nav nav-tabs nav-justified" style="width: auto;">  
						<li class="nav-item"><a href="${path }/licensee/storeEnroll" class="list nav-link active">매장 등록</a></li>
						<li class="nav-item"><a href="${path}/licensee/storeStatus" class="list nav-link ">매장 등록 관리</a></li>
                    </ul>
                    
                    <div class="store-enroll-box">
                  		
                  		<div class="store-enroll">
                  			
                  			<div class="store-enroll-title">
								<i class='fas fa-pen' style='font-size:24px'></i>&nbsp;<span>매장등록</span>         			
                  			</div>
                  			
                  			<div class="store-enroll-content">
	                  			<form action="#" method="post">
	                  				<table>
	                  					<tr>
	                  						<th class="store-enroll-info-title">상호명</th>
	                  						<th class="store-enroll-info">
	                  							<input type="text" name="sname" id="sname" placeholder="예시)BBQ" size="60px;"/>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">주소</th>
	                  						<th class="store-enroll-info">
	                  							<input type="text" name="saddr" id="saddr" size="60px;" readonly/>
	                  							<input type="hidden" name="xl" id="xl" />
	                  							<input type="hidden" name="yl" id="yl" />
	                  							<button onclick="goPopup()">주소찾기</button>
	                  							&nbsp;<p>* 주소버튼을 통해서 주소를 찾을 수 있습니다.</p>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">연락처</th>
	                  						<th class="store-enroll-info">
	                  							<select name="phone" id="phone" class="ui fluid search dropdown" >
	                  								<option value="">지역번호</option><option value="02">02</option><option value="051">051</option><option value="053">053</option><option value="032">032</option><option value="062">062</option><option value="042">042</option><option value="052">052</option>
	                  								<option value="044">044</option><option value="031">031</option><option value="033">033</option><option value="043">043</option><option value="041">041</option><option value="063">063</option><option value="061">061</option>
	                  								<option value="054">054</option><option value="055">055</option><option value="064">064</option>
	                  							</select> -
	                  							<input type="text" name="phone2" size="10px"> -
	                  							<input type="text" name="phone3" size="10px">
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">종목선택</th>
	                  						<th class="store-enroll-info">
	                  							<label><input type="checkbox" name="category" value="치킨">치킨</label>&nbsp;&nbsp;
	                  							<label><input type="checkbox" name="category" value="피자">피자</label>&nbsp;&nbsp;
	                  							<label><input type="checkbox" name="category" value="중국집">중국집</label>&nbsp;&nbsp;
	                  							<label><input type="checkbox" name="category" value="분식">분식</label>&nbsp;&nbsp;
	                  							<label><input type="checkbox" name="category" value="한식">한식</label>&nbsp;&nbsp;
	                  							<label><input type="checkbox" name="category" value="햄버거">햄버거</label>&nbsp;&nbsp;
	                  							<label><input type="checkbox" name="category" value="일식">일식</label>
	                  				
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">최소금액</th>
	                  						<th class="store-enroll-info">
	                  							<input type="number" name="slimitprice" min="9000"> 원 <p>* 최소 9000원 이상입니다.</p>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">결제방법</th>
	                  						<th class="store-enroll-info">
	                  							<label><input type="radio" name="spayopt" value="현금결제">현금결제</label>&nbsp;&nbsp;
	                  							<label><input type="radio" name="spayopt" value="카트결제">카트결제</label>&nbsp;&nbsp;
	                  							<label><input type="radio" name="spayopt" value="현금결제/카트결제">현금결제/카트결제</label>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">소개글</th>
	                  						<th class="store-enroll-info">
	                  							<textarea rows="5" cols="70" style="resize: none;"></textarea><br>
	                  							<p >* 자신의 가게에 대한 소개를해보세요.</p>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">원산지</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">메인이미지</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">소요시간</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">휴무일</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">쿠폰허용</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">운영시간</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">마감시간</th>
	                  						<th class="store-enroll-info"></th>
	                  					</tr>
	                  					
	                  				</table>
	                  			</form>
							</div>
                  		</div>                  		

                    </div>
                    
            </div>
   		</div>
   	</div>
    </section>
    
    <script>
    
    function goPopup(){
		
		var pop = window.open("${path}/juso/jusoxy","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 

		}
		
		function jusoCallBack(roadFullAddr, entX, entY){
			
			$("#saddr").attr("value",roadFullAddr);
			$("#xl").attr("value",entX);
			$("#yl").attr("value",entY);
			
		}
    </script>
    
    <%@include file="../common/footer.jsp" %>