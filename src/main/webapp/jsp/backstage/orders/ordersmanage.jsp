<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=basePath%>jsp/admin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath%>jsp/admin/js/jquery.js"></script>
<script>
 //用于弹出窗口，将服务器返回的数据提交，本处用于账户提交后的状态
        function alert_myMessage(){
           var message="${requestScope.myMessage}";
           if(message!=""){
              alert(message);
           }
        }
        
         $(document).ready(function(){
             //用于弹出窗口，将服务器返回的数据提交，本处用于账户提交后的状态
	        alert_myMessage();
	        
	        //删除产品事件
	        $("a[name='cancelOrders']").click(function() {
			 if(window.confirm('确定要作废该订单吗？作废后无法恢复')){
			     var orderNo=$(this).attr("alt");
	             window.location.href="<%=basePath%>admin/orders/doCancelOrders?orderNo="+orderNo+"&page=${requestScope.pageObject.currentPage}"; 
	         }
		});
	     });

</script>
</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">订单管理</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
           <li><span><img src="<%=basePath%>jsp/admin/images/t04.png" /></span>统计</li>
        </ul>
        
        <ul class="toolbar1">
        <li><span><img src="<%=basePath%>jsp/admin/images/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    <c:set var="list" value="${requestScope.pageObject.list}"/>
    <c:forEach var="ordersOfEach" items="${list}">
    
    <table class="imgtable">
    
    <thead>
    <tr>
    <th colspan="5" style="font-weight:normal;">
            <span style="float:left;">订单号：${ordersOfEach.orderNo}</span>
            <span style="float:left;">下单时间：<fmt:formatDate value="${ordersOfEach.createTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/></span>
             <span style="float:left;">付款方式：${requestScope.payments[ordersOfEach.payment]}</span>
            <span style="float:left;">
               <c:choose>
    			   <c:when  test="${ordersOfEach.dealTime==null}">
        		           付款时间：无
      			   </c:when>
      			   <c:otherwise>
           		            付款时间：<fmt:formatDate value="${ordersOfEach.createTime}" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
     		       </c:otherwise>
     		   </c:choose>
            </span>
            <span style="float:right;clear:right;margin-right:5px;">订单状态：${requestScope.tags[ordersOfEach.tag]}</span>
            <span style="float:right;">总价：${ordersOfEach.totalPrice}元</span>
            
    </th>
    </tr>
    </thead>
    
    <tbody>
    <c:set var="list" value="${requestScope.pageObject.list}"/>
    <c:forEach var="orderDetailOfEach" items="${ordersOfEach.orderDetails}">
    <c:set var="productOfEach" value="${orderDetailOfEach.product}"/>
    <tr>
    <td class="imgtd" width="100px;">
     <c:choose>
       <c:when  test="${productOfEach.picUrl==null||productOfEach.picUrl==''}">
            <img src="<%=basePath%>jsp/admin/images/img13.png" style="width:80px;height:60px;"/>
       </c:when>
       <c:otherwise>
            <img src="${productOfEach.picUrl}" style="width:80px;height:60px;"/>
       </c:otherwise>
      </c:choose>
    </td>
    <td style="width:40%;">
       <a href="#">${productOfEach.name}</a>
       <p>购买数量：${orderDetailOfEach.number}</p>
    </td>
    <td style="width:15%;"><i>购买价格：${orderDetailOfEach.price}</i>
        <p style="text-decoration:line-through;">原价：${orderDetailOfEach.originalPrice}</p>
    </td>
    <td>
      <c:if  test="${ordersOfEach.tag==2||ordersOfEach.tag==3||ordersOfEach.tag==4}">
             <a name="cancelOrders" href="#" class="tablelink" alt="${ordersOfEach.orderNo}">订单作废</a>
   	  </c:if>
      &nbsp;&nbsp;<a href="javascript:void(0);" onclick="alert('该功能建设中');" class="tablelink">订单详情</a>
	</td>
    </tr>
    </c:forEach>
    
    </tbody>
    
    </table>
    <span style="float:left;">收货人：${ordersOfEach.sendName}</span>
    <span style="float:left;margin-left:20px;">收货人地址：${ordersOfEach.sendAddress}</span>
    <span style="float:left;margin-left:20px;">收货人邮编：${ordersOfEach.sendZip}</span>
    <span style="float:left;margin-left:20px;">收货人电话：${ordersOfEach.sendTel}</span>
    <br/>
    <br/>
     </c:forEach>
    
    
    
    
    
   
    <div class="pagin">
    	<div class="message">
    	           共<i class="blue">${requestScope.pageObject.totalRecords}</i>条记录,当前显示第<i class="blue">${requestScope.pageObject.currentPage}</i>页,共<i class="blue">${requestScope.pageObject.maxPage}</i>页
    	</div>
        <ul class="paginList">
        <li class="paginItem"><a href="<%=basePath%>admin/orders/ordersmanage?page=1">首页</a></li>
        <li class="paginItem"><a href="<%=basePath%>admin/orders/ordersmanage?page=${requestScope.pageObject.previousPage}">上一页</a></li>
        <li class="paginItem"><a href="<%=basePath%>admin/orders/ordersmanage?page=${requestScope.pageObject.nextPage}">下一页</a></li>
        <li class="paginItem"><a href="<%=basePath%>admin/orders/ordersmanage?page=${requestScope.pageObject.maxPage}">尾页</a></li>
        </ul>
    </div>
    
    
      
    
    
    </div>
    
   
<script type="text/javascript">
	$('.imgtable tbody tr:odd').addClass('odd');
	</script>
</body>
</html>
