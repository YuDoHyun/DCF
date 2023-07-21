<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <link rel="stylesheet" href="/css/Admin/admin_notice.css">    
    
    <link rel="stylesheet" href="/css/pagenav.css">
    <div class="boardwrap">

        <div class="board-title">
            게시판관리
        </div>

        <div class="board-sub">
            -공지사항
        </div>       
        <div class="board-buttondiv">
            <div>
                <a href="admin_notice_write">
                	<input class="board-btn btn1" onclick="location.href='admin_notice_write'" type="button" value="글등록">
                </a>
	           	 <input class="board-btn btn2" type="button" onclick="document.getElementById('admindelete').submit();" value="글삭제">
            </div>
            <div class="searchdiv">
            	<form action="admin_notice_search">
                <input class="searchbar" type="text" name="keyword">
                <input class="searchbutton" type="submit" value="검색">
                </form>
            </div>
        </div>

        <form action="adminnoticeDeleteAction"  method="get" id="admindelete">
        <div>
            <table class="noticeAdmin-table">
                <tr>
                    <td class="noticeAdmin-title"></td>
                    <td class="noticeAdmin-title">No</td>
                    <td class="noticeAdmin-title">제목</td>
                    <td class="noticeAdmin-title"></td>
                    <td class="noticeAdmin-title">등록일</td>
                </tr>
                <c:forEach var="dto" items="${ list }">
                <tr>
                    <td class="noticeAdmin-td1"><input type="checkbox" name="notice_idx" value="${ dto.notice_idx }"></td>
                    <td class="noticeAdmin-td2">${ dto.notice_idx }</td>
                    <td class="noticeAdmin-td3"><a class="notice-view" href="admin_notice_detail?notice_idx=${ dto.notice_idx }">${ dto.notice_title }</a></td>
                    <td class="noticeAdmin-td4"><a class="notice-modify" href="admin_notice_detail?notice_idx=${ dto.notice_idx }">수정</a></td>
                    <td class="noticeAdmin-td5">
						<c:set var="dateVar" value="${ dto.notice_date }" />
						<fmt:formatDate value="${dateVar}" pattern="yyyy-MM-dd" /></td>
                </tr>
                </c:forEach>

            </table>
   <div id="pagenav">
    <div class="container-fluid">
		<div class="row">
		  <ul class="pagination">
		   
		    <li class="<c:if test="${ page == 1 } ">disabled</c:if>">
		    	<a href="/admin_order_list?page=${page-1}">&#60;</a>
		    </li>
		   
		    <li class="<c:if test="${ page == 1 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_order_list?page=1">1</a>
		    </li>
		    <li class="<c:if test="${ page == 2 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_order_list?page=2">2</a>
		    </li>
		    <li class="<c:if test="${ page == 3 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_order_list?page=3">3</a>
		    </li>
		    <li class="<c:if test="${ page == 4 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_order_list?page=4">4</a>
		    </li>
		    <li class="<c:if test="${ page == 5 }">pageNaveClick</c:if>">
		    	<a class="" href="/admin_order_list?page=5">5</a>
		    </li>
		    <li class="<c:if test="${ page == 5 }">disabled</c:if>">
		    	<a class="" href="/admin_order_list?page=${page+1}">&gt;</a>
		    </li>
		  </ul>
		</div>
	</div>
	</div><!--content-wrap-->
        </div>	
        </form>    
    </div>