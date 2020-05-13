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
		
		//dropdown 선택시 바꾸게 하기
		$(".dropdown-item").click(function(){
			var val = $(this).html();
			console.log(val);
			$(this).parent().prev().html(val);
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
			
			$.ajax({
				url:"${pageContext.request.contextPath}/menu/menuCategory.do",
				data: {"menuCategory":menuCategory},
				success: function(data){
					
					console.log(data);
					$(e.target).siblings().removeClass("active");
					$(e.target).addClass("active");					
					
					//row
					for(var i=1; i<=5; i++){
						$(".category-row-"+i).removeClass("d-none");
					}
					
					//col
					for(var i=0; i<10; i++){
						$(".category-"+i).removeClass("invisible");
						$(".category-"+i).addClass("d-flex");
					}
					
					
					$.each(data, function(i,v){					
						for(var i=0; i<v.length; i++){
							var info = v[i];							
							//로고 이미지
							$(".log-img-"+i).attr("src", "${pageContext.request.contextPath}/resources/img/"+info['s_LOGIMG']);
							
							//상호명
							$(".name-"+i).html(info['s_NAME']);
							
							//별점
							$(".score-"+i).html('★ '+parseFloat(info['s_SCORE']));
							
							//리뷰
							$(".review-"+i).html('리뷰 '+info['s_REVIEWCOUNT']);
							
							//최소 배달 금액
							$(".limit-price-"+i).html(info['s_LIMITPRICE']+' 이상 배달');
							
							//배달 시간
							var plus = info['s_TIME']+5;
							$(".time-"+i).html(info['s_TIME']+'~'+plus+'분');
						}
						
						//unvisibility 처리
						for(var i=v.length; i<10; i++){			
							$('.category-'+i).addClass('invisible')
						}
						
						//d-none 처리
						if(v.length%2==0){
							for(var i=parseInt(v.length/2)+1; i<=5; i++){
								$('.category-row-'+i).addClass('d-none');
							}
						}else{
							for(var i=parseInt(v.length/2)+2; i<=5; i++){
								$('.category-row-'+i).addClass('d-none');
							}
						}
					});
				}
			});
			
		});
	})
	
	
		//선택된 페이지 변화 
			$(function(){
				$(".page-item").click(function(){
					$(this).siblings().removeClass("active");
					$(this).addClass("active");		
				});
			})
		
	//검색 버튼 클릭했을 때
	$("#btn-search").click(function(){
		var name = $("#search-name").val();
		var category = $(".active").eq(0).html();
			
		console.log(category);
		$.ajax({
			url:"${pageContext.request.contextPath}/menu/search.do",
			data: {
				"name":name,
				"category":category	
			},
			success: function(data){
				
				$("#search-name").html(name);
				
				//row
				for(var i=1; i<=5; i++){
					$(".category-row-"+i).removeClass("d-none");
				}
				
				//col
				for(var i=0; i<10; i++){
					$(".category-"+i).removeClass("invisible");
					$(".category-"+i).addClass("d-flex");
				}
				
				
				$.each(data, function(i,v){					
					for(var i=0; i<v.length; i++){
						var info = v[i];							
						//로고 이미지
						$(".log-img-"+i).attr("src", "${pageContext.request.contextPath}/resources/img/"+info['s_LOGIMG']);
						
						//상호명
						$(".name-"+i).html(info['s_NAME']);
						
						//별점
						$(".score-"+i).html('★ '+parseFloat(info['s_SCORE']));
						
						//리뷰
						$(".review-"+i).html('리뷰 '+info['s_REVIEWCOUNT']);
						
						//최소 배달 금액
						$(".limit-price-"+i).html(info['s_LIMITPRICE']+' 이상 배달');
						
						//배달 시간
						var plus = info['s_TIME']+5;
						$(".time-"+i).html(info['s_TIME']+'~'+plus+'분');
					}
					
					//unvisibility 처리
					for(var i=v.length; i<10; i++){			
						$('.category-'+i).addClass('invisible')
					}
					
					//d-none 처리
					if(v.length%2==0){
						for(var i=parseInt(v.length/2)+1; i<=5; i++){
							$('.category-row-'+i).addClass('d-none');
						}
					}else{
						for(var i=parseInt(v.length/2)+2; i<=5; i++){
							$('.category-row-'+i).addClass('d-none');
						}
					}
				});
			}
		})
	});
	
	
	</script>

</body>
</html>