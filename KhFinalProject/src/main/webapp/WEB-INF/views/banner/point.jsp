<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="HelloSpring" name="title"/>
</jsp:include>
<style>
	#point {
	
		height:600;
		border:1px solid black;
		text-align:center;
		/* background-color:#484848; */
	}
	* {
	font-family:'Do Hyeon';
	}
	
	#span{
	
	/* text-shadow:3px 3px 5px pink; */
	font-size:70px;
	color:black;
	}
	
	#span1{	
	/* text-shadow:3px 3px 5px pink; */
	font-size:70px;
	color:black;
	}
	
	#span2{	
	/* text-shadow:3px 3px 5px pink; */
	font-size:70px;
	color:#FFDF24;
	}
	
	#span3{	
	/* text-shadow:3px 3px 5px pink; */
	font-size:70px;
	color:#FFDF24;
	}
	#btn{
		font-size:50px;
		background-color:orange;
		color:white;
	}
	#img {
		margin-top:100px;
		
	}

</style>
    <section id="container">
	
	<div id="point" class="container-fluid">
	<div class="row">
	 <div id="point1" class="col-lg-7">
	 	<br>
	 	<br>
	 	<br>
	 	<span id="span">'배달킹'</span><br>
	 	<span id="span1">최초 회원 가입 시</span><br>
	 	<span id="span2">즉시 사용 가능한</span><br>
	 	<span id="span3">1,000 P 지급!!</span><br>
	 	<button id="btn" type="button" onclick="point();">회원 가입 하러가기 > </button>
	 </div>
	 <div id="point1" class="col-lg-">
	 	<img id="img" width="500" height="400"src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAe1BMVEX///8AAAC/v78pKSnm5ubq6urb29svLy/39/e4uLjV1dWtra1hYWHy8vKdnZ1WVlZBQUFYWFiWlpalpaVNTU1eXl48PDzNzc3Gxsbf39+MjIxmZmYJCQltbW2xsbE1NTWCgoIZGRl4eHhISEghISGPj48UFBR8fHwRERGziurbAAAIrUlEQVR4nO2d2VbDOAyGm9Id2lIKtOwFCjPv/4RD6IJtLVYcb5nj/xJ0nHxV4kWWnF6vqYaP91V192q12z59Vxe7B5vZ/Oa6qpbrxrcRTq/VQW9z3u72aHfDm22PZvuBv1tsp2l10jtrd322W3Bmm7NZZfnFYmnyd0fVjrFbKHZDxk4xe/J7p65aK7dUMXbPitkjbTZVm8vDiXfqLc1Is4Fqdk83t1Pt+gHut7muZbc0Us0YX1+pZnn0pxrhlDSTEj6pZmyXFE2F8KhCeFIhTKD/P+Gnekv0aDFwIYw6WsxunvbPVQ56Hn9cWtcnTbV5SY1lav/FzW2banZtv2ICfXibtX6kRiFlX3NLNHhPzcHIx/JqlhqC12drwIfUCDZdtwSc2C+RWi0f1Fv7FZLrsg3gZeq7F6nNoJH63mV6cQdc2FvPQu6zm39T37pQTOSO18Zo6PtxO4N6eFNtFiPEpNZIixJWD4TZbLRUzXZYc1MwSXYl3OnN7AgzYaxNH1npq0rWh0NjokzHMHm9V4KLJVoBa4tS14XyXGtkSdolIdRvznHU12+JfhDSRDG0V2gsAgLaCG8pDeFW2BynvtrEBW3nmVCL6tOEw4iE2tx1S5pJ+1JtvU3POWMSPqp29Lattky5o5vTJlL02x+TUHUOt1pTx2lm10ztJfe0WUxC9da5oVe5J3ZlrjwTzA8RlfDvTeQjQ+fubzxh7c69KTeQxyXs3Rw8Y5s8PRzmnNaJ8mHf/I3utXrRCX8Gz9epJAw96L9ueQceNHudjniL6ITRVQglKoRpVQglKoRpVQglKoRpxRJuH29/Uw6ud31uBtVVwpkeTn2ip7fdJJxpAepf7SnGThLiOQdXeBsdJBzuUcAfoQuf7hFyW/IbpI3OEfI5B8jyvGuEtqQKuFXcMUJr1giMA3aLUJAWAxIdO0Uoyvsx2+gSoSyxyay36hKhTM9GG50m3K9Hw4e1OYMzBsUuE34drdb6n3d6Gx0m/NsO0BGNnR4b4XwUT80I1R5FS16p9NUiT3g55n5E71qaky6GUOsy9fxYfQLOEsZPWjS6eprQMNT+p/9OHKFWcxhJ+tYdSWgOet/qP/W1MEOoJ0LEkogQVFFr/9WHC4ZQywiJJi3PgyAEgHpqkd5lMYTkUjqodnZCWAevDxd6niZDGI6Ck5YpixJCQN2FxtybIbwIh8FI2x3HCJGTDPR5m5HkwhCmqaLROsIR/D8CeK9bGCtEhjBJFYZ2YMMA/t8OaAYyuPHwKyAJJXW0dgM0M7HYOc1NQBRc6lCGACK5NyYgCLfx89LBS8whY3yjzpmxlwTGQ0F4f2VaWFdPk2gyflz0RzA3J4AHYdFCrutDqpvTk+AgIEx9zZQQ96CJCKte/4FN5UnIDVR/iNCD4CXsZUpIe1BFhB5ESw1yJOQBT4hCwBwJ7XOpGhE+okSxSH6ENg8eEKEHb4n2siNEPLiDf4L7+GS5T26EiAfXkngK5cHsCBEP1oshs4RQ7sHcCAlAa1SM9mBmhCSgBZHxoI1wvliO4wl2H0rBEIPIAvKEU6rNWFIrokhEHpAlTF6or5d8EYgWQI7QZQPWq8yaNhSR62RshMhAG1WwaK8PjWweZAnj7qwBIVWJcC/M6sEMY94nIYDiybaUMOlhC8gJZ/LJtpRwCVqMJxGgxIMsYcLR0J8H+fEQPveRJHoHhYAs4TxRb4oAwgmdFNAyL30EDUcQAvgJjMSAtrXFZNafBlQf2RlBAF07GQlhYM3hKZSiTqbJAW5JCdGQBVCDmAymlISugPJ3sFZCwjiACQllgM4D/VnJCBFArwP9WakIIz2ivWSEIsCJD8BEhEzYUBGcNDYaJo5KQujayTid1JqCUOZBD53MrxIQygCRk6ndLmchHE4vvQveumiYCEI4uUKu419CwACEkt1YD4KnMiHDRC3/hHEyvkQr+l95J4yzbSF9RKsAhDB0EECigf4o74Th8YQhi5O6SCh/B2t5JwwfLhX3ogd5JwyeBI0AsvUB3glDH7ffFDDAeBi28Ak5ftHyXvgn7G0CflRHNA7q/WoAwl5v+nHVXk/IyCpa0a/0cp8ghF40fxcAIkVIq66cE4XkdMBHFI/JdIMQWaGIetE6Z7sThKK46IQIOnWB0CgNJDwIAQ9Z910gXLUB7AIh/JCU6BE91U10gBBkrCAehKGEc2FI/oSgBhSeEI30on+R7fwJYdIROBkPHyaOyp4QKeM1SgipYeKo7AnRczVURO4drBWFcO6sCVFD8IfIvoNxCLdBTjc5IRJTtZiEob5LekC0PaIRCMN9eLVGtHswOKG1FKcVosCDwQmDfju3b+tkYhC+hySEwmp4AxNG5cOTEAIT+txcu7RFJjEPduo9RKtBFBFpJIEJPX4keGFeyRDuwfDjob8jeOClRIDh5zS+EBfItSSAEealGz/z0lNz+BF3NGCUtcVk2Fxzo+M8upA4z4cBzHd9aPiq/tOEOq+I+fxcvoTG0r52IXkeE59tmCuhEZ3hPqrMejBbQtOFxiG4qrh3sFamhPJDQS0ezJUQC7DhQo48MpQnobQw887y3bxaWRIKXSjhy5QQbjY58+VJKHGhlC9PQvtbuBLzZUlodaHcf7UiEE4/lk20spxb28R/UQg9R0yb+S8GIR9aaaqm/otAiKRRuKu5/yIQeixVd+MLTsil60bh60rM+07yGeg0hF6SS136l2iEHuJsbfwXgbB1zcyqJV/48bDdwfru/Us8wjbHmbV9PrE7cGuDnbXNXbefrjz4r1aEmfewv140Vh9+hNBRGa6ePKsQSlQI06oQSlQI06oQSlQI06oQSlQI06oQSlQI06oQSlQI06oQSlQI06oQSlQI08o/4XyQlYYz34SZqxAWwvxVCAth/nIj9FhkGFxuhIm/W9VEL46EST4l4yTzs/BitcuaiSd4eI9Uk2SfdWqkL2fAH23v3lPfv0Xj3aA51n81QagP8LoIzAAAAABJRU5ErkJggg==">
	 </div>
	 </div>	
	</div>
	
 	<script>
 		function point() {
 			location.replace('${path}/banner/enrollMember');
 		}
 	</script>
    </section>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />