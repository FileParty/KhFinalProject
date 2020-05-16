<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

  <style>
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
                    		<h5 style="text-align:center;"><strong><span style="color:red;">* 카테고리</span> -><span style="color:orange;"> 추가옵션 </span>-> <span style="color:lightgreen;">메뉴등록</span> 순으로 등록하시면 편리합니다.</strong></h5>
                    	<br>
                    	<br>
                    	   
                    	   <button type="button" id="subBtn" class="btnC btn btn-outline-success" data-toggle="modal" data-target="#myModal3">카테고리 추가</button> 
                    	   <button type="button" id="subBtn1" class="btn btn-outline-warning btnC1" data-toggle="modal" data-target="#myModal">옵션 추가</button>
                    	   <button type="button" id="subBtn2" class="btn btn-outline-primary" onclick="menuEnroll();">메뉴 등록</button>
                    		<button style="display:none;"type="button" class="hidBtn" onclick="hidBtn();"></button>
                    		<form action="${path }/licensee/menuEnrollEnd" method="post" id="menu-container" enctype="multipart/form-data">
                    		<div class="container addCategory" name="div">	
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
						        <form action="${path }/licensee/categoryEnroll" method="post" class="categoryForm"> 
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
						        	<form action="${path }/licensee/optionEnroll" method="post">	         	
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
						          <h4 class="modal-title">메뉴 등록 <button style="margin-left:300px;height:30px;"type="button"class="xxx btn btn-outline-dark" onclick="xx();" data-dismiss="modal">x</button></h4>
						        </div>
						        <div class="modal-body" align=center>	
						        	<div class="body-container custom-file">		
						        		<label class="custom-file-label fileName" for="modalFile"><strong>메뉴 이미지를 첨부해주세요.</strong></label>
						        		<input type="file" id="modalFile" class="custom-file-input">
						        				        		        
						        		<input type="text" placeholder="메뉴명" class="menu-name form-control" name="menu-name">
						        		<input type="number" placeholder="메뉴가격" class="menu-price form-control" name="menu-price">
						        		<textarea cols="40" rows="1" placeholder="메뉴간단설명" class="menu-detail form-control" name="menu-detail"></textarea>
						        		
						        		<input  type="hidden" value="" id="hid" >					         
						        		<br>							        		
						        	</div>
						        	<div style="margin-top:180px;"class="body-container2"></div>
						        	<div style=""class="body-container3"></div>
						        	<button type="button" id="optionEnroll"class="btn btn-outline-danger" data-dismiss="modal" onclick="menu_enroll();">등록</button>			
						        </div>
						      </div>
						    </div>
						  </div>	
		<script>
			var num = 0;
			
			$("#modalFile").change(function(){
				let fileValue = $("#modalFile").val().split("\\");
				let fileName = fileValue[fileValue.length-1]; 
				$(".fileName").html(fileName);
			})
			function xx() {
				$("#selectCategory").remove();
				$(".menu-name").val("");
				$(".menu-price").val("");
				$(".menu-detail").val("");
				$("#modalFile").val("");
				$(".fileName").html('');
			}
			function menuEnroll() {
				
				$("#myModal2").modal({backdrop:'static'});
				
				var sel = $("<select>").attr({
					'id':'selectCategory'
				})
				
				$.ajax({
					url:'${path}/licensee/selectCategory',
					success:function(data){
						for(let i=0;i<data.length;i++) {
							var op = $("<option>").attr({
								'for':'selectCategory',
								'value':data[i].mt_name,
								'alt':data[i].mt_no
								
							}).html(data[i].mt_name);
							
							var mtNo = $("<input>").attr({
								'type':'hidden',
								'value':data[i].mt_no,
								'name':'mt_nos',
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
						'type':'radio',
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
			
			var tbl = $("<table>");
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
				td.append(text);
				td1.append(number).append(hidden);
				tr.append(td).append(td1);
				tbl.append(tr);
				$("#option1-container").append(tbl);			
			}
			var tbl2 = $("<table>");
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
				td.append(texts);
				td1.append(numbers).append(hidden);
				tr.append(td).append(td1);
				tbl2.append(tr);
				$("#option2-container").append(tbl2);					
			}
		
			
			function menu_enroll() {
				
				
				var values = $("input[name=radio]:checked").val();
				var spanValue = $("input[name=radio]:checked").next().next().html();
				
				
				var inputR = $("<input>").attr({
					 'type':'radio',
					 'name':'end',
					 'id':'end',
					 'value':values,
					 'checked':'true',
					'class':'form-control'
					
				 }).css({'display':'inline','width':'20','height':'20'});
				 var labelR = $("<label>").attr({
					 'for':'end',
					 
				 }).html($("input[name=radio]:checked").val());
				
				 let sdNoHid = $("<input>").attr({
					 'type':'hidden',
					 'name':'sdNoEnd',
					 'value':$("input[name=radio]:checked").prev().val()
				 })
				 
				 var spans = $("<input>").attr({'type':'number','name':'rPrice','value':spanValue,'class':'form-control'}).css({'display':'inline','width':'80','height':'20'});
				 var strong = $("<strong>");
				 var pTag = $("<p>").html("필수");
				 
				 strong.append(pTag);
				
				 let fileValue = $("#modalFile").val().split("\\");
				let fileName = fileValue[fileValue.length-1]; 
				
				
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
				var imgInput = $("<input>").attr({'type':'hidden','name':'me_logImg'});
				imgInput.val(fileName);
				console.log('파일',imgInput.val());
				var div = $("<div>").attr('class','col-lg-5 bodyOne');
				var div1 = $("<div>").attr('class','col-lg-4 bodyTwo'+num);
				var div2 = $("<div>").attr('class','col-lg-3 bodyThree');
				var div3 = $("<div>").attr('class','row categoryPlus'+num);
				
				
				var img = $("<img>").attr({
					'id':'preview'+num,
					'class':'rounded-circle preview'+num,
					'src':' ',
					'width':'150'
				})
				
			
				var file = document.querySelector('#modalFile');
				var fileList = file.files;
				var reader = new FileReader();
				reader.readAsDataURL(fileList[0]);
				reader.onload = function  () {        
			        document.querySelector('.preview'+num).src = reader.result;
				};
				
				div.append(inputN);
				div.append(inputP);
				div.append(textD);
				div1.append(sdNoHid).append(strong).append(inputR).append(labelR).append(spans).append("<br>");
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
				        	'class':'form-control',
				        	'checked':'true',
				        	
				        }).css({'display':'inline','width':'20'});
				        var goods = $("<label>").attr({
				        	'for':'addEnd'+i,
				        	
				        }).html(check[i]).css({'display':'inline'});
				        var spanValues = $("<input>").attr({'type':'number','name':'endPrice','value':$("input[name=check]:checked").next().next().html(),'class':'form-control'}).css({'display':'inline','width':'80','height':'20'});
				    	
				       var sdNoInput = $("<input>").attr({
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
				 		'value':$("option:selected").next().val(),
				 	})
				 	var testss = $(".bodyTwo"+num);
				 	
				 	var hiddenInput = $("<input>").attr({
				 		'type':'hidden',
				 		'name':'count',
				 		'value':$(".categoryPlus"+num).find($("input[name=sdNoEnd]")).length
				 	})
				 	//동적 인풋태그생성
				 
				 	console.log($(".categoryPlus"+num).find($("input[name=sdNoEnd]")).length);
				 	console.log(hiddenInput);
				var divv = $("<div>")
				divv.append(hiddenInput);
				div2.append(imgInput).append(img);
				div3.append(div).append(div1).append(div2);
				$(".addCategory").append(cateInput).append(mtNoInput);
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
				
				div3.append(hiddenInput);

				 }
			
		
		
		
		</script>
    </section>
    
    <%@ include file="../common/footer.jsp" %>