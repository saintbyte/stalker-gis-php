var BigWindow = new Class({
         Implements: [Events],
         initialize: function(title_str){
                this.period = 10;
                this.startSize = 100;
                this.step      = 20;
                var curTop = $(window).getScroll();
                var curSize =$(window).getScrollSize();
                var curVisSize =$(window).getSize();
                var that = this;
                var borderSize = 1;
                this.destLeft = 0;
                var in_obj_padd = 8;
                var in_obj_marg = 5;
                var title_height = 25;
                this.CurLeft = (curSize.x-this.startSize - (borderSize*2));

                this.maindiv = new Element('div',{
                                        html : '',
                                        id   : 'bw_maindiv',
                                        styles : {
                                                    'position':'absolute',
                                                    'z-index':'100',
                                                    'border':'0px solid black ',
                                                    'top': curTop.y+'px',
                                                    'left':'0px',
                                                    'width':  '100%',
                                                    'height':  curVisSize.y +'px',
                                                    'background-color':'transparent',
                                                    'overflow': 'hidden'
                                        }
                }) ;
                this.maindiv.inject(document.body);



                this.div = new Element('div',{
                                        html : '',
                                        styles : {
                                                    'position':'relative',
                                                    'z-index':'50',
                                                    'border':'1px solid',
                                                    'top': '0px',
                                                    'left':this.CurLeft+'px',
                                                    'width': (curVisSize.x - (borderSize*2))+'px',
                                                    'height':  (curVisSize.y - (borderSize*2))+'px',
                                                    'background-color':'white',
                                        }
                }).inject(this.maindiv);
                var title = new Element('div',{
                                        html  : '',
                                        styles: {
                                                  'width': (curVisSize.x - (borderSize*2))+'px',
                                                 'heigth': title_height+'px',
                                                 'padding': in_obj_padd+'px',
                                                 'margin': in_obj_marg +'px',
                                                 'top': '0px',
                                                 'left':'0px',
                                                 'border-bottom':borderSize+'px dotted #C0C0C0'
                                                 
                                                 
                                                }
                }).inject(this.div);
                var clse_bbb = new Element('div',{
                                                html: '&lt;&lt; Назад к картам',
                                                events: {
                                                'click': this.close
                                                },
                                                styles: {
                                                     'width':'150',
                                                     'float':'left',
                                                     'padding-right': '30px',
                                                     'cursor': 'pointer'
                                                 }
                                                 }).inject(title);
                this.contentDiv = new Element('div',{
                                                html: '',
                                                styles: {
                                                     'position':'relative',
                                                     'width': (curVisSize.x - ((borderSize*2)+(in_obj_padd*2)+(in_obj_marg*2)))+'px',
                                                     'height': (curVisSize.y - ((borderSize*4)+(in_obj_padd*4)+(in_obj_marg*4)+title_height))+'px',
                                                     'float':'left',
                                                     'padding': '0px',
                                                     'margin': in_obj_marg +'px',
                                                     'border': 'none'
                                                 }
                                                 })
                this.contentDiv.inject(this.div);
                                                 
                new Element('<span>',{ html:title_str,styles:{'font-size':'20px',}}).inject(title,'bottom');


         },
         start: function()
         {
          this.fireEvent('move_start');
          this.timer = this.work.periodical(this.period, this);
         },
         //----------------------------------------------------------------
         work: function(){
             this.CurLeft = this.CurLeft-this.step;

             if (this.CurLeft <= this.destLeft) {
                this.CurLeft = this.destLeft;
                clearInterval(this.timer);
                this.fireEvent('move_complete');
             }
             this.div.setStyle('left',this.CurLeft+'px');
             
         },
         //----------------------------------------------------------------
         loadIframe: function(uri)
         {
             var curVisSize =$(window).getSize();
             var ss = {  'border': 'none',    'width': '100%',   'height': '100%' } ;
             var loadDiv = new Element('div',{html:'<table style=""><tr><td valign="center" align="center"><img src="/i/ajax-loader.gif"></td></tr></table>',styles: ss});
             var iframe= new Element('iframe',{
                                                src: uri,
                                                border: '1' ,
                                                events: {
                                                       load : function() { loadDiv.dispose(); }
                                                       },
                                                styles: ss
             } );
             iframe.inject(this.contentDiv);
         },
         //----------------------------------------------------------------
         close: function()
         {
                 this.fireEvent('close');
                 $('bw_maindiv').dispose();
         }
         
});
