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
<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<title>私享网-登录</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/mystyle.css">
<!--[if lt IE 9]>
	<script src="js/html5shiv.min.js"></script>
	<script src="js/respond.min.js"></script>
<![endif]-->
<style type="text/css">
	li[mark] ,#regist{
		display:none;
	}
	
	<c:if test="${ empty defaultOpen || defaultOpen!='mobile'}">
	
		li[mark~=general] {
			display:block;
		}
	</c:if>
	<c:if test="${not empty defaultOpen && defaultOpen=='mobile'}">
	
		li[mark~=mobile] {
			display:block;
		}
	</c:if>
	.pull-commom {
		width:22%;
	}
</style>
</head>
<body class="reset-box-sizing">
<div class="warp">
	<div class="header" id="header">
	 	<%@include file="header.jsp"%>
    </div>
    <!--     <div class="login-title">
    	<img src="images/login-title.png" width="296" height="92" alt="">
    </div>
     -->
    
    <div class="userinfo-title user-login-title">
    
     <div class="container">
        <img class="user-login" src="images/user-login.jpg" width="100%" alt=""/>
        </div>
      
     </div>
       
        <!-- 
    <ul class="container login-user" >
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
      <li><img src="images/user01.jpg" alt=""></li>
    </ul>
     -->
    <div class="login-center">
        <form id="loginForm">
    	<ul class="login-list">
    	<li><span class="txt">登陆身份</span>
              <div class="cout pull-left userType">
                  <input name="userType" type="hidden" id="userType" value="general" />
                  
                  <div class="cuser <c:if test="${not empty defaultOpen && defaultOpen=='mobile'}"> ccur </c:if>   pull-commom  pull-left" style="width:22%;">
                      <i></i>手机登陆<input mark="userType" type="hidden"  value="mobile" />
                  </div>
                  <div class="cuser <c:if test="${ empty defaultOpen || defaultOpen!='mobile'}"> ccur </c:if>  pull-left" style="width:22%;">
                      <i></i>普通/明星用户<input mark="userType" type="hidden"  value="general" />
                  </div>
                  <div class="cuser pull-commom pull-right" style="width:22%;">
                      <i></i>官方用户<input mark="userType" type="hidden"  value="offical" />
                  </div>
              </div></li>
         <li mark="mobile"><span class="txt">手机号码</span> 
         	<input type="text"
              name="mobile" id="mobile" placeholder="请输入手机号码"
              class="text" maxlength="11"><label for="mobile"></label></li>
         <li mark="mobile"><span class="txt">手机验证码</span> 
           	 <div class="yzm-out">
                  <input type="text"
                 name="mobileCheckCode" id="mobileCheckCode" placeholder="请输入手机验证码" 
                 class="text"  
                 required><label for="mobileCheckCode"></label>
                   <div class="yzm-code">
                       <a href="javascript:void(0);" style="display: block;width: 100%;height:100%;font-size: 18px;color: #fff;"  onclick="sendSMSCode(this);settime(this);">点击获取</a>
                   </div>
               </div>
           </li>
    	  <li mark="offical general"><span class="txt">用户名/邮箱</span><input type="text" name="uname" id="uname" placeholder="请输入您的用户名或邮箱地址" class="text" required value=""> <label for="uname"></label></li>
    	  <li mark="offical"><span class="txt">授权验证码</span><input type="password" name="private_no" id="private_no" placeholder="请输入您的授权验证码" class="text" required value=""> <label for="private_no"></label></li>
          <li mark="general"><span class="txt">密码</span><input type="password" name="password" id="password" placeholder="请输入密码" minlength="6" maxlength="12"  class="text" value="" required> <label for="password"></label></li>
          <li mark="offical general"><span class="txt">验证码</span><div class="yzm-out"><input style="width:50%;" type="text" name="validcode" id="validcode" placeholder="请输入验证码" class="text" length="5" required><div class="yzm-code"><img id="codeImg"  src="images/yzm-code.png" alt=""></div></div>   <label for="validcode"></label></li>
          <li class="abtn"><input  type="button" class="button but1" value="确认登录" id="submit"><input type="button" class="button but2" value="免费注册" id="regist"></li>
          <li class="txt"><a href="${ctx}/pass/p-1.do">忘记密码</a><a href="${ctx}/userMustKnow.html">用户须知</a><a href="${ctx}">返回首页</a></li>
    	</ul>
        </form>
    </div>
    <input type="hidden" id="contexPath" value="${ctx}">
    <div id="footer">
     	<%@include file="footer.jsp"%>
    </div>

</div>
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/messages_zh.js"></script>
<script src="js/common.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
function login() {
     $("#loginForm").submit();
}
function loadUserPhoto(){
    doAjax("blogic/member/listMemberFace","",function(data){
        if (data.status == 1) {
            var photos=data.data;
            for(var i=0;i<photos.length;i++)
            {
                if(i>=18)
                {
                    return;
                }
                if(photos[i].face!=null)
                {
                    $(".login-user").find("li").eq(i).find("img").attr("src",$('#contexPath').val()+'/'+photos[i].face);
                }
            }
        }
        else if(data.status == 0)
        {
            alertInfo(data.message)
        }
    },function(data,status){
        alertError("服务器异常");
    });
}


$(function (){
	//注册回车事件
	registEnter(login);
		
	 var options = {
			    type:'post',
			    dataType:'json',
		        url: 'blogic/member/login',
		        success: function (data,statusText) {

		            if (data.status == 1) {
		            	if(data.redirect)
		            	{
		            		  window.location.href = data.redirect;
		            	}
		            	else
		            	{
		            		if(data.member.type == 1){
			            		 window.location.href = "userinfo.html";
		            		}else if(data.member.type == 2){
		            			window.location.href = "${ctx}/blogic/star/info/"+data.member.id;
		            		}else if(data.member.type == 3){
		            			window.location.href = "${ctx}/blogic/star/info/"+data.member.id;
		            		}
		            	}
		              
		            }
		            else if (data.status == 0) {
		                alertInfo(data.message)
		            }
		        } ,
	            error:function(data,status)
	            {
	            	alert("服务器异常");
	            }
	 };

    $("#loginForm").validate({
        submitHandler: function(form) {
		$(form).ajaxSubmit(options);
	}});
   //登录事件
   $("#submit").click(function(){
	   login();
   });
   //头像加载
   // loadUserPhoto();
    //验证码
    $("#codeImg").click(function (){
        $(this).attr("src","blogic/validCode/showImage?vtype=memberLogin&random" + Math.random());
    });
    $("#codeImg").attr("src","blogic/validCode/showImage?vtype=memberLogin&random" + Math.random());
    //FIXME fajun.xiang 调用方法，访问注册页面
    userRegFuc();
});

function userRegFuc(){
	$('#regist').click(function(){
		window.location="${ctx}/reg.jsp";	
			
	});
}

//用户类型切换
$(".userType").find(".cuser").each(
		function(index) {
			$(this).click(
					function() {
						$(this).siblings().removeClass("ccur")
								.end().addClass("ccur");
						var userType=$(this).find("input[mark='userType']").val();
						$("#userType").val(userType);
						$("li[mark]").hide();
						$("li[mark~='"+userType+"']").show();
						$("#uname").val("");
						if(userType=='general') {
							$("#regist").show();
						}else if(userType=='offical') {
							$("#uname").val("私享网官方");
							$("#regist").hide();
						}else {
							$("#regist").hide();
						}
// 						if(userType !='mobile') {
// 						}
					});
		});
/** 动态获取手机验证码 **/
function sendSMSCode() {
	var mobile = $("#mobile").val();
	
	if(mobile.length==0){ 
		alertError('请输入手机号码！'); 
          document.form1.mobile.focus(); 
          return false; 
       }     
       if(mobile.length!=11){ 
    	   alertError('请输入有效的手机号码！'); 
           document.form1.mobile.focus(); 
           return false; 
       } 
        
       var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
       if(!myreg.test(mobile)) 
       { 
    	   alertError('请输入有效的手机号码！'); 
           document.form1.mobile.focus(); 
           return false; 
       } 
	
doAjax("blogic/member/sendSMS", {"mobile":mobile,"checkType":"login"}, function(data,status) {
		if (data.status == 1) {
			var photos = data.data;
			
		} else if (data.status == 0) {
			alertInfo(data.message)
		}
	}, function(data,status) {
		alertError("系统异常");
	});
}

var countdown=30;

function settime(val) {
	if (countdown == 0) {
//			val.removeAttribute("disabled");
		$(val).attr('onclick',"sendSMSCode(this);settime(this);");
		$(val).text("点击获取手机验证码");
		countdown = 30;
		return;
	} else {
//			val.setAttribute("disabled", true);
		$(val).removeAttr('onclick');
		$(val).text("重新获取(" + countdown + ")");
		countdown--;
	}
	setTimeout(function() {
		settime(val)
	}, 1000);
}
</script>
</body>
</html>