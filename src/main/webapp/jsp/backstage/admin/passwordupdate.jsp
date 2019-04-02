<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=basePath%>jsp/backstage/css/style.css" rel="stylesheet" type="text/css" />
<script>
 var message='${requestScope.myMessage}';
 //如果没有收到服务端发来的信息，那么就不弹出对话框
 if(message!=''){
    alert(message);
 }

</script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">修改密码</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>修改密码</span></div>
    <form action="<%=basePath%>backstage/admin/doUpdatePassword" method="post">
    <ul class="forminfo">
    <li><label>*旧密码</label><input name="oldPass" type="text" class="dfinput"/><i></i></li>
    <li><label>*新密码</label><input name="newPass" type="text" class="dfinput"/><i></i></li>
    <li><label>*确认密码</label><input name="confirmPass" type="text" class="dfinput"/><i></i></li>
    <li><label>&nbsp;</label><input name="" type="submit" class="btn" value="确认修改"/></li>
    </ul>
    </form>
    
    </div>
</body>
</html>
