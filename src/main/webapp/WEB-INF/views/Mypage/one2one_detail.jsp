<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page trimDirectiveWhitespaces="true" %>
<link rel="stylesheet" href="/css/Mypage/one2one_detail.css">

<div id="page-nav-wrap">
        <div id="page-nav">
            HOME > 1:1문의
        </div>
    </div>

    <div class="onetooneDetail">

        <div class="onetoone-top">
            <span>1:1문의</span>
        </div>
		<form action="one2one_delete_form" method="post">
        <div>
            <table class="onetoone-table">
                <tr>
                    <td class="onetoone-td1">이름
                    <input type="hidden" name="one2one_idx" value="${ dto.one2one_idx }">
                    </td>
                    <td class="onetoone-td2 onetoone-tdname">${ dto.user_name }</td>
                    <td class="onetoone-td1">작성일</td>
                    <td class="onetoone-td2"><fmt:formatDate value="${ dto.one2one_date }" pattern = "yyyy-MM-dd"/></td>
                </tr>

                <tr>
                    <td class="onetoone-td1">제목</td>
                    <td colspan='4' class="onetoone-td2">${ dto.one2one_title }</td>
                </tr>
                <tr>
                    <td class="onetoone-td1 onetoone-td-content">내용</td>
                    <td colspan='4' class="onetoone-td2">${ dto.one2one_content }</td>
                </tr>
                <tr>
                    <td class="onetoone-td1 onetoone-td-img">사진</td>
                    <td colspan='4' class="onetoone-td2"><img src="../upload/${ dto.one2one_image }" alt="" width="70px" height="70px" onClick="view()" style="cursor:pointer;"></td>
                </tr>
            </table>
        </div>

        <div id="one2one_reply">
            <table class="onetoone-table">
                <tr>
                    <td class="onetoone-td1 onetoone-td-content2">
                    
                    답변내용
                    </td>
                    <td colspan='4' class="onetoone-td2"><p id="reply">${ dto.one2one_reply }</p></td>
                </tr>
            </table>

        </div>

        <div class="onetoone-button">
            <input onClick="location.href='one2one_list'" type="button" class="onetoone-button1" value="목록">
            <input type="submit" class="onetoone-button2" value="삭제">
        </div>
	</form>
    </div>
    
    <script type="text/javascript">
    	var a = document.getElementById("reply").innerHTML
    	if( a == "" ){
    		document.getElementById("one2one_reply").style.display = "none";
    	}
    
    </script>
