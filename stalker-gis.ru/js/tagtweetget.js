function toTweet(a)
{
    return a.replace(/(https?:\/\/\S+)/gi,'<a href="$1" target="_blank" class="new_w">$1</a>').replace(/(^|\s)@(\w+)/g,'$1<a href="http://twitter.com/$2"  class="new_w" target="_blank">@$2</a>').replace(/(^|\s)#(\w+)/g,'$1<a href="http://search.twitter.com/search?q=%23$2" class="new_w" target="_blank">#$2</a>')
}
function fixTime(a)
{
    a=a.replace(/\+0000/gi,"");
    a=a.replace(/Sun/g,"Вск");
    a=a.replace(/Mon/g,"Пнд");
    a=a.replace(/Tue/g,"Вт");
    a=a.replace(/Wed/g,"Срд");
    a=a.replace(/Thu/g,"Чтв");
    a=a.replace(/Fri/g,"Птн");
    a=a.replace(/Sat/g,"Суб");
    a=a.replace(/Jan/g,"Янв");
    a=a.replace(/Feb/g,"Фев");
    a=a.replace(/Mar/g,"Мар");
    a=a.replace(/Apr/g,"Апр");
    a=a.replace(/May/g,"Май");
    a=a.replace(/Jun/g,"Июн");
    a=a.replace(/Jul/g,"Июл");
    a=a.replace(/Aug/g,"Авг");
    a=a.replace(/Sep/g,"Сен");
    a=a.replace(/Oct/g,"Окт");
    a=a.replace(/Nov/g,"Нобр");
    a=a.replace(/Dec/g,"Дек");
    return a
}
function requestTwitterHashTagData()
{
    var a=document.createElement("script");
    a.src=search_url;
    a.type="text/javascript";
    document.getElementsByTagName("head")[0].appendChild(a)
}
function onSearchResult(b)
{
    var e=$("tweets");
    var a=b.results;
    var c=a.length;
    if(c==0)
    {
        var d=" За последний неделю  твитов с этим хештагом небыло ";
        new Element("li",{html:d,styles:{"background-color":"red"}}).inject(e,"bottom")
    }else{
        for(var f=0;f<c;f++)
        {
            var d='<span class="tweet_img"><a href="http://twitter.com/'+a[f].from_user+'" target="_blank"><img src="'+a[f].profile_image_url+'" alt="" align="left" style="clear: none; width:48px; float: left" border="0"></a></span>';
            d+="<span>";
            d+='<ul class="tweet_pr list_none">';
            d+='<li><a href="http://twitter.com/'+a[f].from_user+'" target="_blank"><b>'+a[f].from_user+"</b></a>: ";
            d+=""+toTweet(a[f].text)+"</li>";
            d+="<li><small>"+fixTime(a[f].created_at)+"</small></li>";
            d+="</ul>";
            d+="</span>";
            d+="";
            new Element("div",{html:d,"class":"tweet"}).inject(e,"bottom")
        }
    }
}