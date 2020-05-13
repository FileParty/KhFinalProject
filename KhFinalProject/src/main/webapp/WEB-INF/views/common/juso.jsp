<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script language="javascript">

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
				alert(errCode+"="+errDesc);
			}else{
				if(jsonStr != null){
					makeListJson(jsonStr);
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}

function makeListJson(jsonStr){

	var htmlStr = "";
	htmlStr += "<table>";
	$(jsonStr.results.juso).each(function(){
		htmlStr += "<tr>";
		htmlStr += "<td>"+this.roadAddr+"</td>";
		htmlStr += "<input type='hidden' class='beom' value='"+this.rnMgtSn+"' />";
		htmlStr += "<input type='hidden' class='beom' value='"+this.admCd+"' />";
		htmlStr += "<input type='hidden' class='beom' value='"+this.udrtYn+"' />";
		htmlStr += "<input type='hidden' class='beom' value='"+this.buldMnnm+"' />";
		htmlStr += "<input type='hidden' class='beom' value='"+this.buldSlno+"' />";
		htmlStr += "</tr>";
	});
	htmlStr += "</table>";
	$("#list").html(htmlStr);
	 $("#rnMgtSn").attr("value",$($(".beom")[0]).val());
	 $("#admCd").attr("value",$($(".beom")[1]).val());
	 $("#udrtYn").attr("value",$($(".beom")[2]).val());
	 $("#buldMnnm").attr("value",$($(".beom")[3]).val());
	 $("#buldSlno").attr("value",$($(".beom")[4]).val());
}


function getXY(){
	$.ajax({
		 url :"http://www.juso.go.kr/addrlink/addrCoordApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#form2").serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(xmlStr){
			console.log(xmlStr.results.juso[0].entX);
			console.log(xmlStr.results.juso[0].entY);
			$("#list2").html("");
		
			var htmlStr = "";
			htmlStr += "<table>";
			htmlStr += "<tr>";
			htmlStr += "<td>"+xmlStr.results.juso[0].entX+"</td>";
			htmlStr += "<td>"+xmlStr.results.juso[0].entY+"</td>";
			htmlStr += "</tr>";
			htmlStr += "</table>";
			$("#list2").html(htmlStr);
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
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



/* function searchaddr(){
	var length = $("#keyword").val().length;
	if(length>5){
		$("#list").css("display","flex");
		getroadAddr();
	}else{
		$("#list").css("display","none");
	}
} */



</script>
<title>Insert title here</title>
</head>
<body>

<div>
	<form name="form" id="form" method="post">
		<input type="hidden" name="currentPage" value="1"/> 
		<input type="hidden" name="countPerPage" value="2"/>
		<input type="hidden" name="resultType" value="json"/> 
		<input type="hidden" name="confmKey" value="devU01TX0FVVEgyMDIwMDUxMjIwMDA0MTEwOTc1MjQ="/>
		<input type="text" name="keyword" id="keyword" value="" onkeyup="searchaddr();" />
		<div id="list" ></div><!-- 검색 결과 리스트 출력 영역 -->
	</form>
	
	 <form name="form2" id="form2" method="post">
	 	<input type="hidden" name="resultType" value="json"/>
	 	<input type="hidden" name="confmKey" value="devU01TX0FVVEgyMDIwMDUxMjIxMjYyNTEwOTc1MjY="/>
		<input type="hidden" name="admCd" id="admCd" /> 
		<input type="hidden" name="rnMgtSn" id="rnMgtSn" />
		<input type="hidden" name="udrtYn" id="udrtYn" /> 
		<input type="hidden" name="buldMnnm" id="buldMnnm"/>
		<input type="hidden" name="buldSlno" id="buldSlno"/>
		<input type="button" onClick="getXY();" value="검색하기"/>
		<div id="list2" ></div>검색 결과 리스트 출력 영역
	</form> 
</div>
</body>
</html>
						