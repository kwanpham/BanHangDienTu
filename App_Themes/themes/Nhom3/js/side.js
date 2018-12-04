<!--
var pic_width=600;
var pic_height=225;
var button_pos=0;
var stop_time=5000;
var show_text=1;
var txtcolor="fff";
var bgcolor="fff";
var imag=new Array();
var link=new Array();
var text=new Array();


imag[1] = "hot/a.jpg";
link[1] = "";
text[1] = "";

imag[2] = "hot/b.jpg";
link[2] = "";
text[2] = "";

imag[3] = "hot/c.jpg";
link[3] = "";
text[3] = "";

var swf_height=show_text==1?pic_height+0:pic_height;
var pics="", links="", texts="";
for(var i=1; i<imag.length; i++){
pics=pics+("|"+imag[i]);
links=links+("|"+link[i]);
texts=texts+("|"+text[i]);
}
pics=pics.substring(1);
links=links.substring(1);
texts=texts.substring(1);

document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ pic_width +'" height="'+ swf_height +'" style="margin: 0px 0px 0px 0px;align:center;">');
document.write('<param name="movie" value="Js/slide.swf">');
document.write('<param name="quality" value="high">');
document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&pic_width='+pic_width+'&pic_height='+pic_height+'&show_text='+show_text+'&txtcolor='+txtcolor+'&bgcolor='+bgcolor+'&button_pos='+button_pos+'&stop_time='+stop_time+'">');
document.write('<embed style="margin: 0px 0px 0px 0px;align:center;" src="Js/slide.swf" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&pic_width='+pic_width+'&pic_height='+pic_height+'&show_text='+show_text+'&txtcolor='+txtcolor+'&bgcolor='+bgcolor+'&button_pos='+button_pos+'&stop_time='+stop_time+'" quality="high" width="'+ pic_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer">');
document.write('</object>');
//-->