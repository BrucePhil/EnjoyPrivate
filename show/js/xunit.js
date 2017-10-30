// 根据生日的月份和日期，计算星座
function getAstro(m,d){    
    return m-(d<"102223444433".charAt(m-1)- -19);   //输出0～12的数字，0表示摩羯，1表示水瓶，依此类推，...，11是射手
}
function getAstroText(index){    
  var arr=["魔蝎座","水平座","双鱼座","白羊座","金牛座","双子座","巨蟹座","狮子座","处女座","天秤座","天蝎座","射手座"];
  return arr[index];
}