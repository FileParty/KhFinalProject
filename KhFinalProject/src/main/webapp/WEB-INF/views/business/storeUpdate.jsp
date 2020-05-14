<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
	<%@include file="../common/header.jsp" %>
	<link rel="stylesheet" type="text/css" href="${path }/resources/css/storeEnroll.css"/>
    <section style="width:auto;height:auto;">
 	<div class="container">
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                     
                    <h2>매장 정보 수정</h2>
                     
                    <div class="store-enroll-box">
                  		
                  		<div class="store-enroll">
                  			
                  			<div class="store-enroll-title">
								<i class='fas fa-pen' style='font-size:24px'></i>&nbsp;<span>정보입력</span>         			
                  			</div>
                  			
                  			<div class="store-enroll-content">
	                  			<form action="${path }/store/storeEnroll.do" method="post" enctype="multipart/form-data"  onsubmit="return check();">
	                  			
	                  				<table>
	                  					<tr>
	                  						<th class="store-enroll-info-title">상호명</th>
	                  						<th class="store-enroll-info">
	                  							<input type="text" name="sname" id="sname" placeholder="ex) BBQ, 도미노피자" size="60px;" required/>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">주소</th>
	                  						<th class="store-enroll-info">
	                  							<input type="text" name="saddr" id="saddr" size="60px;"/>
	                  							<input type="hidden" name="xl" id="xl" value=" " />
	                  							<input type="hidden" name="yl" id="yl" value=" " />
	                  							<button type="button" onclick="goPopup()" >주소찾기</button>
	                  							&nbsp;<p>* 주소버튼을 통해서 주소를 찾을 수 있습니다.</p>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">연락처</th>
	                  						<th class="store-enroll-info">
	                  							<select name="phone1" id="phone1"  class="ui fluid search dropdown" required >
	                  								<option value="">지역번호</option><option value="02">02</option><option value="051">051</option><option value="053">053</option><option value="032">032</option><option value="062">062</option><option value="042">042</option><option value="052">052</option>
	                  								<option value="044">044</option><option value="031">031</option><option value="033">033</option><option value="043">043</option><option value="041">041</option><option value="063">063</option><option value="061">061</option>
	                  								<option value="054">054</option><option value="055">055</option><option value="064">064</option>
	                  							</select> -
	                  							<input type="text" name="phone2" id="phone2" size="10px" required> -
	                  							<input type="text" name="phone3" id="phone3" size="10px" required>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">종목선택</th>
	                  						<th class="store-enroll-info">
	                  							<label><input type="checkbox" name="category" value="1" checked>치킨</label>
	                  							<label><input type="checkbox" name="category" value="2">피자</label>
	                  							<label><input type="checkbox" name="category" value="3">중국집</label>
	                  							<label><input type="checkbox" name="category" value="4">분식</label>
	                  							<label><input type="checkbox" name="category" value="5">한식</label>
	                  							<label><input type="checkbox" name="category" value="6">햄버거</label>
	                  							<label><input type="checkbox" name="category" value="7">일식</label>
	                  				
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">최소금액</th>
	                  						<th class="store-enroll-info">
	                  							<input type="number" name="slimitprice" value="9000" min="9000" step="500" required> 원 <p>* 최소 9000원 이상입니다.(500원 단위로 증가합니다)</p>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">결제방법</th>
	                  						<th class="store-enroll-info">
	                  							<label><input type="radio" name="spayopt" value="현금결제" checked>현금결제</label>&nbsp;&nbsp;
	                  							<label><input type="radio" name="spayopt" value="카트결제">카트결제</label>&nbsp;&nbsp;
	                  							<label><input type="radio" name="spayopt" value="현금결제/카트결제" checked>현금결제/카트결제</label>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">소개글</th>
	                  						<th class="store-enroll-info">
	                  							<textarea required  name="stext" rows="5" cols="70" style="resize: none;" placeholder="ex) 안녕하세요 ○○○ 가게 입니다 .."> </textarea><br>
	                  							<p >* 자신의 가게에 대한 소개를해보세요.</p>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">원산지</th>
	                  						<th class="store-enroll-info">
	                  							<textarea required name="sorifoodinfo" rows="5" cols="70" style="resize: none;" placeholder="ex) 닭고기(국내산)/돼지고기(수입산)"> </textarea><br>
	                  							<p >* 원산지의 정보를 알맞게 입력해주세요.</p>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">메인이미지</th>
	                  						<th class="store-enroll-info">
	                  							<input type="file" name="slogimg" id="slogimg"/>
										        <div class="img_wrap">
										            <img id="img" src="${path }/resources/img/photocomingsoon.jpg" width="100%" height="100%"/>
										        </div>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">소요시간</th>
	                  						<th class="store-enroll-info">
	                  							<input type="range" name="stime" id="stime" min="30" max="90"  step="10" />
	                  							<div id="rangeshow">50분</div>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">휴무일</th>
	                  						<th class="store-enroll-info">
	                  							<label><input type="checkbox" name="sholiday" value="월" checked>월</label>
	                  							<label><input type="checkbox" name="sholiday" value="화">화</label>
	                  							<label><input type="checkbox" name="sholiday" value="수">수</label>
	                  							<label><input type="checkbox" name="sholiday" value="목">목</label>
	                  							<label><input type="checkbox" name="sholiday" value="금">금</label>
	                  							<label><input type="checkbox" name="sholiday" value="토">토</label>
	                  							<label><input type="checkbox" name="sholiday" value="공휴일">공휴일</label>
	                  							<label><input type="checkbox" name="sholiday" value="연중 무휴">연중 무휴</label>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">쿠폰허용</th>
	                  						<th class="store-enroll-info">
	                  							<select name="scoupon">
	                  								<option value="Y" selected>허용</option>
	                  								<option value="N">비허용</option>
	                  							</select>
	                  							<p>*배달킹이 제공하는 쿠폰이용 허용가능/불가능 설정입니다(쿠폰사용은 결제금액 차감 미적용 됩니다)</p>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">오픈시간/마감시간</th>
	                  						<th class="store-enroll-info">
	                  							오픈 시간 : 
	                  							<select name="sstarttime" id="sstarttime"">
	                  								<option value="" selected>선택</option>
	                  								<option value="0">0:00</option><option value="1">1:00</option><option value="2">2:00</option><option value="3">3:00</option><option value="4">4:00</option><option value="5">5:00</option>
	                  								<option value="6">6:00</option><option value="7">7:00</option><option value="8">8:00</option><option value="9">9:00</option><option value="10">10:00</option><option value="11">11:00</option>
	                  								<option value="12">12:00</option><option value="13">13:00</option><option value="14">14:00</option><option value="15">15:00</option><option value="16">16:00</option><option value="17">17:00</option>
	                  								<option value="18">18:00</option><option value="19">19:00</option><option value="20">20:00</option><option value="21">21:00</option><option value="22">22:00</option><option value="23">23:00</option>
	                  							</select>
	                  							마감 시간 :
	                  							<select name="sendtime" id="sendtime">
	                  								<option value="" selected>선택</option>
	                  								<option value="0">0:00</option><option value="1">1:00</option><option value="2">2:00</option><option value="3">3:00</option><option value="4">4:00</option><option value="5">5:00</option>
	                  								<option value="6">6:00</option><option value="7">7:00</option><option value="8">8:00</option><option value="9">9:00</option><option value="10">10:00</option><option value="11">11:00</option>
	                  								<option value="12">12:00</option><option value="13">13:00</option><option value="14">14:00</option><option value="15">15:00</option><option value="16">16:00</option><option value="17">17:00</option>
	                  								<option value="18">18:00</option><option value="19">19:00</option><option value="20">20:00</option><option value="21">21:00</option><option value="22">22:00</option><option value="23">23:00</option> 								
	                  							</select>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th class="store-enroll-info-title">소개글이미지</th>
	                  						<th class="store-enroll-info">
											    <input type="file" id="input_imgs" name="input_imgs" multiple />		 
										        <div class="imgs_wrap flex-wrap d-flex">
										            
										        </div>
	                  						</th>
	                  					</tr>
	                  					<tr>
	                  						<th colspan="2" style="text-align: center;">
	                  						<button type="submit" class="btn btn-success">수정</button>
	                  						<button type="button" class="btn btn-danger" onclick="location.replace('${path}/licensee/companyStatus')">취소</button>
	                  						</th>
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
    <%@include file="../common/footer.jsp" %>