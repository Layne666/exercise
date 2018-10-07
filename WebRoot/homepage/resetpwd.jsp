<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link href="<c:url value="/styles/main.css" />" type="text/css" rel="stylesheet" />
<title>修改密码</title>
</head>
<body>
    <div class="main">
        <h2 class="title"><span>修改密码</span></h2>
        <form:form action="addSave" modelAttribute="entity">
        <fieldset>
            <legend>修改密码</legend>
            <p>
                <label for="password">新密码：</label>
                <form:input path="password" size="20" autocomplete="off"/>
                <form:errors path="password" cssClass="error"></form:errors>
            </p>
            <p>
              <input type="submit" value="保存" class="btn out" style="cursor:pointer;">
            </p>
        </fieldset>
        </form:form>
        <p style="color: red">${message}</p>
        <form:errors path="*"></form:errors>
    </div>
</body>
</html>
