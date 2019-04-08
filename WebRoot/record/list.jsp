<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/styles/main.css"/>"  type="text/css" rel="stylesheet" />
<title>记录管理</title>
</head>
<body>
    <div class="main">
        <h2 class="title"><span>记录管理</span></h2>
        <form onsubmit="return check()">
        	<table>
        		<tr>
        			<td><input id="kssj" type="date" name="kssj" placeholder="开始时间..." autocomplete="off" value="${kssj}"/>—</td>
        			<td><input id="jssj" type="date" name="jssj" placeholder="结束时间..." autocomplete="off" value="${jssj}"/>&nbsp;&nbsp;&nbsp;</td>
    				<%-- <c:if test="${sessionScope.user.usertype==1}">
    					<td>
    						<select name="sid">
    							<option value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
    							<c:forEach var="stu" items="${stus}">
	    							<option value="${stu.id}">${stu.name}</option>
    							</c:forEach>
    						</select>
    						&nbsp;&nbsp;&nbsp;
    					</td>
    				</c:if> --%>
        			<td><input type="submit"  value="查询" class="btn" style="cursor:pointer;"></td>
        		</tr>
        	</table>
        </form>
        <form action="<c:url value="/record/deletes?pageNO=${pageNO}"/>" method="post">
        <table border="1" width="100%" class="tab" >
            <tr>
                <th><input type="checkbox" id="chbAll"></th>
                <th>记录编号</th>
                <th>上课日期</th>
                <th>课时数</th>
                <th>课时总金额</th>
                <th>教练名字</th>
                <th>会员名字</th>
                <th>操作</th>
            </tr>
            <c:forEach var="entity" items="${slist}" varStatus="status">
                <tr align="center">
                    <th><input type="checkbox" name="id" value="${entity.id}"></th>
                    <td>${entity.id}</td>
                    <td>${entity.ksrq}</td>
                    <td>${entity.kss}</td>
                    <td>￥${entity.ksze}</td>
                    <td>${entity.teacher.name}</td>
                    <td>${entity.student.name}</td>
                    <td>
                    <a href="<c:url value="/record/"/>delete/${entity.id}?pageNO=${pageNO}" class="abtn" onclick="if(confirm('确定删除?')==false)return false;">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div id="pager"></div>
        <p>
            <input type="submit"  value="批量删除" class="btn out" style="cursor:pointer;">
            <p style="float:right;">
            	<span>总共${count}数据，</span>
            	<span>课时总金额为<b style="font-size: 20px;color: red;">￥${totalKsze}</b></span>
            </p>
        </p>
        <p style="color: red">${message}</p>
        <!--分页 -->
        <script type="text/javascript" src="<c:url value="/styles/bootstrap/js/jquery-1.10.2.js"/>" ></script>
        <link href="<c:url value="/scripts/pagination.css"/>"  type="text/css" rel="stylesheet" />
        <script type="text/javascript" src="<c:url value="/scripts/jquery.pagination.js"/>" ></script>
        <script type="text/javascript">
        	function check(){
        		if($("#kssj").val()>$("#jssj").val() && $("#jssj").val()!=""){
        			alert("开始时间要小于等于结束时间！");
        			return false;
        		}
        		return true;
        	}
        
        	var checkbox = $("input[type='checkbox']");
        	$("#chbAll").click(function(){
        		if($(this).is(":checked")){
        			checkbox.prop("checked","checked");
        		}else{
        			checkbox.prop("checked","");
        		}
        	});
        	$(".out").click(function(){
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
               location.href="<c:url value="/record/"/>list?pageNO="+(new_page_index+1);
           }
        </script>
    </form>
    </div>
</body>
</html>
