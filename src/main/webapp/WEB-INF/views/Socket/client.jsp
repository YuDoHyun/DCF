<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <form action="/send" method="get">
      <input type="text" name="ip" id="ip" value="${ ip }">
      <input type="text" name="msg" id="msg" value="">    
      <c:forEach var="dto" items="${ arr }">
      <p>msg ${ dto }</p>
	</c:forEach>
      <input type="button" onclick="location.href='/socketcl';" value="접속">  
      <input type="submit" value="전송">  
      </form>

