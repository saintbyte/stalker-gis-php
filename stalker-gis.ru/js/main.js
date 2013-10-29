var magic_kof=100000000000000;

var map;

var markers=[];

var infoWindow;

var markerManager;

var first_view_marker;

var first_view_marker1,area_line, area_poli, center_dst_view_marker, right_area_view_marker,left_area_view_marker,view_gr;

var all;

var options;

var help_win;

var w;

var openStreet;

var topo2k_ural;

var topo2k_ghs;

//-------------------------------------------------------



function parseUrlParams(){

    var d={};

    var j=Cookie.read("whash");

    if($defined(j)&&(window.location.hash=="")&&(window.location.search=="")) {

        parse_str="#"+j

    }

    else{

        if (window.location.hash=="") {

            parse_str=window.location.search;

        } else {

            parse_str=window.location.hash;

        }

    }

    if(window.location.search)

    {

        d.query=unescape(window.location.search.substring(1))

    }

    if(parse_str)

    {

        hashFragment=unescape(parse_str);

        var f=hashFragment.substring(1).split("&");

        for(var e=0;e<f.length;e++){

            var c=f[e].split("=");

            switch(c[0])

            {



                case"q":d.query=unescape(c[1]);break;



                case"vpcenter": var b=parseLatLng(c[1]);if(b!=null){d.center=b}break;



                case"zoom":var k=parseInt(c[1]);if(!isNaN(k)){d.zoom=k}else{d.zoom=10}break;



                case"lat":var g=c[1];if(!isNaN(g)){d.lat=g}else{d.lat="55.7549390687"}break;



                case"lng":var h=c[1];if(!isNaN(h)){d.lng=h}else{d.lat="37.57381567358"}break;



                case"mt":var a=c[1];if($defined(a)){d.mt=a}else{d.mt=""}break;



                case"country":d.country=unescape(c[1]);break



            }



        }



        return d



    }



    else{return false}



 }//-------------------------------------------------------



 function init() {

       view_gr=40;

       try {

                var b={center:google.maps.LatLng(-34.397,150.644),mapTypeId:google.maps.MapTypeId.ROADMAP,disableDefaultUI:true};

               map=new google.maps.Map(document.getElementById("map"),b);

       } catch (e) {

       if(e instanceof TypeError)

                alert('TypeError');

         else

                alert(e);

       }

       paramz=parseUrlParams();

       if($chk(paramz)){

           map.setCenter(new google.maps.LatLng(paramz.lat,paramz.lng));

           map.setZoom(paramz.zoom)} else {

           map.setCenter(new google.maps.LatLng(56.85141540210788,60.033058166503935));map.setZoom(13)

       }

       infoWindow=new google.maps.InfoWindow();

       var zm = new Zoom(map,'zoom');

       zm.render();

       openStreet=new google.maps.ImageMapType({getTileUrl:function(e,f){var g=e.x%(1<<f);return"http://tile.openstreetmap.org/"+f+"/"+g+"/"+e.y+".png"},tileSize:new google.maps.Size(256,256),isPng:true,maxZoom:18,name:"OSM",alt:"Open Streetmap tiles"});

       map.mapTypes.set("osm",openStreet);



       topo2k_ural=new google.maps.ImageMapType({getTileUrl:function(a,b){return "http://urfotopo.narod.ru/cache/z" + (b+1) + "/"+ Math.floor(a.x/1024) + "/x" + a.x + "/"+ Math.floor(a.y/1024) + "/y" + a.y +  ".jpg"},tileSize:new google.maps.Size(256,256),isPng:false,maxZoom:11,name:"topo2k_ural",alt:"topo2k_ural"});

       map.mapTypes.set("topo2k_ural",topo2k_ural);



       topo2k_ghs=new google.maps.ImageMapType({getTileUrl:function(a,b){return "http://mykurgan1.narod.ru/cache/gsh/2km/z" + (b+1) + "/"+ Math.floor(a.x/1024) + "/x" + a.x + "/"+ Math.floor(a.y/1024) + "/y" + a.y +  ".jpg"},tileSize:new google.maps.Size(256,256),isPng:false,maxZoom:12,name:"topo2k_ghs",alt:"topo2k_ghs"});

       map.mapTypes.set("topo2k_ghs",topo2k_ghs);



       //topo2k_mr = new google.maps.ImageMapType({getTileUrl:function(a,b){ return "http://marshruty.rzd.ru/ml.ashx?x=" + a.x + "&y="+ a.y + "&z="+b+"&i=1&ss=1643300189" },tileSize:new google.maps.Size(256,256),isPng:true,maxZoom:12,minZoom:8,name:"topo2k_mr",alt:"topo2k_mr"});

       //map.mapTypes.set("topo2k_mr",topo2k_mr);

/*

       if (zoom < 8) return "/i/nomapaddzoom.png";

                        if (zoom > 12) return "/i/nomapsubzoom.png";





                        return "http://marshruty.rzd.ru/ml.ashx?x=" + tile.x + "&y=" + tile.y + "&z=" + zoom + "&i=1&ss=" + window.ucg_ss;

*/





       var c=new MapTypesControl(map);



       c.render($("maptypes"));



       if($chk(paramz)){



           c.setByStrId(paramz.mt)



       }else{



           c.setHybrigMap()



       }



       var a=new W();



       help_win=new H;



       help_win.render();



       if(loged){



           init_ui()



       }else{



           init_guest_ui()



       }



       google.maps.event.addListener(map,"idle",view_point_changed)

       google.maps.event.addListener(map, 'zoom_changed',  function() {zm.onZoomChanged()} );

   }



   //-------------------------------------------------------



   function sethashLoc()



   {



       if($defined(map))



       {



           var c=map.getCenter();



           var d=map.getZoom();



           var a=map.getMapTypeId();



           var b=new Hash({lat:c.lat().toFloat(),lng:c.lng().toFloat(),zoom:d,mt:a});



           window.location.hash=b.toQueryString();



           Cookie.write("whash",b.toQueryString(),{duration:10});



           return b



       }



   }



   //---------------------------------------------------------



   function view_point_changed()



   {



       var a=$("view_area");



       if($defined(a)){



           map.getBounds().toString();



           a.innerHTML=map.getBounds().toString()



       }



       new Request.JSON({url:"/mapdata/json-twitter-marks",onSuccess:onmapDataSuccess}).get({bng:map.getBounds().toString(),zoom:map.getZoom()});



       sethashLoc()



   }



   //---------------------------------------------------------



   function show_tag_page(a)



   {



       infoWindow.close();



       var b=new W();



       b.create(""+a,show_loading());



       b.loadpage("/tags/"+a+"")



   }



   //---------------------------------------------------------



   function show_tag_page_by_id(a,c)



   {



       infoWindow.close();



       var b=new W();



       b.create(""+a,show_loading());



       b.loadpage("/tag/"+a+"/id/"+c)



   }



   //---------------------------------------------------------



   function clearLocations()



   {



       infoWindow.close();



       for(var a=0;a<markers.length;a++){



           markers[a].setMap(null)



       }



       markers=[]



   }



   //---------------------------------------------------------



   function createMarker(e,b,d)



   {



       var c="<b>"+b+"</b> <br/><a href=\"javascript:show_tag_page_by_id('"+b+"','"+d+"')\">Подробнее</a>";



       var a=new google.maps.Marker({map:map,position:e,icon:new google.maps.MarkerImage("i/m1.png",new google.maps.Size(32,37),new google.maps.Point(0,0),new google.maps.Point(16,34)),draggable:false,title:b});



       google.maps.event.addListener(a,"click",function(){infoWindow.setContent(c);



           infoWindow.open(map,a)});



           markers.push(a)



       }



   //---------------------------------------------------------



   function show_too_many_markers()



   {



       if(!$defined(first_view_marker)){



           help_win.setHtml("Приблизте поближе чтоб увидеть Хэштаги");



           help_win.show()



       }



   }



   //---------------------------------------------------------



   function hide_too_many_markers()



   {



       if(!$defined(first_view_marker)){



           help_win.hide()



       }



   }



   //---------------------------------------------------------



   function onmapDataSuccess(f,e){



       clearLocations();



       var c=f.result.length;



       var b=markers.length;



       if($defined(f.result.too_many)){



           show_too_many_markers()



       }else{



           hide_too_many_markers();



           var a=f.result;



           for(var d=0;d<c;d++){



               createMarker(new google.maps.LatLng(a[d].lat,a[d].lng),a[d].tag,a[d].id)}



       }



   }



   //---------------------------------------------------------



   function simple_login()



   {



        help_win.hide();



        var a=new W();



        a.create("Войти",show_loading());



        wdiv=a.getContentDiv();



        wdiv.load("/auth/ajaxloginform")



   }



   //---------------------------------------------------------



  function login()



  {



   $('login_result').innerHTML = show_loading();



   var login = $('login').value;



   var password = $('password').value;



   var myJSON = new Request.JSON({url: '/auth/jsonlogin',method: 'post', onSuccess: function(obj) {



                                             if (obj.result=='OK') {



                                                    var w = new W();



                                                    w.close();



                                                    init_ui();



                                             } else {



                                               $('login_result').innerHTML  = obj.result; return false



                                             }} });



   myJSON.send('login='+login+'&password='+password);







  }



   //---------------------------------------------------------



   function make_beta(where_el)



   {



       new Element("div", { html: '<b>iUFO <sup>Beta</sup></b>' , styles:{padding:"5px", float:'left'}}).inject(where_el);



   }



   //---------------------------------------------------------



   function make_top_button(title,to_on_click,to_el)



   {



       var html = '<b class="r3"></b><b class="r1"></b><b class="r1"></b><div class="inner-box">'+title+'</div><b class="r1"></b><b class="r1"></b><b class="r3"></b>';



       new Element("div",{'class':'rounded-box-3 butt_top',html: html ,styles:{padding:"5px",cursor:"hand",pointer:"hand"},events:{click:to_on_click}}).inject(to_el)







   }



   //---------------------------------------------------------



   function make_default_butts(where_el)



   {



      //make_top_button('Фунции 1',function1,where_el);



       //make_top_button('О сайте',about,where_el);



       //make_top_button('Как пользоваться',how,where_el);



       //make_top_button('Контакты',contacts,where_el);



   }



   //---------------------------------------------------------

   function function1()

   {

          var wm = new BigWindow('');

          wm.start();

          wm.loadIframe('/wiki/');

   }

   //---------------------------------------------------------

   function init_ui()



   {



       var a=$("buttons");



       a.empty();



       make_beta(a);



       make_top_button('Добавить',twi_mark,a);

       //make_top_button('Добавить фото', add_foto,a);

       //make_top_button('Клиент Яндекс фоток', yandex_fotki_begin,a);

       make_top_button('Поиск',search,a);

       make_top_button('Фунции 1',function1,a);
       
       make_top_button('KML',kml_store_begin,a);


       make_default_butts(a)



   }



   //---------------------------------------------------------



   function init_guest_ui()



   {



       var a=$("buttons");



       make_beta(a);



       make_top_button('Воити',simple_login,a);



       make_default_butts(a);



   }



   function twi_mark()



   {



       help_win.setHtml('Выберите начальную точку, перетащите на неё маркер затем <br /><a href="javascript:begin_store_twihash()">кликните сюда</a> или если не надо <a href="javascript:cancel_twi_mark()">отмените</a>');



       help_win.show();



       if($defined(first_view_marker)){



           first_view_marker.setMap(map);



           first_view_marker.setPosition(map.getCenter())



        }else{



            first_view_marker=new google.maps.Marker({position:map.getCenter(),map:map,icon:new google.maps.MarkerImage("i/m1.png",new google.maps.Size(32,37),new google.maps.Point(0,0),new google.maps.Point(16,34)),draggable:true,title:"Set TwiHashPlace"})



        }



    }



    //--------------------------------------------------------



    function cancel_twi_mark()



    {



        first_view_marker.setMap(null);



        delete first_view_marker;



        help_win.hide()



    }



    //--------------------------------------------------------



    function begin_store_twihash()



    {



        help_win.hide();



        var a=new W();



        a.create("Сохранить",show_loading());



        wdiv=a.getContentDiv();



        wdiv.load("/store/form")



    }



    //--------------------------------------------------------



    function setGeoCodingPlaceMarker(lat,lng)



    {



       var b=new W(); b.create('',''); b.close();



        var latlng = new google.maps.LatLng(lat,lng);



        map.setCenter(latlng);



        var marker = new google.maps.Marker({



            map: map,



            position: latlng



        });



    }



    //--------------------------------------------------------



    function savehashtag()



    {



        var e=first_view_marker.getPosition().lat();



        var c=first_view_marker.getPosition().lng();



        var f=map.getZoom();



        var a=$("hashtag").value;



        var d=$("descr").value;



        var g=$("src_url").value;



        first_view_marker.setMap(null);



        $("result").innerHTML=show_loading();



        var b=new Request.JSON({url:"/store/jsonsave",method:"post",onSuccess:function(h){if(h.result=="OK"){var g=new W();g.close();return true}else{alert("Произошла непридвиденная ошибка");return false}}});



        b.send("lat="+e+"&lng="+c+"&z="+f+"&tag="+a+"&descr="+d+'&src_url='+g)



    }



    //---------------------------------------------------------



    function show_loading()



    {



        var a='<div class="login_sun"><img src="/i/ajax-loader.gif" /></div>';



        return a



    }



    //----------------------------------------------------------------



    function load_new_page(title,page)



    {



       var b=new W();



       b.create(title,show_loading());



       b.loadpage(page);



    }
	
    function load_kml(file) {
        var ctaLayer = new google.maps.KmlLayer(file); 
        ctaLayer.setMap(map);
    }

    function enable_panoramio()
    {
      var panoramioLayer = new google.maps.panoramio.PanoramioLayer();
      panoramioLayer.setMap(map);
      google.maps.event.addListener(panoramioLayer, 'click', function(event) {
         //var photoDiv = document.getElementById('photoPanel');
         //var attribution = document.createTextNode(event.featureDetails.title + ": " + event.featureDetails.author);
         //var br = document.createElement("br");
         //var link = document.createElement("a");
         //link.setAttribute("href", event.featureDetails.url);
         //link.appendChild(attribution);
         //photoDiv.appendChild(br);
         //photoDiv.appendChild(link);
      });
    }

    function kml_store_begin() {load_new_page("KML","/kmlstore/")}


    function about() {load_new_page("О сайте","/content/about/")}



    function how()    {load_new_page("Как пользоваться","/content/how/")}



    function contacts() {load_new_page("Контакты","/content/contacts/")}



    function search() {load_new_page("Поиск","/search/")}



    //----------------------------------------------------------------





    //----------------------------------------------------------------

    function rast()

    {

        var center = map.getCenter();

        var left_top = map.getBounds().getNorthEast();

        //alert(center.toString()+"\r\n"+left_top.toString());

        var rasss = calc_rast(left_top,center);

        //rasss = rasss * 0.8;

        rasss =toKm(rasss);

        return rasss;

        //alert(rasss + 'KM');

    }

function toKm(metrs) {return Math.ceil(metrs/1000);    }

function deg2rad (angle) {return (angle/180)*Math.PI;}

function calc_rast(loc1,loc2)

{

    var lat1 = loc1.lat();

    var lng1 = loc1.lng();

    var lat2 = loc2.lat();

    var lng2 = loc2.lng();

    lat1=deg2rad(lat1);

    lng1=deg2rad(lng1);

    lat2=deg2rad(lat2);

    lng2=deg2rad(lng2);





    var delta_lat=(lat2 - lat1);

    var delta_lng=(lng2 - lng1);

    return Math.round( 6378137 * Math.acos( Math.cos( lat1 ) * Math.cos( lat2 ) * Math.cos( lng1 - lng2 ) + Math.sin( lat1 ) * Math.sin( lat2 ) ) );

}

//----------------------------------------------------------

function go_to_tag(lat,lon,z,tag,tag_id)

{

    lat = lat.toFloat();

    lon = lon.toFloat();

    var latlng = new google.maps.LatLng(lat,lon);

    var wp = window.parent;

    map.setCenter(latlng);

    map.setZoom(z);

    show_tag_page_by_id(tag,tag_id);

}



