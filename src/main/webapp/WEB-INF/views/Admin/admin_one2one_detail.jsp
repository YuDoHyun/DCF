<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/Admin/admin_one2one_detail.css">

	<% session = request.getSession(); %>

<div class="content-wrap">
        <p class="admin-title">1:1문의</p>
        <div id="one2one-answer-wrap">          
<form action="/admin_one2one_detail_image_form" method="get">
            <table>
                <tr class="taps" style="width:50%;">
                    <td>이름</td>
                    <td class="taps_td">${ dto.user_name }</td>                    
                </tr>
                <tr class="taps" style="width:50%;">
                    <td>작성일</td>
                    <td class="taps_td"><fmt:formatDate value="${ dto.one2one_date }" pattern = "yyyy-MM-dd"/></td>                    
                </tr>
                <tr>
                    <td>제목</td>
                    <td class="taps_td">${ dto.one2one_title }</td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td class="taps_td">${ dto.one2one_content }</td>
                </tr>
                <tr>
                    <td>사진</td>
                    <td>
                        <div class="one2one-answer-img">
                            <img src="../upload/${ dto.one2one_image }" alt="" width="70px" height="70px" onClick="view()" style="cursor:pointer;">
                        </div>
                    </td>
                </tr>               
            </table>
</form>
            <div id="answerform-wrap">
                <form action="admin_one2one_detail_form">
                    <div>
                        <p>답변내용</p>
                        <p>
                        	<input type="hidden" name="one2one_idx" value="${ dto.one2one_idx }">
                            <textarea name="one2one_reply" id="">${ dto.one2one_reply }</textarea>
                        </p>
                    </div>
                <input type="submit" value="답변하기">
                </form>
            </div><!--answerform-wrap 답변부분 랩-->
        </div><!--one2one-answer-wrap-->
    </div>
    
<script>
function view() {
    window.name = "admin_one2one_detail"
    window.open("/admin_one2one_detail_image_form?one2one_idx=${dto.one2one_idx}", "admin_one2one_detail_image_form", '');
    form.submit();
  };    
</script>