<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<%response.setHeader("refresh", "1");%>
	
	<%
	  
	  String time = (new java.util.Date()).toString();%>
	  用户：<c:out value="${sessionScope.username}"/></br>
	  时间：<%=time %></br>
<a href="">修改密码</a>
<a href="">修改资料</a>
<a href="">注销</a>

	  
	
