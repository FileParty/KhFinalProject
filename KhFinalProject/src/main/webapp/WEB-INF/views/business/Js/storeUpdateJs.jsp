<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
        <script>
    
    	$(function(){
    		
    		var phone = '${store.S_PHONE}'.split("-");
    		$("#phone2").attr("value",phone[1]);
    		$("#phone3").attr("value",phone[2]);
    		
    		var values = $("#phone1>option").map(function() { return $(this).val(); });
    		for(var i=0;i<values.length;i++){
    			if(values[i]==phone[0]){
    				$($("#phone1>option")[i]).attr("selected",true);
    			}
    		}
    		/* 폰가져오기 */
    		
    		var payopt =$("input[name=spayopt]");
    		
    		var pay="${store.S_PAYOPT}";
    		for(var j=0;j<payopt.length;j++){
    			if($(payopt[j]).val()==pay){
    				$(payopt[j]).attr("checked",true);
    			}
    		}
    		/* 결제방법가져오기*/
    		
    		var holiday  = '${store.S_HOLIDAY}'.split(",");
    		var sholiday =$("input[name=sholiday]");
    		for(var s=0;s<sholiday.length;s++){
    			for(var t=0;t<holiday.length;t++){
    				if($(sholiday[s]).val()==holiday[t]){
    					$(sholiday[s]).attr("checked",true);
        			}
    			}
    		}
    		/* 휴무일 가져오기 */
    		
    		values = $("#scoupon>option").map(function() { return $(this).val(); });
    		var coupon = "${store.S_COUPON}";
    		for(var i=0;i<values.length;i++){
    			if(values[i]==coupon){
    				$($("#scoupon>option")[i]).attr("selected",true);
    			}
    		}
    		/* 쿠폰 허용 가져오기 */
    		
    		values = $("#sstarttime>option").map(function() { return $(this).val(); });
    		var time = "${store.S_STARTTIME}".split(" ");
    		if(time[1].substring(0,1)==0){
    			time =time[1].substring(1,2);
    		}else{
    			time =time[1].substring(0,2);
    		}
    		for(var i=0;i<values.length;i++){
    			if(values[i]==time){
    				$($("#sstarttime>option")[i]).attr("selected",true);
    			}
    		};
    		values = $("#sendtime>option").map(function() { return $(this).val(); });
    		time = "${store.S_ENDTIME}".split(" ");
    		if(time[1].substring(0,1)==0){
    			time =time[1].substring(1,2);
    		}else{
    			time =time[1].substring(0,2);
    		}
    		for(var i=0;i<values.length;i++){
    			if(values[i]==time){
    				$($("#sendtime>option")[i]).attr("selected",true);
    			}
    		}
    		/* 운영시간/마감시간 가져오기  */

    		var category =$("input[name=category]");
    		var arraylist = new Array('치킨','피자','중국집','분식','한식','햄버거','일식');
    		var categorylist = new Array('${store.category[0]["CT_NAME"]}','${store.category[1]["CT_NAME"]}','${store.category[2]["CT_NAME"]}','${store.category[3]["CT_NAME"]}','${store.category[4]["CT_NAME"]}','${store.category[5]["CT_NAME"]}','${store.category[6]["CT_NAME"]}');

    		for(var s=0;s<arraylist.length;s++){
    			for(var t=0;t<arraylist.length;t++){
    				 if(arraylist[s]== categorylist[t] ){
    					$(category[s]).attr("checked",true);
        			} 
    			}
    		}
    		
    		/* 종목 가져오기 */
    		

    	
    	})
    	
    </script>