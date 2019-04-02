<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="<%=basePath%>jsp/backstage/css/style.css" rel="stylesheet" type="text/css"/>
    <script language="JavaScript" src="<%=basePath%>jsp/backstage/js/jquery.js"></script>

    <script type="text/javascript">
        $(function () {
            //导航切换
            $(".menuson li").click(function () {
                $(".menuson li.active").removeClass("active")
                $(this).addClass("active");
            });

            $('.title').click(function () {
                var $ul = $(this).next('ul');
                $('dd').find('ul').slideUp();
                if ($ul.is(':visible')) {
                    $(this).next('ul').slideUp();
                } else {
                    $(this).next('ul').slideDown();
                }
            });
        })
    </script>


</head>

<body style="background:#f0f9fd;">
<div class="lefttop"><span></span>订餐管理系统</div>

<dl class="leftmenu">

    <dd>
        <div class="title">
            <span><img src="images/leftico01.png"/></span>个人账户
        </div>
        <ul class="menuson">
            <li><cite></cite><a href="<%=basePath%>backstage/admin/toUpdatePassword" target="rightFrame">修改密码</a><i></i></li>
            <li><cite></cite><a href="<%=basePath%>jsp/backstage/admin/adminupdate.jsp" target="rightFrame">修改基本信息</a><i></i></li>
        </ul>
    </dd>

    <dd>
        <div class="title">
            <span><img src="images/leftico01.png"/></span>管理员模块
        </div>
        <ul class="menuson">
            <li><cite></cite><a href="<%=basePath %>admin/adminmanage/toManageAdmin"
                                target="rightFrame">管理员管理</a><i></i></li>
        </ul>
    </dd>


</dl>
</body>
</html>
