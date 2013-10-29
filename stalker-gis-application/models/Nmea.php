<?php
class Application_Model_Nmea
{ 
/*
$GPRMC

Recommended minimum specific GPS/Transit data

eg1. $GPRMC,081836,A,3751.65,S,14507.36,E,000.0,360.0,130998,011.3,E*62
eg2. $GPRMC,225446,A,4916.45,N,12311.12,W,000.5,054.7,191194,020.3,E*68


           225446       Time of fix 22:54:46 UTC
           A            Navigation receiver warning A = OK, V = warning
           4916.45,N    Latitude 49 deg. 16.45 min North
           12311.12,W   Longitude 123 deg. 11.12 min West
           000.5        Speed over ground, Knots
           054.7        Course Made Good, True
           191194       Date of fix  19 November 1994
           020.3,E      Magnetic variation 20.3 deg East
           *68          mandatory checksum


eg3. $GPRMC,220516,A,5133.82,N,00042.24,W,173.8,231.8,130694,004.2,W*70
              1    2    3    4    5     6    7    8      9     10  11 12


      1   220516     Time Stamp
      2   A          validity - A-ok, V-invalid
      3   5133.82    current Latitude
      4   N          North/South
      5   00042.24   current Longitude
      6   W          East/West
      7   173.8      Speed in knots
      8   231.8      True course
      9   130694     Date Stamp
      10  004.2      Variation
      11  W          East/West
      12  * 70        checksum


eg4. $GPRMC,hhmmss.ss,A,llll.ll,a,yyyyy.yy,a,x.x,x.x,ddmmyy,x.x,a*hh
1    = UTC of position fix
2    = Data status (V=navigation receiver warning)
3    = Latitude of fix
4    = N or S
5    = Longitude of fix
6    = E or W
7    = Speed over ground in knots
8    = Track made good in degrees True
9    = UT date
10   = Magnetic variation degrees (Easterly var. subtracts from true course)
11   = E or W
12   = Checksum
9.1.2) Default "gprmc" Configuration:
The default "gprmc" cofiguration (with no special configuration changes made in the "webapp.conf" file) expects a
http-based URL formatted as follows: (the URL below displays the various fields on separate lines, but is normally sent
to the server as a single URL all on a single line):

http://example.com:8080/gprmc/Data?
id=123456789012345&
code=0xF020&
gprmc=$GPRMC,080701.00,A,3128.7540,N,14257.6714,W,000.0,000.0,180707,,,A*1C

Where
http://example.com:8080/gprmc/Data?
Represents the host:port ("example.com:8080") and "gprmc.war" servlet location ("/gprmc/Data?")

123456789012345
Represents the unique mobile ID of the device (such as the IMEI#). (This value should be entered into the "Device Admin"
page "Unique ID" field in the format "gprmc_123456789012345").

0xF020
0xF020 61472 STATUS_LOCATION Location (0) General Location Information
Represents the status code used for identifying the reason for the event. The status code used here should match the hex, or decimal value of a status code listed in the "Status Codes and Descriptions" manual at the following location:
http://www.geotelematic.com/docs/StatusCodes.pdf

In addition to one of the above hex/decimal status codes, any of the following text code names may also be used, which will automatically be converted into it's corresponding hex-based status code when it is entered into the EventData table: GPS, PANIC, WAYMARK, etc, (see gprmc source module "Data.java" for a current list).

$GPRMC,080701.00,A,3128.7540,N,14257.6714,W,000.0,000.0,180707,,,A*1C
Represents the NMEA-0183 $GPRMC record straight from the GPS receiver.
https://github.com/mendhak/gpslogger/issues/123


http://www.gelix.com/index.php?Page=page_164
---------
($GPGGA,204204,4330.4850,N,08011.4392,W,0,00,,00330.6,M,-035.4,M,,*6F)
to usable lat long coordinates.

I have extracted the important info:
4330.4850 N
08011.4392 W

For a specific "formula", here is an example based on your coordinates.
43 degrees 30 minutes and 48.50 seconds
43 + 30 / 60 + 48.50 / 3600 = 43.513472
Because this is north of the equator, the number remains positive.
43.513472

There are 60 minutes in a degree, and 3600 seconds in a degree.
80 degrees 11 minutes 43.92 seconds
80 + 11 / 60 + 43.92 / 3600 = 80.195533

Because this is west of Greenwich, the number becomes negative.
-80.195533
*/
  private $nmeastr;
  private $nmea_arr;
  public function __construct()
  {

  }
  public function parseNmea($str)
  {
    $arr = explode(',',$str);
    $result = array();
    $this->nmea_arr = $arr;
    if ($arr[0] == '$GPRMC')
    {
     $result['latitude'] = $this->toGradusFromNmea($arr[3],$arr[4]);
     $result['longitude'] = $this->toGradusFromNmea($arr[5],$arr[6]);
     $result['speed'] = intval($arr[7]);
     $result['src'] = $arr;
     return $result;
    }
    return $arr;
  }
  public function toGradusFromNmea($val,$val2)
  {
   return $this->degree2decimal($val.$val2);
   $i = strpos($val,'.');
   if ($i == 5)
   {
    $first_get = 3;
   }
   else 
   {
    $first_get = 2;
   }
   $gr = substr($val,0,$first_get);
   $offter = substr($val,$first_get+1);
   $offter1 = substr($val,$first_get,2);
   $offter2 = substr($val,$i+1);
   $offter3 = substr($offter2,0,2);
   $offter4 = substr($offter2,2);
   $offter5 = floatval($offter3.'.'.$offter4);
   // alg 1
   //$offter = strtr($offter,array('.'=>''));
   //$offter = ($offter * 500) / 3;
   // alg 2
   //$gr = intval($gr);
   /*
   print '$var:'.   $val.'<br />';
   print '$i:'.   $i.'<br />';
   print '$first_get'.$first_get.'<br />';
   print '$gr:'.   $gr.'<br />';
   print '$offter:'.   $offter.'<br />';
   print '$offter1:'.   $offter1.'<br />';
   print '$offter2:'.   $offter2.'<br />';
   print '$offter3:'.   $offter3.'<br />';
   print '$offter4:'.   $offter4.'<br />';
   print '$offter5:'.   $offter5.'<br />'; 
   */
   $offter = $gr + $offter1 / 60 + $offter5 / 3600 ;
   //print '$offterRES:'.$offter.'<br />'; 
   if ($val2 == 'S' || $val2 == 'W')
   {
    $znak = '-';
   }
   else {
    $znak = '';
   }
   //return $znak.$gr.'.'.$offter; //alg 1
   return $znak.$offter; //alg 2
  }
  
  public function get()
  {

  }
  public function degree2decimal($deg_coord){
    //reference http://www.directionsmag.com/site/latlong-converter
    //GPS/NMEA fixes are in Degree Minutes.m format
    //for Google maps we need to convert them to decimal degrees
    //sample format of GPS  4533.35 is 45 degrees and 33.35 minutes
    //formula is as follows//Degrees=Degrees 
    //.d = M.m/60//Decimal Degrees=Degrees+.d
    $degree=(int)($deg_coord/100); //simple way
    $minutes= $deg_coord-($degree*100);
    $dotdegree=$minutes/60;
    $decimal=$degree+$dotdegree;
    $direction=substr($deg_coord,-1);
    //South latitudes and West longitudes need to return a negative result
    if (($direction=="S") or ($direction=="W"))       
    { 
      $decimal=$decimal*(-1);}
      $decimal=number_format($decimal,4,'.',''); //truncate decimal to 4 places
      return $decimal;
    }
}
