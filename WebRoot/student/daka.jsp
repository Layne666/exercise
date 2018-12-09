<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link href="<c:url value="/styles/main.css" />" type="text/css"
    rel="stylesheet" />
<script type="text/javascript" src="<c:url value="/styles/bootstrap/js/jquery-1.10.2.js"/>" ></script>
<title></title>
<base href="<c:url value="/" />" />
</head>
<body>
    <div class="main">
        <h2 class="title">
            <span>会员打卡</span>
        </h2>
        <form:form modelAttribute="entity">
             <fieldset>
            <legend>会员</legend>
            <form:hidden path="id"/>
            <p>
                <label for="name">会员姓名：</label>
                <form:input path="name" size="20" autocomplete="off" disabled="true"/>
                <form:errors path="name" cssClass="error"></form:errors>
            </p>
           <%--  <p>
                <label for="sex">会员性别：</label>
                <form:select path="sex" disabled="true">
                     <form:option value="男">男</form:option>
                     <form:option value="女">女</form:option>
                </form:select>
                <form:errors path="sex" cssClass="error"></form:errors>
            </p>
            <p>
                <label for="age">会员年龄：</label>
                <form:input path="age" size="20" autocomplete="off" disabled="true"/>
                <form:errors path="age" cssClass="error"></form:errors>
            </p> --%>
            <p>
                <label for="tel">会员电话：</label>
                <form:input path="tel" size="20" autocomplete="off" disabled="true"/>
                <form:errors path="tel" cssClass="error"></form:errors>
            </p>
            <%-- <p>
                <label for="idcard">身份证：</label>
                <form:input path="idcard" size="22" autocomplete="off"/>
                <form:errors path="idcard" cssClass="error"></form:errors>
            </p> --%>
            <p>
                <label for="sykss">剩余课时数：</label>
                <form:input path="sykss" size="18" autocomplete="off" disabled="true"/>
                <form:errors path="sykss" cssClass="error"></form:errors>
            </p>
            <p>
                <%-- <label for="skkss">上课课时数：</label>
                <form:input path="skkss" size="18" autocomplete="off" />
                <form:errors path="skkss" cssClass="error"></form:errors> --%>
                <label for="skkss">上课课时数：</label>
                <input name='skkss' size="18" autocomplete="off" >
            </p>
            <p>
                <%-- <label for="ksze">课时总额：</label>
                <form:input path="ksze" size="20" autocomplete="off" disabled="true"/>
                <form:errors path="ksze" cssClass="error"></form:errors> --%>
                <label for="ksze">课时总金额：</label>
                <input name='ksze' size="18" autocomplete="off" >
            </p>
           <%--  <p>
                <label for="classid">班级：</label>
                <form:select path="productType.id">
                     <form:option value="0">--请选择--</form:option>
                     <form:options items="${productTypes}"  itemLabel="name" itemValue="id"/>
                </form:select>
                <form:select path="classid">
                   <form:option value="0">--请选择班级--</form:option>
                   <form:options items="${clist}" itemLabel="name" itemValue="id"></form:options>
                </form:select>
                <form:errors path="classid" cssClass="error"></form:errors>
            </p> --%>
            <p>
              <input type="button" value="打卡" class="btn out daka" style="cursor:pointer;">
            </p>
            <script type="text/javascript">
	            $(".daka").click(function(){
		        	if(confirm('确定打卡?')==false){
	        			return false;
	        		}else if($(this).parent().siblings().eq(4).find("input").val()<=0){
	        			alert("剩余课时数不够！");
	        			return false;
	        		}
	        		$.ajax({
	        			type:'post',
	        			url:'/stu/daka',
	        			data:{
	        				'tid':'${entity.id}',
	        				'kss':$(this).parent().siblings().eq(5).find("input").val(),
	        				'ksze':$(this).parent().siblings().eq(6).find("input").val(),
	        			},
	        			success:function(data){
	        				window.location.href="/stu/dakalist";
	        			}
	        		});
		        });
            </script>
        </fieldset>
        </form:form>
        <p style="color: red">${message}</p>
        <form:errors path="*"></form:errors>
        <p>
            <a href="stu/dakalist" class="abtn out">返回列表</a>
        </p>
    </div>
</body>
</html>