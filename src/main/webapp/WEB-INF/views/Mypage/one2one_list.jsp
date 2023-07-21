<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true" %>
<link rel="stylesheet" href="/css/Mypage/one2one_list.css">

<div class="wrapper">
        <div id="page-nav-wrap">
            <div id="page-nav">
                HOME > 문의내역
        </div>
    </div>

    <div class="onetoonelistwrap">

        <div class="onetoonelist-title">
            <sapn>문의내역</sapn>
        </div>
    
        <div id="onetoonelist">
            <table class="table">
                <tr class="table-head">
                    <td class="table-td1">제목</td>
                    <td class="table-td2">작성일</td>
                </tr>
                <c:forEach var="mylist" items="${mylist}">
                <tr class="table-tr">
                    <td class="td1"><a href="/one2one_detail?one2one_idx=${mylist.one2one_idx}">${mylist.one2one_title}</a></td>
                    <td class="td2"><fmt:formatDate value="${mylist.one2one_date}" pattern = "yyyy-MM-dd"/></td>
                </tr>
                </c:forEach>
            </table>
        </div>

        <div class="onetoone-button">
            <input onClick="location.href='one2one'" type="button" class="onetoone" value="1:1문의하기">
        </div>

    </div>
    
<script>
    <% if(request.getAttribute("msg") != null) { %>
		alert("${msg}");
	<% }else { %>
	<% } %>

</script>