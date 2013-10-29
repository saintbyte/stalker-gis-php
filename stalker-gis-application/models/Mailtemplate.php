<?php
class Application_Model_Mailtemplate
{
    public static function getHtmlTop()
    {
        $s = '<html><head><title></title></head><body><table cellspacing="0" align="center" cellpadding="0" width="600" style="">';
	$s .= '<tr><td>';
	$s .= '<img src="http://stalker-gis.ru/subs_images/top.jpg" width="600" height="93" border="0">';
	$s .= '</td></tr>';
	$s .= '<tr><td align="justify">';
	return $s;
    }
    public static function getHtmlFooter()
    {
        $s = '</td></tr></table></body></html>';
        return $s;
    }
    
    
    
}