package com.kh.fp.common;

import java.net.URLEncoder;

public class PageingFactory {
	
	
	
	public static String PageBarFactory(int cPage, int numPerPage, int totalData, String url) {
		
			
			int pageCount=(int)Math.ceil((double)totalData/numPerPage);
			int pageBarSize=5;
			String pageBar="";
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
	      
			pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
			if(pageNo==1) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+");'>이전</a>";
				pageBar+="</li>";
			}
	      
			while(!(pageNo>pageEnd||pageNo>pageCount)) {
				if(cPage==pageNo) {
					pageBar+="<li class='page-item active'>";
					pageBar+="<a class='page-link'>"+pageNo+"</a>";
					pageBar+="</li>";
				}else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+");'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				pageNo++;
			}
	      
			if(pageNo>pageCount) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link'>다음</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+");'>다음</a>";
				pageBar+="</li>";
			}
			pageBar+="</ul>";
			pageBar+="<script>";
			pageBar+="function fn_paging(cPage){";
			pageBar+="location.href='"+url+"?cPage='+cPage";
			pageBar+="}";
			pageBar+="</script>";
  
			return pageBar;
			
	}
	
		public static String PageBarFactoryAjax(int cPage, int numPerPage, int totalData, String url, String category, String search, String sortType) {
			
			
			int pageCount=(int)Math.ceil((double)totalData/numPerPage);
			int pageBarSize=5;
			String pageBar="";
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
	      
			pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
			if(pageNo==1) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+",\""+category+"\",\""+search+"\",\""+sortType+"\");'>이전</a>";
				pageBar+="</li>";
			}
	      
			while(!(pageNo>pageEnd||pageNo>pageCount)) {
				if(cPage==pageNo) {
					pageBar+="<li class='page-item active'>";
					pageBar+="<a class='page-link'>"+pageNo+"</a>";
					pageBar+="</li>";
				}else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+",\""+category+"\",\""+search+"\",\""+sortType+"\");'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				pageNo++;
			}
	      
			if(pageNo>pageCount) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link'>다음</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+",\""+category+"\",\""+search+"\",\""+sortType+"\");'>다음</a>";
				pageBar+="</li>";
			}
			pageBar+="</ul>";
			pageBar+="<script>";
			pageBar+="$(function fn_paging(cPage, category, search, sortType){";
			pageBar+="$.ajax({";
			pageBar+="url:"+url+",";
			pageBar+="data:{'cPage':cPage, 'category':category, 'search':search, 'sortType':sortType}";
			pageBar+="success: function(data){";
			pageBar+="$(e.target).siblings().removeClass(\"active\");";
			pageBar+="$(e.target).addClass(\"active\");";
			pageBar+="for(var i=1; i<=5; i++){";
			pageBar+="$(\".category-row-\"+i).removeClass(\"d-none\");";
			pageBar+="}";
			pageBar+="for(var i=0; i<10; i++){";
			pageBar+="$(\".category-\"+i).removeClass(\"invisible\");";
			pageBar+="$(\".category-\"+i).addClass(\"d-flex\");";
			pageBar+="}";
			pageBar+=" $.each(data['list'], function(i,v){";
			pageBar+="var info = v;	";
			pageBar+="$(\".log-img-\"+i).attr(\"src\", \"${pageContext.request.contextPath}/resources/img/\"+info['s_LOGIMG']);";
			pageBar+="$(\".name-\"+i).html(info['s_NAME']);";
			pageBar+="$(\".score-\"+i).html('★ '+parseFloat(info['s_SCORE']));";
			pageBar+="$(\".review-\"+i).html('리뷰 '+info['s_REVIEWCOUNT']);";
			pageBar+="$(\".limit-price-\"+i).html(info['s_LIMITPRICE']+' 이상 배달');";
			pageBar+="var plus = info['s_TIME']+5;";
			pageBar+="$(\".time-\"+i).html(info['s_TIME']+'~'+plus+'분');";
			pageBar+="});";
			pageBar+="var length = data['list'].length;";
			pageBar+="if(length==\"\") length=0;";
			pageBar+="for(var i=length; i<10; i++){";
			pageBar+="$('.category-'+i).addClass('invisible');";
			pageBar+="}";
			pageBar+="for(var i=length; i<10; i++){";
			pageBar+="$('.category-'+i).addClass('invisible');";
			pageBar+="}";
			pageBar+="if(length%2==0){";
			pageBar+="for(var i=parseInt(length/2)+1; i<=5; i++){";
			pageBar+="$('.category-row-'+i).addClass('d-none');";
			pageBar+="}";
			pageBar+="}else{";
			pageBar+="for(var i=parseInt(length/2)+2; i<=5; i++){";
			pageBar+="$('.category-row-'+i).addClass('d-none');";
			pageBar+="}";
			pageBar+="}";
			pageBar+="}";
			
			pageBar+="});";
			pageBar+="})";
			pageBar+="</script>";
	
			return pageBar;
			
	}
	
		//메뉴 리스트 페이징 처리 
		//by 승연
		
		public static String PageBarFactory(int cPage, int numPerPage, int totalData, String url, String category, String search, String sortType) {
		
			
			int pageCount=(int)Math.ceil((double)totalData/numPerPage);
			int pageBarSize=5;
			String pageBar="";
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
	      
			pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
			if(pageNo==1) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+",\""+category+"\",\""+search+"\",\""+sortType+"\");'>이전</a>";
				pageBar+="</li>";
			}
	      
			while(!(pageNo>pageEnd||pageNo>pageCount)) {
				if(cPage==pageNo) {
					pageBar+="<li class='page-item active'>";
					pageBar+="<a class='page-link'>"+pageNo+"</a>";
					pageBar+="</li>";
				}else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+",\""+category+"\",\""+search+"\",\""+sortType+"\");'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				pageNo++;
			}
	      
			if(pageNo>pageCount) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link'>다음</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+",\""+category+"\",\""+search+"\",\""+sortType+"\");'>다음</a>";
				pageBar+="</li>";
			}
			pageBar+="</ul>";
			pageBar+="<script>";
			pageBar+="function fn_paging(cPage,category,search,sortType){";
			pageBar+="location.href='"+url+"?cPage='+cPage+'&menuCategory='+category+'&search='+search+'&sortType='+sortType";
			pageBar+="}";
			pageBar+="</script>";
  
			return pageBar;
			
	}
		
		//페이징 처리 
		//ajax 처리
public static String PageBarFactory(int cPage, int numPerPage, int totalData, String url, String category, String script) {
		
			
			int pageCount=(int)Math.ceil((double)totalData/numPerPage);
			int pageBarSize=5;
			String pageBar="";
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
	      
			pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
			if(pageNo==1) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+",\""+category+"\");'>이전</a>";
				pageBar+="</li>";
			}
	      
			while(!(pageNo>pageEnd||pageNo>pageCount)) {
				if(cPage==pageNo) {
					pageBar+="<li class='page-item active'>";
					pageBar+="<a class='page-link'>"+pageNo+"</a>";
					pageBar+="</li>";
				}else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+",\""+category+"\");'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				pageNo++;
			}
	      
			if(pageNo>pageCount) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link'>다음</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+",\""+category+"\");'>다음</a>";
				pageBar+="</li>";
			}
			pageBar+="</ul>";
			pageBar+="<script>";
			pageBar+="function fn_paging(cPage,category){";
			pageBar+="location.href='"+url+"?cPage='+cPage+'&menuCategory='+category";
			pageBar+="}";
			pageBar+="</script>";
  
			return pageBar;
			
	}

//범

		public static String PageBarFactoryBeom(int cPage, int numPerPage, int totalData,int no, String url) {
			
			
			int pageCount=(int)Math.ceil((double)totalData/numPerPage);
			int pageBarSize=5;
			String pageBar="";
			int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
			int pageEnd=pageNo+pageBarSize-1;
		  
			pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
			if(pageNo==1) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link' href='#' tabindex='-1'>이전</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+",\""+no+"\");'>이전</a>";
				pageBar+="</li>";
			}
		  
			while(!(pageNo>pageEnd||pageNo>pageCount)) {
				if(cPage==pageNo) {
					pageBar+="<li class='page-item active'>";
					pageBar+="<a class='page-link'>"+pageNo+"</a><input id='pageno' type='hidden' value='"+pageNo+"'/>";
					pageBar+="</li>";
				}else {
					pageBar+="<li class='page-item'>";
					pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+",\""+no+"\");'>"+pageNo+"</a>";
					pageBar+="</li>";
				}
				pageNo++;
			}
		  
			if(pageNo>pageCount) {
				pageBar+="<li class='page-item disabled'>";
				pageBar+="<a class='page-link'>다음</a>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+",\""+no+"\");'>다음</a>";
				pageBar+="</li>";
			}
			pageBar+="</ul>";
			pageBar+="<script>";
			pageBar+="function fn_paging(cPage,no){";
			pageBar+="location.href='"+url+"?cPage='+cPage+'&no='+no";
			pageBar+="}";
			pageBar+="</script>";
		
			return pageBar;
			
		}

}
