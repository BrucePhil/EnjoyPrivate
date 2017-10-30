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
        <title>私享网 </title>
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
        <c:if test="${currentMember.id == member.id}">
        	<a href="${ctx}/blogic/membersetting/accountSettingSecurity/${member.id}" class="lw-btn pull-right">修改个人资料</a></div>
        </c:if>
        <c:if test="${currentMember.id != member.id}">
        	<a href="${ctx}/blogic/membersetting/givingPresent/${currentMember.id}?toMemberid=${member.id}" class="lw-btn pull-right">给ta赠送礼物</a></div>
        </c:if>
        <ul class="info-list">
        <li class="w14 pull-left">
        <div class="ho">
        	<c:if test="${currentMember.id == member.id}">
		         <a href="${ctx}/blogic/membersetting/homepageall/${member.id}">
        	</c:if>
        	<c:if test="${currentMember.id != member.id}">
        	</c:if>	
            		<img src="${ctx}/${member.level }" alt="" class="lv">
	             	 <img src="${ctx}/${member.face}" alt="" class="upic">
	<!--         <img src="images/upic.jpg" alt="" class="upic"> -->
	        </a>
          </div>
        <h4><a href="javascript:">${member.nickName}</a></h4>
        <div class="mbtn">
        <c:if test="${currentMember.id==member.id }">
	        <a href="${ctx}/blogic/membersetting/homepageall/${member.id}">主页</a>
        </c:if>
        <c:if test="${currentMember.id!=member.id }">
	        <a href="${ctx}/userinfo.html?memberid=${member.id}">主页</a>
        </c:if>
        <a href="${ctx}/blogic/membersetting/pesronalShareMine/${member.id}">私享</a>
        <a href="${ctx}/blogic/membersocial/socialSecrets/${member.id}">秘密</a></div>
        <c:if test="${currentMember.id!=member.id }">
	        <div class="sx"> <span>私信</span><a class="f" href="${ctx}/blogic/memberpublish/sendMessage/${member.id}">发私信信息</a><img src="images/sx-icon.png" alt=""> </div>
        </c:if>
        <c:if test="${currentMember.id==member.id }">
	        <div class="sx"><a class="f" href="${ctx}/blogic/membermessage/messageLettersGet/${member.id}"> <span>私信</span>我收到的私信信息<img src="images/sx-icon.png" alt=""> </a></div>
        </c:if>
        <div class="rqnum"><img src="images/heart.png" alt="">${member.red_heart }</div>
        <div class="rqnum"><img src="images/poke.png" alt="">${member.vermicelli_num }</div>
        <c:if test="${currentMember.id!=member.id }">
        	<div class="rqnum"><a href="javascript:focus();" class="gz">关注</a> </div>
        </c:if>
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
        <a href="${ctx}/blogic/membersetting/accountcharge/${member.id}" class="cz-btn">马上充值</a>
        </dl>
        </li>
        <li class="w16 pull-left">
        <dl class="info">
        <dt>伴侣信息 Partner info</dt>
        <c:if test="${patner!=null}">
        <dd class="mgb20">伴侣：<span id="pnickName">${patner.nickName}</span><a href="${ctx}/blogic/star/past/info/${member.id}"><span style='color:red;font-weight: bold;font-size:16px;margin-left:10px;'>P</span></a></dd>
        <dd>伴侣等级：<span id="pmemberLv">${ptlv }</span>级</dd>
        <dd>伴侣人气：<span id="ppopularity">${patner.popularity}</span></dd>
<!--         <dd class="mgb20">心动值 ：<span id=""></span></dd> -->
        <dd>伴侣身价：<span id="pworth">${patner.worth}</span></dd>
        <dd>纪念日期：<span id="partner_memorial_day">${pmtime}</span></dd>
        <dd class="mgb20"></dd>
        </dl>
        <div class="user-frend">
        <div class="pic"><a class="ho" href="javascript:">
                 <img src="${ctx}/${member.face}" alt="">
                 <img src="${ctx}/${member.level }" alt="" class="lv">
<!--         <img src="images/upic.jpg" alt=""> -->
        </a><h3><a href="javascript:">${member.nickName}</a></h3></div>
        <div class="pic"><a class="ho" href="${ctx}/userinfo.html?memberid=${patner.id}">
<!--         <img src="images/upic.jpg" alt=""> -->
           <img src="${ctx}/${patner.face}" alt="">
           <img src="${ctx}/${patner.level }" alt="" class="lv">
        </a><h3><a href="${ctx}/userinfo.html?memberid=${patner.id}">${patner.nickName}</a></h3></div>
        </div>
        </c:if>
        </li>
        <li class="w16 w21 pull-right">
        <dl class="info">
        <dt>专宠信息 Pet INFO</dt>
        <c:if test="${petMember!=null }">
        <dd class="mgb20">专宠：<span id="petMemberNickName">${petMember.nickName}</span> </dd>
        <dd>专宠等级：<span id="petMemberPeLv">${pelv }</span></dd>
        <dd>专宠人气：<span id="petMemberPopularity">${petMember.popularity}</span></dd>
        <dd>专宠身价：<span id="petMemberWorth">${petMember.worth}</span></dd>
        <dd>纪念日期：<span id="petMemberPetTime">${petime}</span></dd>
        <dd class="mgb20">伴侣：<span id="petMemberPartnerName">${member.nickName}</span></dd>
        <dd>竞争对手：</dd>
        <c:if test="${not empty petMembers}">
	        <dd class="mgb20">
	        <span id="petMemberNames">
	        <c:forEach items="${petMembers}" var="temp">
		        ${empty temp.nickName?temp.uname:temp.nickName}
	        </c:forEach>
	        </span>
	        </dd>
        </c:if>
        </dl>
       <%--  <div id="peMemberList" class="user-frend" style="height:110px;">
        <c:if test="${not empty peMemberList }">
        	 <c:forEach items="${peMemberList}" var="temp" varStatus="i">
	        	<div class="pic" style="margin-left:10px;">
	        		<input type="hidden" mark="petMemberNickName" value="${temp.nickName }" />
	        		<input type="hidden" mark="petMemberPopularity" value="${temp.popularity }" />
	        		<input type="hidden" mark="petMemberPeLv" value="${temp.lv_ }" />
	        		<input type="hidden" mark="petMemberWorth" value="${temp.worth }" />
	        		<input type="hidden" mark="petMemberPetTime" value="${temp.pet_memorial_day }" />
	        		<input type="hidden" mark="petMemberNames" value="${temp.petMember }" />
	        		<input type="hidden" mark="petMemberPartnerName" value="${temp.partnerName }" />
	        		<c:if test="${i.index==0 }">
	        			<span style="color:red;margin-left:13px;">TOP${i.index + 1 }</span>
	        		</c:if>
	        		<c:if test="${i.index ==1 or i.index ==2 or i.index ==3 or i.index ==4 }">
	        			<span style="color:#f3c203;margin-left:13px;">TOP${i.index + 1 }</span>
	        		</c:if>
	        		<c:if test="${i.index !=0 and i.index !=1 and i.index !=2 and i.index !=3 and i.index !=4 }">
	        			<span style="color:#fff;margin-left:13px;">TOP${i.index + 1 }</span>
	        		</c:if>
		        	<a href="javascript:">
		        		   <img src="${ctx}/${temp.level }" alt="" style="position: absolute;width:30px;height:30px;margin-left:40px;margin-top:30px;">
		                   <img src="${ctx}/${temp.face}" alt="">
			         </a>
			         <h3><a href="javascript:">${temp.nickName}</a></h3>
		         </div>
	          </c:forEach>
        </c:if>
        </div> --%>
        </c:if>
        </li>
        </ul>
        </div>
        <div class="container">
        <div class="user-qm">
        <div class="user-qm-l pull-left">
        <h3>个性签名</h3>
        <!-- <p>终于迎来了七月，对于我们的很多读者来说，七月意味着又一年暑假的来临，而今年的七月无论是对于我还是对于你们来说，都有了更多值得期待的理由。是的，7月17日电影《小时代3：刺金时代全国公映。这一路的历程我已通过《导演日记》与大家分享，而更多更丰富全面的幕后花絮与拍摄记录. . .</p> -->
         <p id="txt1">
           <c:forEach items="${userSignatures }" var="item" >
            ${item.signatures}<br/>
            </c:forEach>
            </p>
           <span id="more-qm1" class="cursor-pointer">更多</span>
			<span id="more-sh1" class="cursor-pointer">收起</span>
             
            <%--  <c:if test="${userSignatures.size()>3 }">
               <a href="javascript:" class="gdqm cursor-pointer" >更多签名</a>
                 <a href="javascript:" class="sq cursor-pointer"  style="display:none;">收起更多签名</a>
            </c:if> --%>
        </div>
        <div class="user-qm-r pull-right">
        <h3>认证信息</h3>
         <p id="txt2">
            	<c:forEach items="${auths }" var="item" >
                
            		${item.content }
            	</c:forEach>
            </p>
            <span id="more-qm" class="cursor-pointer">更多</span>
			<span id="more-sh" class="cursor-pointer" style="display:none;">收起</span>
           
          <%--   <c:if test="${auths.size()>3}">
              <a href="javascript:"  class="gdqm cursor-pointer">更多认证信息</a>
                 <a href="javascript:" class="sq cursor-pointer" style="display:none;">收起更多认证信息</a>
            </c:if> --%>
        </div>
        </div>
        </div>

    <div class="container ">
        <div class="user-focus"><a href="${adv1.url}"><img src="${ctx}/${empty adv1.path?"images/def-png.png":adv1.path}" alt=""></a></div>
    </div>
    <div class="container">
        <div class="userinfo-title">
            <div class="ltxt pull-left">我的心水</div>

            <div class="clear"></div>
        </div>
    </div>
    <div class="container mgb50">
        <ul class="item-list articleUl">
        <c:forEach items="${lovers}" var="entity" varStatus="i">
            <li>
                <a target="_blank" href="${ctx}/countdown-details.html?id=${entity.id}"><img class="item-list-img" src="${entity.cover_image}" alt=""/></a>
                <a class="item-list-h1" target="_blank" href="${ctx}/countdown-details.html?id=${entity.id}">${entity.name}</a>
               <c:if test="${currentMember.id == member.id}">
                <h3 class="edit-txt"><a href="javascript:" onclick="delLovers('${entity.id}')" class="d-icon">删除</a></h3>
               </c:if>
            </li>
        </c:forEach>
        </ul>
        <div class="user-list-m"><a  href="javascript:" page="0"  type="8">加载更多</a></div>
    </div>
    <div class="container">
        <div class="userinfo-title">
            <div class="ltxt pull-left">我的精选</div>
            <c:if test="${currentMember.id == member.id}">
        		<a href="${ctx}/blogic/memberpublish/publishArtical/${member.id}?type=2" class="lw-btn pull-right">发布</a>
        	</c:if>
            <div class="clear"></div>
        </div>
    </div>
    <div class="container mgb50">
        <ul class="item-list  articleUl">
        <c:forEach items="${jingxuan}" var="entity" varStatus="i">
        <li>
	        <a  target="_blank" href="${ctx}/blogic/carefullychosenResources/cfchosenDetail?id=${entity.id}"><img class="item-list-img" src="${ctx}/${entity.cover_image}" alt=""/></a>
	        <a class="item-list-h1"  target="_blank" href="${ctx}/blogic/carefullychosenResources/cfchosenDetail?id=${entity.id}">${entity.title}</a>
	         <c:if test="${currentMember.id == member.id}">
	        <h3 class="edit-txt"><a href="javascript:" onclick="editResouce('${entity.id}',2)" class="e-icon">编辑</a><a href="javascript:" onclick="delJingxuan('${entity.id}')" class="d-icon">删除</a></h3>
        	</c:if>
        </li>
        </c:forEach>

        </ul>
        <div class="user-list-m"><a  href="javascript:" page="0"  type="2">加载更多</a></div>
    </div>

    <div class="container ">
        <div class="user-focus"><a href="${adv2.url}"><img src="${ctx}/${empty adv2.path?"images/def-png.png":adv2.path}" alt=""></a></div>
    </div>
    <div class="container">
        <div class="homepage-user">
            <ul class="login-user">
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
                <li><img src="images/user01.jpg" alt=""></li>
                <li><img src="images/user01.jpg" alt=""></li>
                <li><img src="images/user01.jpg" alt=""></li>
            </ul>
        </div>
        <div class="user-list-m" style="display:none;"><a href="javascript:">加载更多</a></div>
    </div>
    <div class="container">
        <div class="userinfo-title">
            <div class="ltxt pull-left">我的一起</div>
            <c:if test="${currentMember.id == member.id}">
        		<a href="${ctx}/blogic/memberpublish/publishArtical/${member.id}?type=3" class="lw-btn pull-right">发布</a>
            </c:if>
            <div class="clear"></div>
        </div>
    </div>
    <div class="container mgb50">
        <ul class="item-list  articleUl">
        <c:forEach items="${yiqi}" var="entity" varStatus="i">
        <li>
        <a target="_blank" href="${ctx}/blogic/togetherResources/togetherDetail?id=${entity.id}"><img class="item-list-img" src="${ctx}/${entity.cover_image}" alt=""/></a>
        <a class="item-list-h1" target="_blank" href="${ctx}/blogic/togetherResources/togetherDetail?id=${entity.id}">${entity.title}</a>
         <c:if test="${currentMember.id == member.id}">
        <h3 class="edit-txt"><a href="javascript:" onclick="editResouce('${entity.id}',3)" class="e-icon">编辑</a><a href="javascript:" onclick="delYiqi('${entity.id}')" class="d-icon">删除</a></h3>
        </c:if>
        </li>
        </c:forEach>

        </ul>
        <div class="user-list-m"><a  href="javascript:" page="0"  type="3">加载更多</a></div>
    </div>
    <div class="container">
        <div class="userinfo-title">
            <div class="ltxt pull-left">餐厅</div>
            <c:if test="${currentMember.id == member.id}">
	        	<a href="${ctx}/blogic/memberpublish/publishArtical/${member.id}?type=4" class="lw-btn pull-right">发布</a>
    		</c:if>
            <div class="clear"></div>
        </div>
    </div>
    <div class="container mgb50">
        <ul class="item-list  articleUl">
        <c:forEach items="${canting}" var="entity" varStatus="i">
        <li>
        <a target="_blank" href="${ctx}/blogic/restaurantResources/restaurantDetail?id=${entity.id}"><img class="item-list-img" src="${ctx}/${entity.cover_image}" alt=""/></a>
        <a class="item-list-h1" target="_blank" href="${ctx}/blogic/restaurantResources/restaurantDetail?id=${entity.id}">${entity.title}</a>
       	 <c:if test="${currentMember.id == member.id}">
       	<h3 class="edit-txt"><a href="javascript:" class="e-icon" onclick="editResouce('${entity.id}',4)">编辑</a><a href="javascript:" onclick="delCanting('${entity.id}')" class="d-icon">删除</a></h3>
        </c:if>
        </li>
        </c:forEach>

        </ul>
        <div class="user-list-m"><a  href="javascript:" page="0"  type="4">加载更多</a></div>
    </div>

    <div class="container">
        <div class="userinfo-title">
            <div class="ltxt pull-left">设计</div>
            <c:if test="${currentMember.id == member.id}">
        		<a href="${ctx}/blogic/memberpublish/publishArtical/${member.id}?type=5" class="lw-btn pull-right">发布</a>
            </c:if>
            <div class="clear"></div>
        </div>
    </div>
    <div class="container mgb50">
        <ul class="item-list  articleUl">
        <c:forEach items="${sheji}" var="entity" varStatus="i">
        <li>
        <a target="_blank" href="${ctx}/blogic/designResources/designDetail?id=${entity.id}"><img class="item-list-img" src="${ctx}/${entity.cover_image}" alt=""/></a>
        <a class="item-list-h1" target="_blank" href="${ctx}/blogic/designResources/designDetail?id=${entity.id}">${entity.title}</a>
         <c:if test="${currentMember.id == member.id}">
        <h3 class="edit-txt"><a href="javascript:" class="e-icon" onclick="editResouce('${entity.id}',5)">编辑</a><a href="javascript:" onclick="delSheji('${entity.id}')" class="d-icon">删除</a></h3>
        </c:if>
        </li>
        </c:forEach>

        </ul>
        <div class="user-list-m"><a  href="javascript:" page="0"  type="5">加载更多</a></div>
    </div>

    <div class="container">
        <div class="userinfo-title">
            <div class="ltxt pull-left">摄影</div>
            <c:if test="${currentMember.id == member.id}">
        		<a href="${ctx}/blogic/memberpublish/publishArtical/${member.id}?type=6" class="lw-btn pull-right">发布</a>
            </c:if>
            <div class="clear"></div>
        </div>
    </div>
    <div class="container mgb50">
        <ul class="item-list  articleUl">
        <c:forEach items="${sheying}" var="entity" varStatus="i">
        <li>
        <a target="_blank" href="${ctx}/blogic/photographResources/photographDetail?id=${entity.id}"><img class="item-list-img" src="${ctx}/${entity.cover_image}" alt=""/></a>
        <a class="item-list-h1" target="_blank" href="${ctx}/blogic/photographResources/photographDetail?id=${entity.id}">${entity.title}</a>
         <c:if test="${currentMember.id == member.id}">
        <h3 class="edit-txt"><a href="javascript:" class="e-icon" onclick="editResouce('${entity.id}',6)">编辑</a><a href="javascript:" onclick="delSheying('${entity.id}')" class="d-icon">删除</a></h3>
        </c:if>
        </li>
        </c:forEach>

        </ul>
        <div class="user-list-m"><a  href="javascript:" page="0"  type="6">加载更多</a></div>
    </div>

    <div class="container">
        <div class="userinfo-title">
            <div class="ltxt pull-left">艺术</div>
            <c:if test="${currentMember.id == member.id}">
        		<a href="${ctx}/blogic/memberpublish/publishArtical/${member.id}?type=7" class="lw-btn pull-right">发布</a>
            </c:if>
            <div class="clear"></div>
        </div>
    </div>
    <div class="container">
        <ul class="item-list  articleUl">
        <c:forEach items="${yishu}" var="entity" varStatus="i">
        <li>
        <a target="_blank" href="${ctx}/blogic/artisticResources/artisticDetail?id=${entity.id}"><img class="item-list-img" src="${ctx}/${entity.cover_image}" alt=""/></a>
        <a class="item-list-h1" target="_blank" href="${ctx}/blogic/artisticResources/artisticDetail?id=${entity.id}">${entity.title}</a>
         <c:if test="${currentMember.id == member.id}">
        <h3 class="edit-txt"><a href="javascript:" class="e-icon" onclick="editResouce('${entity.id}',7)">编辑</a><a href="javascript:" onclick="delYishu('${entity.id}')" class="d-icon">删除</a></h3>
        </c:if>
        </li>
        </c:forEach>

        </ul>
        <div class="user-list-m"><a  href="javascript:" page="0"  type="7">加载更多</a></div>
    </div>
    <div class="container ">
        <div class="user-focus"><a href="${adv3.url}"><img src="${ctx}/${empty adv3.path?"images/def-png.png":adv3.path}" alt=""></a></div>
    </div>
        <div id="footer"><%@include file="../footer.jsp"%></div>
</div>
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="js/jquery.form.js"></script>
        <script src="js/jquery.validate.js"></script>
        <script src="js/messages_zh.js"></script>
        <script src="js/common.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="${ctx}/js/jquery-bigSlider2.js"></script>
        <script>
        jQuery(document).ready(function() {
        	$("#more-sh").click();
        	$("#more-sh1").click();
			jQuery('#peMemberList').bigSlider({
				focusType: 'enlarge',
				animationDuration: 400
			});
			$("#peMemberList").find("div.pic").each(function(_index, element) {
				$(this).bind("click",function(){
	        		$(this).find("input[mark^='petMember']").each(function(){
	        			var mark = $(this).attr("mark");
	        			var value = $(this).val();
	        			$("#"+mark).text(value);
	        		});
				})
			});
		});
          $(function (){
        	  $(".gdqm").bind("click",function(){
        	        $(this).parent().find("p").css("maxHeight","none");
        	        $(this).hide();
        	        $(this).parent().find(".sq").show();
        	    });
        	  $(".sq").bind("click",function(){
        		  $(this).parent().find("p").css("maxHeight","");
      	        $(this).hide();
      	        $(this).parent().find(".gdqm").show();
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
        var obj=$(".articleUl").eq(index);
        for (var i = 0; i < artiles.length; i++) {

        var appendData=        '  <a href=""><img class="item-list-img" src="${ctx}/images/tem/tem-pets.jpg" alt=""/></a><a class="item-list-h1">'+artiles[i].title+'</ a>';
     //   var appendData='<li><a href="javascript:"><img src="images/upic01.jpg" alt=""></a><div class="txt"><h5 class="num">'+artiles[i].title+'</h5><h5 class="title">'+artiles[i].title+'</h5><p>'+artiles[i].simpleContent+'</p><h5 class="view">人气<em>548,000次</em></h5></div></li>';
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

          })
    });
          
          //删除心水
          function delLovers(productid){
        	  var memberid = '${member.id}';
        	  var data = {
        			  'memberid':memberid,
        			  'productid':productid
        	  }
        	  var url = '${ctx}/ajax/delMemberLover';
        	  doAjax(url,data,function(data){
        		alertInfo(data.message);
				location.reload();
        	  },function(data){
        		  alertError("服务器异常");
        	  });
          }
          //删除精选
          function delJingxuan(jingxuanid){
        	  var memberid = '${member.id}';
        	  var data = {
        			  'memberid':memberid,
        			  'jingxuanid':jingxuanid
        	  }
        	  var url = '${ctx}/blogic/carefullychosenResources/delCarefullychosen';
        	  doAjax(url,data,function(data){
          		alertInfo(data.message);
  				location.reload();
          	  },function(data){
          		  alertError("服务器异常");
          	  });
          }
          //删除一起
          function delYiqi(yiqiid){
        	  var memberid = '${member.id}';
        	  var data = {
        			  'memberid':memberid,
        			  'yiqiid':yiqiid
        	  }
        	  var url = '${ctx}/blogic/togetherResources/delYiqi';
        	  doAjax(url,data,function(data){
            		alertInfo(data.message);
    				location.reload();
            	  },function(data){
            		  alertError("服务器异常");
            	  });
          }
          //删除餐厅
		  function delCanting(cantingid){
			  var memberid = '${member.id}';
        	  var data = {
        			  'memberid':memberid,
        			  'cantingid':cantingid
        	  }
        	  var url = '${ctx}/blogic/restaurantResources/delCanting';
        	  doAjax(url,data,function(data){
            		alertInfo(data.message);
    				location.reload();
            	  },function(data){
            		  alertError("服务器异常");
            	  });
          }
          //删除设计
          function delSheji(shejiid){
        	  var memberid = '${member.id}';
        	  var data = {
        			  'memberid':memberid,
        			  'shejiid':shejiid
        	  }
        	  var url = '${ctx}/blogic/designResources/delSheji';
        	  doAjax(url,data,function(data){
            		alertInfo(data.message);
    				location.reload();
            	  },function(data){
            		  alertError("服务器异常");
            	  });
          }
          //删除摄影
          function delSheying(sheyingid){
        	  var memberid = '${member.id}';
        	  var data = {
        			  'memberid':memberid,
        			  'sheyingid':sheyingid
        	  }
        	  var url = '${ctx}/blogic/photographResources/delSheying';
        	  doAjax(url,data,function(data){
            		alertInfo(data.message);
    				location.reload();
            	  },function(data){
            		  alertError("服务器异常");
            	  });
          }
          //删除艺术
          function delYishu(yishuid){
        	  var memberid = '${member.id}';
        	  var data = {
        			  'memberid':memberid,
        			  'yishuid':yishuid
        	  }
        	  var url = '${ctx}/blogic/artisticResources/delYishu';
        	  doAjax(url,data,function(data){
            		alertInfo(data.message);
    				location.reload();
            	  },function(data){
            		  alertError("服务器异常");
            	  });
          }
          
          function editResouce(resouceid,type){
        	  var memberid = '${member.id}';
        	  var data = {
        			  'resouceid':resouceid,
        			  'type':type
        	  }
        	  var url = '${ctx}/blogic/memberpublish/editArtical?resouceid='+resouceid+'&type='+type;
        	  window.location.href=url;
//         	  doAjax(url,data,function(data){
//             		alertInfo(data.message);
//     				location.reload();
//             	  },function(data){
//             		  alertError("服务器异常");
//             	  });
          }
          //关注
          function focus(){
	          var params={
		          memberid:"${currentMember.id}",
		          followid:"${member.id}"
	          }
	          doAjax("${ctx}/blogic/member/followMember",params,function(data){
	          if (data.status == 1) {
		          alertInfo("关注成功");
		          $(this).remove();
	          }
	          else if(data.status == 0)
	          {
	         	 alertInfo(data.message,true);
	          }
	          },function(data,status){
	          
	          });

          };
        </script>
</body>
</html>