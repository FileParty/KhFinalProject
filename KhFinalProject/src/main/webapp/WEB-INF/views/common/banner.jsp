<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<div id="banner" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#banner" data-slide-to="0" class="active"></li>
    <li data-target="#banner" data-slide-to="1" class="active"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="${pageContext.request.contextPath }/resources/img/치킨.jpg" alt="Los Angeles" width="1000" height="300">
    </div>
    <div class="carousel-item">
      <img src="${pageContext.request.contextPath }/resources/img/피자.jpg" alt="Los Angeles" width="1000" height="300">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#banner" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#banner" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
  
</div>