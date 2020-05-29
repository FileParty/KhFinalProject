<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="path" value="${pageContext.request.contextPath }" />
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
      <style>
      
      /*  @font-face{
      src:url("../font/BMJUA_ttf.ttf");
      font-family:"jua";
      } */
      *{
      	font-family:"jua";
      }
      
        div#side {
            border: 1px soild black;
            margin-top:130px;           
            width:150px;
            
        }
      
        a.menu{
            
            border-top: none;
            border-left: none;
            border-right: none;
            border-bottom:none;
            width: auto;
            color:black;
            text-align: center;
            margin-top: 20px;
            border-bottom: 1px solid lightgray;
            font-size: 18px;
            font-family: 'Nanum Gothic';
        }
  		a.menuDetail{
  			border-top: none;
            border-left: none;
            border-right: none;
            font-size:13px;
            width: 120px;
             color:black;
            font-weight: 400;
            text-align: center;
            font-family: 'Nanum Gothic';
  		}
  		
  		.list-group{
  			display: flex;
  			flex-direction: column;
  			justify-content: center;
  			align-items: center;
  		}
  		
  		
  		
		
    </style>
	
   <div class="col-lg-2" id="side">
                
                    <ul class="list-group" >
                    	<li class="list-group"><a class="menu list-group-item list-group-item-action" href="${path }/store/mypage">메인화면</a></li>
                        <li class="list-group bar-store" ><a class="menu list-group-item disabled" href="#">매장
                        <img src="${path }/resources/img/sidebar/shop.png" style="width:40px;height:40px;"></a>
                        </li>
                      	<li class="list-group"><a class="menuDetail list-group-item list-group-item-action " href="${path }/licensee/storeEnroll">매장 등록</a></li>
                        <li class="list-group"><a class="menuDetail list-group-item list-group-item-action " href="${path }/store/storedetail">매장 정보</a></li>
                        <li class="list-group"><a class="menuDetail list-group-item list-group-item-action " href="${path }/licensee/menuEnroll">메뉴 등록</a></li>
                        <li class="list-group"><a class="menuDetail list-group-item list-group-item-action " href="${path }/licensee/menuStatus">메뉴 관리</a></li>
                       	<li class="list-group"><a class="menu list-group-item list-group-item-action " href="${path }/licensee/calculate">매출 도표</a></li>
                       	<li class="list-group"><a class="menu list-group-item list-group-item-action " href="${path }/licensee/order">주문 내역</a></li>
                        <li class="list-group"><a class="menu list-group-item list-group-item-action" href="${path }/licensee/review">리뷰 관리</a></li>

                    </ul>
            </div>

