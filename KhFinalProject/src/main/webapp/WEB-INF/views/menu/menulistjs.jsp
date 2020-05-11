<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		$(".food-category").click(function(){
			
			//매핑값 설정 해주세요 ^^
			
			//location.replace("");
		});
		
		//메뉴 호버시 포인터
		$(".list-group-item").hover(function(){
			$(this).attr("style", "cursor:pointer;");
		}, function(){
			$(this).attr("style", "cursor:pointer;");
		});
		
		//메뉴 클릭시 active 변화
		$(".list-group-item").click(function(){
			$(this).siblings().removeClass("active");
			$(this).addClass("active");
		});
	})
	
	
		//선택된 페이지 변화 
			$(function(){
				$(".page-item").click(function(){
					$(this).siblings().removeClass("active");
					$(this).addClass("active");		
				});
			})
		</script>

</body>
</html>