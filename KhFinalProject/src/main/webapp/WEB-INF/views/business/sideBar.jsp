<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <c:set var="path" value="${pageContext.request.contextPath }" />

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
            margin-top:150px;
            position: fixed;
            width:200px;
        }
      
        a.menu{
            
            border-top: none;
            border-left: none;
            border-right: none;
            border-bottom:none;
            width: 120px;
            color:black;
        }
  		a.menuDetail{
  			border-top: none;
            border-left: none;
            border-right: none;
            font-size:13px;
            width: 120px;
             color:black;
            font-weight: 400;
            margin-left:30px;
  		}

    </style>
	
   <div class="col-lg-2" id="side">
                
                    <ul class="list-group" >
                        <li class="list-group"><a class="menu list-group-item disabled" href="#">매장
                        <img src="http://blogfiles.naver.net/20160309_167/jugiya3_1457484081373SoXNf_JPEG/attachImage_62923672.jpeg" style="width:40px;height:40px;"></a>
                        </li>
                      	<li class="list-group"><a class="menuDetail list-group-item list-group-item-action " href="${path }/licensee/storeEnroll">매장 등록</a></li>
                      	<li class="list-group"><a class="menuDetail list-group-item list-group-item-action " href="${path }/licensee/menuStatus">메뉴 운영</a></li>
                        <li class="list-group"><a class="menuDetail list-group-item list-group-item-action " href="${path }/store/storedetail">매장 정보</a></li>
                        <br> 
                       	<li class="list-group"><a class="menu list-group-item list-group-item-action " href="${path }/licensee/calculate">정산 내역</a></li>
                        <br>
                       	<li class="list-group"><a class="menu list-group-item list-group-item-action " href="${path }/licensee/order">주문 내역</a></li>
                        <br>
                        <li class="list-group"><a class="menu list-group-item " href="${path }/licensee/review">리뷰관리</a></li>

                    </ul>
            </div>

