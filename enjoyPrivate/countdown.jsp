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
<script src="js/jquery-1.11.3.min.js"></script> 
</head>
<body class="reset-box-sizing">
<!-- 黄总关注以下字段 -->
<input type="hidden" value="${order_type}" name="order_type" id="order_type">
<div class="warp">
  <div class="header" id="header"> <%@include file="header.jsp"%></div>
  <div class="container">
    <div class="userinfo-title userinfo-coun-title">
      <div class="ltxt pull-left">倒计时</div>
      <ul class="count-list" style="width: auto;">
      	<li class="pull-left"><a href="javascript:" class="type">按分类<img src="images/count-tips.png" alt=""></a><div class="lshow">
	      		<a href="countdown.html?cat_id=0">全部分类</a>
      		<c:forEach items="${cats}" var="cat">
	      		<a href="countdown.html?cat_id=${cat.id}">${cat.name}</a>
      		</c:forEach>
      	<!-- <a class="cur" href="javascript:">商品类别</a><a href="javascript:">商品类别</a> --></div></li>
        <li class="pull-left"><a href="javascript:" class="type">按销量<img src="images/count-tips.png" alt=""></a>
	        <div class="lshow">
		        <a href="countdown.html?buyCountOrder=desc">销量从高到低 </a>
		        <a href="countdown.html?buyCountOrder=asc">销量从低到高</a>
	        </div>
        </li>
        <li class="pull-left"><a href="javascript:" class="type">按价格<img src="images/count-tips.png" alt=""></a>
	        <div class="lshow">
		        <a href="countdown.html?price=desc">价格从高到低</a>
		        <a href="countdown.html?price=asc">价格从低到高</a>
	        </div>
        </li>
      </ul>
      <div class="clear"></div>
      </div>
  </div>
  <div class="container">
  	<c:forEach items="${big_product}" var="product">
	  	<div class="countdown">
	      	<a href="countdown-details.html?id=${product.id}">
<!-- 	      	<img src="images/countdown-pic.jpg" alt=""> -->
	      	<img src="${ctx}/${product.image}" alt="">
	      	</a>
	        <ul class="cdownlist">
	        	<li class="w26" style="width:30%;">
	        		<h3>${product.name}</h3>
	        		<div class="bbtn">
	        			<c:if test="${product.store==0 }" >
	        				<a href="javascript:;" style="background-color:#cccccc;color:#fff; "   >已售罄</a>
	        			</c:if>
	        			<c:if test="${product.store>0 }">
		        			<a href="javascript:;" class="buynow" btntype = "buynow"  productid="${product.id}" >立即购买</a>
	        			</c:if>
	        			<a href="javascript:;"  productid="${product.id}" btntype="addlove" class="addLove">心水</a>
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
	          </li>
	          <li style="width:215px;"><h3>全年最低价格</h3><h2>${product.old_price} 元</h2></li>
	          <li><h3>购买人数</h3><h2>${product.buyCount} 人</h2></li>
	        </ul>
	  	</div>
  	</c:forEach>
  <!--   <div class="countdown">
      	<a href="javascript:"><img src="images/countdown-pic.jpg" alt=""></a>
        <ul class="cdownlist">
        	<li class="w26"><h3>倒计时的商品名称</h3><div class="bbtn"><a href="javascript:">立即购买</a><a href="javascript:">心水</a></div></li>
          <li><h3>倒计时剩余时间</h3><h2>13天12小时</h2></li>
          <li><h3>私享倒计时价</h3><h2>986.00 元</h2></li>
          <li><h3>商品原价</h3><h2>1386.00 元</h2></li>
          <li><h3>购买人数</h3><h2>15,979 人</h2></li>
        </ul>
  	</div>
    <div class="countdown">
      	<a href="javascript:"><img src="images/countdown-pic.jpg" alt=""></a>
        <ul class="cdownlist">
        	<li class="w26"><h3>倒计时的商品名称</h3><div class="bbtn"><a href="javascript:">立即购买</a><a href="javascript:">心水</a></div></li>
          <li><h3>倒计时剩余时间</h3><h2>13天12小时</h2></li>
          <li><h3>私享倒计时价</h3><h2>986.00 元</h2></li>
          <li><h3>商品原价</h3><h2>1386.00 元</h2></li>
          <li><h3>购买人数</h3><h2>15,979 人</h2></li>
        </ul>
  	</div> -->
  </div> 
   <div class="container">
   	<ul class="cdownmlist">
   	 	<c:forEach items="${small_product}" var="product">
	   	  <li>
	      	<a href="countdown-details.html?id=${product.id}">
	      	<img src="${ctx}/${empty product.cover_image?product.image:product.cover_image}" alt="">
<!-- 	      	<img src="images/cdownmlistp01.jpg" alt=""> -->
	      	</a>
	        <h3><a href="javascript:">${product.name }</a></h3>
	        <h4>私享价：<em>${product.price }</em>元</h4>
	        <h4>购买人数：<em>${product.buyCount }</em>人</h4>
	        <h4>到期时间：<em>${product.end_time}</em></h4>
	      </li>
   	 	</c:forEach>
   	</ul>
    <div class="user-list-m"><a href="javascript:" page="1">加载更多</a></div>
   </div>
  <div id="footer"><%@include file="footer.jsp"%></div>
</div>

<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/common.js"></script> 
<script src="js/bootstrap.min.js"></script>  
    <script>

    $(function(){
	    toMenu(1);
	
	    $(".count-list .pull-left").each(function (index){
	    var that=$(this);
	    $(this).find("a.type").click(function(){
	    $(that).siblings().find(".lshow").hide();
	    var obj=$(that).find(".lshow");
	    if(obj.is(":visible"))
	    {
	    $(that).find(".lshow").hide();
	    }
	    else
	    {
	    $(that).find(".lshow").show();
	    }
	    });
	    });
	
	    $(".lshow").find("a").click(function(){
	    $(this).parent().hide();
	    });
	
	    //加载更多
	    $(".user-list-m a").click(function(){
	    	var that=$(this);
		    var page_num=parseInt($(this).attr("page") )+1;
		    var page_size=5;
		    var order_type=$("#order_type").val();
		    var postData={
			    "pageNum":page_num,
			    "pageSize":page_size,
			    "orderType":order_type
		    } ;
		    doAjax("blogic/product/moreProduct",postData,function(data){
			    if (data.status == 1) {
				    var products = data.data.products;
				    var count=products.length;
				    if(count==0) {
				    	$(".user-list-m a").html("没有更多数据");
				    	$(".user-list-m a").unbind("click");
				   	 return;
				    } else{
					    var obj=$(".cdownmlist");
					    for (var i = 0; i < products.length; i++) {
						    var image = products[i].cover_image==''||products[i].image==null?products[i].image:products[i].cover_image;
						    var appendData=' <li>'+
						      '	<a href="countdown-details.html?id='+products[i].id+'"><img src="'+image+'" alt=""></a>'+
						      '<h3><a href="javascript:">'+products[i].name+'</a></h3>'+
						      ' <h4>私享价：<em>'+products[i].price+'</em>元</h4>'+
						      ' <h4>购买人数：<em>'+products[i].buyCount+'</em>人</h4>'+
						      ' <h4>倒计时：<em>'+products[i].end_time+'</em></h4>'+
						      ' </li>';
						    obj.append(appendData);
					    }
					    that.attr("page",data.data.pageNum);
				    }
			    } else if(data.status == 0) {
			    	alertInfo(data.message,true);
			    }
		    },function(data,status){
		   	 	alertError("服务器异常",true);
		    });
	    });
// 	    nowBuyBtn();
		$('.buynow').each(function(){
			$(this).unbind('click').click(function(){
				var productid = $(this).attr('productid');
				addToShoppingCar(productid);
			});
		});
		// 加入购物车
		$('.addCar').each(function(){
			$(this).unbind('click').click(function(){
				var productid = $(this).attr('productid');
				addCarFn(productid);
			});
		});
		$('.addLove').each(function(){
			$(this).unbind('click').click(function(){
				var productid = $(this).attr('productid');
				addloveFunc(productid);
			});
		});
    });

//     function nowBuyBtn(){
//     	$('.bbtn').find('a').each(function(){
//     		alert('in a ');
// 		    $(this).unbind('click').click(function(){
// 		    	var productid = $(this).attr('productid');
// 		    	var btntype = $(this).attr('btntype');
// 	    		if(btntype == 'buynow'){
// 			    	addToShoppingCar(productid);
// 	    		}else if(btntype == 'addlove'){
// 	    			addloveFunc(productid);
// 	    		}
// 		    });		
//     	});
//     }
    
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
// 					alert(data.message);
					window.location="${ctx}/blogic/order/orderCheckOut";
	            },error:function(request){
	            	
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
// 					window.location="${ctx}/blogic/order/orderCheckOut";
	            },error:function (){
	            	
	            }
	        })
    }
    </script>
</body>
</html>