<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>

	$(function(){
		console.log($(".rec_store"));
		console.log($(".rec-items").length);
		//최근 목록 상세페이지 연결'
		
		var currentPage = 0;
		var changePage = function(){
			$(".rec-container").animate({
				top: -currentPage * 368
			}, 500);
		};
		
		$(".rec-btn-top").click(function(){
			if(currentPage > 0){
				currentPage = currentPage - 1;
				changePage();
				console.log(currentPage);
			}
		});
		
		$(".rec-btn-bottom").click(function(){
			if(currentPage < $(".rec-items").length-1 ){
				currentPage = currentPage + 1;
				changePage();
				console.log(currentPage);
			}
		});
		
		$(".rec-cancel").click(function(e){
			var no = $(this).siblings("input").val();
			console.log(no);
			$.ajax({
				url:"${pageContext.request.contextPath}/menu/recDelete.do",
				data: {
					no : no
				},
				success: function(data){
					console.log(data['flag']);
					console.log(data);
					if(data['flag']==true){
						console.log($(e.target).parent().parent());
						console.log($(e.target).parent().parent().parent());
						
						
						console.log($(".rec-item").length);
						
						var co = $.trim($(".rec-count").html())-1;
						
						$(".rec-count").html(co);  
						
						if($(".rec-item").length%4==1){
							//카운트 감소
							
							$(e.target).parent().parent().parent().remove();
							
							if(currentPage > 0){
								currentPage = currentPage - 1;
								changePage();
								console.log(currentPage);
							}
							if(currentPage==0){
								$(".rec-slider").addClass("d-none");
								$(".rec-none").removeClass('d-none');
							}
						}else{
							$(e.target).parent().parent().remove();
						}  
					}
				}
			})
			
		});
		
		$(".rec_store").click(function(){
			var no = $(this).siblings("input").val();
			var c = $("#menu-category").val();
			var sortType = $("#sortType").val();
			var search = $("#search").val();
			var cPage = $("#cPage").val(); 
		
			console.log(no);
			location.replace('${pageContext.request.contextPath}/menu/menuDetailView?no='+no+'&category='+c+'&sortType='+sortType+'&search='+search+'&cPage='+cPage);
		});
		
		//최근 목록 호버시 삭제버튼 나오게 하기
		$(".rec-item").hover(function(){
			$(this).find(".rec-cancel").removeClass("invisible");
		},function(){
			$(this).find(".rec-cancel").addClass("invisible");
		});
		
		//페이지 로드되었을 때 메뉴-ul active 추가
		$(".list-group-item").siblings().removeClass("active");
		
		//상세페이지 매핑 시켜주기
		$(".food-category").click(function(){
			var no = $(this).find("span").html();
			var c = $("#menu-category").val();
			var sortType = $("#sortType").val();
			var search = $("#search").val();
			var cPage = $("#cPage").val();
			
			no = $.trim(no);
			c = $.trim(c);
			sortType=$.trim(sortType);
			search=$.trim(search);
			cPage=$.trim(cPage);
			
			location.replace('${pageContext.request.contextPath}/menu/menuDetailView?no='+no+'&category='+c+'&sortType='+sortType+'&search='+search+'&cPage='+cPage);
		});
		
		$.each($(".list-group-item"), function(i,v){			
			if($(v).html()=='${category}'){
				$(v).addClass("active");
			}
		});	
		
		$(".category").hover(function(){
			/* $(this).find("h2").css("background-color", "black");
			$(this).find("h2").css("color", "white"); */
			$(this).find("h2").attr("style", "cursor:pointer");
			$(this).find("h2").addClass("text-white");
			$(this).find("h2").addClass("bg-dark");
		},function(){
			/* $(this).find("h2").css("background-color", "white");
			$(this).find("h2").css("color", "black"); */
			$(this).find("h2").removeClass("text-white");
			$(this).find("h2").removeClass("bg-dark");
		});
		
		$(".food-category").hover(function(){
			$(this).attr("style", "cursor:pointer; height:130px; opacity:0.4;");
		}, function(){
			$(this).attr("style", "cursor:pointer; height:130px;");
		});
		
		//메뉴 클릭시 controller로 넘겨주기
		$(".category").click(function(){
			//매핑값 설정
			var category = $(this).attr("id");
			console.log(category);
			//cateogry 같이 넘겨주기
			//location.replace("category/categorylist.do?"+category);
		})
		
		//foodcategory 클릭시 controller로 넘겨주기
		/* $(".food-category").click(function(){
			
			//매핑값 설정 해주세요 ^^
			var category = $(this).val();
			console.log(category);
			location.replace($(path)+"/food/foodlist.do?category=");
		}); */
		
		//메뉴 호버시 포인터
		$(".list-group-item").hover(function(){
			$(this).attr("style", "cursor:pointer;");
		}, function(){
			$(this).attr("style", "cursor:pointer;");
		});
		
		//메뉴 클릭시 active 변화
		//페이지리스트 출력 ajax 처리
		$(".list-group-item").click(function(e){
			var menuCategory = $(this).html();
			$("#menu-category").val(menuCategory);
			$("#sortType").val('');
			$("#search").val('');
			$("#cPage").val('');
			
			$.ajax({
				url:"${pageContext.request.contextPath}/menu/menuFilter.do",
				data: {
					"menuCategory":menuCategory
					
				},
				success: function(data){
					
					console.log(data['list']);
					console.log(data['pageBar']);
					$("#sort").html('기본 정렬순');
					$("#search-name").val('');
					$(e.target).siblings().removeClass("active");
					$(e.target).addClass("active");					
					
					console.log(data['pageBar']);
					
					//row
					for(var i=1; i<=5; i++){
						$(".category-row-"+i).removeClass("d-none");
					}
					
					//col
					for(var i=0; i<10; i++){
						$(".category-"+i).removeClass("invisible");
						$(".category-"+i).addClass("d-flex");
					}
					
					 $.each(data['list'], function(i,v){		
						 console.log(v);
						 console.log(data['list'].length);
						 console.log(v.length);
						
							console.log(v)
							var info = v;	
							console.log(info);
							//로고 이미지
							$(".log-img-"+i).attr("src", "${pageContext.request.contextPath}/resources/img/"+info['s_LogImg']);
							
							//상호명
							$(".name-"+i).html(info['s_Name']);
							
							//별점
							if(info['s_ReviewCount']!=0)
								$(".score-"+i).html('★ '+((info['s_Taste']+info['s_Amount']+info['s_Delivery'])/3/info['s_ReviewCount']).toFixed(2));
							else
								$(".score-"+i).html('0');
							//리뷰
							$(".review-"+i).html('리뷰 '+info['s_ReviewCount']);
							
							//최소 배달 금액
							$(".limit-price-"+i).html(info['s_LimitPrice']+' 이상 배달');
							
							//배달 시간
							var plus = info['s_Time']+5;
							$(".time-"+i).html(info['s_Time']+'~'+plus+'분');	
							
							//배달 시간
							var plus = info['s_Time']+5;
							$(".time-"+i).html(info['s_Time']+'~'+plus+'분');
							
							//영업 상태
							//시간 포맷팅
							Date.prototype.hhmmss = function() {
						      var hh = this.getHours().toString();
						      var mm = this.getMinutes().toString();
						      var ss = this.getSeconds().toString();
						      return (hh[1] ? hh : "0" + hh[0]) + ":" + (mm[1] ? mm : "0" + mm[0]) + ":" + (ss[1] ? ss : "0" + ss[0]);
						  	}
							
							var start = new Date(info['s_StartTime']);
							var end = new Date(info['s_EndTime']);
							var now = new Date();
							
							var status='';
							
							start = start.hhmmss();
							end = end.hhmmss();
							now = now.hhmmss();
								
							if(start<now && now<end) status = '영업중';
							else status = '영업 준비중';
							
							$(".status-"+i).html(status);
							
							//가게 번호
							$(".store-no-"+i).html(info['s_No']);
					}); 
					 
					//unvisibility 처리
						var length = data['list'].length;
						if(length=="") length=0;
						console.log(length);
						
						for(var i=length; i<10; i++){			
							$('.category-'+i).addClass('invisible');
						}
						
						//d-none 처리
						if(length%2==0){
							for(var i=parseInt(length/2)+1; i<=5; i++){
								$('.category-row-'+i).addClass('d-none');
							}
						}else{
							for(var i=parseInt(length/2)+2; i<=5; i++){
								$('.category-row-'+i).addClass('d-none');
							}
						}
						
						$(".page-bar").empty();						
						$(".page-bar").append(data['pageBar']);
				}
			});
			
		});
	})
	
	
		
	//검색 버튼 클릭했을 때
	$("#btn-search").click(function(){
		var name = $("#search-name").val();
		var category = $(".active").eq(0).html();
		var sort = $("#sortType").val();
		
		//hidenn에 추가
		$("#search").val(name);
			
		$.ajax({
			url:"${pageContext.request.contextPath}/menu/menuFilter.do",
			data: {
				"sortType":sort,
				"search":name,
				"menuCategory":category	
			},
			success: function(data){
				
				//row
				for(var i=1; i<=5; i++){
					$(".category-row-"+i).removeClass("d-none");
				}
				
				//col
				for(var i=0; i<10; i++){
					$(".category-"+i).removeClass("invisible");
					$(".category-"+i).addClass("d-flex");
				}
				
				 $.each(data['list'], function(i,v){		
					 console.log(v);
					 console.log(data['list'].length);
					 console.log(v.length);
					
						console.log(v)
						var info = v;	
						console.log(info);
						//로고 이미지
						$(".log-img-"+i).attr("src", "${pageContext.request.contextPath}/resources/img/"+info['s_LogImg']);
						
						//상호명
						$(".name-"+i).html(info['s_Name']);
						
						//별점
						if(info['s_ReviewCount']!=0)
							$(".score-"+i).html('★ '+((info['s_Taste']+info['s_Amount']+info['s_Delivery'])/3/info['s_ReviewCount']).toFixed(2));
						else
							$(".score-"+i).html('0');
						
						//리뷰
						$(".review-"+i).html('리뷰 '+info['s_ReviewCount']);
						
						//최소 배달 금액
						$(".limit-price-"+i).html(info['s_LimitPrice']+' 이상 배달');
						
						//배달 시간
						var plus = info['s_Time']+5;
						$(".time-"+i).html(info['s_Time']+'~'+plus+'분');	
						
						//배달 시간
						var plus = info['s_Time']+5;
						$(".time-"+i).html(info['s_Time']+'~'+plus+'분');
						
						//영업 상태
						//시간 포맷팅
						Date.prototype.hhmmss = function() {
					      var hh = this.getHours().toString();
					      var mm = this.getMinutes().toString();
					      var ss = this.getSeconds().toString();
					      return (hh[1] ? hh : "0" + hh[0]) + ":" + (mm[1] ? mm : "0" + mm[0]) + ":" + (ss[1] ? ss : "0" + ss[0]);
					  	}
						
						var start = new Date(info['s_StartTime']);
						var end = new Date(info['s_EndTime']);
						var now = new Date();
						
						var status='';
						
						start = start.hhmmss();
						end = end.hhmmss();
						now = now.hhmmss();
							
						if(start<now && now<end) status = '영업중';
						else status = '영업 준비중';
						
						$(".status-"+i).html(status);
							
						
						//가게 번호
						$(".store-no-"+i).html(info['s_No']);
				}); 
				 
				//unvisibility 처리
					var length = data['list'].length;
					if(length=="") length=0;
					console.log(length);
					
					for(var i=length; i<10; i++){			
						$('.category-'+i).addClass('invisible');
					}
					
					//d-none 처리
					if(length%2==0){
						for(var i=parseInt(length/2)+1; i<=5; i++){
							$('.category-row-'+i).addClass('d-none');
						}
					}else{
						for(var i=parseInt(length/2)+2; i<=5; i++){
							$('.category-row-'+i).addClass('d-none');
						}
					}
					$(".page-bar").empty();						
					$(".page-bar").append(data['pageBar']);
			}
		});
	});
	
	//드랍다운 선택시 바꾸기
	$(".dropdown-item").click(function(e){
		var val = $(this).html();
		
		//hidden 태그에 추가
		$("#sortType").val(val);
		
		console.log(val);
		$(this).parent().prev().html(val);
		
		var name = $("#search").val();
		var category = $(".active").eq(0).html();
		//var sort = $(e.target).html();
		var sort = $("#sortType").val();
		
		console.log(sort);
		
		$.ajax({
			url:"${pageContext.request.contextPath}/menu/menuFilter.do",
			data: {
				"sortType":sort,
				"search":name,
				"menuCategory":category	
			},
			success: function(data){	
				//row
				for(var i=1; i<=5; i++){
					$(".category-row-"+i).removeClass("d-none");
				}
				
				//col
				for(var i=0; i<10; i++){
					$(".category-"+i).removeClass("invisible");
					$(".category-"+i).addClass("d-flex");
				}
				
				 $.each(data['list'], function(i,v){		
					 console.log(v);
					 console.log(data['list'].length);
					 console.log(v.length);
					
						console.log(v)
						var info = v;	
						console.log(info);
						//로고 이미지
						$(".log-img-"+i).attr("src", "${pageContext.request.contextPath}/resources/img/"+info['s_LogImg']);
						
						//상호명
						$(".name-"+i).html(info['s_Name']);
						
						//별점
						if(info['s_ReviewCount']!=0)
							$(".score-"+i).html('★ '+((info['s_Taste']+info['s_Amount']+info['s_Delivery'])/3/info['s_ReviewCount']).toFixed(2));
						else
							$(".score-"+i).html('0');
						
						//리뷰
						$(".review-"+i).html('리뷰 '+info['s_ReviewCount']);
						
						//최소 배달 금액
						$(".limit-price-"+i).html(info['s_LimitPrice']+' 이상 배달');
						
						//배달 시간
						var plus = info['s_Time']+5;
						$(".time-"+i).html(info['s_Time']+'~'+plus+'분');
						
						//영업 상태
						//시간 포맷팅
						Date.prototype.hhmmss = function() {
					      var hh = this.getHours().toString();
					      var mm = this.getMinutes().toString();
					      var ss = this.getSeconds().toString();
					      return (hh[1] ? hh : "0" + hh[0]) + ":" + (mm[1] ? mm : "0" + mm[0]) + ":" + (ss[1] ? ss : "0" + ss[0]);
					  	}
						
						var start = new Date(info['s_StartTime']);
						var end = new Date(info['s_EndTime']);
						var now = new Date();
						
						var status='';
						
						start = start.hhmmss();
						end = end.hhmmss();
						now = now.hhmmss();
							
						if(start<now && now<end) status = '영업중';
						else status = '영업 준비중';
						
						$(".status-"+i).html(status);
							
						
						//가게 번호
						$(".store-no-"+i).html(info['s_No']);
				}); 
				 
				//unvisibility 처리
					var length = data['list'].length;
					if(length=="") length=0;
					console.log(length);
					
					for(var i=length; i<10; i++){			
						$('.category-'+i).addClass('invisible');
					}
					
					//d-none 처리
					if(length%2==0){
						for(var i=parseInt(length/2)+1; i<=5; i++){
							$('.category-row-'+i).addClass('d-none');
						}
					}else{
						for(var i=parseInt(length/2)+2; i<=5; i++){
							$('.category-row-'+i).addClass('d-none');
						}
					}
					$(".page-bar").empty();						
					$(".page-bar").append(data['pageBar']);
			}
		});
	})
	
	</script>

</body>
</html>