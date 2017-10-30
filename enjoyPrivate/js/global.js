// JavaScript Document

//购物车弹层

$(function(){
	$(".sh-address span a.xz-add").click(function(){
		$(".sh-fifter").show();
		$(".buy-fifterin-s").hide();
	})
	$(".buy-fifterin a.go-back,.buy-fifterin a.close-btn").click(function(){
		$(".sh-fifter").hide();
		$(".buy-fifterin-s").show();
	})	
})