<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<div class="container top-bar">
	<div class="logo pull-left">
		<a href="${ctx}/"><img src="${ctx}/images/logo.png" alt=""></a>
	</div>
    <div class="serch-bar pull-right" id="topMenu">
    <ul class="bar-list">
    <li> <a href="javascript:">设为首页</a></li>
        <%
			if (session.getAttribute("member") != null) {
		%>
    <li> <a href="${ctx}/blogic/shoppingcar/showShoppingCar"><img src="${ctx}/images/icon-01.png" alt="">购物车<em id="carCount">0</em></a>
    </li>
    <li>
    <a
    href="${ctx}/blogic/order/showShoppingOrdering"><img src="${ctx}/images/icon-02.png" alt="">我的订单<em id="orderCount">0</em></a></li>

    <li class="sub" style="width:100px;">
   	 <a  href="${ctx}/blogic/membermessage/messageSystem/${not empty currentMember?currentMember.id:member.id}" >
	    <img alt="" src="${ctx}/images/icon-03.png">我的消息  <em id="newsCount">0</em>
	  </a>
    <ul>
    <li><a href="${ctx}/blogic/membermessage/messageSystem/${not empty currentMember?currentMember.id:member.id}">系统信息<em id="sysnewsCount"></em></a></li>
    <li><a href="${ctx}/blogic/membermessage/messageFans/${not empty currentMember?currentMember.id:member.id}">粉丝信息<em id="fensiCount"></em></a></li>
    <li><a href="${ctx}/blogic/membermessage/messageLettersGet/${not empty currentMember?currentMember.id:member.id}">我的私信<em id="privateNewsCount"></em></a></li>
    <%-- 
    <li><a href="${ctx}/blogic/membermessage/messageShareGet/${not empty currentMember?currentMember.id:member.id}">我的转发<em id="forwardNewsCount"></em></a></li>
     --%>
    <li><a href="${ctx}/blogic/membermessage/messageCommentGet/${not empty currentMember?currentMember.id:member.id}">我的评论<em id="commendNewsCount"></em></a></li>
    </ul>
    </li>
    <li class="sub live">
    <img alt="" src="${ctx}/images/icon-05.png">账号设置
    <ul style="">
    <li><a href="${ctx}/blogic/membersetting/accountSettingSecurity/${not empty currentMember?currentMember.id:member.id}">账号安全</a></li>
    <li><a href="${ctx}/blogic/membersetting/accountSettingBind/${not empty currentMember?currentMember.id:member.id}">账号绑定</a></li>
    <li><a href="${ctx}/blogic/membersetting/accountSettingPrivacy/${not empty currentMember?currentMember.id:member.id}">隐私设置</a></li>
    <li><a href="${ctx}/blogic/membersetting/accountSettingMessage/${not empty currentMember?currentMember.id:member.id}">消息设置</a></li>
    <li><a href="${ctx}/blogic/membersetting/accountSettingFavor/${not empty currentMember?currentMember.id:member.id}">偏好设置</a></li>
    <li><a href="${ctx}/blogic/membersetting/accountSettingPassword/${not empty currentMember?currentMember.id:member.id}">修改密码</a></li>
    <li><a href="${ctx}/blogic/member/logout">退出</a></li>
    </ul>
    </li>
    <li><a class="notice" href="${ctx}/blogic/membersetting/homepageall/${empty currentMember.id?member.id:currentMember.id}">
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${not empty member.nickName}">${member.nickName}</c:when> --%>
<%-- 			<c:when test="${empty member.nickName}">${member.uname}</c:when> --%>
<%-- 		</c:choose> --%>
	${empty membername?member.nickName:membername}
    </a></li>
</ul>
    <div class="serch-btn">
    <input type="text" class="text" id="searchContent"><input type="button"
    class="button" onclick="searchContent();">
    </div>
        <%
			}
			else
			{
				%>
				  <li><a href="${ctx}/login.jsp">登录</a>/<a class="notice" href="${ctx}/reg.jsp">注册</a></li>
				<%

			}
		%>
    </div>
</div>
<div class="container">
	<ul class="nav pull-left" id="mainmenu">
		<a class="cur" href="${ctx}/" pageType="0">首页</a>
		<a href="${ctx}/countdown.html" pageType="1">倒计时</a>
		<a href="${ctx}/blogic/carefullychosenResources/cfchosen" pageType="2">精选</a>
		<a href="${ctx}/blogic/togetherResources/together" pageType="3">一起</a>
		<a href="${ctx}/blogic/star/starList" pageType="4">明星</a>
		<a href="${ctx}/blogic/famehall/showPage" pageType="5">名人堂</a>
		<a href="${ctx}/blogic/restaurantResources/restaurant" pageType="6">餐厅</a>
		<a href="${ctx}/blogic/photographResources/photograph" pageType="7" >影摄</a>
		<a href="${ctx}/blogic/designResources/design" pageType="8">设计</a>
		<a href="${ctx}/blogic/artisticResources/artistic" pageType="9">艺术</a>
		<a href="${ctx}/vedio/vedio" pageType="21">视频</a>
		<a href="${ctx}/gx/gx.html" pageType="22">共享</a>
	</ul>
	<div class="myuser pull-right">
		 <c:if test="${not empty sessionScope.member}">
		 	<c:if test="${sessionScope.member.type == 1}">
				 <a href="${ctx}/userinfo.html"><img src="${ctx}/images/login-icon.png" alt=""> ${empty sessionScope.member.nickName?sessionScope.member.uname:sessionScope.member.nickName}的私享</a>
		 	</c:if>
		 	<c:if test="${sessionScope.member.type == 2}">
				 <a href="${ctx}/blogic/star/info/${sessionScope.member.id}"><img src="${ctx}/images/login-icon.png" alt=""> ${empty sessionScope.member.nickName?sessionScope.member.uname:sessionScope.member.nickName}的私享</a>
		 	</c:if>
		 </c:if>
	</div>
</div>
<script>

   function searchContent() {
	/* var postData = {
			"title" : $('#searchContent').val()
		};
		var url = "${ctx}/searchContent";
		doAjax(url, postData); */
		
		window.location.href="${ctx}/searchContent?title="+$('#searchContent').val();
		
}
//    findCarCount();
// 	findOrderCount();
 //查找购物车数量
//    function findCarCount(){
//    		var data ={};
//    		$.ajax({
//    	            url:'${ctx}/blogic/shoppingcar/findCarCount',
//    	            type:'post',
//    	            dataType:'json',
//    	            success:function(data){
//    					$("#carCount").text(data.carCount);
// //   					window.location="${ctx}/blogic/order/orderCheckOut";
//    	            },error:function (){
   	            	
//    	            }
//    	        });
//    	  $("#carCount").text("100");
//    }
   // 查找购物车数量
//    function findOrderCount(){
//    		var data ={};
//    		$.ajax({
//    	            url:'${ctx}/blogic/order/orderCount',
//    	            type:'post',
//    	            dataType:'json',
//    	            success:function(data){
//    					$("#orderCount").text(data.carCount);
// //   					window.location="${ctx}/blogic/order/orderCheckOut";
//    	            },error:function (){
   	            	
//    	            }
//    	        })
//    }
</script>