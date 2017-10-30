<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp" %>
<!DOCTYPE html>
<!--[if IE 8]><html class="ie ie8"> <![endif]-->
<!--[if IE 9]><html class="ie ie9"> <![endif]-->
<!--[if gt IE 9]><!-->
<html>
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>私享网-注册</title>
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${ctx}/css/mystyle.css">
<link rel="stylesheet" href="${ctx}/css/jquery.toastmessage.css">
<!--[if lt IE 9]>
	<script src="js/html5shiv.min.js"></script>
	<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<body class="reset-box-sizing">
	<div class="warp">
		<div class="header" id="header">	<%@include file="header.jsp"%></div>
    <div class="userinfo-title user-login-title">
        <div class="container">
        <img class="user-login" src="${ctx}/images/user-login.jpg" width="100%" alt=""/>
        </div>
    </div>

		<div class="login-center reg-center">
            <div class="container">
                <form id="registForm">
                    <ul class="login-list">
                        <li><span class="txt">注册账户身份</span>
                            <div class="cout pull-left userType">
                                <input name="userType" type="hidden" id="userType" value="1" />
                                <div class="cuser ccur pull-left">
                                    <i></i>普通用户
                                </div>
                                <div class="cuser pull-right">
                                    <i></i>明星
                                </div>
                            </div></li>
                        <li><span class="txt">用户名/邮箱</span> <input type="text"
                            name="uname" id="uname" placeholder="请输入您的用户名或邮箱地址"
                            class="text" required><label for="uname"></label></li>
                        <li><span class="txt">密码</span> <input type="password"
                            name="password" id="password" placeholder="请输入密码" class="text"
                            maxlength="12" minlenght="6" required><label
                            for="password"></label></li>
                        <li><span class="txt">确认密码</span> <input type="password"
                            name="repassword" id="repassword" placeholder="请再次输入密码"
                            class="text" maxlength="12" minlenght="6" equalTo="#password"
                            required><label for="repassword"></label></li>
                        <li><span class="txt">验证码</span>
                            <div class="yzm-out">
                                <input style="width: 50%;" type="text" name="validcode" id="validcode"
                                    placeholder="请输入验证码" class="text" length="5" required>
                                <div class="yzm-code">
                                    <img id="codeImg" src="images/yzm-code.png" alt=""><label
                                        for="validcode"></label>
                                </div>
                            </div></li>
                        <li><span class="txt">推荐人</span> <input type="text"
                            name="recommender" id="recommender" placeholder="请输入推荐人私号"
                            class="text" value="${not empty privateNo?privateNo:''}" ><label for="recommender"></label></li>
                        <li class="abtn"><input type="button"
                            class="button but1 back1" value="确定注册" id="submit"> <input
                            type="button" class="button but2 back2" value="重新填写" id="regist">
                        </li>
                    </ul>
                </form>
            </div>
        </div>
		<div id="footer">	<%@include file="footer.jsp"%></div>
	</div>
	<script src="${ctx}/js/jquery-1.11.3.min.js"></script>
	<script src="${ctx}/js/jquery.form.js"></script>
	<script src="${ctx}/js/jquery.validate.js"></script>
	<script src="${ctx}/js/messages_zh.js"></script>
	<script src="${ctx}/js/common.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script>
		function regist() {
			$("#registForm").submit();
		}
		function loadUserPhoto() {
			doAjax("${ctx}/blogic/member/listMemberFace", "", function(data,status) {
				if (data.status == 1) {
					var photos = data.data;
					for (var i = 0; i < photos.length; i++) {
						if (i >= 18) {
							return;
						}
						if (photos[i].face != null) {
							$(".login-user").li(eq).find("img").attr("src",photos[i].face);
						}
					}
				} else if (data.status == 0) {
					alertInfo(data.message)
				}
			}, function(data,status) {
				alertError("系统异常");
			});
		}

		$(function() {
			registEnter(regist);

			var options = {
				type : 'post',
				dataType : 'json',
				url : '${ctx}/blogic/member/register',
				success : function(data) {
					if (data.status == 1) {
						window.location.href = "${ctx}/userinfo.html";
					} else if (data.status == 0) {
						alertInfo(data.message)
					} else if (data.status == 2) {
						alertInfo(data.message)
					}
				}
			};

			$("#registForm").validate({
				submitHandler : function(form) {
					$(form).ajaxSubmit(options);
				}
			});

			//用户类型切换
			$(".userType").find(".cuser").each(
					function(index) {
						$(this).click(
								function() {
									$(this).siblings().removeClass("ccur")
											.end().addClass("ccur");
									$("#userType").val(index+1);
								});
					});
			//验证码
			$("#codeImg").click(
					function() {
						$(this).attr(
								"src",
								"${ctx}/blogic/validCode/showImage?vtype=memberRegister&random"
										+ Math.random());
					});
			$("#codeImg").attr(
					"src",
					"${ctx}/blogic/validCode/showImage?vtype=memberRegister&random"
							+ Math.random());
			//注册事件
			$("#submit").click(function() {
				regist();
			});
			//头像加载
			loadUserPhoto();
		});
	</script>
</body>
</html>