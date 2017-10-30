/**
 * Created by Nelin on 14-8-5.
 */

/**
 * Created by Nelin on 14-2-27.
 */
/**
 * 跳转
 *
 * @param 跳转的页号
 */
function jumpPage(pageNo) {
    $("#pageNo").val(pageNo);
    $("#listForm").submit();
}

function sort(fieldName) {
    if ($("#orderName").val() == fieldName) {
        if ($("#ascDesc").val() == "") {
            $("#ascDesc").val("ASC");
        } else if ($("#ascDesc").val() == "DESC") {
            $("#ascDesc").val("ASC");
        } else if ($("#ascDesc").val() == "ASC") {
            $("#ascDesc").val("DESC");
        }
    } else {
        $("#orderName").val(fieldName);
        $("#ascDesc").val("ASC");
    }

    $("#listForm").submit();
}

function search() {
    $("#pageNo").val(1);
    $("#listForm").submit();
}


function doDelete(url) {
    if (confirm("确定执行该操作？")) {
        location.href = url;
    }
}

var _S4 = function () {
    return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
}

var _genUUID = function () {
    return (_S4() + _S4() + "-" + _S4() + "-" + _S4() + "-" + _S4() + "-" + _S4() + _S4() + _S4());
    // return (S4() + S4() + S4() + S4() + S4() + S4() + S4() + S4());
}

window.genUUID = _genUUID;

// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1,                 //月份
        "d+": this.getDate(),                    //日
        "h+": this.getHours(),                   //小时
        "m+": this.getMinutes(),                 //分
        "s+": this.getSeconds(),                 //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds()             //毫秒
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}


$(function () {
    $("iframe").load(function () {
        var loginPage = $(this).contents().find("body#LOGIN_PAGE");
        if (loginPage.length == 1) {
            window.location.href = window.BasePath + "/login.html";
        }
    });

    $("a[delete]").click(function () {
        return confirm("确定执行该操作？");
    });
});


//移除数组中的元素
var BaseUtil = {
    removeItem: function (array, dx) {
        if (isNaN(dx) || dx > array.length) {
            return false;
        }
        delete array[dx];
        for (var i = 0, n = 0; i < array.length; i++) {
            if (array[i] != array[dx]) {
                array[n++] = array[i];
            }
        }
        array.length -= 1;
    }
}