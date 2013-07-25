<?php
/**
 * digidesk - media solutions
 *
 * @link           http://www.digidesk.de
 * @version        SVN: $Id$
 */
/**
 * module class
 *
 * @package modules
 */
class dd_oxidmobile_oxoutput extends dd_oxidmobile_oxoutput_parent
{
    public function process( $sValue, $sClassName )
    {
        $sReturn = parent::process( $sValue, $sClassName);
		$bIsInserted;
        if ( function_exists( 'ddIsMobileDevice' ) && ddIsMobileDevice() && !isAdmin() )
        {
            $myConfig = oxRegistry::getConfig();
            $sShopID = $myConfig->getShopId();
            $sModule = 'theme:mobiletheme';
            $sVarname = 'aVersionSwitchText';
            //$iLang = (int)oxLang::getInstance()->getBaseLanguage();
            $iLang =0;

            //$sLinkTxt = oxLang::getInstance()->translateString();
            $oDb = oxDb::getDb();

            $sQ = "select " . $myConfig->getDecodeValueQuery() . " as oxvarvalue from oxconfig where oxshopid = '$sShopID' and oxmodule=" . $oDb->quote( $sModule ) . " and oxvarname = " . $oDb->quote( $sVarname );
            $aVars = unserialize( $oDb->getOne( $sQ));
            $sSwitchLink = '<div align="center" class="dd_switch_version"><br><a href="' . $myConfig->getShopUrl() . '?viewmode=mobile">' . ( isset( $aVars[ $iLang]) ? $aVars[ $iLang ] : 'Switch to Mobile-Version') . '</a><br><br><br></div>';
            $sReturn = str_replace( '</body>', $sSwitchLink . '</body>', $sReturn);
			$bIsInserted=true;
        }
		if ( ddIsMozillaDevice() && !isAdmin() && !$bIsInserted)
        {
            $myConfig = oxRegistry::getConfig();
            $sShopID = $myConfig->getShopId();
            $sModule = 'theme:azure';
            $sVarname = 'aVersionSwitchText';
            //$iLang = (int)oxLang::getInstance()->getBaseLanguage();
            $iLang = 0;

            //$sLinkTxt = oxLang::getInstance()->translateString();
            $oDb = oxDb::getDb();

            $sQ = "select " . $myConfig->getDecodeValueQuery() . " as oxvarvalue from oxconfig where oxshopid = '$sShopID' and oxmodule=" . $oDb->quote( $sModule ) . " and oxvarname = " . $oDb->quote( $sVarname );
            $aVars = unserialize( $oDb->getOne( $sQ));
            $sSwitchLink = '<div align="center" class="dd_switch_version"><br><a href="' . $myConfig->getShopUrl() . '?viewmode=mobile">' . ( isset( $aVars[ $iLang]) ? $aVars[ $iLang ] : 'Switch to Mobile-Version') . '</a><br><br><br></div>';
            $sReturn = str_replace( '</body>', $sSwitchLink . '</body>', $sReturn);
		}
        return $sReturn;
    }
}