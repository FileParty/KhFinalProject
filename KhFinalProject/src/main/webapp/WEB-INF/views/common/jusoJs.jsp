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
				$("#list").css("display","none");
			}else{
				if(jsonStr != null){
					$("#list").css("display","flex");
					makeListJson(jsonStr);
					
				}
			}
		}
	    ,error: function(xhr,status, error){
	    	alert("에러발생");
	    }
	});
}


function getXY(i){
	$.ajax({
		 url :"http://www.juso.go.kr/addrlink/addrCoordApiJsonp.do"  //인터넷망
		,type:"post"
		,data:$("#form"+i).serialize()
		,dataType:"jsonp"
		,crossDomain:true
		,success:function(xmlStr){
			console.log(xmlStr.results.juso[0].entX);
			console.log(xmlStr.results.juso[0].entY);
			/* $("#list2").html("");
		
			var htmlStr = "";
			htmlStr += "<table>";
			htmlStr += "<tr>";
			htmlStr += "<td>"+xmlStr.results.juso[0].entX+"</td>";
			htmlStr += "<td>"+xmlStr.results.juso[0].entY+"</td>";
			htmlStr += "</tr>";
			htmlStr += "</table>";
			$("#list2").html(htmlStr); */
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
		htmlStr += "<td onclick='getXY("+i+");' class='search-autosearch'><div><strong>"+this.jibunAddr+"</strong><br>[도로명 주소]"+this.roadAddr+"</div><hr/></td>";
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





</script>