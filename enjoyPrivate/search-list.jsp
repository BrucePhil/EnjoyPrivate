<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html>
<!--<![endif]-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp" %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>私享网</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/mystyle.css">
    <link rel="stylesheet" type="text/css" href="diyUpload/css/webuploader.css">
    <link rel="stylesheet" type="text/css" href="diyUpload/css/diyUpload.css">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="reset-box-sizing">
<div class="warp">
    <!-- <div class="header" style="display:none" id="header"></div> -->
            <div class="header"> 
            <div class="container top-bar">
<!-- 	<div class="logo pull-left">
		<a href="/enjoyPrivate"><img alt="" src="images/logo.png"></a>
	</div> -->
<!-- 	<div class="serch-bar pull-right" id="topMenu">
            <ul class="bar-list">
                <li><a class="notice" href="javascript:">设为首页</a></li>
                <li><a href="shopping-cart.html"><img alt="" src="images/icon-01.png">购物车<em id="carCount">1</em></a></li>
                <li><a href="order-list.html"><img alt="" src="images/icon-02.png">我的订单<em id="orderCount">14</em></a></li>
                <li class="sub">
                    <img alt="" src="images/icon-03.png">我的消息<em id="newsCount">0</em>
                    <ul>
                        <li><a href="message-01-system.html">系统信息<em>+5</em></a></li>
                        <li><a href="message-02-fans.html">粉丝信息<em>+5</em></a></li>
                        <li><a href="message-03-letters.html">我的私信<em>+5</em></a></li>
                        <li><a href="message-04-share.html">我的转发<em>+5</em></a></li>
                        <li><a href="message-05-comment.html">我的评论<em>+5</em></a></li>
                    </ul>
                </li>
                <li class="sub live">
                    <img alt="" src="images/icon-05.png">账号设置
                    <ul>
                        <li><a href="account-setting-01-security.html">账号安全</a></li>
                        <li><a href="account-setting-02-bind.html">账号绑定</a></li>
                        <li><a href="account-setting-03-privacy.html">隐私设置</a></li>
                        <li><a href="account-setting-04-message.html">消息设置</a></li>
                        <li><a href="account-setting-05-favor.html">偏好设置</a></li>
                        <li><a href="account-setting-06-password.html">修改密码</a></li>
                        <li><a href="login.html">退出</a></li>
                    </ul>
                </li>
                <li><a class="notice" href="homepage-all.html">用户昵称</a></li>
            </ul>
            <div class="serch-btn">
                <input type="text" class="text" value="搜索" id="searchContent"><input type="button"  class="button" onclick="searchContent();">
            </div>
        </div> -->
</div>
<div class="header" id="header"><%@include
				file="../../../../header.jsp"%></div>
    <div class="container">
        <div class="userinfo-title">
            <div class="ltxt pull-left">搜索结果</div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="container">
       			<c:forEach items="${indexDTOs}" var="indexDTO">
					<dl class="search-list">
							<a href="${indexDTO.url}"><dt>${indexDTO.title}</dt></a>
                            <dd>${indexDTO.content}</dd>
					</dl>
			</c:forEach>
        <div class="user-list-m"><a href="javascript:">加载更多</a></div>
    </div>
    <div class="container">
        <div class="userinfo-title">
            <div class="ltxt pull-left">搜索用户</div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="container">
       			<c:forEach items="${members}" var="member">
					<dl class="search-list">
							<a href="${ctx}/userinfo.html?memberid=${member.id}"><dt>${member.nickName}</dt></a>
                            <%-- <dd>${member.nickName}</dd> --%>
					</dl>
			</c:forEach>
        <div class="user-list-m"><a href="javascript:">加载更多</a></div>
    </div>
    <div class="container">
        <div class="userinfo-title">
            <div class="ltxt pull-left">搜索用户发布文章</div>
            <div class="clear"></div>
        </div>
    </div>
    <div class="container">
       			<c:forEach items="${indexDTOLists}" var="indexDTOList">
					<dl class="search-list">
							<a href="${indexDTOList.url}"><dt>${indexDTOList.title}</dt></a>
                            <dd>${indexDTOList.content}</dd>
					</dl>
			</c:forEach>
        <div class="user-list-m"><a href="javascript:">加载更多</a></div>
    </div>
    <div class="container footer">
        <dl class="list l25 pull-left">
            <dt><em>版权信息</em>Copyright</dt>
            <dd>网站所有版权归圈叉网网络信息平台所有<br>新ICP备 05017822号<br>&copy;2013-2014</dd>
        </dl>
        <dl class="list l38 pull-left">
            <dt><em>联系我们</em>Contact Us</dt>
            <dd>服务热线 010-59788888<br>
                官网网址 www.ooxx.com<br>
                电子邮箱 ooxx@ooxx.com(投稿)；ooxx@hotmail.com（商业合作）
            </dd>
        </dl>
        <dl class="list lw200 pull-right">
            <dt><em>网站地图</em>SiteMap</dt>
            <dd>
                <a href="index-in.html">网站首页</a>
                <a href="contact.html">联系我们</a>
                <a href="suggestion.html">投诉建议</a>
                <a href="javascript:">网站地图</a>
                <a href="cooperation.html">商业合作</a>
                <a href="ad.html">广告投放</a>
                <a href="law.html">法律隐私</a>
                <a href="about-us.html">关于我们</a>
            </dd>
        </dl>
    </div>
<div class="copyright container">
    <span class="pull-left">2014-2015&copy;  PRESERVE. All rights reserved.</span>
    <span class="pull-right">&copy; 所有版权归圈叉网所有</span>
</div>
			<div style="display:none" id="footer"></div>
</div>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/messages_zh.js"></script>
<script src="js/common.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript"  src="ueditor/ueditor.config.js"></script>
<script type="text/javascript"  src="ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript"  src="ueditor/lang/zh-cn/zh-cn.js"></script>

<script type="text/javascript" src="diyUpload/js/webuploader.html5only.min.js"></script>
<script type="text/javascript" src="diyUpload/js/diyUpload.js"></script>
<script type="text/javascript">


	function searchContent() {

		window.location.href = "${ctx}/searchContent?title="
				+ $('#searchContent').val();

	}
	$(function() {

		var ue = UE.getEditor('editor', {
			autoHeight : false
		});

		$('#focusPic').diyUpload({
			url : 'server/fileupload.php',
			success : function(data) {
				console.info(data);
			},
			error : function(err) {
				console.info(err);
			},
			buttonText : '选择文件',
			chunked : true,
			// 分片大小
			chunkSize : 512 * 1024,
			//最大上传的文件数量, 总文件大小,单个文件大小(单位字节);
			fileNumLimit : 50,
			fileSizeLimit : 10000 * 1024 * 50,
			fileSingleSizeLimit : 10000 * 1024,
			accept : {
				title : "Images",
				extensions : "gif,jpg,jpeg,bmp,png",
				mimeTypes : "image/*"
			}
		});

		$('#coverPic').diyUpload({
			url : 'server/fileupload.php',
			success : function(data) {
				console.info(data);
			},
			error : function(err) {
				console.info(err);
			},
			buttonText : '选择文件',
			chunked : true,
			// 分片大小
			chunkSize : 512 * 1024,
			//最大上传的文件数量, 总文件大小,单个文件大小(单位字节);
			fileNumLimit : 1,
			fileSizeLimit : 10000 * 1024 * 50,
			fileSingleSizeLimit : 10000 * 1024,
			accept : {
				title : "Images",
				extensions : "gif,jpg,jpeg,bmp,png",
				mimeTypes : "image/*"
			}
		});

	});
</script>
</body>
</html>