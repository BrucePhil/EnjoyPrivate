
var projectName="enjoyPrivate";
/** 新加提示弹窗 **/
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
	
	if(autoClose==undefined || autoClose==null) autoClose=false 
	
	//这里图片地址要改
    var   html='<div class="fifter"><div class="box"><img class="p" src="/'+projectName+'/images/'+type+'.png" alt="">'+msg+'<img src="/'+projectName+'/images/close.gif" alt="" class="close"></div></div>';
    if(autoClose==true)
    {
        setTimeout(function (){
            $(".fifter").remove();
            if(typeof(eval(fn)) == "function")
            {
                fn();
            }
        },1500);
    }
   
    $("body").append(html);
    $(".fifter .close").click(function (){
        $(".fifter").remove();
        if(typeof(eval(fn)) == "function")
        {
            fn();
        }
    });
}