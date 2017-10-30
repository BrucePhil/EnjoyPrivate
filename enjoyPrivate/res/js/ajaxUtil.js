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