H=function(){this.div=null;this.width=500;this.height=100};H.prototype={getLocation:function(){var b=$(window);var a=b.getScroll().y+b.getSize().y-(this.height+40);var c=(b.getSize().x/2)-(this.width/2);return new Array(a,c)},update:function(){},show:function(){var a=this.getLocation();this.div.setStyle("top",a[0]+"px");this.div.setStyle("left",a[1]+"px");this.div.setStyle("display","block")},hide:function(){this.div.setStyle("display","none")},setHtml:function(a){this.div.innerHTML=a},render:function(){var b=this.getLocation();var a="text";this.div=new Element("div",{id:"help_win",html:a,styles:{top:b[0]+"px",left:b[1]+"px",display:"none","z-index":"10",width:this.width+"px",height:this.height+"px"}}).inject(document.body)}};