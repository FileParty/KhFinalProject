<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
    	
    	function goPopup(){
    		
			var pop = window.open("<%=request.getContextPath() %>/juso/jusoxy","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 

		};
		
		function jusoCallBack(roadFullAddr){
			
			$("#saddr").attr("value",roadFullAddr);
			geocoder.addressSearch(roadFullAddr, callback);
			
		};
		
		var callback = function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var address = result[0].road_address.address_name;
		        console.log(address);
		        var x = result[0].road_address.x;
		        var y =	result[0].road_address.y;
		        $("#xl").attr("value",x);
				$("#yl").attr("value",y);
				
				
		    }
		};
		
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
		
		$("#stime").on("change",function(){
        	$("#rangeshow").html(this.value+"분");
        });
    	
    	
		$('input[type="text"]').keydown(function() {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
			});
		
		
		var sel_file;
		var sel_files = [];
		
        $(document).ready(function() {
            $("#slogimg").on("change", handleImgFileSelect);
            $("#input_imgs").on("change", handleImgsFilesSelect2);
        }); 
 
        function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
 	
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
                sel_file = f;
                var reader = new FileReader();
                reader.onload = function(e) {
                    $("#img").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        };
        
        
        
        function handleImgsFilesSelect2(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
 
                sel_files.push(f);
 				$(".imgs_wrap").html("");
                var reader = new FileReader();
                reader.onload = function(e) {
                	
                    var img_html = "<div class='img_mul'><img width='100%' height='100%' src=\"" + e.target.result + "\" /></div>";
                    $(".imgs_wrap").append(img_html);
                }
                reader.readAsDataURL(f);
            });
        }
        
        function check(){
        	var regNumber = /^[0-9]*$/;
        	console.log("?");
        	var saddr = $("#saddr").val().length;
        	var phone2 = $("#phone2").val();
        	var phone3 = $("#phone3").val();
        	var sstarttime = $("#sstarttime").val().length;
        	var sendtime = $("#sendtime").val().length;

        	if(saddr==0){
        		alert("주소를 입력하세요");
        		return false;
        	}else if(!regNumber.test(phone2) || !regNumber.test(phone3) ){
        		alert("연락처에 숫자만 입력하세요.");
        		return false;
        	}else if(sstarttime==0 || sendtime==0){
        		alert("오픈시간/마감시간을 선택해주세요");
        		return false;
        	}
        	
        	return true;
        }
        
        $("input[name='sholiday']").on("click",function(){
        
        	if($($("input[name='sholiday']")[7]).val()==$(this).val()){
        		$("input[name='sholiday']").not($("input[name='sholiday']")[7]).prop("checked", false);
        	}else{
        		$($("input[name='sholiday']")[7]).prop("checked", false);
        	};
        })
		
    </script>