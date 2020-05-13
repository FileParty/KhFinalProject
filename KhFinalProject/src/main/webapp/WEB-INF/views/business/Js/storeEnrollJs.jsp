<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<script>
    

    	
    	function goPopup(){
    		
			var pop = window.open("<%=request.getContextPath() %>/juso/jusoxy","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 

		};
		
		function jusoCallBack(roadFullAddr, entX, entY){
			
			$("#saddr").attr("value",roadFullAddr);
			$("#xl").attr("value",entX);
			$("#yl").attr("value",entY);
			
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
 
                var reader = new FileReader();
                reader.onload = function(e) {
                	
                    var img_html = "<div class='img_mul'><img width='100%' height='100%' src=\"" + e.target.result + "\" /></div>";
                    $(".imgs_wrap").append(img_html);
                }
                reader.readAsDataURL(f);
            });
        }
        
        function check(){
        	var saddr = $("#saddr").val().length;
        	if(saddr==0){
        		alert("주소를 입력하세요");
        		return false;
        	}
        	
        	return true;
        }
		
    </script>