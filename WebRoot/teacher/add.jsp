<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link href="<c:url value="/styles/main.css" />" type="text/css" rel="stylesheet" />
<title>添加教练</title>
</head>
<body>
    <div class="main">
        <h2 class="title"><span>添加教练</span></h2>
        <form:form action="addSave" modelAttribute="entity">
        <fieldset>
            <legend>教练</legend>
            <p>
                <label for="name">教练姓名：</label>
                <form:input path="name" size="20" autocomplete="off"/>
                <form:errors path="name" cssClass="error"></form:errors>
            </p>
            <p>
                <label for="sex">教练性别：</label>
                <form:select path="sex">
                     <form:option value="男">男</form:option>
                     <form:option value="女">女</form:option>
                </form:select>
                <form:errors path="sex" cssClass="error"></form:errors>
            </p>
            <p>
                <label for="age">教练年龄：</label>
                <form:input path="age" size="20" autocomplete="off"/>
                <form:errors path="age" cssClass="error"></form:errors>
            </p>
            <p>
                <label for="tel">教练电话：</label>
                <form:input path="tel" size="20" autocomplete="off"/>
                <form:errors path="tel" cssClass="error"></form:errors>
            </p>
            <p>
                <label for="idcard">身份证：</label>
                <form:input path="idcard" size="22" autocomplete="off"/>
                <form:errors path="idcard" cssClass="error"></form:errors>
            </p>
            <p>
                <label for="name">登录名：</label>
                <form:input path="loginname" size="22" autocomplete="off"/>
                <form:errors path="loginname" cssClass="error"></form:errors>
            </p>
            <p>
                <label for="password">密码：</label>
                <form:password path="password" size="24" autocomplete="off"/>
                <form:errors path="password" cssClass="error"></form:errors>
            </p>
            <p>
              <input type="submit" value="保存" class="btn out" style="cursor:pointer;">
            </p>
        </fieldset>
        </form:form>
        <p style="color: red">${message}</p>
        <form:errors path="*"></form:errors>
        <p>
            <a href="<c:url value="/tea/list" />"  class="abtn out">返回列表</a>
        </p>
    </div>
</body>
</html>
