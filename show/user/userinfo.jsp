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
<title>私享网</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/mystyle.css">
<!--[if lt IE 9]>
	<script src="js/html5shiv.min.js"></script>
	<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<body class="reset-box-sizing">
<div class="warp">
  <div class="header" id="header">
  	<%@include file="/header.jsp"%>
   </div>
  <div class="container">
    <div class="userinfo-title">
      <div class="ltxt pull-left">${member.nickName}的个人主页</div>
      <a href="${ctx}/blogic/membersetting/givingPresent/${member.id}" class="lw-btn pull-right">给ta赠送礼物</a></div>
    <ul class="info-list">
      <li class="w14 pull-left"> <a href="${ctx}/blogic/membersetting/homepageall/${member.id}">
<!--      	 <img src="${member.face}" alt="" class="upic"> --!>
     	 <img src="images/upic.jpg" alt="" class="upic">
      </a>
        <h4><a href="javascript:">${member.nickName}</a></h4>
        <div class="mbtn">
        <a href="${ctx}/blogic/membersetting/homepageall/${member.id}">主页</a>
        <a href="${ctx}/blogic/membersetting/pesronalShareMine/2">私享</a>
        <a href="${ctx}/blogic/membersocial/socialSecrets/2">秘密</a></div>
        <div class="sx"> <span>私信</span><a class="f" href="${ctx}/blogic/membermessage/messageLettersGet/${member.id}">给我发私信信息</a><img src="images/sx-icon.png" alt=""> </div>
        <div class="rqnum"><img src="images/heart.png" alt="">${member.red_heart }</div>
        <div class="rqnum"><img src="images/poke.png" alt="">${member.vermicelli_num }</div>
      </li>
      <li class="w16 pull-left">
        <dl class="info">
          <dt>个人信息 profile</dt>
          <dd class="mgb20">昵称：<span id="member-nickName">${member.nickName}</span></dd>
          <dd>私号：<span id="member-private-no">${member.private_no}</span></dd>
          <dd class="mgb20">等级：<span id="memberLv">${exp}</span>级</dd>
          <dd>人气：<em><span id="member-popularity">${member.popularity}</span></em></dd>
          <dd class="mgb20">人气排名：<em><span id="popularityNum">${popularityNum }</span>位</em></dd>
          <dd>身价：<em><span id="member-worth">${member.worth}</span></em></dd>
          <dd class="mgb20">身价排名：<em>第<span id="worthNum">${worthNum}</span>名</em></dd>
          <dd>星级：<span id="starLv">${member.experience }</span>级</dd>
          <dd>星级排名：第<span id="starNum">${starLv}</span>名</dd>
          <a href="javascript:" class="cz-btn">马上充值</a>
        </dl>
      </li>
      <li class="w16 pull-left">
       <dl class="info">
       <dt>伴侣信息 Partner info</dt>
       <c:if test="${patner!=null}">
        <dd class="mgb20">配偶：<span id="pnickName">${patner.nickName}</span></dd>
        <dd>配偶等级：<span id="pmemberLv">${ptlv }</span>级</dd>
        <dd>配偶人气：<span id="ppopularity">${patner.popularity}</span></dd>
        <dd class="mgb20">心动值 ：<span id=""></span></dd>
        <dd>配偶身价：<span id="pworth">${patner.worth}</span></dd>
        <dd class="mgb20">伴侣：<span id="">${patner.nickName}</span></dd>
        <dd>纪念日期：</dd>
        <dd class="mgb20"><span id="partner_memorial_day">${pmtime}</span></dd>
       </dl>
       <div class="user-frend">
         <div class="pic"><a href="javascript:">
<!--          <img src="${member.face}" alt=""> --!>
         <img src="images/upic.jpg" alt="">
         </a><h3><a href="javascript:">自己</a></h3></div>
         <div class="pic"><a href="javascript:">
         <img src="images/upic.jpg" alt="">
<!--          <img src="${patner.face}" alt=""> --!>
         </a><h3><a href="javascript:">男友/女友</a></h3></div>
       </div>
      </c:if>
      </li>
      <li class="w16 w21 pull-right">
      	<dl class="info">
          <dt>专宠信息 Pet INFO</dt>
	     <c:if test="${petMember!=null }">
          <dd class="mgb20">专宠：<span id="">${petMember.nickName}</span> </dd>
          <dd>专宠等级：<span id="">${pelv }</span></dd>
          <dd>专宠人气：<span id="">${petMember.nickName}</span></dd>
          <dd>专宠身价：<span id="">${petMember.popularity }</span></dd>
          <dd>纪念日期：<span id="">${petime}</span></dd>
          <dd class="mgb20">伴侣：<span id="">${member.nickName}</span></dd>
          <dd>竞争对手：</dd>
          <dd class="mgb20"><span id=""></span></dd>
        </dl>
        <div class="user-frend">
          <div class="pic"><a href="javascript:">
          <img src="images/upic.jpg" alt="">
<!--           <img src="${member.face}" alt=""> --!>
          </a><h3><a href="javascript:">自己</a></h3></div>
          <div class="pic"><a href="javascript:">
          <img src="images/upic.jpg" alt="">
<!--           <img src="${petMember.face }" alt=""> --!>
          </a><h3><a href="javascript:">男友/女友</a></h3></div>
        </div>
          </c:if>
      </li>
    </ul>
  </div>
  <div class="container">
  	<div class="user-qm">
    	<div class="user-qm-l pull-left">
        	<h3>个性签名</h3>
            <!-- <p>终于迎来了七月，对于我们的很多读者来说，七月意味着又一年暑假的来临，而今年的七月无论是对于我还是对于你们来说，都有了更多值得期待的理由。是的，7月17日电影《小时代3：刺金时代全国公映。这一路的历程我已通过《导演日记》与大家分享，而更多更丰富全面的幕后花絮与拍摄记录. . .</p> -->
           <p>
           <c:forEach items="${userSignatures }" var="item" >
            ${item.signatures}
            </c:forEach>
            </p>
             <c:if test="${userSignatures!=null&&userSignatures.size()>3} }">
               <a href="javascript:" class="gdqm">更多签名</a>
            </c:if>
        </div>
        <div class="user-qm-r pull-right">
        	<h3>认证信息</h3>
            <p>
            	<c:forEach items="${auths }" var="item" >
            		${item.content }
            	</c:forEach>
            </p>
            <c:if test="${auths.size()>3} }">
              <a href="javascript:"  class="gdqm">更多认证信息</a>
            </c:if>
          
        </div>
    </div>
  </div>
  <div class="container">
  	<div class="user-focus"><img src="images/user-focus.jpg" alt=""></div>
  </div>
  <div class="container">
    <div class="userinfo-title user-snav">
      <div class="ltxt pull-left">${member.nickName}的分享</div>
      <a href="javascript:" class="cur">心水</a><a  href="javascript:">精选</a><a href="javascript:">一起</a><a href="javascript:">餐厅</a><a href="javascript:">设计</a><a href="javascript:">影摄</a><a href="javascript:">艺术</a>
      </div>
      <div class="content">
      <div>
      <ul class="user-list" >   
      <c:forEach items="${xinshui}" var="entity" varStatus="i">
        <li>
        	<a href="javascript:"><img src="images/upic01.jpg" alt=""></a>
            <div class="txt">
            	<h5 class="num"> ${entity.title}</h5>
                <h5 class="title"> ${entity.title}</h5>
                <p> ${entity.simpleContent}</p>
                <h5 class="view">人气<em>548,000次</em></h5>
            </div>
       	</li>
       	</c:forEach>
      </ul> <div class="user-list-m"><a href="javascript:" page="0"  type="8">加载更多</a></div>
      </div>
      <div style="display: none;">
       <ul class="user-list" >   
      <c:forEach items="${jingxuan}" var="entity" varStatus="i">
        <li>
        	<a href="javascript:"><img src="images/upic01.jpg" alt=""></a>
            <div class="txt">
            	<h5 class="num"> ${entity.title}</h5>
                <h5 class="title"> ${entity.title}</h5>
                <p> ${entity.simpleContent}</p>
                <h5 class="view">人气<em>548,000次</em></h5>
            </div>
       	</li>
       	</c:forEach>
      </ul> <div class="user-list-m"><a href="javascript:"  page="0"  type="2">加载更多</a></div>
      </div>
      <div style="display: none;">
        <ul class="user-list" >   
      <c:forEach items="${yiqi}" var="entity" varStatus="i">
        <li>
        	<a href="javascript:"><img src="images/upic01.jpg" alt=""></a>
            <div class="txt">
            	<h5 class="num"> ${entity.title}</h5>
                <h5 class="title"> ${entity.title}</h5>
                <p> ${entity.simpleContent}</p>
                <h5 class="view">人气<em>548,000次</em></h5>
            </div>
       	</li>
       	</c:forEach>
      </ul> <div class="user-list-m"><a href="javascript:"  page="0"  type="7">加载更多</a></div>
      </div><div style="display: none;">
        <ul class="user-list" >   
      <c:forEach items="${canting}" var="entity" varStatus="i">
        <li>
        	<a href="javascript:"><img src="images/upic01.jpg" alt=""></a>
            <div class="txt">
            	<h5 class="num"> ${entity.title}</h5>
                <h5 class="title"> ${entity.title}</h5>
                <p> ${entity.simpleContent}</p>
                <h5 class="view">人气<em>548,000次</em></h5>
            </div>
       	</li>
       	</c:forEach>
      </ul> <div class="user-list-m"><a href="javascript:"  page="0" type="4">加载更多</a></div>
      </div><div style="display: none;">
        <ul class="user-list" >   
      <c:forEach items="${sheji}" var="entity" varStatus="i">
        <li>
        	<a href="javascript:"><img src="images/upic01.jpg" alt=""></a>
            <div class="txt">
            	<h5 class="num"> ${entity.title}</h5>
                <h5 class="title"> ${entity.title}</h5>
                <p> ${entity.simpleContent}</p>
                <h5 class="view">人气<em>548,000次</em></h5>
            </div>
       	</li>
       	</c:forEach>
      </ul> <div class="user-list-m"><a href="javascript:"  page="0"  type="5">加载更多</a></div>
      </div>
      <div style="display: none;">
        <ul class="user-list" >   
      <c:forEach items="${sheying}" var="entity" varStatus="i">
        <li>
        	<a href="javascript:"><img src="images/upic01.jpg" alt=""></a>
            <div class="txt">
            	<h5 class="num"> ${entity.title}</h5>
                <h5 class="title"> ${entity.title}</h5>
                <p> ${entity.simpleContent}</p>
                <h5 class="view">人气<em>548,000次</em></h5>
            </div>
       	</li>
       	</c:forEach>
      </ul> <div class="user-list-m"><a href="javascript:"  page="0"  type="sheying">加载更多</a></div>
      </div><div style="display: none;">
        <ul class="user-list" >   
      <c:forEach items="${yishu}" var="entity" varStatus="i">
        <li>
        	<a href="javascript:"><img src="images/upic01.jpg" alt=""></a>
            <div class="txt">
            	<h5 class="num"> ${entity.title}</h5>
                <h5 class="title"> ${entity.title}</h5>
                <p> ${entity.simpleContent}</p>
                <h5 class="view">人气<em>548,000次</em></h5>
            </div>
       	</li>
       	</c:forEach>
      </ul> <div class="user-list-m"><a href="javascript:"  page="0"  type="7">加载更多</a></div>
      </div>
      
      </div>
     
  </div>
  <div id="footer"><%@include file="../footer.jsp"%></div>
</div>
<script src="js/jquery-1.11.3.min.js"></script> 
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/messages_zh.js"></script>
<script src="js/common.js"></script> 
<script src="js/bootstrap.min.js"></script>
    <script>
    
    
    $(".gdqm").bind("click",function(){
        $(this).parent().find("p").css("maxHeight","none");
    });
    
    $(".user-snav").find("a").each(function(index){
      $(this).click(function(){
    $(this).siblings().removeClass("cur").end().addClass("cur");
    $(".content>div").eq(index).siblings().hide().end().show();
    });
    });

    //加载更多
     $(".user-list-m").each(function(index){
     $(this).find("a").click(function(){
       var type=$(this).attr("type");
       var page_num=parseInt($(this).attr("page") )+1;
       var page_size=10;
       
       var postData={
    		   "type":type,
    		    "page_num":page_num,
    		    "page_size":page_size
       } ;	 
    	 doAjax("blogic/member/getMemberResoucesByType",postData,function(data){
    	        if (data.status == 1) {
    	        	var artiles = data.data;
    	            var count=artiles.length;
    	            if(count==0)
    	            {
    	            	return;
    	            }
    	            else
    	            {    	
    	                var obj=$(".content .user-list").eq(index);
    					for (var i = 0; i < artiles.length; i++) {
    						var appendData='<li><a href="javascript:"><img src="images/upic01.jpg" alt=""></a><div class="txt"><h5 class="num">'+artiles[i].title+'</h5><h5 class="title">'+artiles[i].title+'</h5><p>'+artiles[i].simpleContent+'</p><h5 class="view">人气<em>548,000次</em></h5></div></li>';
    						obj.append(appendData);
    					}
    	            	$(this).attr("page",data.pageNum);
    	            	
    	            }
    	        }
    	        else if(data.status == 0)
    	        {
    	            alertInfo(data.message)
    	        }
    	    },function(data,status){
    	        alertError("服务器异常");
    	    });
    	 
      // console.log("i;"+index);
    });
    });

    </script>
</body>
</html>