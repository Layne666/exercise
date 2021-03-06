<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/styles/main.css"/>"  type="text/css" rel="stylesheet" />
<title>学生管理</title>
</head>
<body>
    <div class="main">
        <h2 class="title"><span>会员管理</span></h2>
        <form action="<c:url value="/stu/deletes?pageNO=${pageNO}"/>" method="post">
        <table border="1" width="100%" class="tab" >
            <tr>
                <th><input type="checkbox" id="chbAll"></th>
                <th>会员编号</th>
                <th>会员姓名</th>
                <th>手机号</th>
                <th>性别</th>
                <th>年龄</th>
                <!-- <th>身份证</th> -->
                <th>剩余课时数</th>
               <!--  <th>所在班级</th> -->
                <c:if test="${sessionScope.user.usertype==1}">
                	<th>操作</th>
                </c:if>
            </tr>
            <c:forEach var="entity" items="${slist}" varStatus="status">
                <tr align="center">
                    <th><input type="checkbox" name="id" value="${entity.id}"></th>
                    <td>${entity.id}</td>
                    <td>${entity.name}</td>
                    <td>${entity.tel}</td>
                    <td>${entity.sex}</td>
                    <td>${entity.age}</td>
                    <%-- <td>${entity.idcard}</td> --%>
                    <td>${entity.sykss}</td>
                   <%--  <td>${entity.classname}</td> --%>
                   <c:if test="${sessionScope.user.usertype==1}">
                    <td>
                    <a href="<c:url value="/stu/"/>delete/${entity.id}?pageNO=${pageNO}" class="abtn" onclick="if(confirm('确定删除?')==false)return false;">删除</a>
                    <a href="edit/${entity.id}" class="abtn">编辑</a>
                    </td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
        <div id="pager"></div>
        <p>
        	 <c:if test="${sessionScope.user.usertype==1}">
            <a href="add" class="abtn out">添加</a>
            <input type="submit"  value="批量删除" class="btn out" style="cursor:pointer;">
            </c:if>
            <span style="float:right;">总共${count}数据</span>
        </p>
        <p style="color: red">${message}</p>
        <!--分页 -->
        <script type="text/javascript" src="<c:url value="/styles/bootstrap/js/jquery-1.10.2.js"/>" ></script>
        <link href="<c:url value="/scripts/pagination.css"/>"  type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="<c:url value="/scripts/jquery.pagination.js"/>" ></script>
        <script type="text/javascript">
        	var checkbox = $("input[type='checkbox']");
        	$("#chbAll").click(function(){
        		if($(this).is(":checked")){
        			checkbox.prop("checked","checked");
        		}else{
        			checkbox.prop("checked","");
        		}
        	});
        	$(".btn").click(function(){
        		if(!checkbox.is(":checked")){
        			alert("请至少选择一条数据进行删除！");
        			return false;
        		}else{
        			if(confirm('确定删除?')==false){
        				return false;
        			}else{
        				return true;
        			}
        		}
        	});
           //初始化分页组件
           var count=${count};
           var size=${size};
           var pageNO=${pageNO};
           $("#pager").pagination(count, {
              items_per_page:size,
               current_page:pageNO-1,
               next_text:"下一页",
               prev_text:"上一页",
               num_edge_entries:2,
               load_first_page:false,
               callback:handlePaginationClick
            });
           
           //回调方法
           function handlePaginationClick(new_page_index, pagination_container){
               location.href="<c:url value="/stu/"/>list?pageNO="+(new_page_index+1);
           }
        </script>
    </form>
    </div>
</body>
</html>
