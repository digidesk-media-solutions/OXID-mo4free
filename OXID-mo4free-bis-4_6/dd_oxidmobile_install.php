<?php
/**
 * digidesk - media solutions
 *
 * @link           http://www.digidesk.de
 * @version        SVN: $Id$
 */

function getShopBasePath()
{
    return realpath( dirname( __FILE__ ) ) . DIRECTORY_SEPARATOR;
}

require_once getShopBasePath() . 'core/oxfunctions.php';
$oShopConfig = oxConfig::getInstance();

if ( oxSession::getVar( 'usr' ) === null || oxSession::getVar( 'usr' ) !== 'oxdefaultadmin' )
{
    exit( 'You must be logged in as Admin!.' );
}

$oDb = oxDb::getDb( true );
$sShopId = $oShopConfig->getBaseShopId();

$sSql = "INSERT INTO oxconfigdisplay
         SELECT
          md5(oxid),
          REPLACE( oxcfgmodule, 'azure', 'mobiletheme'),
          `OXCFGVARNAME`,
          `OXGROUPING`,
          `OXVARCONSTRAINT`,
          `OXPOS`
         FROM oxconfigdisplay
         WHERE oxcfgmodule LIKE '%azure'";
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
          `OXVARVALUE`
         FROM oxconfig
         WHERE oxmodule LIKE '%azure'";
$oDb->Execute( $sSql );

$aSwitchTexts = array( '0' => 'Zur mobilen Version wechseln');
$sSql = "INSERT INTO oxconfig
         SELECT
          md5('aVersionSwitchText'),
          `OXSHOPID`,
          'theme:mobiletheme',
          'aVersionSwitchText',
          'aarr',
          ENCODE( " . $oDb->quote( serialize( $aSwitchTexts) ) . ", " . $oDb->quote( $oShopConfig->sConfigKey ) . ")
         FROM oxconfig
         WHERE oxmodule LIKE '%azure' LIMIT 1";
$oDb->Execute( $sSql );

$sSql = "UPDATE oxconfig
         SET oxvarvalue = ENCODE( " . $oDb->quote( '87*87' ) . ", " . $oDb->quote( $oShopConfig->sConfigKey ) . ")
         WHERE `OXVARNAME` = 'sIconsize' AND `OXMODULE` = 'theme:mobiletheme'";
$oDb->Execute( $sSql );

$sSql = "UPDATE oxconfig
         SET oxvarvalue = ENCODE( " . $oDb->quote( '87*87' ) . ", " . $oDb->quote( $oShopConfig->sConfigKey ) . ")
         WHERE `OXVARNAME` = 'sIconsize' AND `OXMODULE` = 'theme:mobiletheme'";
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
         SET oxvarvalue = ENCODE( " . $oDb->quote( serialize( $aDetailImageSizes) ) . ", " . $oDb->quote( $oShopConfig->sConfigKey ) . ")
         WHERE `OXVARNAME` = 'aDetailImageSizes' AND `OXMODULE` = 'theme:mobiletheme'";
$oDb->Execute( $sSql );

echo 'Installation-Script has been executed!';
unlink( __FILE__);
exit;