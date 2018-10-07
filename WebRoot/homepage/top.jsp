<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body {
			background:url(images/logo.jpg) no-repeat;
			background-size:100% 100%;
		}
	</style>
  </head>
  
  <body>
  	<br/>
  	<div>
  		<table width="100%">
  			<tr>
  			    <td width="165px">
  					
  				</td>
  				<td align="right" valign="bottom" style="padding-right: 30px">
  				   <font color="white" style="text-decoration:none" size="4">
  					  欢迎您，${sessionScope.user.name}!<br/></font> 
  				   <font size="4">
  				        <a href="javascript:;" id="logout" style="text-decoration:none;">退出</a>
  				   </font>
  				</td>
  			</tr>
  		</table>
  	</div>
  </body>
  <script type="text/javascript" src="/styles/bootstrap/js/jquery-1.10.2.js"></script>
  <script type="text/javascript">
  	$(function(){
  		$("#logout").click(function(){
  			$.ajax({
  				type:'post',
				url:'/admin/logout',
				success:function(data){
					if(data){
						parent.location.reload();
					}else {
						alert("退出失败！");
					}
				}
  			});
  		});
  	});
  </script>
</html>
