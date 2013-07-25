<?php
/**
 * digidesk - media solutions
 *
 * @link           http://www.digidesk.de
 * @version        SVN: $Id$
 */
include dirname( __FILE__ ).'/bootstrap.php';
function getShopBasePath()
{
    return realpath( dirname( __FILE__ ) ) . DIRECTORY_SEPARATOR;
}

require_once getShopBasePath() . 'core/oxfunctions.php';

$oShopConfig = oxRegistry::getConfig();

/*if ( oxRegistry::getSession()->getVar( 'usr' ) === null || oxRegistry::getSession()->getVar( 'usr' ) !== 'oxdefaultadmin' )
{
    exit( 'You must be logged in as Admin!.' );
}*/


$oDb = oxDb::getDb( true );
$sShopId = $oShopConfig->getBaseShopId();
$bFile=fopen("log-mob.txt","w");
$sWrite=fwrite($bFile, $oShopConfig->getConfigParam( 'sConfigKey' ));
$sSql = "INSERT INTO oxconfigdisplay
         SELECT
          md5(oxid),
          REPLACE( oxcfgmodule, 'azure', 'mobiletheme'),
          `OXCFGVARNAME`,
          `OXGROUPING`,
          `OXVARCONSTRAINT`,
          `OXPOS`,
          `OXTIMESTAMP`
         FROM oxconfigdisplay
         WHERE oxcfgmodule LIKE '%azure'";
		 $sWrite=fwrite($bFile," sql1: ".$sSql);
$oDb->Execute( $sSql);

$sSql = "INSERT INTO oxconfigdisplay VALUES (md5('aVersionSwitchText'), 'theme:mobiletheme', 'aVersionSwitchText', 'display', '', 0)";
$oDb->Execute( $sSql );

$sSql = "INSERT INTO oxconfig
         SELECT
          md5(oxid),
          `OXSHOPID`,
          REPLACE( `OXMODULE`, 'azure', 'mobiletheme'),
          `OXVARNAME`,
          `OXVARTYPE`,
          `OXVARVALUE`,
		  `OXTIMESTAMP`
         FROM oxconfig
         WHERE oxmodule LIKE '%azure'";
		 $sWrite=fwrite($bFile," sql2: ".$sSql);
$oDb->Execute( $sSql );

$aSwitchTexts = array( '0' => 'Zur mobilen Version wechseln');
$sSql = "INSERT INTO oxconfig
         SELECT
          md5('aVersionSwitchText'),
          `OXSHOPID`,
          'theme:mobiletheme',
          'aVersionSwitchText',
          'aarr',
          ENCODE( " . $oDb->quote( serialize( $aSwitchTexts) ) . ", " . $oDb->quote( $oShopConfig->getConfigParam( 'sConfigKey' ) ) . "),
		  '2013-03-11 00:00'
         FROM oxconfig
         WHERE oxmodule LIKE '%azure' LIMIT 1";
		 $sWrite=fwrite($bFile," sql3: ".$sSql);
$oDb->Execute( $sSql );

$sSql = "UPDATE oxconfig
         SET oxvarvalue = ENCODE( " . $oDb->quote( '87*87' ) . ", " . $oDb->quote( $oShopConfig->getConfigParam( 'sConfigKey' )) . ")
         WHERE `OXVARNAME` = 'sIconsize' AND `OXMODULE` = 'theme:mobiletheme'";
		 $sWrite=fwrite($bFile," sql4: ".$sSql);
$oDb->Execute( $sSql );

$sSql = "UPDATE oxconfig
         SET oxvarvalue = ENCODE( " . $oDb->quote( '87*87' ) . ", " . $oDb->quote( $oShopConfig->getConfigParam( 'sConfigKey' )) . ")
         WHERE `OXVARNAME` = 'sIconsize' AND `OXMODULE` = 'theme:mobiletheme'";
		 $sWrite=fwrite($bFile," sql5: ".$sSql);
$oDb->Execute( $sSql );

//aDetailImageSizes
$aDetailImageSizes = array(
    'oxpic1' => '200*200',
    'oxpic2' => '200*200',
    'oxpic3' => '200*200',
    'oxpic4' => '200*200',
    'oxpic5' => '200*200',
    'oxpic6' => '200*200',
    'oxpic7' => '200*200',
    'oxpic8' => '200*200',
    'oxpic9' => '200*200',
    'oxpic10' => '200*200',
    'oxpic11' => '200*200',
    'oxpic12' => '200*200',
);
$sSql = "UPDATE oxconfig
         SET oxvarvalue = ENCODE( " . $oDb->quote( serialize( $aDetailImageSizes) ) . ", " . $oDb->quote( $oShopConfig->getConfigParam( 'sConfigKey' ) ) . ")
         WHERE `OXVARNAME` = 'aDetailImageSizes' AND `OXMODULE` = 'theme:mobiletheme'";
		 $sWrite=fwrite($bFile," sql6: ".$sSql);
$oDb->Execute( $sSql );

echo 'Installation-Script has been executed!';
unlink( __FILE__);
exit;