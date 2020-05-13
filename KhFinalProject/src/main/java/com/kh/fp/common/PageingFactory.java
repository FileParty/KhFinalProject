package com.kh.fp.common;

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
	
		public static String PageBarFactoryAjax(int cPage, int numPerPage, int totalData, String url, String script) {
			
			
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
			pageBar+="$(function(){";
			pageBar+="$.ajax({";
			pageBar+="url:"+url+",";
			pageBar+="success:"+script+"";
			pageBar+="})";
			pageBar+="})";
			pageBar+="</script>";
	
			return pageBar;
			
	}
	
		//메뉴 리스트 페이징 처리 
		//by 승연
		
		public static String PageBarFactory(int cPage, int numPerPage, int totalData, String url, String category) {
		
			
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

}
