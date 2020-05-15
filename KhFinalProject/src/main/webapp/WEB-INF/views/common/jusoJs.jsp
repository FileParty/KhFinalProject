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
					$("#list").css("z-index","-1");
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


//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();


var callback = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var address = result[0].road_address.address_name;
        var x = result[0].road_address.x;
        var y =	result[0].road_address.y;
        $("#xl").attr("value",x);
		$("#yl").attr("value",y);
		$("#keyword").prop("value",address);
		$("#list").css("visibility","hidden");
		$("#list").css("z-index","-1");
    }
};

var callback2 = function(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        $("#list").css("visibility","hidden");
        $("#list").css("z-index","-1");
		$("#keyword").prop("value",result[0].address.address_name);
    }
};

function getXY(data){
	data=data.replace(/§/gi," ");
	geocoder.addressSearch(data, callback);
}

function makeListJson(jsonStr){

	var htmlStr = "";
	htmlStr += "<table>";
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td onclick=getXY(\'"+this.jibunAddr.replace(/ /gi,'§')+"\'); class='search-autosearch'><div><strong>"+this.jibunAddr+"</strong><br>[도로명 주소]"+this.roadAddr+"</div><hr/></td>";
		htmlStr += "</tr>";
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


function getbrowserxy(){
	navigator.geolocation.getCurrentPosition(function(pos) {
	    var latitude = pos.coords.latitude;
	    var longitude = pos.coords.longitude;
	   
	    $("#xl").attr("value",latitude);
		$("#yl").attr("value",longitude);
		 
		
		var coord = new kakao.maps.LatLng(latitude, longitude);

		geocoder.coord2Address(coord.getLng(), coord.getLat(), callback2);
		
	});

}


function selectCategory(data){
	
	var x = $("#xl").val().length;
	var y= $("#yl").val().length;
	
	var val = data;
	
	if(!(x==0 || y==0)){
		var x = $("#xl").val();
		var y= $("#yl").val();
		var addr = $("#keyword").val();
		location.replace("${pageContext.request.contextPath }/menu/menuList.do?menuCategory="+val+"&xl="+x+"&yl="+y+"&addr"+addr);
	}else{
		alert("주소를 입력해주세요");
	}
	
}


</script>