ZoomControl=function(a){
    this.map=a;
    this.Levels=18;
    this.curLevel=10
};
ZoomControl.prototype={
    In:function()
    {
        var a=map.getZoom();
        a++;
        map.setZoom(a)
    },
    Out:function(){
        var a=map.getZoom();
        if(a!=1)
        {
            a--;
            map.setZoom(a)
        }
    },
    render:function(a)
    {
        new Element("div",{id:"zoomplus","class":"zoombutt",html:"+",events:{click:this.In}}).inject(a);
        new Element("div",{id:"zoomminus","class":"zoombutt",html:"-",events:{click:this.Out}}).inject(a)
    },
    setZoomLevel:function(a)
    {
        this.curLevel=a;this.render()
    }
};