<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <style>
    *{margin: 0; padding: 0; list-style: none; box-sizing:border-box;}
    #index{
    width:1080px; 
    position:relative; 
    margin:0 auto;
    }
    </style>
<div id="index">

<c:import url="../Admin/admin_header.jsp" />

<!-- main.jsp, login.jsp, ... -->
<c:import url="${ adminPage }" />
</div>