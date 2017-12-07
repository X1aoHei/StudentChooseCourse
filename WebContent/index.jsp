<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>登录</title>

</head>
<body>
<!-- 代码 开始 -->
<div class="wrapper">
	<div class="container">
		<h1>欢迎登陆</h1>
		<div id="err">
		<c:out value="${param.error }"/>
		</div>
		<form class="form" action="LoginVaild.jsp" method="post">
			<input type="text" placeholder="用户名" name="name">
			<input type="password" placeholder="密码" name="password">
			<select size="1" name="usertype">
				<option value="1">学生</option>
				<option value="2">教师</option>
			</select>
			</br>
			<button type="submit" id="login-button">登陆</button></br>
			<a href="">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="" target="_blank">忘记密码?</a>
			
		</form>
	</div>
	
	

</body>
</html>