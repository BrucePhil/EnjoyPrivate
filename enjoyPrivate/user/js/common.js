function doAjax(url,data,callbackSuccess,callbackError)	{
	$.ajax({
        url:url,
        data:data,
        type:'post',
        dataType:'json',
        success:callbackSuccess,
        error:callbackError
    });
}
//成功提示信息
function alertSuccess(msg,autoClose,fn){
    myAlert("success",msg,autoClose,fn);
}
//提示类提示信息
function alertInfo(msg,autoClose,fn)
{
    myAlert("notice",msg,autoClose,fn);
}
//警告提示信息
function alertWarn(msg,autoClose,fn)
{
    myAlert("warning",msg,autoClose,fn);
}
//错误提示信息
function alertError(msg,autoClose,fn)
{
    myAlert("error",msg,autoClose,fn);
}

function myAlert(type,msg,autoClose,fn){
    var   html='<div class="fifter"><div class="box"><img class="p" src="images/'+type+'.png" alt="">'+msg+'<img src="images/close.gif" alt="" class="close"></div></div>';
    if(autoClose==true)
    {
        setTimeout(function (){
            $(".fifter").remove();
        },4000);
    }
    if(typeof(eval(fn)) == "function")
    {
        fn();
    }
    $("body").append(html);
    $(".fifter .close").click(function (){
        $(".fifter").remove();
    });
}

//加入自定义验证器
jQuery.validator.addMethod("length", function(value, element, param) {
    var length = value.length;
  return length==param;   
}, $.validator.format("长度为{0}位"));

//注册回车事件
function registEnter(fn)
{
	document.onkeydown = function(e){ 
	    var ev = document.all ? window.event : e;
	    if(ev.keyCode==13) {
	        fn();//处理事件
	     }
	};
}



$(function (){
    /*$.ajaxSetup({
        statusCode: {
            404: function() {
                console.log('page not found');
            }
        }
    });*/
	//加载头部和尾部
	/*$("#header").load("header.html",function (){
	});*/
	  /*  $("#footer").load("footer.html",function (){
	    });*/
	});

