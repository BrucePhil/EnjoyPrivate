<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/jsp/common/taglibs.jsp" %>
<input type="hidden" value="${commenttype}" id="commenttype">
<script type="text/javascript">
		function commentArticle(){
			var comment = $("#comment").val();
			if(comment == ''){
				alertInfo('评论内容不能为空');
			}else{
				var postData = {
					"type_id" : $('#commenttype').val(),
					"comment" : comment,
					"comment_oid" : $('#entityid').val()
				};
				var url = "${ctx}/blogic/comment/saveComment";
				doAjax(url, postData,
				function(data){
					if(data.status == 1) {
						alertSuccess(data.message);
						$("#comment").val('');
						$('.comment-list').empty();
						loadMore('${pageNo}');
					}else if(data.status == 0) {
						confirm(data.message,window.location.href="/enjoyPrivate/login.jsp");
	    	        }
				},
				function(data,status){
	    	        alertError("服务器异常");
	    	    });
			}
		}	
		
		
		
		function loadMore(pageNo){
			var url = '${ctx}/blogic/star/queryMore';
			var oid = $('#entityid').val();
			var postData = {
				"oid" : oid,
				"typeid" : $('#commenttype').val(),
				"pageNo" : pageNo
			};
			doAjax(url, postData,
			function(data){
				if(data.status == 1) {
					var msg = '';
					var total = data.total;
					var json = eval(data.data);
					for(var i = 0; i < json.length; i++){
						msg += "<li><h4>" + (total - i) + "楼 &nbsp;&nbsp;"
						+ "<em><a href=\"${ctx}/userinfo.html?memberid="+json[i].member_id+"\">"
						+"<img src=\"${ctx}/"+json[i].lv+"\" alt=\"\" style=\"position: absolute;border:none;:auto;margin-left: 35px;z-index:2;margin-top: 23px;    width: 30px;height: 30px;\">"
						+"<img src=\"${ctx}/"+json[i].face+"\" alt=\"\" style=\"position: relative;margin-left: 5px;border:none;margin-top: 0px;width: 50px;height: 50px;box-sizing: border-box;border-radius: 50%;padding: 4px;\">"
						+ "<span style=\"margin-left:10px;\">"+json[i].nickName + "</span></a></em>" + json[i].insert_time
						+ "</h4><p>" + json[i].comment + "</p>";
						for (var j = 0; j < json[i].replays.length; j++) {
							msg = msg +"<h4><em><a href=\"${ctx}/userinfo.html?memberid="+json[i].replays[j].member_id+"\">"
							+"<img src=\"${ctx}/"+json[i].replays[j].lv+"\" alt=\"\" style=\"position: absolute;border:none;:auto;margin-left: 35px;z-index:2;margin-top: 23px;    width: 30px;height: 30px;\">"
							+"<img src=\"${ctx}/"+json[i].replays[j].face+"\" alt=\"\" style=\"position: relative;margin-left: 5px;border:none;margin-top: 0px;width: 50px;height: 50px;box-sizing: border-box;border-radius: 50%;padding: 4px;\">"
							+ "<span style=\"margin-left:10px;\">"+json[i].replays[j].nickName
							+"</span></a></em>回复 &nbsp;&nbsp;<em><a href=\"${ctx}/userinfo.html?memberid="
									+json[i].member_id+"\">"
									+"<img src=\"${ctx}/"+json[i].lv+"\" alt=\"\" style=\"position: absolute;border:none;:auto;margin-left: 35px;z-index:2;margin-top: 23px;    width: 30px;height: 30px;\">"
									+"<img src=\"${ctx}/"+json[i].face+"\" alt=\"\" style=\"position: relative;margin-left: 5px;border:none;margin-top: 0px;width: 50px;height: 50px;box-sizing: border-box;border-radius: 50%;padding: 4px;\">"
									+ "<span style=\"margin-left:10px;\">"+json[i].nickName +"</a></em>"+json[i].replays[j].insert_time+"</h4> <p>" + json[i].replays[j].comment + "</p>";
						}
						msg = msg +'<h5><a href="javascript:void(0)" onclick="$(\'#reply_'+json[i].id+'\').show();">回复</a></h5>';
						msg = msg +'<div class="comment-info" id="reply_'+json[i].id+'" style="display: none;border: 0;">';
						msg = msg +'<div class="textarea">';
						msg = msg +'<textarea id="reply_'+json[i].id+'_content"></textarea>';
						msg = msg +'</div>';
						msg = msg +'<input type="button" value="确定" class="summit" onclick="reply('+json[i].id+');">';
						msg = msg +'</div>';
					}
					$('.comment-list').empty();
					$('.comment-list').html(msg);
					if(total == json.length){
						$('.user-list-m').html('没有更多数据');
					}
				}else if(data.status == 0) {
    	            alertInfo(data.message);
    	        }
			},
			function(data,status){
    	        alertError("服务器异常");
    	    });
		}
		
		function reply(id){
			var comment = $("#reply_"+id+"_content").val();
			if(comment == ''){
				alertInfo('回复内容不能为空');
			}else{
				var postData = {
					"type_id" : '1',
					"comment" : comment,
					"comment_pid" : id
				};
				var url = "${ctx}/blogic/comment/saveReply";
				doAjax(url, postData,
				function(data){
					if(data.status == 1) {
						alertSuccess(data.message);
						$("#reply_"+id+"_content").val('');
						$('#reply_'+id).hide();
						$('.comment-list').empty();
						loadMore('${pageNo}');
					}else if(data.status == 0) {
						confirm(data.message,window.location.href="/enjoyPrivate/login.jsp");
	    	        }
				},
				function(data,status){
	    	        alertError("服务器异常");
	    	    });
			}
		}
	</script>
<div class="container footer">
    <dl class="list l25 pull-left">
        <dt><em>版权信息</em>Copyright</dt>
        <dd>网站所有版权归圈叉网网络信息平台所有<br />新ICP备 05017822号<br />©2013-2014</dd>
    </dl>
    <dl class="list l38 pull-left">
        <dt><em>联系我们</em>Contact Us</dt>
        <dd>服务热线 010-59788888<br />
            官网网址 www.ooxx.com<br />
            电子邮箱 ooxx@ooxx.com(投稿)；ooxx@hotmail.com（商业合作）
        </dd>
    </dl>
    <dl class="list lw200 pull-right">
        <dt><em>网站地图</em>SiteMap</dt>
        <dd><a href="${ctx}">网站首页</a><a href="${ctx}/contact.html">联系我们</a><a href="${ctx}/suggestion.html">投诉建议</a><a href="javascript:">网站地图</a><a href="${ctx}/cooperation.html">商业合作</a><a href="${ctx}/ad.html">广告投放</a><a href="${ctx}/law.html">法律隐私</a><a href="${ctx}/about-us.html">关于我们</a>
        </dd>
    </dl>
</div>
<div class="copyright container">
    <span class="pull-left">2014-2015&copy;  PRESERVE. All rights reserved.</span>
    <span class="pull-right">&copy; 所有版权归圈叉网所有</span>
</div>