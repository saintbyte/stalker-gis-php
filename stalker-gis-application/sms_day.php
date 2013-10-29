<?php

require_once(APPLICATION_PATH.'/models/User.php');

require_once(APPLICATION_PATH.'/models/Mailtemplate.php');

require_once(APPLICATION_PATH.'/models/Smsnum2email.php');

require_once(APPLICATION_PATH.'/models/Mailaddmessage.php');

require_once(APPLICATION_PATH.'/models/Smspilot.php');

require_once(APPLICATION_PATH.'/models/Suninfo.php');
//----------------------------------------------

$us = new Application_Model_User();
$sunifon =new Application_Model_Suninfo();
//----------------------------------------------

//$sl->where('date  > DATE_SUB(NOW(),INTERVAL 1 DAY)');

$sms_body = '';
$subject = 'StalkerGis информирует';
$points = new Application_Model_Pointtag();
$mailtext = new Application_Model_Mailaddmessage();
$mailt= $mailtext->get();
if ($mailt) {
$body = $mailt['html'];
}else
{
$body = '';
}
//----------------------------------------------
$stmt = $db->query('SELECT COUNT( * ) as cnt FROM hashtags WHERE  created_on > DATE_SUB( CURDATE( ) , INTERVAL 1 DAY )');
$row = $stmt->fetch();
$body .= '<br /><br />';
if ($row['cnt'] != '0')
{
$subject = 'Радары засекли активность';
$body .= 'Новые точки за последние сутки:'.$row['cnt'];
}else {
$subject = 'В Багдаде всё спокойно';
$body .= 'Нет новых точек';
}
$body .= '<br /><br />';
//----------------------------------------------
$body .= '<div style="margin: 5px; padding: 5px; border: 1px solid black; border-raduis: 4px;">';
$body .= 'Информация о долготе дня в Екатеринбурге<br /><br />';
$body .= $sunifon->get_html_text();
$body .= '</div><br /><br />';
//----------------------------------------------
$smsbody = 'Читать отчет: %link%';
// Получает email для рассылки
$sl = $us->Select();
$sl->where('send_email = 1 OR send_sms=1');
$users_to_subs = $us->fetchAll($sl);
foreach($users_to_subs as $uss)
{
        print '$uss->send_email:'.$uss->send_email."\r\n";
        print '$uss->send_sms:'.$uss->send_sms."\r\n";
        print '$uss->sms_over_email:'.$uss->sms_over_email."\r\n";
        print '$uss->tel:'.$uss->tel."\r\n";
/*

    public function AddsmstoQueue($to,$body,$prior=0,$ishtml=true,$header='',$from='')

    public function AddG2SMtoQueue($to,$subject,$body,$prior=0,$ishtml=true,$header='',$from='')

    public function AddSmsOverMailtoQueue($to,$subject,$body,$prior=0,$header='',$from='')

*/

        if ($uss->send_email == 1)

        {

          if ($uss->email) {

                print '['.$uss->email.']<br />';

                $body1 = Application_Model_Mailtemplate::getHtmlTop();

                $body1 .= $body;

                $body1 .= Application_Model_Mailtemplate::getHtmlFooter();

                $mq->AddtoQueue($uss->email, $subject, $body1); 

          }

        } 

        if ($uss->send_sms == 1)

        {

            //--------------------------

            $sms2mail = new Application_Model_Smsnum2email($uss->tel);

            $smsemail = $sms2mail->getEmail();

            print 'SMSMAIL:['.$smsemail.']';

            print 'SMSMAIL:['.$smsemail.']';

            //--------------------------

            if ($uss->sms_over_email == 1)

            {

                $body1 = $body;

                $mq->AddSmsOverMailtoQueue($smsemail, $subject, $body1);

            } else {

              // Native send sms

              $mq->AddsmstoQueue($uss->tel,$body); // ,$prior=0,$ishtml=true,$header='',$from=''

            }

        // send sms

        }

}

$mailtext->setAsSended();





//----------------------------------------------



//



