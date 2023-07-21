<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/Customer/notice_detail.css">
<div id="page-nav-wrap">
        <div id="page-nav">
            HOME > 공지사항
        </div>
    </div>
      <div id="contentwrap">
        <h2>공지사항</h2>
        <table>
            <tr id="title">
            	<td>${ notice.notice_title } <span><fmt:formatDate value="${ notice.notice_date }" pattern = "yyyy-MM-dd"/></span></td>            	
            </tr>
            <tr id="content">
                <td>${ notice.notice_content }</td>
            </tr>
        </table>
        <a href="notice"><button>목록</button></a>
    </div>
