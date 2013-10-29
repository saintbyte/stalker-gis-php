var WaitWindow = new Class({
   Implements: [],
         initialize: function(str){
                    var bb = document.body;
                    var str1 = str;
                    var a=new Element("div",{id:"darkbox","class":"opacity50"}).inject(bb);
                    var size = bb.getSize();
                    var wait_div_width = 200;
                    var wait_div_height = 26;
                    var body_width  = size.x;
                    var body_height = size.y;
                    var wait_top = (body_height/2) - (wait_div_height /2 );
                    var wait_left = (body_width/2) - (wait_div_width /2 );
                    a.setStyles({height:$(window).getScrollSize().y+"px"});
                    var c ='<div class="wait_img"> </div><span>'+str1+'</span>';
                    var f=new Element("div",{'id':"waitw",
                                             'class':"wait",
                                             html:c,
                                             styles:{
                                                top:wait_top+"px",
                                                left:wait_left +"px",
                                                width:wait_div_width+"px",
                                                height:wait_div_height+"px"}}).inject(bb);

         }
});
