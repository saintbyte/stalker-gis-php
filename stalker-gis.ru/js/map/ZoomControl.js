 var Zoom =  new Class({
         Implements: [Events],
         zoomLevelElems:[],
         // Map  - Google Map Obj  ; Div - Where we render zoom control
         initialize: function(map,div){
                this.map  = map;
                this.div   = $(div);
                this.magic_b = 2;
                this.maxZoom = 20;
                this.minZoom = 1;
                this.curZoom = 0;

          },
         drawZoom: function (oldZoom,newZoom) {
                       var oldZoomel = $('zoomlevel'+oldZoom);
                       if ((typeOf(oldZoomel) != 'undefined' )) {
                                if (oldZoomel.hasClass("zoomActive")) {
                                        oldZoomel.removeClass("zoomActive");
                                }
                       }
                       $('zoomlevel'+newZoom).addClass("zoomActive");
         },

         render: function() {
                var mWidth = this.div.getStyle('width').toInt();
                var mHeight = this.div.getStyle('height').toInt();
                var zoombutt_size = mWidth - this.magic_b;
                var zoom_area_size  = mHeight - (mWidth * 2 )-this.magic_b;
                var self = this;
                new Element("div",{
                        id:"zoomplus",
                        'class':"zoombutt zoomPlus",
                        styles: {
                                top: '0px',
                                left: '0px',
                                width: zoombutt_size+'px',
                                height: zoombutt_size+'px'

                        },
                        events:{
                                click:this.ZoomIn.bind(this)
                               }
                      }).inject(this.div);
                //---------------------------------------------------------------------

                var zoomArea = new Element("div",{
                                id:"zoomArea",
                                'class':"zoomArea",
                                styles: {
                                        top: '0px',
                                        left: '0px',
                                        width: zoombutt_size+'px'},}).inject(this.div);
               //-----------------------------------------------------------------------
               var cnt_of_zoom = this.maxZoom - this.minZoom;
               var item_size   = zoom_area_size / cnt_of_zoom;
               var item_size   = Math.ceil( item_size );
               for(this.i=this.maxZoom; this.i>=this.minZoom; this.i--) {
                        //---------------------------------------------------------------------
                        var self = this;
                        new Element("div",{
                                id:"zoomlevel"+this.i,
                                'class':"zoomLevel",
                                styles: {
                                        top: '0px',
                                        left: '0px',
                                        width: zoombutt_size+'px',
                                        height: item_size+'px'},events: {
                                        click: this.setZoom.bind(this, this.i)},}).inject(zoomArea);
               }
               //---------------------------------------------------------------
                               new Element("div",{
                                id:"zoomminus",
                                'class':"zoombutt zoomMunis",
                                styles: {
                                        top: '0px',
                                        left: '0px',
                                        width: zoombutt_size+'px',
                                        height: zoombutt_size+'px'}, events:{
                                        click:this.ZoomOut.bind(this)}}).inject(this.div);
                                //------------------------------------------
                                this.setupZoom();

         },
                setZoom: function(level) {
                this.drawZoom(this.curZoom,level);
                this.map.setZoom(level);
                this.curZoom = level;
         },
         ZoomIn: function() {
                newZoom =  this.curZoom + 1;
                if (!(newZoom > this.maxZoom)) {
                 this.setZoom(newZoom);
                }

         },
         ZoomOut: function() {
                newZoom =  this.curZoom - 1;
                if (!(newZoom < this.minZoom)) {
                 this.setZoom(newZoom);
                }

         },
         setupZoom: function() {
                this.curZoom = this.map.getZoom();
                this.drawZoom(this.curZoom,this.curZoom);

         },
         onZoomChanged: function() {
                var oldZoom = this.curZoom;
                this.curZoom = this.map.getZoom();
                this.drawZoom(oldZoom,this.curZoom);
         }

});
