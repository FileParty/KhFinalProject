<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap" rel="stylesheet">
<style>
	*{
		font-family:"jua";
	}
	div#side {
		border: 1px soild black;
		margin-top:50px;
		width:300px;
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
        font-size: 22px;
        font-family: 'Nanum Gothic';
    }
	a.menuDetail{
		border-top: none;
		border-left: none;
		border-right: none;
		font-size:16px;
		width: 150px;
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
		<li class="list-group">
			<a class="menu list-group-item list-group-item-action" href="${path }/admin/adminMain.do">메인화면</a>
		</li>
		<li class="list-group">
			<a class="menuDetail list-group-item list-group-item-action " href="${path }/admin/applyStoreList">가게 신청목록</a>
		</li>
	</ul>
</div>