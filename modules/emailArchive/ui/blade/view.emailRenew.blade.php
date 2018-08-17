<?php
include_once UTILITY.'class.util.inc';
include_once MODULES_EMAIL.'bao/class.emailbao.php';
include_once MODULES_EMAIL.'bao/class.emailRenewbao.php';

$_EmailRenewBao=new EmailRenewBao();
$_EmailBao=new EmailBao();
$_DB=DBUtil::getInstance();

?>