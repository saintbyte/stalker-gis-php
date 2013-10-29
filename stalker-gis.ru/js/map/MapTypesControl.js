MapTypesControl=function(a){};
MapTypesControl_setDefStyles=function()
{
    if($("maptypenormal").hasClass("mapTypeActive")){
        $("maptypenormal").removeClass("mapTypeActive")
    }
    if($("maptypesatellite").hasClass("mapTypeActive")){
        $("maptypesatellite").removeClass("mapTypeActive")
    }
    if($("maptypehybrid").hasClass("mapTypeActive"))
    {
        $("maptypehybrid").removeClass("mapTypeActive")
    }
    if($("maptypephysical").hasClass("mapTypeActive"))
    {
        $("maptypephysical").removeClass("mapTypeActive")
    }
    if($("maptypeosm").hasClass("mapTypeActive")){
        $("maptypeosm").removeClass("mapTypeActive")
    }
    if($("maptypetopo2k_ural").hasClass("mapTypeActive")){
        $("maptypetopo2k_ural").removeClass("mapTypeActive")
    }
    if($("maptypetopo2k_ghs").hasClass("mapTypeActive")){
        $("maptypetopo2k_ghs").removeClass("mapTypeActive")
    }
    //if($("maptypetopo2k_mr").hasClass("mapTypeActive")){
    //    $("maptypetopo2k_mr").removeClass("mapTypeActive")
    //}
    return true
};
MapTypesControl.prototype=
    {
    getTypesList:function(){},
    setByIntId:function(a)
    {
        switch(a)
        {
            case"1":this.setNormalMap();break;
            case"2":this.setSatelliteMap();break;
            case"3":this.setHybrigMap();break;
            case"4":this.setPhysicalMap();break;
            case"5":this.setOsmMap(); break;
            case"6":this.setTopo2k_uralMap(); break;
            case"7":this.setTopo2k_ghsMap(); break;
            case"8":this.setTopo2k_mrMap(); break;
            default:this.setHybrigMap()
        }
    },
    setByStrId:function(a)
    {
        switch(a){
            case"roadmap":this.setNormalMap();break;
            case"satellite":this.setSatelliteMap();break;
            case"hybrid":this.setHybrigMap();break;
            case"terrain":this.setPhysicalMap();break;
            case"osm":this.setOsmMap();break;
            case"topo2k_ural":this.setTopo2k_uralMap();break;
            case"topo2k_ghs":this.setTopo2k_ghsMap();break;
            case"topo2k_mr":this.setTopo2k_mrMap();break;
            default:this.setHybrigMap()
            }
    },
    setMapType:function(a){
        alert(a);return false
    },
    setNormalMap:function()
    {
        map.setMapTypeId(google.maps.MapTypeId.ROADMAP);
        MapTypesControl_setDefStyles();
        $("maptypenormal").addClass("mapTypeActive");
        return false
    },
    setSatelliteMap:function()
    {
        map.setMapTypeId(google.maps.MapTypeId.SATELLITE);
        MapTypesControl_setDefStyles();
        $("maptypesatellite").addClass("mapTypeActive");
        return false
    },
    setHybrigMap:function()
    {
        map.setMapTypeId(google.maps.MapTypeId.HYBRID);
        MapTypesControl_setDefStyles();
        $("maptypehybrid").addClass("mapTypeActive");
        return false
    },
    setPhysicalMap:function()
    {
        map.setMapTypeId(google.maps.MapTypeId.TERRAIN);
        MapTypesControl_setDefStyles();
        $("maptypephysical").addClass("mapTypeActive");
        return false
    },
    setOsmMap:function()
    {
        map.setMapTypeId("osm");
        MapTypesControl_setDefStyles();
        $("maptypeosm").addClass("mapTypeActive");
        return false
    },
    setTopo2k_uralMap:function()
    {
        map.setMapTypeId("topo2k_ural");
        MapTypesControl_setDefStyles();
        $("maptypetopo2k_ural").addClass("mapTypeActive");
        return false
    },
     setTopo2k_ghsMap:function()
    {
        map.setMapTypeId("topo2k_ghs");
        MapTypesControl_setDefStyles();
        $("maptypetopo2k_ghs").addClass("mapTypeActive");
        return false
    },
    setTopo2k_mrMap:function()
    {
        map.setMapTypeId("topo2k_mr");
        MapTypesControl_setDefStyles();
        $("maptypetopo2k_mr").addClass("mapTypeActive");
        return false
    },
    render:function(a)
    {
        new Element("a",{id:"maptypenormal",href:"#","class":"mapTypeButt",html:"Карта",events:{click:this.setNormalMap}}).inject(a);
        new Element("a",{id:"maptypesatellite",href:"#","class":"mapTypeButt",html:"Спутник",events:{click:this.setSatelliteMap}}).inject(a);
        new Element("a",{id:"maptypehybrid",href:"#","class":"mapTypeButt",html:"Гибрид",events:{click:this.setHybrigMap}}).inject(a);
        new Element("a",{id:"maptypephysical",href:"#","class":"mapTypeButt",html:"Рельеф",events:{click:this.setPhysicalMap}}).inject(a);
        new Element("a",{id:"maptypeosm",href:"#","class":"mapTypeButt",html:"OpenStreetMap",events:{click:this.setOsmMap}}).inject(a)
        new Element("a",{id:"maptypetopo2k_ural",href:"#","class":"mapTypeButt",html:"Топо(2 км Урал)",events:{click:this.setTopo2k_uralMap}}).inject(a)
        new Element("a",{id:"maptypetopo2k_ghs",href:"#","class":"mapTypeButt",html:"ГенШТопо(2 км Урал)",events:{click:this.setTopo2k_ghsMap}}).inject(a)
        //new Element("a",{id:"maptypetopo2k_mr",href:"#","class":"mapTypeButt",html:"Топо(все)",events:{click:this.setTopo2k_mrMap}}).inject(a)
    }
};
