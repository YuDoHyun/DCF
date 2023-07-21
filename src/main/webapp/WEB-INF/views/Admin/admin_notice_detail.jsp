<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<link rel="stylesheet" href="/css/Admin/admin_notice_detail.css">
 <div class="content-wrap">
        <p class="admin-title">게시판 관리</p>
        <p class="admin-subtitle">-공시사항 </p>
        <div class="notice_board">
	        <form action="adminUpdateAction">
	        <div class="notice_board_title">
	            	<input type="hidden" name="notice_idx" value="${noticedto.notice_idx }"></input>
	            	<input type="text" name="notice_title" value="${ noticedto.notice_title }"></input>
	            	<span>
	            		<c:set var="dateVar" value="${ noticedto.notice_date }" />
						<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" />
					</span>
			</div>
	        <div class="notice_board_content">
	                <textarea rows="" cols=""  name="notice_content">${noticedto.notice_content}</textarea >               
	        </div>
	           <input type="submit" value="수정"></input>
	       	</form>    
            <a href="admin_notice"><button>목록</button></a>
        </div>
       
    </div><!--content-wrap-->
    <script>
    $('textarea').each(function () {
    	this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
    	}).on('input', function () {
    	this.style.height = 'auto';
    	this.style.height = (this.scrollHeight) + 'px';
    	});
    </script>