<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <link rel="stylesheet" href="/css/Admin/admin_one2one.css">
<div class="content-wrap">
        <p class="admin-title">1:1문의</p>
        <form action="/admin_one2one_search" method="get">
        <div class="btn-wrap">
            <div class="customer-search">
                <input name="keyword" type="text" class="searchbar">
                <input type="submit" class="searchbutton" value="검색">
            </div>
        </div>    
        </form>    
        <table>
            <thead>
                <tr>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>제목</th>
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="list" items="${list}">
                <tr>
                    <td onclick="location.href='/admin_one2one_detail?one2one_idx=${ list.one2one_idx }';">${ list.user_name }</td>
                    <td onclick="location.href='/admin_one2one_detail?one2one_idx=${ list.one2one_idx }';">${ list.user_id }</td>               
                    <td onclick="location.href='/admin_one2one_detail?one2one_idx=${ list.one2one_idx }';">${ list.one2one_title }</td>
                    <td onclick="location.href='/admin_one2one_detail?one2one_idx=${ list.one2one_idx }';"><fmt:formatDate value="${ list.one2one_date }" pattern = "yyyy-MM-dd"/></td>
                </tr>
            </c:forEach>
            </tbody>


        </table>
    </div><!--content-wrap-->