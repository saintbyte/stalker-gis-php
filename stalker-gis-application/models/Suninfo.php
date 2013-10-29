<?php
class Application_Model_Suninfo
{ 
  private $_default_lat;
  private $_default_lon;
  private $_default_time;
  public function __construct($time = 0,$latitude=0,$longitude=0)
  {
      $this->_default_lat = 56.83;
      $this->_default_lon = 60.59;
      $this->_default_time =  time();
      $this->_to_local_hour_offset = 6;
      if ($time == 0) { $this->time = $this->_default_time; }
      else { $this->time = $time; }
      if ($latitude == 0) $this->lat = $this->_default_lat ;
      else { $this->lat = $latitude; }
      if ($longitude == 0) $this->time = $this->_default_lon;
      else { $this->lon = $longitude; }
      $this->src_arr = date_sun_info ( $this->time , $this->lat , $this->lon );
  }
  public function get_text($new_str = "\r\n")
  {
      $result = '';
      $this->src_arr = date_sun_info ( $this->time , $this->lat , $this->lon );
      foreach ($this->src_arr as $key => $val) {
        if ($key == 'sunrise') {
                $sunrise = $val;
                $result .='Восход: '.date("H:i:s", ($sunrise+($this->_to_local_hour_offset*3600))).'';
        }

        if ($key == 'sunset') {
                $sunset = $val;
                $day_length = $sunset - $sunrise;
                $result .='Заход: '.date("H:i:s", ($sunset+($this->_to_local_hour_offset*3600))).''.$new_str;
                $result .='Долгота дня: '.gmdate("H:i:s", $day_length).'';
        }

        if ($key == 'transit') {
                $result .='В зените: '.date("H:i:s", ($val+($this->_to_local_hour_offset*3600))).'';
        }

        if ($key == 'civil_twilight_begin') {
                $result .='Начало утренних сумерек: '.date("H:i:s", ($val+($this->_to_local_hour_offset*3600))).'';
        }

        if ($key == 'civil_twilight_end') {
                $result .='Конец вечерних сумерек: '.date("H:i:s", ($val+($this->_to_local_hour_offset*3600))).'';
        }
     $result .=  $new_str;
     }
     return $result;
  }
  public function get_html_text()
  {
        return $this->get_text("<br />");
  }
}
