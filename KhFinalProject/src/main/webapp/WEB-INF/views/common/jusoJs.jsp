<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>

function getroadAddr(){
	// 적용예 (api 호출 전에 검색어 체크) 	
	if (!checkSearchedWord(document.form.keyword)) {
		return ;
	}


	$.ajax({
		 url :"http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#form").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(jsonStr){
			$("#list").html("");
			var errCode = jsonStr.results.common.errorCode;
			var errDesc = jsonStr.results.common.errorMessage;
			if(errCode != "0"){
				alert("주소를 다시입력해주세요");
				$("#list").css("visibility","hidden");
				$("#list").css("z-index","-1");
			}else{
				if(jsonStr != null){
					$("#list").css("visibility","hidden");
					if(!jsonStr.results.juso.length==0){
						$("#list").css("visibility","visible");
					}
					
					$("#list").css("z-index","2");
					makeListJson(jsonStr);
					
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}


function getXY(i,data){
	data=data.replace(/§/gi," ");
	console.log(data);
	$.ajax({
		 url :"http://www.juso.go.kr/addrlink/addrCoordApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#form"+i).serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(xmlStr){
			var x= xmlStr.results.juso[0].entX;
			var y =xmlStr.results.juso[0].entY;
			$("#keyword").prop("value",data);
			$("#xl").attr("value",x);
			$("#yl").attr("value",y);
			$("#list").css("visibility","hidden");
			$("#list").css("z-index","-1");
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}



function makeListJson(jsonStr){

	var htmlStr = "";
	var i=0;
	htmlStr += "<table>";
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td onclick=getXY("+i+",\'"+this.jibunAddr.replace(/ /gi,'§')+"\'); class='search-autosearch'><div><strong>"+this.jibunAddr+"</strong><br>[도로명 주소]"+this.roadAddr+"</div><hr/></td>";
		htmlStr += "<td>";
		htmlStr += "<form name='form"+i+"' id='form"+i+"' method='post'>";
		htmlStr += "<input type='hidden' name='resultType' value='json'/>";
		htmlStr += "<input type='hidden' name='confmKey' value='devU01TX0FVVEgyMDIwMDUxMjIxMjYyNTEwOTc1MjY='/>";
		htmlStr += "<input type='hidden' name='rnMgtSn'  value='"+this.rnMgtSn+"' />";
		htmlStr += "<input type='hidden' name='admCd' ' value='"+this.admCd+"' />";
		htmlStr += "<input type='hidden' name='udrtYn'  value='"+this.udrtYn+"' />";
		htmlStr += "<input type='hidden' name='buldMnnm'  value='"+this.buldMnnm+"' />";
		htmlStr += "<input type='hidden' name='buldSlno' value='"+this.buldSlno+"' />";
		htmlStr += "</form>"
		htmlStr += "</td>";
		htmlStr += "</tr>";
		i++;
	});
	htmlStr += "</table>";
	$("#list").html(htmlStr);

}

//특수문자, 특정문자열(sql예약어의 앞뒤공백포함) 제거
function checkSearchedWord(obj){
	if(obj.value.length >0){
		//특수문자 제거
		var expText = /[%=><]/ ;
		if(expText.test(obj.value) == true){
			alert("특수문자를 입력 할수 없습니다.") ;
			obj.value = obj.value.split(expText).join(""); 
			return false;
		}
		
		//특정문자열(sql예약어의 앞뒤공백포함) 제거
		var sqlArray = new Array(
			//sql 예약어
			"OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE", "DROP", "EXEC",
             		 "UNION",  "FETCH", "DECLARE", "TRUNCATE" 
		);
		
		var regex;
		for(var i=0; i<sqlArray.length; i++){
			regex = new RegExp( sqlArray[i] ,"gi") ;
			
			if (regex.test(obj.value) ) {
			    alert("\"" + sqlArray[i]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
				obj.value =obj.value.replace(regex, "");
				return false;
			}
		}
	}
	return true ;
}

function enterSearch() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	if (evt_code == 13) {
		event.keyCode = 0;  
		 getroadAddr();
	} 
}

function selectCategory(data){
	$("#category").attr("value",data);
	var x = $("#xl").val().length;
	var y= $("#yl").val().length;
	console.log(data);
	if(!(x==0 || y==0)){
		location.replace("${pageContext.request.contextPath }/menu/menuList.do");
	}else{
		alert("주소를 입력해주세요");
	}
	
}

function getbrowserxy(){
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	    $("#list").css("visibility","hidden");
	    $("#xl").attr("value",latitude);
		$("#yl").attr("value",longitude);
		$("#keyword").prop("value","현재 위치");
	});

}

$(".location-button").hover(function(){
    $('.toast').toast('show');
  });



</script>