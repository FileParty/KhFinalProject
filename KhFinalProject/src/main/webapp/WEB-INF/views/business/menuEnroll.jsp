<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

  <style>
  
	#xBtn {
		box-shadow:inset 0px 1px 0px 0px #fce2c1;
		background:linear-gradient(to bottom, #ffc477 5%, #fb9e25 100%);
		background-color:#ffc477;
		border:3px solid #eeb44f;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:8px;
		font-weight:bold;
		padding:0px 11px;
		text-decoration:none;
		text-shadow:0px 1px 0px #cc9f52;
	}
	#xBtn {
		background:linear-gradient(to bottom, #fb9e25 5%, #ffc477 100%);
		background-color:#fb9e25;
	}
	#xBtn {
		position:relative;
		top:1px;
	}

	 div#main{
      	margin-top:150px;
      	margin-left:200px;
      }
      div.col-12{
      	width:900px;
      	
      }
      th#h2{
      padding: 20 0 20 0;
      }
      th#h3{
      padding: 20 0 20 0;
      }
      td.d1{
      padding:0 0 0 10;
      }
      td.d2{
      padding:10 0 0 0;
      }
      th#h1{
       padding:0 0 20 0;
      }
      .btnC {
      margin-left:300px;
      }

      







      </style> 
	<%@ include file="../common/header.jsp" %>
	
    <section style="width:1366px;height:auto;margin-bottom:200px;">
 	<div class="container">
 		<div class="row">
 		<%@ include file="sideBar.jsp" %>
            <div class="col-lg-10" id="main">
                     <ul class="nav nav-tabs nav-justified">
                        <li class="nav-item">
                        	<a href="${path }/licensee/menuEnroll" class="list nav-link active">메뉴 등록</a>
                        </li>
                         <li class="nav-item">
                        	<a href="${path }/licensee/menuStatus" class="list nav-link">메뉴 관리</a>
                        </li>
                    </ul>
                    <br>                 

                    	<div class="col-12">
                    	<br>
                    		
                    		<select id="storeInfo" name="storeNo" class="form-control" style="margin-left:400px;width:100px;display:block;">
                    		<c:forEach items="${store}" var="s">
                    			<option for="storeInfo" value="${s.s_No }"><c:out value="${s.s_Name }" /></option>
                    		</c:forEach> 
                    		</select>
                    		<br>
                    		<br>
                    	   <button type="button" id="subBtn" class="btnC btn btn-outline-success" onclick="categoryPlus();">카테고리 추가</button> 
                    	   <button type="button" id="subBtn1" class="btn btn-outline-warning btnC1" onclick="optionPlus();">옵션 추가</button>
                    	   <button type="button" id="subBtn2" class="btn btn-outline-primary" onclick="menuEnroll();">메뉴 등록</button>
                    		<button style="display:none;"type="button" class="hidBtn" onclick="hidBtn();"></button>
                    		<form action="${path }/licensee/menuEnrollEnd" method="post" id="menu-container" enctype="multipart/form-data">
                    		<div class="container addCategory">	
                    		</div>
                    		<br>
                    		<br>
                    		<button style="margin-left:400px;"  id="menuEnrollBtn" type="submit" id="subBtn2" class="btn btn-outline-warning">등록</button>
                    		</form>
                    		
                    	    </div>
                    	  </div>
                    	</div>                    				  
            	</div> <!-- 컨테이너 -->
            		
            			<!--카테고리 추가 모달 -->
            			<div class="modal" id="myModal3">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header">
						          <h4 class="modal-title">카테고리 등록</h4>
						          <button style="margin-left:180px;"class="btn btn-outline-dark"type="button" onclick="add();">추가</button>
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>
						         
						        <div class="modal-body" align=center>	
						        <form id="form" action="${path }/licensee/categoryEnroll" method="post" class="categoryForm"> 
						        	<button type="submit">등록</button>
						        </form>
						        </div>					        
						      </div>
						    </div>
						  </div>

						<!-- 추가옵션 등록 모달 -->
						  <div class="modal" id="myModal">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header">
						          <h4 class="modal-title">추가옵션 등록</h4>
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>
						         
						        <div class="modal-body" align=center>	
						        	<form id="optionForm" action="${path }/licensee/optionEnroll" method="post" onsubmit="return text();">	         	
						          	<input style="width:60px;display:inline" type="text" id="plusOption2" name="e_option" class="form-control" placeholder="필수" disabled>
						          	<button type="button" class="btn btn-outline-success plus"  onclick="option();">옵션 추가</button>						     
						          	<br>
						          	<br>
						          	<div id="option1-container">
						          	</div>					          					          	
						          	<input style="width:60px;display:inline;" type="text" id="plusOption2" name="e_option2" class="form-control" placeholder="추가" disabled>        
						          	<button type="button" class="btn btn-outline-success plus1" onclick="option1();">옵션 추가</button> 					          	
						          	<br>
						          	<br>
						          	<div id="option2-container"></div>
						          	 
						          	<button type="submit" class="btn btn-outline-danger" >등록</button>		
						          	</form>		        
						        </div>					        
						      </div>
						    </div>
						  </div>
						  <!-- 메뉴등록 모달 -->
						  <div class="modal" id="myModal2">
						    <div class="modal-dialog">
						      <div class="modal-content">
						        <div class="modal-header">
						          <h4 class="modal-title">메뉴 등록 <button id="xBtn" style="margin-left:300px;height:30px;"type="button"class="xxx btn btn-outline-dark" onclick="xx();" data-dismiss="modal">x</button></h4>
						        </div>
						        <div class="modal-body" align=center>	
						        	<div class="body-container custom-file">		
						        		<label class="custom-file-label fileName" for="modalFile"><strong>메뉴 이미지를 첨부해주세요.</strong></label>
						        		<input type="file" id="modalFile" class="custom-file-input">
						        				        		        
						        		<input type="text" placeholder="메뉴명" class="menu-name form-control" name="menu-name">
						        		<input type="number" placeholder="메뉴가격" class="menu-price form-control" name="menu-price">
						        		<textarea cols="20" rows="1" placeholder="메뉴간단설명(30자 제한)" id="textArea" class="menu-detail form-control" name="menu-detail"></textarea>
						        		<br>
						        	</div>
						        	<div style="margin-top:200px;"class="body-container2"></div>
						        	<div style=""class="body-container3"></div>
						        	<button type="button" id="optionEnroll"class="btn btn-outline-danger" data-dismiss="modal" onclick="menu_enroll();">등록</button>			
						        </div>
						      </div>
						    </div>
						  </div>
						 
						  
						  	
		<script>
		
		function text() {
			//옵션 폼
			let sd_name = $("input[name=sd_name]").val();
			let sd_price = $("input[name=sd_name]").val();
			if(sd_name.trim().length==0 || sd_price.trim().length==0) {
				alert('ㅎㅎㅎ');
				return false;
			}
		}
		$(function() {
		$("#textArea").on('keyup',function(){
			if($(this).val().length>20) {
				$(this).val($(this).val().substring(0,30));
			}
		});
		});
			$(".close").click(function() {
			
				$("input[name=category]").remove();
				$("input[name=sd_name]").parent().parent().remove();
				$("input[name=sd_price]").parent().remove();
				$(".deleteBtn").remove();
				
			})
			var num = 0;			
			 $("#modalFile").change(function(){
				 console.log($("#modalFile").val());
				 
				let fileValue = $("#modalFile").val().split("\\");
				let fileName = fileValue[fileValue.length-1]; 
				console.log(fileName);
				if(fileName.trim().length==0) {
					$(".fileName").html('<strong>'+'메뉴 이미지를 첨부해주세요.'+'</strong>');
				}else { 
					$(".fileName").html(fileName);
				}

			}) 
			function xx() {
				$("#selectCategory").remove();
				$(".menu-name").val("");
				$(".menu-price").val("");
				$(".menu-detail").val("");
				$("#modalFile").val("");
				$(".fileName").html('<strong>'+'메뉴 이미지를 첨부해주세요.'+'</strong>');
			}
			 function categoryPlus() {
				 $("#myModal3").modal('show');
				 let storeNo = $("<input>").attr({
					 'type':'hidden',
					 'name':'storeNo',
					 'value':$("#storeInfo").val()
				 });
				 $("#form").append(storeNo);
				 
			 }
			 function optionPlus() {
				 $("#myModal").modal('show');
				 let storeNo = $("<input>").attr({
					 'type':'hidden',
					 'name':'storeNum',
					 'value':$("#storeInfo").val()
				 });
				 $("#option2-container").append(storeNo);
			 }
			 function menuEnroll() {
				
				$("#myModal2").modal({backdrop:'static'});
				
				var sel = $("<select>").attr({
					'id':'selectCategory',
					'class':'form-control',				
				}).css('width','auto');
				 

				$.ajax({
					url:'${path}/licensee/selectCategory',
					data:{s_no:$("#storeInfo").val()},
					success:function(data){
						
						for(let i=0;i<data.length;i++) {
							var op = $("<option>").attr({
								'for':'selectCategory',
								'value':data[i].mt_name,
								
								
							}).html(data[i].mt_name);
							
							var mtNo = $("<input>").attr({
								'type':'hidden',
								'value':data[i].mt_no,
								'name':'mt_no',
								'class':'mtNo'+data[i].mt_no
							})
							sel.append(op).append(mtNo);
						}
						
						$(".body-container").append(sel);
						
						
					}
				})
				num++;
			}
			 
			
			function add() {
				$(".categoryForm").append($("<input>").attr({'type':'text','class':'form-control','name':'category','placeholder':'카테고리를 입력해주세요.'}));
			}
	
			
			$("#myModal2").on('show.bs.modal',function(){
				
				let div = $(".body-container2").children();
				let div2 = $(".body-container3").children();
				 	$.ajax({
				url:'${path }/licensee/selectOption',
				data:{s_no:$("#storeInfo").val()},
				success:function(data) {
					div.remove();
					div2.remove();
					console.log('성공');
					console.log(data);
					
					
					var hh3 = $("<h3>").attr({
						'class':'hh3text'
					}).html('필수선택');
					var h3 = $("<h3>").attr({
						'class':'h3text'
					}).html('추가선택');
					
					$(".body-container2").append(hh3);
					$(".body-container3").append(h3);
					
					for(let i=0;i<data.length;i++) {
						if(data[i].sd_division=='Y') {
					var input =  $("<input>").attr({
						'type':'checkbox',
						'value':data[i].sd_name,
						'id':'sideOption'+i,
						'name':'radio'
						
					})
					var label = $("<label>").attr({
						'for':'sideOption'+i,
						
					}).html(data[i].sd_name);
					let sdNo = $("<input>").attr({
						'type':'hidden',
						'name':'sdNo',
						'value':data[i].sd_no
					})	
					var span = $("<span>").html(data[i].sd_price).css('margin-left','80');
				
						
					$(".hh3text").after(span).after(label).after(input).after(sdNo).after($("<br>"));
					
					}else { 
						var input =  $("<input>").attr({
							'type':'checkbox',
							'value':data[i].sd_name,
							'id':'sideOption'+i,
							'class':'sideOption',
							'name':'check'
							
						})
						var label = $("<label>").attr({
							'for':'sideOption'+i,
							
						}).html(data[i].sd_name);
						
						var span = $("<span>").html(data[i].sd_price).css('margin-left','100');
						let sdNo = $("<input>").attr({
							'type':'hidden',
							'name':'sdNo',
							'value':data[i].sd_no
						})
						$(".h3text").after(span).after(label).after(input).after(sdNo).after($("<br>"));
						
					}
					}
					
				},
				error:function(){
					console.log("실패");
				}
			});	 
			})
			
			var tbl = $("<table>").attr('id','option1');
			var tr = $("<tr>");
			var th = $("<th>").html('옵션');
			var th1 = $("<th>").html('가격');
			tr.append(th).append(th1);
			tbl.append(tr);
			tbl.attr({
				'class':'table table-hover'
			})
			
			
			function option() {
				var tr = $("<tr>");
				var tr1 = $("<tr>");
				var td = $("<td>");
				var td1 = $("<td>");
				var td2 = $("<td>");
				var text = $("<input>").attr({
					'type':'text',
					'name':'sd_name',
					'class':'sd_name form-control',
					'placeholder':'옵션 입력 해주세요'
				})
				var number = $("<input>").attr({
					'type':'number',
					'name':'sd_price',
					'class':'sd_price form-control',
					'placeholder':'가격 입력 해주세요'
				});	
				var hidden = $("<input>").attr({
					'name':'sd_division',
					'type':'hidden',
					'value':'Y'
				})
				let deleteBtn = $("<input>").attr({
					'class':'deleteBtn',
					'type':'button',
					'value':'x',
					'onclick':'deleteX();'
					
				})
				td.append(text);
				td1.append(number).append(hidden);
				td2.append(deleteBtn);
				tr.append(td).append(td1).append(td2);
				tbl.append(tr);
				$("#option1-container").append(tbl);			
			}
			
			function deleteX() {
				console.log(event.target.parentNode.parentNode);
				let deleteX = event.target.parentNode.parentNode;
				deleteX.remove();
				
			}
			
			var tbl2 = $("<table>").attr('id','option2');
			var tr2 = $("<tr>");
			var th2 = $("<th>").html('옵션');
			var th3 = $("<th>").html('가격');
			tr2.append(th2).append(th3);
			tbl2.append(tr2);
			tbl2.attr({
				'class':'table table-hover'
			})
			
			function option1() {
				var tr = $("<tr>");
				var tr1 = $("<tr>");
				var td = $("<td>");
				var td1 = $("<td>");
				var td2 = $("<td>");
				var texts = $("<input>").attr({
					'type':'text',
					'name':'sd_name',
					'class':'form-control',
					'placeholder':'옵션 입력 해주세요'
					
				})
				var numbers = $("<input>").attr({
					'type':'number',
					'name':'sd_price',
					'class':'form-control',
					'placeholder':'가격 입력 해주세요'
				})
				var hidden = $("<input>").attr({
					'name':'sd_division',
					'type':'hidden',
					'value':'N'
				})
				
				let deleteBtn = $("<input>").attr({
					'class':'deleteBtn',
					'type':'button',
					'value':'x',
					'onclick':'deleteX();'
					
				})
				td.append(texts);
				td1.append(numbers).append(hidden);
				td2.append(deleteBtn);
				tr.append(td).append(td1).append(td2);
				tbl2.append(tr);
				$("#option2-container").append(tbl2);					
			}
		
			
			function menu_enroll() {
				if($("input[name=menu-name]").val().trim().length==0){
					alert('메뉴명을 적어주세요!');
					$("input[name=menu-name]").focus();
					$("#optionEnroll").removeAttr('data-dismiss');
					return;
				}else { 
					$("#optionEnroll").attr('data-dismiss','modal');
				}
				
				if($("input[name=menu-price]").val().trim().length==0){
					alert('메뉴 가격을 적어주세요!');
					$("input[name=menu-price]").focus();
					$("#optionEnroll").removeAttr('data-dismiss');
					return;
				}else { 
					$("#optionEnroll").attr('data-dismiss','modal');
				}
				let txt = document.getElementById('textArea').value;
				if(txt.length==0){
					alert('메뉴 간단 설명을 해주세요!');
					$("input[name=menu-detail]").focus();
					$("#optionEnroll").removeAttr('data-dismiss');
					return;
				}else { 
					$("#optionEnroll").attr('data-dismiss','modal');
				}
					
				let checkName = document.getElementsByName('check');
				let checkCount = 0;
				
			 for(let i=0;i<checkName.length;i++) {
					
					let check = checkName[i];
						
					if(check.checked==false) {
						checkCount+= 0;		
						
					}else {
						checkCount += 1;
						
					}
				}
			
				
				if($("input[name=radio]:checked").length==0){
					alert('필수옵션 선택해주세요!');
					$("input[name=radio]:checked").focus();
					$("#optionEnroll").removeAttr('data-dismiss');
					return;
				}else {
				$("#optionEnroll").attr('data-dismiss','modal');
				}
				
				 if(checkCount == 0) {
					 alert('추가옵션은 1개 이상 선택해주세요!');
					 $("#optionEnroll").removeAttr('data-dismiss');
					 return;
				 }else {
						$("#optionEnroll").attr('data-dismiss','modal');
					}
				
				
				var cloneFile = $("#modalFile").clone();
				cloneFile.removeAttr('id');
				cloneFile.attr({
					'id':'cloneFile',
					'name':'me_logImg',
					
				}).css('display','none');


				var menuName = $(".menu-name").val();
				var menuPrice = $(".menu-price").val();
				var menuDetail = $(".menu-detail").val();
				
				var inputN = $("<input>").attr({
					'type':'text',
					'name':'me_name',
					'value':menuName,
					'class':'form-control'
				});
				var inputP = $("<input>").attr({
					'type':'number',
					'name':'me_price',
					'value':menuPrice,
					'class':'form-control'
				});
				var textD = $("<textarea>").attr({
					'cols':'20',
					'rows':'1',
					'name':'me_text',
					'class':'form-control'
				}).html(menuDetail);
				
				var hidNum = $("#hid").val();	
				var div = $("<div>").attr('class','col-lg-5 bodyOne');
				var div1 = $("<div>").attr('class','col-lg-4 bodyTwo'+num);
				var div2 = $("<div>").attr('class','col-lg-3 bodyThree');
				var div3 = $("<div>").attr('class','row categoryPlus'+num);
				
				
					var img = $("<img>").attr({
						'id':'preview'+num,
						'class':'preview'+num,
						'src':' ',
						'width':'150'
					})
					
				
					var file = document.querySelector('#modalFile');
					var fileList = file.files;
					var reader = new FileReader();
					if(fileList[0]!=null) {
					
					reader.readAsDataURL(fileList[0]);
					 
					}
					
					reader.onload = function  () {       
						
				        document.querySelector('#preview'+num).src = reader.result;
						
						};
					
					
				div.append(inputN);
				div.append(inputP);
				div.append(textD);
			/* 	div1.append(sdNoHid).append(strong).append(inputR).append(labelR).append(spans).append("<br>"); */
			
				
				 var strong = $("<strong>");
				 var pTag = $("<p>").html("필수");
				 strong.append(pTag);
				 div1.append(strong);				 

				let mCheck = [];
				let mPrice = [];
				let sdNum = [];
				 $("input[name=radio]:checked").each(function(i) { 

					 mCheck[i]=$(this).val();
					 mPrice[i]=$(this).next().next().html();
					 sdNum[i]=$(this).prev().val();
				        var mCheckbox = $("<input>").attr({
				        	'type':'checkbox',
				        	'name':'checked',
				        	'value':mCheck[i],
				        	'id':'addEnd'+i,
				        	'class':'form-control checkk',
				        	'checked':'true',
				        	'readonly':'true'
				        	
				        }).css({'display':'inline','width':'20'});
				        var mLabel = $("<label>").attr({
				        	'for':'addEnd'+i,
				        	
				        }).html(mCheck[i]).css({'display':'inline'});
				        var spanValues = $("<input>").attr({'type':'number','name':'endPrice','value':$("input[name=radio]:checked").next().next().html(),'class':'form-control'}).css({'display':'inline','width':'80','height':'20'});
				    	
				       let sdNoInput = $("<input>").attr({
							'type':'hidden',
							'value':sdNum[i],
							'name':'sdNoEnd'
						});
				   
				        div1.append(sdNoInput).append(mCheckbox).append(mLabel).append(spanValues).append($("<br>"));
				 });
				 
					 let check = [];
					let price =[];
					let sdNo=[];
					
					var strong1 = $("<strong>");
					var pTag1 = $("<p>").html("추가");
					strong1.append(pTag1);
					div1.append(strong1);
					
				 $("input[name=check]:checked").each(function(i) { 

				        check[i]=$(this).val();
				        price[i]=$(this).next().next().html();
				        sdNo[i]=$(this).prev().val();
				        var good = $("<input>").attr({
				        	'type':'checkbox',
				        	'name':'checked',
				        	'value':check[i],
				        	'id':'addEnd'+i,
				        	'class':'form-control checkk',
				        	'checked':'true',
				        	'readonly':'true'
				        	
				        }).css({'display':'inline','width':'20'});
				        var goods = $("<label>").attr({
				        	'for':'addEnd'+i,
				        	
				        }).html(check[i]).css({'display':'inline'});
				        var spanValues = $("<input>").attr({'type':'number','name':'endPrice','value':$("input[name=check]:checked").next().next().html(),'class':'form-control'}).css({'display':'inline','width':'80','height':'20'});
				    	
				       let sdNoInput = $("<input>").attr({
							'type':'hidden',
							'value':sdNo[i],
							'name':'sdNoEnd'
						});
	
				        div1.append(sdNoInput).append(good).append(goods).append(spanValues).append($("<br>"));
				 });
						
				 	var  cateInput = $("<input>").attr({
				 		'type':'text',
				 		'name':'categoryEnd',
				 		'value':$("#selectCategory").val(),
				 		'readonly':'true'
				 	})
				 	
				 	
				 	var mtNoInput = $("<input>").attr({
				 		'type':'hidden',
				 		'name':'mt_no',
				 		'value':$("#selectCategory option:selected").next().val(),
				 	})
				 	
				 	var testss = $(".bodyTwo"+num);
				 	
				 	var hiddenInput = $("<input>").attr({
				 		'type':'hidden',
				 		'name':'count',
				 		'value':$(".categoryPlus"+num).find($("input[name=sdNoEnd]")).length
				 	})
				 	 let storeNo = $("<input>").attr({
					 'type':'hidden',
					 'name':'storeNum',
					 'value':$("#storeInfo").val()
				 });
		 
				var divv = $("<div>")
				divv.append(hiddenInput);
				div2.append(img);
				div3.append(div).append(div1).append(div2);
				$(".addCategory").append(cateInput).append(mtNoInput).append(cloneFile);
				$(".addCategory").append(div3);
				$(".menu-name").val("");
				$(".menu-price").val("");
				$(".menu-detail").val("");
				$("#modalFile").val("");
				$(".fileName").html('<strong>'+'메뉴 이미지를 첨부해주세요.'+'</strong>');
				$("#selectCategory").remove();
				console.log($(".categoryPlus"+num).find($("input[name=sdNoEnd]")).length);
				 var hiddenInput = $("<input>").attr({
				 		'type':'hidden',
				 		'name':'count',
				 		'value':$(".categoryPlus"+num).find($("input[name=sdNoEnd]")).length
				 	})
				
				 div3.append(hiddenInput).append(storeNo);
				 

				 }

			
		
		
		
		</script>
    </section>
    
    <%@ include file="../common/footer.jsp" %>