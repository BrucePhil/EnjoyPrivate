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
<link rel="stylesheet" href="css/jquery.toastmessage.css">
<!--[if lt IE 9]>
	<script src="js/html5shiv.min.js"></script>
	<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<script src="js/jquery-1.11.3.min.js"></script> 
<body class="reset-box-sizing">
<div class="warp">
  <div class="header" id="header"><%@include file="header.jsp"%> </div>
  <input type="hidden" id="entityid" value="${product.id}">
  <div class="container">
  	<div class="countdown">
      	<a href="javascript:"><img src="${product.image}" alt=""></a>
        <ul class="cdownlist">
        	<li class="w26" style="width:30%;">
        		<h3>${product.name }</h3>
	        		<div class="bbtn">
	        			<c:if test="${product.store==0 }" >
	        				<a href="javascript:;" style="background-color:#cccccc;color:#fff; "   >已售罄</a>
	        			</c:if>
	        			<c:if test="${product.store>0 }">
		        			<a href="javascript:addToShoppingCar('${product.id}')" id="buyBtn" productid="${product.id}">立即购买</a>
	        			</c:if>
		        		<a href="javascript:addloveFunc('${product.id}')">心水</a>
		        		<a href="javascript:;" class="addCar" btntype = "addCar"  productid="${product.id}" >加入购物车</a>
	        		</div>
        		</li>
            <li style="width:250px;"><h3>倒计时剩余时间</h3><h2>
		    <span  id="colockbox${product.id}"> <span class="day"></span>天 <span class="hour"></span>小时 <span class="minute"></span>分 <span class="second"></span>秒</span>
		    <script type="text/javascript">
		    $(function(){
		    countDown('${product.end_time}'.replace("-","/").replace("-","/"),'#colockbox${product.id}');
		    });</script>
		    </h2></li>
          <li style="width:215px;"><h3>今日价格</h3><h2>
           <div style="float:left;width:65%;">${product.price} 元</div>
	            <div  style="float:left; margin-top:17px;margin-left:5px;">
	          	<c:if test="${product.old_price > product.price}">
	          		<img src="${ctx}/images/down.png" alt="" style="width:20px;height:20px;border:0;margin:0;">
	          	</c:if>
	          	
	          	<c:if test="${product.old_price < product.price}">
	          		<img src="${ctx}/images/up.png" alt="" style="width:20px;height:20px;border:0;margin:0;">
	          	</c:if></div>
	          	</h2>
          <li style="width:215px;"><h3>全年最低价格</h3><h2>${product.old_price } 元</h2></li>
          <li><h3>购买人数</h3><h2>${product.buyCount } 人</h2></li>
        </ul>
  	</div>
  </div>
  <div class="container mgt80">
    <div class="userinfo-title userinfo-coun-title">
      <div class="ltxt pull-left">商品描述</div>
      <div class="clear"></div>
      </div>
      <div class="countdown-details">
      	<!-- <h3>曲奇COOKIE</h3>
        曲奇，来源于英语COOKIE（英音：'kuki美音：'kukɪ），是由香港传入的粤语译音，曲奇饼在美国与加拿大解释为细少而扁平的蛋榚式的饼干，而英语的COOKIE是由德文koekje来的，意为"细少的蛋榚"。这个词在英式英语主要用作分辨美式饼干如"朱古力饼干"。第一次制造的曲奇是由数片，细少的蛋榚组合而成，据考据，是由伊朗人发明的。<br /><br />
        手工曲奇是世界上最受欢迎的食品之一，尽管不同的曲奇各有特色，它们的做法却大同小异，都是用水来使底饼变得尽可能薄并能允许泡泡出现。而且在之后会加入大量的牛油和蛋，然后将其烘干，使泡泡饱和而让蛋中
曲奇饼曲奇饼的少量水份逃离。这个饱和过程制造了曲奇最吸引人的特性，就是爽快的口感。<br /><br />
手工曲奇自上世纪80年代，从欧美传入中国。本世纪初，香港，澳门，台湾等地掀起一阵风潮，手工巧克力以及手工曲奇。节日，女孩子都会到手工曲奇作坊，亲自在导师的教导下制造味道诱人的曲奇，用以送给自己的爱人或朋友，代表着心意以及尊重。<br /><br />
逐渐这种手工制作曲奇的风潮传入广州、北京、上海等大城市，不少女孩子订购一些手工作坊的的曲奇配上精美的包装，送给身边的另一半。因此，手工曲奇网上购物应运而生。可在网上采购一些熟悉的手工曲奇作坊，也可以选择一些饼家推出的手工曲奇。<br /><br />
		<img src="images/pt01.jpg" alt=""><br />
        <h3>曲奇的研制方法</h3>
        <b>黄油的打发</b><br />
        黄油打发程度越高，面团的延展性越好。彻底的打发黄油，会让曲奇面团往花纹消失更快的方向发<br /><br />
        <b>面粉的筋度</b><br />
        面粉筋度越高，面团的延展性越差。用高筋面粉做出来的曲奇更容易保持花纹的清晰。<br /><br />
        <b>面团的含水量</b><br />
        含水量越高，延展性越好。审视你的曲奇面团，是很干还是很湿？太湿的面团花纹会消失，太干的面团挤出花纹会很费劲，两者都是不可取的。<br /><br />
        <b>烘焙的温度</b><br />
        温度越高，延展性越差。曲奇一般在190度-200度烤焙最佳，温度不可太低。<br /><br />
        <b>糖的粗细</b><br />
        颗粒越粗的糖，越能增加面团的延展性；颗粒越细的糖，越能降低面团的延展性。当其它的所有条件都已经确定时，糖的使用，直接决定了面团的延展性。在曲奇的配方中，细砂糖和糖粉是同时存在的，这是为了平衡曲奇的延展性。只用糖粉的曲奇，延展性过低，饼干会不够酥松；但不用糖粉的曲奇，延展性过高，花纹不易定型。这也解释了，为什么长时间打发黄油以后，曲奇的花纹会变得清晰一些——因为长时间的打发使得细砂糖溶解了，起到了糖粉的作用，所以面团的延展性得到了一定程度的降低。但要注意，这种方法虽然能保证花纹不消失，但注定无法获得花纹非常清晰的曲奇，因为黄油的过度打发，也会增加面团延展性的，这样得到的面团，延展性注定不会太低。<br /><br />
        <img src="images/pt01.jpg" alt="" style="margin-right:30px;"><img src="images/pt01.jpg" alt=""> -->
      	${product.info}
      </div>
  </div>
<!--   <div class="container mgt80"> -->
<!--     <div class="userinfo-title userinfo-coun-title"> -->
<!--       <div class="ltxt pull-left">心水</div> -->
<!--       <div class="clear"></div> -->
<!--       </div> -->
<!-- 	  <ul class="comment-list"> -->
<%-- 	      	<c:forEach items="${comments}" var="comment" varStatus="status"> --%>
<!-- 	           <li> -->
<!-- 	               <h4> -->
<%-- 	               	${total - status.index}楼 &nbsp;&nbsp; --%>
<%-- 	               	<em>${comment.uname }</em> --%>
<%-- 	               	${comment.insert_time } --%>
<!-- 	               </h4> -->
<%-- 	               <p>${comment.comment }</p> --%>
<%-- 	               <c:forEach items="${comment.replays}" var="item"> --%>
<!-- 	                <h4> -->
<%-- 	                	<em>${item.uname}</em>回复 &nbsp;&nbsp;<em>${comment.uname}</em> --%>
<%-- 						${item.insert_time } --%>
<!-- 	                </h4> -->
<%-- 	                <p>${item.comment}</p> --%>
<%-- 	               </c:forEach> --%>
<%-- 	               <h5><a href="javascript:void(0)" onclick="$('#reply_${comment.id}').show();">回复</a></h5> --%>
<%-- 	               <div class="comment-info" id="reply_${comment.id}" style="display: none;border: 0;"> --%>
<!-- 	          			<div class="textarea"> -->
<%-- 	              			<textarea id="reply_${comment.id}_content"></textarea> --%>
<!-- 	              		</div> -->
<%-- 	          			<input type="button" value="确定" class="summit" onclick="reply('${comment.id}');"> --%>
<!-- 	      			</div> -->
<!-- 	           </li> -->
<%-- 		</c:forEach> --%>
<!-- 	  </ul> -->
<!--       <div class="user-list-m"><a href="javascript:">加载更多</a></div> -->
<!--       <div class="comment-info"> -->
<!--       	<h3>我要评论</h3> -->
<!--         <div class="textarea"> -->
<!--           <textarea placeholder="请输入评论内容" id="content" name="content"   ></textarea></div> -->
<!--         <input type="button" value="发表评论" class="summit"> -->
<!--       </div> -->
<!--   </div> -->
	<div class="container mgb50">
        <p class="start-title">心水</p>
        <ul class="comment-list">
        	<c:forEach items="${comments}" var="comment" varStatus="status">
	            <li>
	                <h4>
	                	${total - status.index}楼 &nbsp;&nbsp;
	                	<em><a href="${ctx}/userinfo.html?memberid=${comment.member_id}">
	                	<img src="${ctx}/${comment.lv}" alt="" style="position: absolute;border:none;:auto;margin-left: 35px;z-index:2;margin-top: 23px;    width: 30px;height: 30px;">
                		<img src="${ctx}/${comment.face }" alt="" style="position: relative;margin-left: 5px;border:none;margin-top: 0px;width: 50px;height: 50px;box-sizing: border-box;border-radius: 50%;padding: 4px;">
                		<span style="margin-left:10px;">${empty comment.nickName?comment.uname:comment.nickName}</span></a></em>
	                	${comment.insert_time }
	                </h4>
	                <p>${comment.comment }</p>
	                <c:forEach items="${comment.replays}" var="item">
		                <h4>
		                	<em><a href="${ctx}/userinfo.html?memberid=${item.member_id}">
		                	<img src="${ctx}/${item.lv}" alt="" style="position: absolute;border:none;:auto;margin-left: 35px;z-index:2;margin-top: 23px;    width: 30px;height: 30px;">
	                		<img src="${ctx}/${item.face }" alt="" style="position: relative;margin-left: 5px;border:none;margin-top: 0px;width: 50px;height: 50px;box-sizing: border-box;border-radius: 50%;padding: 4px;">
		                	<span style="margin-left:10px;">${empty item.nickName?item.uname:item.nickName}</span></a></em>回复 &nbsp;&nbsp;<em>
		                	<a href="${ctx}/userinfo.html?memberid=${comment.member_id}">
		                	<img src="${ctx}/${comment.lv}" alt="" style="position: absolute;border:none;:auto;margin-left: 35px;z-index:2;margin-top: 23px;    width: 30px;height: 30px;">
	                		<img src="${ctx}/${comment.face }" alt="" style="position: relative;margin-left: 5px;border:none;margin-top: 0px;width: 50px;height: 50px;box-sizing: border-box;border-radius: 50%;padding: 4px;">
		                	<span style="margin-left:10px;">${empty comment.nickName?comment.uname:comment.nickName}</span></a></em>
							${item.insert_time }
		                </h4>
		                <p>${item.comment}</p>
	                </c:forEach>
	                <h5><a href="javascript:void(0)" onclick="$('#reply_${comment.id}').show();">回复</a></h5>
	                <div class="comment-info" id="reply_${comment.id}" style="display: none;border: 0;">
            			<div class="textarea">
                			<textarea id="reply_${comment.id}_content"></textarea>
                		</div>
            			<input type="button" value="确定" class="summit" onclick="reply('${comment.id}');">
        			</div>
	            </li>
			</c:forEach>
        </ul>
        <c:if test="${fn:length(comments) < 1}">
        	<div class="user-list-m"><a href="javascript:void(0);">没有更多数据</a></div>
       	</c:if>
       	<c:if test="${fn:length(comments) > 0}">
			<div class="user-list-m"><a href="javascript:void(0);" onclick="loadMore('${pageNo + 1}');">加载更多</a></div>
       	</c:if>
        <div class="comment-info">
            <h3>我要评论</h3>
            <div class="textarea">
                <textarea placeholder="请输入评论内容" id="comment"></textarea></div>
            <input type="button" value="发表评论" class="summit" onclick="commentArticle();">
        </div>
    </div>
  <div id="footer"><%@include file="footer.jsp"%></div>
</div>

    <div class="buy-fifter" style="display: none;">
    <div class="buy-fifterin" style="display:none;">
    <div class="title">
<!--     <a href="javascript:" class="go-back">返回倒计时</a> -->
    <a href="javascript:" class="close-btn"></a></div>

    <!--倒计时第一步-->

    <div class="buy-fifterback" >
    <ul class="buy-step-l">
    <li class="first cur"><em></em><div class="current_1"></div>1.提交订单</li>
    <li><em></em>2.选择支付方式</li>
    <li class="end"><em></em>3.购买成功</li>
    <i></i>
    </ul>
    <div class="clear"></div>
    <ul class="buy-splist">
    <li class="bt"><span class="t1">商品</span><span class="t2">单价</span><span class="t3">数量</span><span class="t4">总价</span></li>
    <li><span class="t1">曲奇COOKIE</span><span class="t2" price="326">¥ 326</span>
    <span class="t3"><a href="javascript:" class="jian"></a><input class="text" value="1" type="text"><a href="javascript:" class="jia"></a></span>
    <span class="t4"><em class="red  spriceTotal" >326</em></span>
    </li>
    <li class="bz">备注：</li>
    <li class="jb">代金券：<a href="javascript:">使用代币 &gt;</a></li>
    </ul>
    <h4 class="total">订单总价：<em>326元</em></h4>
    <input type="submit" class="submit" value="提交订单" id="submitOrder">
    </div>

    <!--倒计时第二步-->


    <div class="buy-fifterback" style="display:none;">
    <ul class="buy-step-l">
    <li class="first cur"><em></em><div></div>1.提交订单</li>
    <li class="cur"><em></em><div class="current_2"></div>2.选择支付方式</li>
    <li class="end"><em></em><div></div>3.购买成功</li>
    <i></i>
    </ul>
    <div class="clear"></div>
    <div class="buy-title">收货地址</div>
    <ul>
    <li><label>
    <input type="radio" name="RadioGroup2" value="0" id="RadioGroup2_0">
    四川省成都市第一个地址</label></li>
    <li><label>
    <input type="radio" name="RadioGroup2" value="1" id="RadioGroup2_1">
    四川省成都市第二个地址</label></li>
    <li><label>
    <input type="radio" name="RadioGroup2" value="2" id="RadioGroup2_2">
    四川省成都市第三个地址</label></li>
    </ul>
    <div class="buy-title">物流方式</div>
    <ul>
    <li><label>
    <input type="radio" name="RadioGroup3" value="0" id="RadioGroup3_0">
    申通</label></li>
    <li><label>
    <input type="radio" name="RadioGroup3" value="1" id="RadioGroup3_1">
    圆通</label></li>
    </ul>
    <input type="submit" class="submit" value="提交订单">
    </div>
    <!--倒计时第三步-->

    <div class="buy-fifterback" style="display:none;">
    <ul class="buy-step-l">
    <li class="first cur"><em></em><div></div>1.提交订单</li>
    <li class="cur"><em></em><div class="current_2"></div>2.选择支付方式</li>
    <li class="end"><em></em><div></div>3.购买成功</li>
    <i></i>
    </ul>
    <div class="clear"></div>
    <div class="buy-title">购买信息</div>
    <ul class="dd-list">
    <li><span class="t1">曲奇COOKIE</span><span class="t2">1份</span><span class="t3">应付总额：</span><span class="t4">326元</span></li>
    </ul>
    <div class="payment">
    <ul class="payment-title">
    <li><a class="cur" href="javascript:">储蓄卡</a></li>
    <li><a href="javascript:">信用卡</a></li>
    <li><a href="javascript:">支付宝/财付通</a></li>
    </ul>
    <ul class="paychange">
    <li>
    <input type="radio" name="RadioGroup1" value="0" id="RadioGroup1_0">
    <label for="RadioGroup1_0"><img src="images/pay01.jpg" alt=""></label>

    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="1" id="RadioGroup1_1">
    <label for="RadioGroup1_1"><img src="images/pay02.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="2" id="RadioGroup1_2">
    <label for="RadioGroup1_2"><img src="images/pay03.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="3" id="RadioGroup1_3">
    <label for="RadioGroup1_3"><img src="images/pay04.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="4" id="RadioGroup1_4">
    <label for="RadioGroup1_4"><img src="images/pay05.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="5" id="RadioGroup1_5">
    <label for="RadioGroup1_5"><img src="images/pay06.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="6" id="RadioGroup1_6">
    <label for="RadioGroup1_6"><img src="images/pay07.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="7" id="RadioGroup1_7">
    <label for="RadioGroup1_7"><img src="images/pay08.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="8" id="RadioGroup1_8">
    <label for="RadioGroup1_8"><img src="images/pay09.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="9" id="RadioGroup1_9">
    <label for="RadioGroup1_9"><img src="images/pay10.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="10" id="RadioGroup1_10">
    <label for="RadioGroup1_10"><img src="images/pay11.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="11" id="RadioGroup1_11">
    <label for="RadioGroup1_11"><img src="images/pay12.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="12" id="RadioGroup1_12">
    <label for="RadioGroup1_12"><img src="images/pay13.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="13" id="RadioGroup1_13">
    <label for="RadioGroup1_13"><img src="images/pay14.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="14" id="RadioGroup1_14">
    <label for="RadioGroup1_14"><img src="images/pay15.jpg" alt=""></label>
    </li>
    <li>
    <input type="radio" name="RadioGroup1" value="15" id="RadioGroup1_15">
    <label for="RadioGroup1_15"><img src="images/pay16.jpg" alt=""></label>
    </li>
    </ul>
    </div>
    <div class="payment-btn">
    <a class="b1" href="javascript:">立即付款</a><a class="b2" href="javascript:">淘宝购买</a>
    </div>
    </div>

    </div>
    <!--支付方式第四步-->
    <div class="payment-zt" style="display:none;">
    <div class="title">付款提示<img src="images/pay-close-btn.png" alt="" class="c"></div>
    <div class="ptxt">
    <h3>请您在新打开的页面上完成付款。</h3>
    付款完成前请不要关闭此窗口。<br />
    完成付款后请根据您的情况点击下面的按钮:
    </div>
    <div class="pbtn"><a class="b1" href="javascript:">已完成付款</a><a class="b2" href="javascript:">付款遇到问题</a></div>
    <div class="payment-other"><a href="javascript:">返回选择其他付款方式</a></div>
    </div>
    </div>

<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/common.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script>
$(function (){
	//立即购买
// 	$("#buyBtn").click(function(){
		
// 		//添加购入车
// 		var product_id = $(this).attr('productid');
// 		var num = 1;
// 		var postData ={
// 				'product_id':product_id,
// 				'num':num
// 		};
		
// 		doAjax("${ctx}/blogic/shoppingcar/addGoodsToCar", postData, function(data,status) {
// 			if (data.status == 1) {
				
				
// 				$(".buy-fifter,.buy-fifterin").show();			
// 			} else if (data.status == 0) {
// 				alertInfo(data.message);
// 			}
// 		}, function(data,status) {
// 			alertError("系统异常");
// 		});		
		
// 	});
	
	//购入车增减
	$(".buy-splist li").each(function(){
		var that=$(this);
		var sumInput=$(this).find("input");
		var priceInput=$(this).find(".t2");
		var spriceTotalObj=$(this).find(".spriceTotal");
		
		$(this).find(".jian").click(function(){
			var sum=parseInt(sumInput.val());
			var price=parseInt(priceInput.attr("price"));
			var spriceTotal;
			if(sum==1)
			{
				return;
			}
			spriceTotal=(sum-1)*price;
			spriceTotalObj.html(spriceTotal);
			sumInput.val(sum-1);
		});
		$(this).find(".jia").click(function(){
			var sum=parseInt(sumInput.val());
			var price=parseInt(priceInput.attr("price"));
			var spriceTotal;
			if(sum>=100)
			{
				return;
			}
			spriceTotal=(sum+1)*price;
			spriceTotalObj.html(spriceTotal);
			sumInput.val(sum+1);
		});
	});
	
	
	
	
	
	$(".buy-fifterin a.go-back").click(function(){
		$(".buy-fifter").hide();
	});
	$(".buy-fifterin a.close-btn").click(function(){
		$(".buy-fifter").hide();
	});


    //提交订单
    $("#submitOrder").click(function(){
    });
	
	
	
	 //发表评论
//     $(".summit").click(function(){
//     var content=$.trim($("#content").val());
//     if(content.length>200)
//     {
//     alertInfo("评论内容最长度不能超过200字符");
//     return;
//     }
//     var postData={
//     "type":id,
//     "content":content
//     } ;
//     doAjax("blogic/member/getMemberResoucesByType",postData,function(data){
//     if (data.status == 1) {

//     }
//     else if(data.status == 0)
//     {
//     alertInfo(data.message)
//     }
//     },function(data,status){
//     alertError("服务器异常");
//     });
//     });


    //加载更多
    $(".user-list-m a").click(function (){
    var postData={
    "type":id,
    "content":content
    } ;
    doAjax("blogic/member/getMemberResoucesByType",postData,function(data){
    if (data.status == 1) {

    }
    else if(data.status == 0)
    {
    alertInfo(data.message)
    }
    },function(data,status){
    alertError("服务器异常");
    });
    });
    
    $('.addCar').each(function(){
		$(this).unbind('click').click(function(){
			var productid = $(this).attr('productid');
			addCarFn(productid);
		});
	});
});

function addloveFunc(productid){
	var data = {
		'productid':productid
	}
	$.ajax({
        url:'${ctx}/ajax/addMemberLover',
        data:data,
        type:'post',
        dataType:'json',
        error:function(){
        	alert('系统错误');
        },
        success:function(data){
			alert(data.message);
        }
    })
} 

function addToShoppingCar(product_id){
	var num = 1;
	var data ={
			'product_id':product_id,
			'num':num
	}
	$.ajax({
            url:'${ctx}/blogic/shoppingcar/addGoodsToCar',
            data:data,
            type:'post',
            dataType:'json',
            success:function(data){
// 				alert(data.message);
				window.location="${ctx}/blogic/order/orderCheckOut";
            }
        })
}
///  添加购物车
function addCarFn(product_id){
	var num = 1;
	var data ={
			'product_id':product_id,
			'num':num
	}
	$.ajax({
            url:'${ctx}/blogic/shoppingcar/addGoodsToCar',
            data:data,
            type:'post',
            dataType:'json',
            success:function(data){
				alert(data.message);
//					window.location="${ctx}/blogic/order/orderCheckOut";
            },error:function (){
            	
            }
        })
}
</script>
</body>
</html>